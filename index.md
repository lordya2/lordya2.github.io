---
layout: frontpage
title: Hyun Seok ("Huck") Lee
description: Hyun Seok ("Huck") Lee uses operational data, field experiments, and causal inference to improve decisions in healthcare, supply chains, retail, services, platforms, and AI-enabled work.
keywords: Hyun Seok, Huck, Lee, Operations Management, Supply Chain, Healthcare, Retail, KUBS.
lang: en
alternate_url: /ko/
---
{% assign profile = site.data.profile %}
{% assign industry = site.data.industry_collaboration %}
{% assign people = site.data.people %}

<section class="hero section" aria-labelledby="hero-title">
  <div class="hero__content">
    <p class="eyebrow">{{ profile.affiliation }}</p>
    <h1 id="hero-title">{{ profile.name }} <span lang="ko">{{ profile.name_ko }}</span></h1>
    <p class="hero__title">{{ profile.display_title }}</p>
    <p class="hero__positioning"><strong class="hero__tagline">{{ profile.positioning_lead }}</strong> {{ profile.positioning }}</p>
    <nav class="button-row" aria-label="Primary paths">
      <a class="button" href="{{ '/pages/research.html' | relative_url }}">Explore research</a>
      <a class="button button--secondary" href="{{ '/pages/people.html' | relative_url }}" data-analytics-event="people_page_click">Meet the research group</a>
      <a class="button button--secondary" href="#work-with-organizations" data-analytics-event="organization_pathways_click"><span lang="ko">기업 협력</span> · Work with organizations</a>
    </nav>
    <nav class="hero__utility-links" aria-label="Profile resources">
      <a href="{{ profile.cv_url }}" data-analytics-event="cv_download">CV</a>
      <a href="{{ profile.links.google_scholar.url }}" target="_blank" rel="noopener noreferrer" data-analytics-event="google_scholar_click">Google Scholar</a>
      <a href="{{ '/ko/' | relative_url }}" lang="ko">한국어 소개</a>
    </nav>
  </div>
  <figure class="hero__portrait"><img src="{{ profile.headshot }}" alt="{{ profile.headshot_alt }}" width="1122" height="1402" fetchpriority="high"></figure>
</section>

<section class="section section--compact section--tinted" id="news" aria-labelledby="news-title">
  <p class="eyebrow">Recent Updates</p>
  <h2 id="news-title">Research, student achievements, and recognition</h2>
  {% assign recent_news = site.data.news | sort: "date" | reverse %}
  <ul class="timeline-list">
    {% for item in recent_news limit:3 %}
      <li><time datetime="{{ item.date }}">{{ item.date }}</time><span>{% if item.url %}<a href="{{ item.url | relative_url }}">{{ item.text }}</a>{% else %}{{ item.text }}{% endif %}</span></li>
    {% endfor %}
  </ul>
  <p><a href="{{ '/pages/news.html' | relative_url }}" data-analytics-event="news_archive_click">View all updates</a></p>
</section>

<section class="section" id="research-areas" aria-labelledby="research-areas-title">
  <p class="eyebrow">Research Areas</p>
  <h2 id="research-areas-title">Research grounded in real operating problems</h2>
  <div class="card-grid card-grid--four">
    {% for area in site.data.research_areas %}<article class="card"><h3>{{ area.title }}</h3><p>{{ area.summary }}</p></article>{% endfor %}
  </div>
  <p><a href="{{ '/pages/research.html' | relative_url }}">Explore research themes and methods</a></p>
</section>

<section class="section section--tinted" id="featured-research" aria-labelledby="featured-research-title">
  <p class="eyebrow">Featured Research</p>
  <h2 id="featured-research-title">Selected research and its operational implications</h2>
  {% assign featured_papers = site.data.publications | where: "featured", true | sort: "featured_order" %}
  <div class="card-grid card-grid--three research-highlight-grid">
    {% for paper in featured_papers limit:3 %}
      <article class="card research-highlight-card">
        <p class="research-card__venue">{{ paper.venue }} · {{ paper.year }}</p>
        <h3>{{ paper.featured_short_title | default: paper.short_title }}</h3>
        <p>{{ paper.finding }}</p>
        {% if paper.links %}
          <p class="link-row research-highlight-card__links">{% for link in paper.links %}<a href="{{ link.url }}" data-analytics-event="publication_click">{{ link.label }}</a>{% unless forloop.last %}<span aria-hidden="true"> · </span>{% endunless %}{% endfor %}</p>
        {% endif %}
      </article>
    {% endfor %}
  </div>
  <p><a class="button button--ghost" href="{{ '/pages/research.html' | relative_url }}">View the full research portfolio</a></p>
</section>

<section class="section" id="research-group" aria-labelledby="research-group-title">
  <p class="eyebrow">Research Group &amp; Opportunities</p>
  <h2 id="research-group-title">Students working on consequential operations questions</h2>
  <p class="lead-text">{{ people.group_intro }}</p>
  <div class="card-grid card-grid--four home-student-grid">
    {% for student in people.current_students %}
      <article class="card home-student-card">
        <p class="home-student-card__area">{{ student.area }}</p>
        <h3><a href="{{ '/pages/people.html#' | append: student.id | relative_url }}">{{ student.name }}</a> <span lang="ko">{{ student.name_ko }}</span></h3>
        <p class="home-student-card__meta">{{ student.program }}{% if student.entry_year %} · Entered {{ student.entry_year }}{% endif %}</p>
        <p><strong>{{ student.project_title }}</strong></p>
        <p>{{ student.project_summary }}</p>
      </article>
    {% endfor %}
  </div>
  {% assign student_achievement = people.student_achievements | first %}
  {% if student_achievement %}
    <article class="home-achievement">
      <div>
        <p class="card-label">Student Achievement · {{ student_achievement.year }}</p>
        <h3>{{ student_achievement.student }}: {{ student_achievement.title }}</h3>
        <p>{{ student_achievement.project_summary }}</p>
      </div>
      <p><a class="button button--ghost" href="{{ '/pages/people.html#' | append: student_achievement.id | relative_url }}">View funding details</a></p>
    </article>
  {% endif %}
  <div class="button-row section-actions">
    <a class="button" href="{{ '/pages/people.html' | relative_url }}" data-analytics-event="people_page_click">Meet the research group</a>
    <a class="button button--ghost" href="{{ '/pages/people.html#research-opportunities' | relative_url }}" data-analytics-event="student_opportunity_click">Research opportunities</a>
  </div>
</section>

<section class="section section--tinted" id="work-with-organizations" lang="ko" aria-labelledby="work-with-organizations-title">
  <p class="eyebrow">Work with Organizations · 기업 협력</p>
  <h2 id="work-with-organizations-title">운영 질문을 검증 가능한 의사결정으로 바꿉니다</h2>
  <p class="lead-text">기업의 판매·재고·고객·물류·노동·서비스 데이터를 바탕으로 문제를 정의하고, 현장실험·인과추론·머신러닝을 결합해 실행 가능한 개선안을 도출합니다.</p>
  <div class="card-grid card-grid--three">
    {% for mode in industry.project_modes %}
      <article class="card engagement-card">
        <h3>{{ mode.title }}</h3>
        <p>{{ mode.description }}</p>
        <p><a class="button button--ghost" href="{{ '/pages/inquiry.html' | relative_url }}?type={{ mode.id | uri_escape }}&amp;source=homepage" data-analytics-event="{{ mode.event }}">{{ mode.cta }}</a></p>
      </article>
    {% endfor %}
  </div>
  <p class="collaboration-topics"><strong>주요 협력 주제:</strong> 수요·재고·추천, 현장실험과 효과평가, 공급망 회복탄력성, AI 기반 업무설계</p>
  <p><a href="{{ '/pages/industry.html' | relative_url }}" data-analytics-event="industry_page_click">협력 분야와 공개 사례 자세히 보기</a></p>
</section>

<section class="section" id="media-impact-preview" aria-labelledby="media-impact-preview-title">
  <p class="eyebrow">Media &amp; Impact</p>
  <h2 id="media-impact-preview-title">Research beyond academic journals</h2>
  {% assign latest_selected_media = site.data.media_impact.selected_media | sort: "date" | reverse %}
  {% assign latest_selected_item = latest_selected_media | first %}
  {% assign featured_impact = site.data.media_impact.featured | first %}
  {% assign latest_columns = site.data.media_impact.essays_and_columns | sort: "date" | reverse %}
  {% assign latest_column = latest_columns | first %}
  <div class="media-grid">
    {% if latest_selected_item %}
      <article class="card">
        <p class="card-label media-meta">{{ latest_selected_item.type }} · {{ latest_selected_item.date }}</p>
        <h3>{{ latest_selected_item.title }}</h3>
        <p><strong>{{ latest_selected_item.outlet }}</strong></p>
        <p>{{ latest_selected_item.summary }}</p>
        <p><a href="{{ latest_selected_item.url }}" target="_blank" rel="noopener noreferrer" data-analytics-event="media_impact_click">Read article</a></p>
      </article>
    {% endif %}
    {% if featured_impact %}
      <article class="card media-group">
        <p class="card-label media-meta">{{ featured_impact.type }} · {{ featured_impact.date }}</p>
        <h3>{{ featured_impact.title }}</h3>
        <p>{{ featured_impact.summary }}</p>
        {% if featured_impact.related_work %}<p><span class="status-badge">Related research</span> {{ featured_impact.related_work }}</p>{% endif %}
        <p><a href="{{ '/pages/media.html#drug-shortage-coverage' | relative_url }}" data-analytics-event="media_impact_click">View grouped coverage</a></p>
      </article>
    {% endif %}
    {% if latest_column %}
      <article class="card">
        <p class="card-label media-meta">{{ latest_column.type }} · {{ latest_column.date }}</p>
        <h3>{{ latest_column.title }}</h3>
        <p><strong>{{ latest_column.outlet }}</strong></p>
        <p>{{ latest_column.summary }}</p>
        <p><a href="{{ latest_column.url }}" target="_blank" rel="noopener noreferrer" data-analytics-event="media_impact_click">Read column</a></p>
      </article>
    {% endif %}
  </div>
  <p><a class="button button--ghost" href="{{ '/pages/media.html' | relative_url }}" data-analytics-event="media_impact_click">View Media &amp; Impact</a></p>
</section>

<section class="section section--compact section--tinted" id="academic-profile" aria-labelledby="academic-profile-title">
  <p class="eyebrow">Academic Profile</p>
  <h2 id="academic-profile-title">Recognition, service, and teaching</h2>
  <div class="card-grid card-grid--three academic-overview-grid">
    <article class="card academic-overview-card">
      <p class="card-label">Recognition</p>
      <h3>Recent awards and recognition</h3>
      <ul class="compact-list">
        {% for item in site.data.awards_service.selected_awards limit:3 %}<li><span class="compact-list__meta">{{ item.date }}</span><span>{{ item.label }}</span></li>{% endfor %}
      </ul>
      <p><a href="{{ '/pages/award.html' | relative_url }}">View awards and service</a></p>
    </article>
    <article class="card academic-overview-card">
      <p class="card-label">Editorial Service</p>
      <h3>Academic and professional service</h3>
      <ul class="compact-list compact-list--stacked">
        {% for item in site.data.awards_service.editorial_review_boards %}<li>{{ item }}</li>{% endfor %}
        <li>Korean Production and Operations Management Society: Director and Editorial Board Member</li>
      </ul>
      <p><a href="{{ '/pages/award.html' | relative_url }}">View service record</a></p>
    </article>
    <article class="card academic-overview-card">
      <p class="card-label">Teaching</p>
      <h3>Research training and analytics education</h3>
      <ul class="compact-list compact-list--stacked">
        {% for item in site.data.teaching.homepage_cards %}<li><strong>{{ item.title }}</strong><br>{{ item.summary }}</li>{% endfor %}
      </ul>
      <p><a href="{{ '/pages/teaching.html' | relative_url }}">View teaching history</a></p>
    </article>
  </div>
</section>

<section class="section section--contact" id="contact" aria-labelledby="contact-title">
  <div class="contact__intro">
    <p class="eyebrow">Contact</p>
    <h2 id="contact-title">Choose the right path</h2>
    <p>Prospective students can review current projects and research opportunities, organizations can use the collaboration inquiry, and academic inquiries are welcome by email.</p>
    <nav class="button-row contact-pathways" aria-label="Contact pathways">
      <a class="button" href="{{ '/pages/people.html#research-opportunities' | relative_url }}" data-analytics-event="student_opportunity_click">Prospective students</a>
      <a class="button button--secondary" href="{{ '/pages/inquiry.html' | relative_url }}?source=homepage" lang="ko" data-analytics-event="inquiry_page_click">기업 강연·협업 문의</a>
      <a class="button button--ghost" href="mailto:{{ profile.email }}" data-analytics-event="email_click">Academic inquiries</a>
    </nav>
    <p class="contact__name"><strong>{{ profile.name }}</strong> <span lang="ko">{{ profile.name_ko }}</span></p>
    <p>{{ profile.full_title }}<br>{{ profile.affiliation }}</p>
  </div>
  <div class="contact__details">
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
