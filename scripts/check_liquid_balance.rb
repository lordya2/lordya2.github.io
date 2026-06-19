#!/usr/bin/env ruby
# frozen_string_literal: true

ROOT = File.expand_path('..', __dir__)
patterns = ['*.md', '*.html', '_includes/**/*.html', '_layouts/**/*.html', 'pages/**/*.md', 'pages/**/*.html', 'ko/**/*.md', 'ko/**/*.html']
files = patterns.flat_map { |pattern| Dir.glob(File.join(ROOT, pattern)) }.uniq.sort.select { |path| File.file?(path) }
errors = []

files.each do |path|
  text = File.read(path)
  tag_open = text.scan(/{%/).length
  tag_close = text.scan(/%}/).length
  output_open = text.scan(/{{/).length
  output_close = text.scan(/}}/).length
  relative = path.sub("#{ROOT}/", '')

  errors << "#{relative}: found #{tag_open} '{%' delimiters but #{tag_close} '%}' delimiters" unless tag_open == tag_close
  errors << "#{relative}: found #{output_open} '{{' delimiters but #{output_close} '}}' delimiters" unless output_open == output_close
end

if errors.any?
  warn "Liquid delimiter check failed:"
  warn errors.join("\n")
  exit 1
end

puts "Checked Liquid delimiter balance in #{files.length} files."
