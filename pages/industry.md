---
layout: page
title: 산학협력
hide_page_header: true
description: 기업 데이터와 운영 의사결정을 연결하는 연구 기반 산학협력.
lang: ko
---
{% assign industry = site.data.industry_collaboration %}
{% assign profile = site.data.profile %}

<section class="section page-section industry-page" lang="ko" aria-labelledby="industry-title">
  <p class="eyebrow">{{ industry.eyebrow_en }} · {{ industry.headline }}</p>
  <h1 id="industry-title">{{ industry.title }}</h1>
  <p class="lead-text">{{ industry.intro }}</p>
  <div class="button-row" aria-label="기업 협력 경로">
    {% for mode in industry.project_modes %}
      <a class="button{% unless forloop.first %} button--ghost{% endunless %}" href="#{{ mode.id }}" data-analytics-event="{{ mode.event }}">{{ mode.title }}</a>
    {% endfor %}
  </div>
  <p class="button-row" aria-label="기업 협력 소개 자료">
    <a class="button button--ghost" href="{{ '/assets/downloads/hyunseok-lee-speaker-one-pager-ko.pdf' | relative_url }}" data-analytics-event="speaker_onepager_download">Speaker One-pager PDF</a>
    <a class="button button--ghost" href="{{ '/assets/downloads/hyunseok-lee-collaboration-brief-ko.pdf' | relative_url }}" data-analytics-event="collaboration_brief_download">Collaboration Brief PDF</a>
  </p>

  <h2>어떤 문제를 함께 다룰 수 있나</h2>
  <div class="card-grid card-grid--three">
    {% for area in industry.collaboration_areas %}
      <article class="card">
        <h3>{{ area.title }}</h3>
        <p>{{ area.description }}</p>
      </article>
    {% endfor %}
  </div>

  <h2>세 가지 협업 방식</h2>
  <p>{{ industry.engagement_intro }}</p>
  <div class="card-grid card-grid--three">
    {% for mode in industry.project_modes %}
      <article class="card engagement-card" id="{{ mode.id }}">
        <h3>{{ mode.title }}</h3>
        <p>{{ mode.description }}</p>
        <p><a class="button button--ghost" href="{{ '/pages/inquiry.html' | relative_url }}?type={{ mode.id | uri_escape }}&amp;source=industry-page" data-analytics-event="{{ mode.event }}">{{ mode.cta }}</a></p>
      </article>
    {% endfor %}
  </div>

  <h2>MSBA 캡스톤 및 산학 프로젝트 사례</h2>
  <p>{{ industry.capstone_intro }}</p>
  <p class="muted">{{ industry.case_disclaimer }}</p>
  <div class="card-grid card-grid--two capstone-grid">
    {% for project in industry.capstone_projects %}
      <article class="card capstone-card">
        <p class="card-label">{{ project.partner }}</p>
        <h3>{{ project.title }}</h3>
        {% if project.problem %}
          <dl class="case-study__details">
            <dt>문제</dt><dd>{{ project.problem }}</dd>
            <dt>데이터</dt><dd>{{ project.data }}</dd>
            <dt>방법</dt><dd>{{ project.method }}</dd>
            <dt>의사결정 초점</dt><dd>{{ project.decision_relevance }}</dd>
          </dl>
        {% else %}
          <p>{{ project.description }}</p>
        {% endif %}
        {% if project.video_url %}
          <div class="video-embed">
            <iframe src="{{ project.video_url }}" title="{{ project.title }} 발표 영상" loading="lazy" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
          </div>
        {% endif %}
      </article>
    {% endfor %}
  </div>

  <h2>연결된 조직 및 산업 맥락</h2>
  <p class="muted">{{ industry.selected_collaborators.note }}</p>
  <div class="card-grid card-grid--two">
    {% for group in industry.selected_collaborators.groups %}
      <article class="card">
        <p class="card-label">{{ group.geography }}</p>
        <ul>
          {% for organization in group.organizations %}<li>{{ organization }}</li>{% endfor %}
        </ul>
      </article>
    {% endfor %}
  </div>

  <h2>협업 원칙</h2>
  <ul class="pill-list">
    {% for principle in industry.principles %}<li>{{ principle }}</li>{% endfor %}
  </ul>

  <h2 id="inquiry">문의</h2>
  <div class="card">
    <p>{{ industry.contact_cta.text }}</p>
    <p><a class="button" href="{{ '/pages/inquiry.html' | relative_url }}?source=industry-page" data-analytics-event="inquiry_page_click">{{ industry.contact_cta.button }}</a></p>
    <p class="muted">이메일로 직접 문의하려면 <a href="mailto:{{ profile.email }}?subject={{ industry.contact_cta.subject | uri_escape }}" data-analytics-event="industry_email_click">{{ profile.email }}</a>로 보내 주세요.</p>
  </div>
</section>
