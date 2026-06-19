#!/usr/bin/env ruby
# frozen_string_literal: true

require 'cgi'
require 'net/http'
require 'set'
require 'uri'

ROOT = File.expand_path('..', __dir__)
SITE = File.join(ROOT, '_site')
abort 'Missing _site directory. Run Jekyll build before checking external links.' unless Dir.exist?(SITE)

links = Set.new
Dir.glob(File.join(SITE, '**', '*.html')).sort.each do |file|
  File.read(file).scan(/\s(?:href|src)=(['"])(https?:\/\/.*?)\1/i) do |_quote, raw_url|
    links << CGI.unescapeHTML(raw_url).split('#', 2).first
  end
end

warnings = []
links.each do |link|
  uri = URI.parse(link)
  response = nil
  Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https', open_timeout: 5, read_timeout: 5) do |http|
    response = http.request_head(uri.request_uri.empty? ? '/' : uri.request_uri)
    if response.is_a?(Net::HTTPMethodNotAllowed) || response.is_a?(Net::HTTPForbidden)
      response = http.get(uri.request_uri.empty? ? '/' : uri.request_uri, { 'User-Agent' => 'site-checks-link-checker' })
    end
  end
  warnings << "#{response.code} #{response.message}: #{link}" unless response.is_a?(Net::HTTPSuccess) || response.is_a?(Net::HTTPRedirection)
rescue StandardError => e
  warnings << "#{e.class}: #{e.message}: #{link}"
end

if warnings.any?
  warn "External link warnings (non-blocking):"
  warn warnings.join("\n")
else
  puts 'No external link warnings.'
end

puts "Checked #{links.length} unique external links."
