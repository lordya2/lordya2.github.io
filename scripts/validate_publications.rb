#!/usr/bin/env ruby
# frozen_string_literal: true

require 'yaml'
require 'set'

ROOT = File.expand_path('..', __dir__)
PUBLICATIONS_PATH = File.join(ROOT, '_data', 'publications.yml')
THEMES_PATH = File.join(ROOT, '_data', 'research_themes.yml')

errors = []

def load_yaml(path, errors)
  YAML.safe_load_file(path, permitted_classes: [Date], aliases: false)
rescue StandardError => e
  errors << "#{path} failed to parse: #{e.message}"
  nil
end

publications = load_yaml(PUBLICATIONS_PATH, errors)
theme_data = load_yaml(THEMES_PATH, errors)

unless publications.is_a?(Array)
  errors << '_data/publications.yml must be a list of publication entries.'
  publications = []
end

ids = publications.map { |publication| publication['id'] }
ids.each_with_index do |id, index|
  errors << "Publication at index #{index} is missing id." if id.nil? || id.to_s.strip.empty?
end
ids.compact.tally.each do |id, count|
  errors << "Publication id #{id.inspect} is duplicated." if count > 1
end
id_set = ids.compact.to_set

featured_orders = []
publications.each do |publication|
  id = publication['id'] || '(missing id)'

  Array(publication['links']).each_with_index do |link, index|
    unless link.is_a?(Hash) && link['label'].to_s.strip != '' && link['url'].to_s.strip != ''
      errors << "Publication #{id} link #{index + 1} must include label and url."
    end
  end

  next unless publication['featured']

  %w[citation question finding impact].each do |field|
    errors << "Featured publication #{id} is missing #{field}." if publication[field].to_s.strip.empty?
  end

  %w[short_title venue year links featured_order].each do |field|
    errors << "Featured publication #{id} is missing required field #{field}." if publication[field].nil? || publication[field].to_s.strip.empty?
  end

  featured_orders << publication['featured_order'] if publication.key?('featured_order')
end

featured_orders.tally.each do |order, count|
  errors << "Featured order #{order.inspect} is duplicated." if count > 1
end

unless theme_data.is_a?(Hash) && theme_data['themes'].is_a?(Array)
  errors << '_data/research_themes.yml must contain a themes list.'
else
  theme_data['themes'].each do |theme|
    title = theme['title'] || theme['id'] || '(missing theme title)'
    unless theme['representative_papers'].is_a?(Array)
      errors << "Theme #{title} must include representative_papers as a list."
      next
    end

    theme['representative_papers'].each do |publication_id|
      errors << "Theme #{title} references unknown publication id #{publication_id.inspect}." unless id_set.include?(publication_id)
    end
  end
end

if errors.any?
  warn errors.join("\n")
  exit 1
end

puts "Validated #{publications.length} publications and #{theme_data.fetch('themes', []).length} research themes."
