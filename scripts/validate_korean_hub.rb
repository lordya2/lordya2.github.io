#!/usr/bin/env ruby
# frozen_string_literal: true

require 'json'
require 'yaml'

ROOT = File.expand_path('..', __dir__)
SITE = File.join(ROOT, '_site')
HUB = File.join(SITE, 'ko', 'index.html')
HOME = File.join(SITE, 'index.html')
SITEMAP = File.join(ROOT, 'sitemap.xml')

errors = []

abort 'Korean hub validation failed: _site/ko/index.html was not generated.' unless File.file?(HUB)
abort 'Korean hub validation failed: _site/index.html was not generated.' unless File.file?(HOME)

html = File.read(HUB)
home_html = File.read(HOME)
people = YAML.safe_load_file(File.join(ROOT, '_data', 'people.yml'), aliases: true)
profile = YAML.safe_load_file(File.join(ROOT, '_data', 'profile.yml'), aliases: true)
publications = YAML.safe_load_file(File.join(ROOT, '_data', 'publications.yml'), aliases: true)
teaching = YAML.safe_load_file(File.join(ROOT, '_data', 'teaching.yml'), aliases: true)
media = YAML.safe_load_file(File.join(ROOT, '_data', 'media_impact.yml'), aliases: true)
navigation = YAML.safe_load_file(File.join(ROOT, '_data', 'navigation.yml'), aliases: true)
news = YAML.safe_load_file(File.join(ROOT, '_data', 'news.yml'), aliases: true)

errors << 'The document language must be Korean.' unless html.match?(/<html\s+lang=["']ko["']/i)
errors << 'The canonical URL must be https://hyunseoklee.com/ko/.' unless html.include?('<link rel="canonical" href="https://hyunseoklee.com/ko/">')
errors << 'Missing Korean hreflang.' unless html.include?('<link rel="alternate" hreflang="ko" href="https://hyunseoklee.com/ko/">')
errors << 'Missing reciprocal English hreflang.' unless html.include?('<link rel="alternate" hreflang="en" href="https://hyunseoklee.com/">')
errors << 'Missing x-default hreflang.' unless html.include?('<link rel="alternate" hreflang="x-default" href="https://hyunseoklee.com/">')
errors << 'Missing ko_KR Open Graph locale.' unless html.include?('<meta property="og:locale" content="ko_KR">')

title = html[/<title>(.*?)<\/title>/im, 1].to_s
%w[이현석 운영관리 공급망].each do |term|
  errors << "The Korean SEO title is missing #{term}." unless title.include?(term)
end
errors << 'The Korean meta description is missing.' unless html.match?(/<meta\s+name="description"\s+content="[^"]*공급망 강연[^"]*">/)
errors << 'The page must contain exactly one H1.' unless html.scan(/<h1\b/i).length == 1
errors << 'The Korean hub must set the body class.' unless html.match?(/<body\s+class="ko-hub">/i)

required_section_ids = %w[updates research students research-impact industry media academic contact]
required_section_ids.each do |id|
  errors << "Missing section ##{id}." unless html.match?(/<section\b[^>]*\bid=["']#{Regexp.escape(id)}["']/i)
end

ids = html.scan(/\bid=["']([^"']+)["']/i).flatten
ids.tally.each do |id, count|
  errors << "Duplicate id #{id.inspect}." if count > 1
end

students = people.fetch('current_students', [])
student_section = html[/<section\b[^>]*\bid=["']students["'][^>]*>(.*?)<\/section>/im, 1]
if student_section.nil?
  errors << 'Could not inspect the current-student section.'
else
  rendered_students = student_section.scan(/class=["'][^"']*\bko-student-card\b[^"']*["']/i).length
  errors << "Expected #{students.length} student cards, rendered #{rendered_students}." unless rendered_students == students.length
  errors << 'Student photos must not be rendered.' if student_section.match?(/<img\b/i)
end

featured_count = publications.count { |paper| paper['featured'] }
expected_research_cards = [featured_count, 5].min
rendered_research_cards = html.scan(/class=["'][^"']*\bko-paper-card\b[^"']*["']/i).length
errors << "Expected #{expected_research_cards} Korean research cards, rendered #{rendered_research_cards}." unless rendered_research_cards == expected_research_cards

def json_ld_blocks(document, errors, label)
  document.scan(/<script\s+type="application\/ld\+json">\s*(.*?)\s*<\/script>/im).flatten.filter_map.with_index do |block, index|
    begin
      JSON.parse(block)
    rescue JSON::ParserError => e
      errors << "#{label} JSON-LD block #{index + 1} is invalid: #{e.message}"
      nil
    end
  end
end

hub_schema = json_ld_blocks(html, errors, 'Korean hub').find { |block| block['@type'] == 'ProfilePage' }
if hub_schema.nil?
  errors << 'Missing ProfilePage JSON-LD on the Korean hub.'
else
  errors << 'Korean ProfilePage JSON-LD must declare ko-KR.' unless hub_schema['inLanguage'] == 'ko-KR'
  errors << 'Korean ProfilePage must reference the shared Person id.' unless hub_schema.dig('mainEntity', '@id') == 'https://hyunseoklee.com/#person'
end

home_person = json_ld_blocks(home_html, errors, 'English home').find { |block| block['@type'] == 'Person' }
errors << 'English home Person JSON-LD must use the shared Person id.' unless home_person && home_person['@id'] == 'https://hyunseoklee.com/#person'

errors << 'English home canonical is incorrect.' unless home_html.include?('<link rel="canonical" href="https://hyunseoklee.com/">')
errors << 'English home is missing its en hreflang.' unless home_html.include?('<link rel="alternate" hreflang="en" href="https://hyunseoklee.com/">')
errors << 'English home is missing reciprocal ko hreflang.' unless home_html.include?('<link rel="alternate" hreflang="ko" href="https://hyunseoklee.com/ko/">')
errors << 'English home is missing x-default hreflang.' unless home_html.include?('<link rel="alternate" hreflang="x-default" href="https://hyunseoklee.com/">')

%w[display_title_ko headshot_alt_ko positioning_ko].each do |field|
  errors << "profile.yml is missing #{field}." if profile[field].to_s.strip.empty?
end

required_student_fields = %w[name_ko program_ko area_ko project_title_ko project_summary_ko]
students.each_with_index do |student, index|
  required_student_fields.each do |field|
    errors << "Current student #{index + 1} is missing #{field}." if student[field].to_s.strip.empty?
  end
end

required_alumni_fields = %w[name_ko degree_ko placement_ko]
people.fetch('alumni', []).each_with_index do |alum, index|
  required_alumni_fields.each do |field|
    errors << "Alumnus #{index + 1} is missing #{field}." if alum[field].to_s.strip.empty?
  end
end

people.fetch('conference_presentations', []).each_with_index do |presentation, index|
  %w[presenter_ko location_ko].each do |field|
    errors << "Conference presentation #{index + 1} is missing #{field}." if presentation[field].to_s.strip.empty?
  end
end

nrf = people.fetch('student_achievements', []).find { |item| item['id'] == 'saeyoung-yoon-nrf-2026' }
if nrf.nil?
  errors << 'Missing the 2026 Saeyoung Yoon NRF achievement.'
else
  %w[program_ko project_title_ko duration_ko].each do |field|
    errors << "NRF achievement is missing #{field}." if nrf[field].to_s.strip.empty?
  end
end

publications.select { |paper| paper['featured'] }.first(5).each do |paper|
  %w[featured_short_title_ko question_ko finding_ko impact_ko].each do |field|
    errors << "Featured publication #{paper['id']} is missing #{field}." if paper[field].to_s.strip.empty?
  end
end

teaching.fetch('homepage_cards', []).each_with_index do |item, index|
  %w[title_ko summary_ko].each do |field|
    errors << "Teaching card #{index + 1} is missing #{field}." if item[field].to_s.strip.empty?
  end
end

latest_selected = media.fetch('selected_media', []).max_by { |item| item['date'].to_s }
latest_column = media.fetch('essays_and_columns', []).max_by { |item| item['date'].to_s }
media_items = [latest_selected, media.fetch('featured', []).first, latest_column].compact
media_items.each_with_index do |item, index|
  %w[type_ko summary_ko].each do |field|
    errors << "Korean hub media item #{index + 1} is missing #{field}." if item[field].to_s.strip.empty?
  end
end

navigation.each_with_index do |item, index|
  errors << "Navigation item #{index + 1} is missing label_ko." if item['label_ko'].to_s.strip.empty?
end

news.each_with_index do |item, index|
  errors << "News item #{index + 1} is missing text_ko." if item['text_ko'].to_s.strip.empty?
end

inquiry_script = File.read(File.join(ROOT, 'assets', 'js', 'inquiry-form.js'))
errors << 'Inquiry form does not allow the korean-hub source.' unless inquiry_script.include?("'korean-hub'")
errors << 'The sitemap must include /ko/.' unless File.read(SITEMAP).include?('<loc>https://hyunseoklee.com/ko/</loc>')

if errors.any?
  warn 'Korean hub validation failed:'
  warn errors.join("\n")
  exit 1
end

puts 'Validated Korean hub SEO, structure, translations, shared identity, students, research, inquiry attribution, and sitemap.'
