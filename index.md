---
layout: frontpage
title: Hyun Seok ("Huck") Lee
description: Huck Lee studies empirical operations, healthcare and pharmaceutical supply chains, retail, platforms, and policy-relevant decisions at Korea University Business School.
keywords: Hyun Seok, Huck, Lee, Operations Management, Supply Chain, Healthcare, Retail, KUBS.
lang: en
---
{% assign profile = site.data.profile %}
{% assign industry = site.data.industry_collaboration %}

<section class="hero section" aria-labelledby="hero-title">
  <div class="hero__content">
    <p class="eyebrow">{{ profile.affiliation }}</p>
    <h1 id="hero-title">{{ profile.name }} <span lang="ko">{{ profile.name_ko }}</span></h1>
    <p class="hero__title">{{ profile.display_title }}</p>
    <p class="hero__positioning">{{ profile.positioning }}</p>
    <p class="hero__positioning" lang="ko">{{ profile.positioning_ko }}</p>
    <div class="button-row" aria-label="Primary actions">
      <a class="button" href="{{ '/pages/research.html' | relative_url }}">Research</a>
      <a class="button button--secondary" href="{{ '/pages/industry.html' | relative_url }}" data-analytics-event="industry_page_click">산학협력</a>
      <a class="button button--secondary" href="{{ '/pages/people.html' | relative_url }}" data-analytics-event="people_page_click">People</a>
      <a class="button button--ghost" href="{{ profile.cv_url }}" data-analytics-event="cv_download">Download CV</a>
      <a class="button button--ghost" href="{{ profile.links.google_scholar.url }}" target="_blank" rel="noopener noreferrer" data-analytics-event="google_scholar_click">Google Scholar</a>
    </div>
  </div>
  <figure class="hero__portrait"><img src="{{ profile.headshot }}" alt="{{ profile.headshot_alt }}"></figure>
</section>

<section class="section" id="research-areas" aria-labelledby="research-areas-title">
  <p class="eyebrow">Research Areas</p>
  <h2 id="research-areas-title">Empirical operations research for healthcare, retail, platforms, and policy-relevant decisions.</h2>
  <div class="card-grid card-grid--four">
    {% for area in site.data.research_areas %}<article class="card"><h3>{{ area.title }}</h3><p>{{ area.summary }}</p></article>{% endfor %}
  </div>
</section>

<section class="section section--tinted" id="featured-research" aria-labelledby="featured-research-title">
  <p class="eyebrow">Featured Research</p>
  <h2 id="featured-research-title">Selected peer-reviewed publications.</h2>
  <div class="research-list">
    {% assign featured_papers = site.data.publications | where: "featured", true | sort: "featured_order" %}
    {% for paper in featured_papers %}
      <article class="research-card">
        <div class="research-card__summary">
          <p class="research-card__venue">{{ paper.venue }} · {{ paper.year }}</p>
          <h3>{{ paper.featured_short_title | default: paper.short_title }}</h3>
        </div>
        <div class="research-card__body">
          <dl>
            <dt>Question</dt><dd>{{ paper.question }}</dd>
            <dt>Finding</dt><dd>{{ paper.finding }}</dd>
            <dt>Impact</dt><dd>{{ paper.impact }}</dd>
            <dt>Publication links</dt><dd>{% for link in paper.links %}<a href="{{ link.url }}" data-analytics-event="publication_click">{{ link.label }}</a>{% unless forloop.last %}<span aria-hidden="true"> · </span>{% endunless %}{% endfor %}</dd>
          </dl>
        </div>
        <p class="research-card__citation">{{ paper.citation }}</p>
      </article>
    {% endfor %}
  </div>
</section>

<section class="section" id="industry-collaboration-preview" lang="ko" aria-labelledby="industry-collaboration-preview-title">
  <p class="eyebrow">Industry Collaboration · 산학협력</p>
  <h2 id="industry-collaboration-preview-title">기업 데이터와 운영 의사결정을 연결하는 연구 기반 산학협력</h2>
  <p>국내 기업과 함께 데이터 기반 운영진단, A/B 테스트 및 현장실험, 인과추론 기반 효과 평가, 수요예측·추천·재고 의사결정 프로젝트를 진행합니다.</p>
  <div class="card-grid card-grid--three">
    <article class="card"><h3>데이터 기반 운영진단</h3><p>판매, 재고, 고객, 물류, 노동, 서비스 데이터를 활용해 운영 병목과 개선 기회를 찾습니다.</p></article>
    <article class="card"><h3>A/B 테스트 및 인과추론</h3><p>정책, 프로모션, 추천, 서비스 변화가 실제 성과에 미친 영향을 엄밀하게 평가합니다.</p></article>
    <article class="card"><h3>MSBA 캡스톤·산학 프로젝트</h3><p>기업 현안을 학생 프로젝트와 연결해 예측, 추천, 군집분석, 효과 평가 결과물을 만듭니다.</p></article>
  </div>
  <p><a class="button" href="{{ '/pages/industry.html' | relative_url }}" data-analytics-event="industry_page_click">산학협력 사례 보기</a></p>
</section>

<section class="section" id="media-impact-preview" aria-labelledby="media-impact-preview-title">
  <p class="eyebrow">Media &amp; Impact</p>
  <h2 id="media-impact-preview-title">Research in the media and public-facing outlets</h2>
  <div class="media-grid">
    {% for item in site.data.media_impact.featured limit:1 %}
      <article class="card media-group">
        <p class="card-label media-meta">{{ item.type }} · {{ item.date }}</p>
        <h3>{{ item.title }}</h3>
        <p>{{ item.summary }}</p>
        {% if item.related_work %}<p><span class="status-badge">Related research</span> {{ item.related_work }}</p>{% endif %}
        <p><a href="{{ '/pages/media.html#drug-shortage-coverage' | relative_url }}" data-analytics-event="media_impact_click">View grouped coverage</a></p>
      </article>
    {% endfor %}
    {% for item in site.data.media_impact.selected_media limit:1 offset:1 %}
      <article class="card">
        <p class="card-label media-meta">{{ item.type }} · {{ item.date }}</p>
        <h3>{{ item.title }}</h3>
        <p><strong>{{ item.outlet }}</strong></p>
        <p>{{ item.summary }}</p>
        <p><a href="{{ item.url }}" target="_blank" rel="noopener noreferrer" data-analytics-event="media_impact_click">Read article</a></p>
      </article>
    {% endfor %}
    {% for item in site.data.media_impact.essays_and_columns limit:1 offset:2 %}
      <article class="card">
        <p class="card-label media-meta">{{ item.type }} · {{ item.date }}</p>
        <h3>{{ item.title }}</h3>
        <p><strong>{{ item.outlet }}</strong></p>
        <p>{{ item.summary }}</p>
        <p><a href="{{ item.url }}" target="_blank" rel="noopener noreferrer" data-analytics-event="media_impact_click">Read column</a></p>
      </article>
    {% endfor %}
  </div>
  <p><a class="button" href="{{ '/pages/media.html' | relative_url }}" data-analytics-event="media_impact_click">View Media &amp; Impact</a></p>
</section>

<section class="section" id="people-preview" aria-labelledby="people-preview-title">
  <p class="eyebrow">People</p>
  <h2 id="people-preview-title">Student mentoring, alumni placements, and MSBA capstone outcomes.</h2>
  <p>{{ site.data.people.mentoring_approach }}</p>
  <div class="card-grid card-grid--three">
    <article class="card"><h3>Current students</h3><ul>{% for person in site.data.people.current_students %}<li>{{ person.name }} — {{ person.program }}</li>{% endfor %}</ul></article>
    <article class="card"><h3>Selected alumni</h3><ul>{% for person in site.data.people.alumni limit:2 %}<li>{{ person.name }} — {{ person.placement }}</li>{% endfor %}</ul></article>
    <article class="card"><h3>Research opportunities</h3><p>{{ site.data.opportunities.summary }}</p><p><a href="mailto:{{ profile.email }}?subject=Research%20opportunities" data-analytics-event="student_opportunity_click">Email about opportunities</a></p></article>
  </div>
  <p><a class="button" href="{{ '/pages/people.html' | relative_url }}" data-analytics-event="people_page_click">View People page</a></p>
</section>

<section class="section section--compact" id="news" aria-labelledby="news-title"><p class="eyebrow">Recent News</p><h2 id="news-title">Recent updates</h2><ul class="timeline-list">{% for item in site.data.news limit:4 %}<li><time>{{ item.date }}</time><span>{{ item.text }}</span></li>{% endfor %}</ul><p><a href="{{ '/pages/news.html' | relative_url }}" data-analytics-event="news_archive_click">View all news</a></p></section>

<section class="section section--compact" id="awards-service" aria-labelledby="awards-service-title"><p class="eyebrow">Awards &amp; Service</p><h2 id="awards-service-title">Selected recognition and service</h2><div class="card-grid card-grid--three awards-grid">{% for item in site.data.awards_service.homepage_highlights %}<article class="card award-card"><p class="card-label">{{ item.category }}</p><h3>{{ item.title }}</h3>{% if item.organization %}<p>{{ item.organization }}</p>{% endif %}{% if item.detail %}<p>{{ item.detail }}</p>{% endif %}{% if item.date %}<p class="award-card__date">{{ item.date }}</p>{% endif %}</article>{% endfor %}</div><p><a href="{{ '/pages/award.html' | relative_url }}">View awards and service</a></p></section>

<section class="section" id="teaching" aria-labelledby="teaching-title"><p class="eyebrow">Teaching</p><h2 id="teaching-title">Courses across research graduate programs, MSBA, MBA, and undergraduate education.</h2><div class="card-grid card-grid--four">{% for card in site.data.teaching.homepage_cards %}<article class="card"><h3>{{ card.title }}</h3><p>{{ card.summary }}</p></article>{% endfor %}</div><p><a href="{{ '/pages/teaching.html' | relative_url }}">View teaching history</a></p></section>

<section class="section section--contact" id="contact" aria-labelledby="contact-title">
  <div class="contact__intro">
    <p class="eyebrow">Contact</p>
    <h2 id="contact-title">Get in touch</h2>
    <p class="contact__name"><strong>{{ profile.name }}</strong> <span lang="ko">{{ profile.name_ko }}</span></p>
    <p>{{ profile.full_title }}<br>{{ profile.affiliation }}</p>
    <p lang="ko">{{ profile.full_title_ko }}<br>{{ profile.affiliation_ko }}</p>
  </div>
  <div class="contact__details" aria-label="Contact details">
    <dl class="contact-card">
      <div class="contact-card__row">
        <dt>Email</dt>
        <dd><a href="mailto:{{ profile.email }}" data-analytics-event="email_click">{{ profile.email }}</a></dd>
      </div>
      <div class="contact-card__row">
        <dt>Phone</dt>
        <dd><a href="tel:{{ profile.office_phone | replace: '-', '' }}">{{ profile.office_phone }}</a></dd>
      </div>
      <div class="contact-card__row">
        <dt>Office</dt>
        <dd>{{ profile.office }}</dd>
      </div>
      <div class="contact-card__row">
        <dt>Address</dt>
        <dd>{{ profile.address }}<br><span lang="ko">{{ profile.address_ko }}</span></dd>
      </div>
      <div class="contact-card__row">
        <dt>Profile links</dt>
        <dd class="link-row"><a href="{{ profile.cv_url }}" data-analytics-event="cv_download">CV</a><a href="{{ profile.links.kubs.url }}" target="_blank" rel="noopener noreferrer" data-analytics-event="external_profile_click">{{ profile.links.kubs.label }}</a><a href="{{ profile.links.linkedin.url }}" target="_blank" rel="noopener noreferrer" data-analytics-event="external_profile_click">{{ profile.links.linkedin.label }}</a><a href="{{ profile.links.google_scholar.url }}" target="_blank" rel="noopener noreferrer" data-analytics-event="google_scholar_click">{{ profile.links.google_scholar.label }}</a><a href="{{ profile.links.orcid.url }}" target="_blank" rel="noopener noreferrer" data-analytics-event="orcid_click">{{ profile.links.orcid.label }}</a></dd>
      </div>
    </dl>
  </div>
</section>
