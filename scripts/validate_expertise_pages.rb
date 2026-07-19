#!/usr/bin/env ruby
# frozen_string_literal: true

require 'json'

ROOT = File.expand_path('..', __dir__)
SITE = File.join(ROOT, '_site')
INDUSTRY = File.join(SITE, 'pages', 'industry.html')
EXPLAINER = File.join(SITE, 'ko', 'drug-shortage-recovery', 'index.html')
KOREAN_HUB = File.join(SITE, 'ko', 'index.html')
SITEMAP = File.join(ROOT, 'sitemap.xml')
INQUIRY_SCRIPT = File.join(ROOT, 'assets', 'js', 'inquiry-form.js')

errors = []

{
  'industry page' => INDUSTRY,
  'drug-shortage explainer' => EXPLAINER,
  'Korean hub' => KOREAN_HUB
}.each do |label, path|
  errors << "Missing generated #{label}: #{path}" unless File.file?(path)
end

if errors.any?
  warn 'Expertise-page validation failed:'
  warn errors.join("\n")
  exit 1
end

industry_html = File.read(INDUSTRY)
explainer_html = File.read(EXPLAINER)
hub_html = File.read(KOREAN_HUB)

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

def duplicate_ids(document)
  document.scan(/\bid=["']([^"']+)["']/i).flatten.tally.select { |_id, count| count > 1 }.keys
end

errors << 'Industry page must declare Korean as its document language.' unless industry_html.match?(/<html\s+lang=["']ko["']/i)
errors << 'Industry page must contain exactly one H1.' unless industry_html.scan(/<h1\b/i).length == 1
errors << 'Industry page canonical is incorrect.' unless industry_html.include?('<link rel="canonical" href="https://hyunseoklee.com/pages/industry.html">')
errors << 'Industry SEO title is missing supply-chain speaking.' unless industry_html[/<title>(.*?)<\/title>/im, 1].to_s.include?('공급망 강연')
errors << 'Industry SEO title is missing operations advisory.' unless industry_html[/<title>(.*?)<\/title>/im, 1].to_s.include?('운영관리 기업 자문')

[
  '공급망 리스크와 회복탄력성 기업 강연',
  '데이터 기반 운영관리 기업 자문·공동연구',
  '헬스케어·제약 공급망 전문 분야'
].each do |heading|
  errors << "Industry page is missing heading: #{heading}" unless industry_html.include?(heading)
end

service_schema = json_ld_blocks(industry_html, errors, 'Industry page').find do |block|
  Array(block['@graph']).any? { |item| item['@type'] == 'Service' }
end
errors << 'Industry page is missing Service JSON-LD.' unless service_schema

errors << 'Drug-shortage explainer must declare Korean as its document language.' unless explainer_html.match?(/<html\s+lang=["']ko["']/i)
errors << 'Drug-shortage explainer must contain exactly one H1.' unless explainer_html.scan(/<h1\b/i).length == 1
errors << 'Drug-shortage explainer canonical is incorrect.' unless explainer_html.include?('<link rel="canonical" href="https://hyunseoklee.com/ko/drug-shortage-recovery/">')
errors << 'Drug-shortage explainer must use article Open Graph metadata.' unless explainer_html.include?('<meta property="og:type" content="article">')

['4,741건', '136개', '10.3%', '21.5%', '재고정책과 학습 프로그램의 효과를 직접 비교하지 않았습니다'].each do |term|
  errors << "Drug-shortage explainer is missing required evidence or qualifier: #{term}" unless explainer_html.include?(term)
end

article_schema = json_ld_blocks(explainer_html, errors, 'Drug-shortage explainer').find { |block| block['@type'] == 'Article' }
if article_schema.nil?
  errors << 'Drug-shortage explainer is missing Article JSON-LD.'
else
  errors << 'Article JSON-LD must declare ko-KR.' unless article_schema['inLanguage'] == 'ko-KR'
  errors << 'Article JSON-LD must reference the shared Person id.' unless article_schema.dig('author', '@id') == 'https://hyunseoklee.com/#person'
  errors << 'Article JSON-LD must use the explainer as mainEntityOfPage.' unless article_schema.dig('mainEntityOfPage', '@id') == 'https://hyunseoklee.com/ko/drug-shortage-recovery/'
end

duplicate_ids(industry_html).each { |id| errors << "Industry page contains duplicate id #{id.inspect}." }
duplicate_ids(explainer_html).each { |id| errors << "Drug-shortage explainer contains duplicate id #{id.inspect}." }

explainer_path = '/ko/drug-shortage-recovery/'
errors << 'Korean hub does not link to the drug-shortage explainer.' unless hub_html.include?(explainer_path)
errors << 'Industry page does not link to the drug-shortage explainer.' unless industry_html.include?(explainer_path)
errors << 'Sitemap does not include the drug-shortage explainer.' unless File.read(SITEMAP).include?('<loc>https://hyunseoklee.com/ko/drug-shortage-recovery/</loc>')
errors << 'Inquiry form does not allow the drug-shortage-explainer source.' unless File.read(INQUIRY_SCRIPT).include?("'drug-shortage-explainer'")

if errors.any?
  warn 'Expertise-page validation failed:'
  warn errors.join("\n")
  exit 1
end

puts 'Validated Korean expertise hub links, industry services, drug-shortage explainer, structured data, sitemap, and inquiry attribution.'
