---
layout: frontpage
title: Hyun Seok ("Huck") Lee
description: Huck Lee is a KUBS Research Fellow, Associate Professor, and Area Chair in Korea University Business School.
keywords: Hyun Seok, Huck, Lee, Business Analytics, Service, Retail, Healthcare, KUBS.
lang: en
---
{% assign profile = site.data.profile %}

<section class="hero section" aria-labelledby="hero-title">
  <div class="hero__content">
    <p class="eyebrow">{{ profile.affiliation }}</p>
    <h1 id="hero-title">{{ profile.name }} <span lang="ko">{{ profile.name_ko }}</span></h1>
    <p class="hero__title">{{ profile.title }}</p>
    <p class="hero__positioning">{{ profile.positioning }}</p>
    <p class="hero__positioning" lang="ko">{{ profile.positioning_ko }}</p>
    <div class="button-row" aria-label="Primary actions">
      <a class="button" href="{{ BASE_PATH }}/pages/research.html">Research</a>
      <a class="button button--secondary" href="#students" data-analytics-event="student_opportunity_click">Students</a>
      <a class="button button--ghost" href="{{ profile.cv_url }}" data-analytics-event="cv_download">Download CV</a>
    </div>
  </div>
  <figure class="hero__portrait">
    <img src="{{ profile.headshot }}" alt="{{ profile.headshot_alt }}">
  </figure>
</section>

<section class="section" id="research-areas" aria-labelledby="research-areas-title">
  <p class="eyebrow">Research Areas</p>
  <h2 id="research-areas-title">Empirical operations research for organizations, healthcare, retail, and policy.</h2>
  <div class="card-grid card-grid--three">
    {% for area in site.data.research_areas %}
      <article class="card">
        <h3>{{ area.title }}</h3>
        <p>{{ area.summary }}</p>
      </article>
    {% endfor %}
  </div>
</section>

<section class="section section--tinted" id="featured-research" aria-labelledby="featured-research-title">
  <p class="eyebrow">Featured Research</p>
  <h2 id="featured-research-title">Selected work framed for researchers, editors, organizations, and policy audiences.</h2>
  <div class="research-list">
    {% for paper in site.data.featured_research %}
      <article class="research-card">
        <div>
          <p class="research-card__venue">{{ paper.venue }}</p>
          <h3>{{ paper.title }}</h3>
          <p>{{ paper.authors }} ({{ paper.year }})</p>
        </div>
        <dl>
          <dt>Research question</dt>
          <dd>{{ paper.research_question }}</dd>
          {% if paper.key_finding and paper.key_finding != '' %}
          <dt>Key finding</dt>
          <dd>{{ paper.key_finding }}</dd>
          {% endif %}
          <dt>Why it matters</dt>
          <dd>{{ paper.why_it_matters }} <span lang="ko">{{ paper.why_it_matters_ko }}</span></dd>
        </dl>
        <p class="link-row">
          {% for link in paper.links %}
            <a href="{{ link.url }}" data-analytics-event="publication_click">{{ link.label }}</a>{% unless forloop.last %}<span aria-hidden="true"> · </span>{% endunless %}
          {% endfor %}
        </p>
      </article>
    {% endfor %}
  </div>
</section>

<section class="section" id="students" aria-labelledby="students-title">
  <p class="eyebrow">Students &amp; Research Opportunities</p>
  <h2 id="students-title">Research mentoring for PhD, MS, and undergraduate students.</h2>
  <p>{{ site.data.opportunities.summary }}</p>
  <p lang="ko">{{ site.data.opportunities.summary_ko }}</p>
  <div class="split-list">
    <div>
      <h3>Who should reach out</h3>
      <ul>
        {% for item in site.data.opportunities.audiences %}<li>{{ item }}</li>{% endfor %}
      </ul>
    </div>
    <div>
      <h3>Helpful details to include</h3>
      <ul>
        {% for item in site.data.opportunities.email_guidance %}<li>{{ item }}</li>{% endfor %}
      </ul>
    </div>
  </div>
  <p><a class="button" href="mailto:{{ profile.email }}?subject=Research%20opportunities" data-analytics-event="student_opportunity_click">Contact about research opportunities</a></p>
</section>

<section class="section section--compact" id="news" aria-labelledby="news-title">
  <p class="eyebrow">Recent News</p>
  <h2 id="news-title">Recent updates</h2>
  <ul class="timeline-list">
    {% for item in site.data.news %}
      <li><time>{{ item.date }}</time><span>{{ item.text }}</span></li>
    {% endfor %}
  </ul>
</section>

<section class="section section--compact" id="awards-service" aria-labelledby="awards-service-title">
  <p class="eyebrow">Awards &amp; Service</p>
  <h2 id="awards-service-title">Selected recognition and service</h2>
  <ul class="timeline-list">
    {% for award in site.data.awards_service %}
      <li><time>{{ award.date }}</time><span>{{ award.label }}</span></li>
    {% endfor %}
  </ul>
  <p><a href="{{ BASE_PATH }}/pages/award.html">View full awards page</a></p>
</section>

<section class="section" id="teaching" aria-labelledby="teaching-title">
  <p class="eyebrow">Teaching</p>
  <h2 id="teaching-title">Courses in operations management, empirical research, business analytics, and statistics.</h2>
  <p>Teaching includes graduate empirical research in operations management, service operations management, MSBA analytics courses, MBA operations management, undergraduate operations management, and business statistics.</p>
  <p><a href="{{ BASE_PATH }}/pages/teaching.html">View teaching history</a></p>
</section>

<section class="section section--contact" id="contact" aria-labelledby="contact-title">
  <div>
    <p class="eyebrow">Contact</p>
    <h2 id="contact-title">Get in touch</h2>
    <p><strong>{{ profile.name }}</strong> <span lang="ko">{{ profile.name_ko }}</span></p>
    <p>{{ profile.title }}<br>{{ profile.affiliation }}</p>
    <p lang="ko">{{ profile.title_ko }}<br>{{ profile.affiliation_ko }}</p>
  </div>
  <address>
    <a href="mailto:{{ profile.email }}" data-analytics-event="email_click">{{ profile.email }}</a><br>
    {{ profile.office_phone }}<br>
    {{ profile.address }}<br>
    <span lang="ko">{{ profile.address_ko }}</span>
  </address>
  <p class="link-row">
    <a href="{{ profile.cv_url }}" data-analytics-event="cv_download">CV</a>
    <span aria-hidden="true"> · </span><a href="{{ profile.links.kubs.url }}" data-analytics-event="external_profile_click">{{ profile.links.kubs.label }}</a>
    <span aria-hidden="true"> · </span><a href="{{ profile.links.linkedin.url }}" data-analytics-event="external_profile_click">{{ profile.links.linkedin.label }}</a>
  </p>
</section>
