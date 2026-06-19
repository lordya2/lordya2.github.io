#!/usr/bin/env ruby
# frozen_string_literal: true

require 'cgi'
require 'set'
require 'uri'

ROOT = File.expand_path('..', __dir__)
SITE = File.join(ROOT, '_site')
abort 'Missing _site directory. Run Jekyll build before checking internal links.' unless Dir.exist?(SITE)

html_files = Dir.glob(File.join(SITE, '**', '*.html')).sort
site_files = Dir.glob(File.join(SITE, '**', '*'), File::FNM_DOTMATCH).select { |path| File.file?(path) }.map { |path| path.sub(SITE, '') }.to_set
anchors_by_page = {}

html_files.each do |path|
  html = File.read(path)
  anchors = Set.new([''])
  html.scan(/\s(?:id|name)=(['"])(.*?)\1/i) { |_quote, value| anchors << CGI.unescapeHTML(value) }
  anchors_by_page[path.sub(SITE, '')] = anchors
end

SKIP_SCHEMES = /\A(?:mailto:|tel:|https?:|javascript:|data:)/i
errors = []
checked = 0

def html_path_for(path)
  return path if path.end_with?('.html')
  return File.join(path, 'index.html') if path.end_with?('/')

  [path, "#{path}.html", File.join(path, 'index.html')]
end

def existing_site_path(candidates, site_files)
  Array(candidates).find { |candidate| site_files.include?(candidate) }
end

html_files.each do |file|
  html = File.read(file)
  current = file.sub(SITE, '')
  current_dir = File.dirname(current)

  html.scan(/\s(?:href|src)=(['"])(.*?)\1/i) do |_quote, raw_url|
    url = CGI.unescapeHTML(raw_url.to_s.strip)
    next if url.empty? || url.start_with?('#:~:text=') || url.match?(SKIP_SCHEMES) || url.start_with?('//')

    checked += 1
    path_part, fragment = url.split('#', 2)
    path_part = current if path_part.nil? || path_part.empty?
    path_part = path_part.split('?', 2).first
    path_part = CGI.unescape(path_part)

    normalized = if path_part.start_with?('/')
                   path_part
                 else
                   '/' + File.expand_path(path_part, current_dir).sub(%r{\A/}, '')
                 end
    normalized = '/' if normalized.empty?

    candidates = html_path_for(normalized)
    target = existing_site_path(candidates, site_files)
    unless target
      errors << "#{current}: #{raw_url} points to missing internal target #{normalized}"
      next
    end

    next if fragment.nil? || fragment.empty? || !target.end_with?('.html')

    anchors = anchors_by_page[target] || Set.new
    decoded_fragment = CGI.unescape(fragment)
    errors << "#{current}: #{raw_url} points to missing anchor ##{decoded_fragment} in #{target}" unless anchors.include?(decoded_fragment)
  end
end

if errors.any?
  warn "Internal link check failed:"
  warn errors.join("\n")
  exit 1
end

puts "Checked #{checked} internal links across #{html_files.length} generated HTML files."
