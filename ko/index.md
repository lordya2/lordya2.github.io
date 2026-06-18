---
layout: page
title: 한국어 개요
description: Hyun Seok Huck Lee 교수의 한국어 간략 소개입니다.
permalink: /ko/
lang: ko
---
{% assign profile = site.data.profile %}
<section class="section korean-overview" lang="ko" aria-labelledby="ko-title">
  <p class="eyebrow">한국어 개요</p>
  <h1 id="ko-title">{{ profile.name_ko }} · {{ profile.name }}</h1>
  <p><strong>{{ profile.title_ko }}</strong></p><p>{{ profile.positioning_ko }}</p>
  <h2>연구 분야</h2><div class="card-grid card-grid--four">{% for area in site.data.research_areas %}<article class="card"><h3>{{ area.title_ko }}</h3><p>{{ area.summary_ko }}</p></article>{% endfor %}</div>
  <h2>대표 연구와 임팩트</h2>{% for paper in site.data.featured_research limit:3 %}<article class="mini-paper"><h3 lang="en">{{ paper.short_title }}</h3><p><strong>질문:</strong> {{ paper.question_ko }}</p><p><strong>결과:</strong> {{ paper.finding_ko }}</p><p><strong>의의:</strong> {{ paper.impact_ko }}</p></article>{% endfor %}
  <h2>People</h2><p>현재 학생과 졸업생 배치, MSBA 캡스톤 멘토링 결과는 <a href="{{ BASE_PATH }}/pages/people.html" data-analytics-event="people_page_click">People page</a>에서 확인할 수 있습니다.</p>
  <h2>학생 배치 하이라이트</h2><p>아래 배치 정보는 CV에 기재된 공식 영문 기관명을 유지했습니다.</p><ul>{% for alum in site.data.people.alumni %}<li>{{ alum.name }} — {{ alum.degree }}, {{ alum.year }}년 졸업; <span lang="en">{{ alum.placement }}</span></li>{% endfor %}</ul>
  <h2>연구 기회 및 연락처</h2><p>{{ site.data.opportunities.summary_ko }}</p><p><a href="mailto:{{ profile.email }}" data-analytics-event="email_click">{{ profile.email }}</a> · <a href="{{ profile.cv_url }}" data-analytics-event="cv_download">CV</a> · <a href="{{ profile.links.google_scholar.url }}" data-analytics-event="google_scholar_click">Google Scholar</a></p>
</section>
