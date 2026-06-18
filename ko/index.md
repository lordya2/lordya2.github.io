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
  <p><strong>{{ profile.title_ko }}</strong></p>
  <p>{{ profile.positioning_ko }}</p>
  <p><span class="review-note">검토 필요:</span> 아래 내용은 전체 이중언어 사이트가 아니라 주요 방문자를 위한 간략 한국어 개요입니다.</p>

  <h2>연구 분야</h2>
  <ul>
    {% for area in site.data.research_areas %}
      <li><span lang="en">{{ area.title }}</span> — {{ area.summary }}</li>
    {% endfor %}
  </ul>

  <h2>학생 연구 기회</h2>
  <p>{{ site.data.opportunities.summary_ko }}</p>
  <p>연구 관심 분야, 관련 수업, 프로그래밍 및 데이터 분석 경험, 연구를 하고 싶은 이유를 포함하여 이메일로 연락해 주세요.</p>

  <h2>대표 연구</h2>
  {% for paper in site.data.featured_research limit:2 %}
    <article class="mini-paper">
      <h3 lang="en">{{ paper.title }}</h3>
      <p lang="en">{{ paper.venue }}</p>
      <p>{{ paper.why_it_matters_ko }}</p>
    </article>
  {% endfor %}

  <h2>연락처</h2>
  <p>{{ profile.affiliation_ko }}<br>{{ profile.address_ko }}<br><a href="mailto:{{ profile.email }}" data-analytics-event="email_click">{{ profile.email }}</a></p>
</section>
