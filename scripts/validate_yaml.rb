#!/usr/bin/env ruby
# frozen_string_literal: true

require 'date'
require 'time'
require 'yaml'

ROOT = File.expand_path('..', __dir__)
paths = [File.join(ROOT, '_config.yml')] + Dir.glob(File.join(ROOT, '_data', '**', '*.yml')).sort
errors = []

paths.each do |path|
  YAML.safe_load_file(path, permitted_classes: [Date, Time], aliases: true)
  puts "OK #{path.sub("#{ROOT}/", '')}"
rescue StandardError => e
  errors << "#{path.sub("#{ROOT}/", '')}: #{e.class}: #{e.message}"
end

if errors.any?
  warn "YAML validation failed:"
  warn errors.join("\n")
  exit 1
end

puts "Validated #{paths.length} YAML files."
