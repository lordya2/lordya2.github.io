---
layout: page
title: Media & Impact
hide_page_header: true
description: Media coverage, school news, research impact, and public-facing communication about empirical operations research.
---
{% assign media = site.data.media_impact %}

<section class="section page-section" aria-labelledby="media-title">
  <p class="eyebrow">Media &amp; Impact</p>
  <h1 id="media-title">Research in the media and public-facing outlets</h1>
  <p>Selected media coverage, school news, research impact, and public-facing communication related to empirical operations, healthcare and pharmaceutical supply chains, retail, platforms, and policy-relevant decisions.</p>

  <h2>Featured impact</h2>
  <div class="media-grid">
    {% for item in media.featured %}
      <article class="card media-group">
        <p class="card-label media-meta">{{ item.type }} · {{ item.date }}</p>
        <h3>{{ item.title }}</h3>
        <p>{{ item.summary }}</p>
        {% if item.related_work %}<p><span class="status-badge">Related research</span> {{ item.related_work }}</p>{% endif %}
        <p><a href="{{ item.url | relative_url }}" data-analytics-event="media_impact_click">View Media &amp; Impact coverage</a></p>
      </article>
    {% endfor %}
  </div>

  <h2>Recent media coverage</h2>
  <div class="media-list">
    {% for group in media.coverage_groups %}
      <article class="card media-group" id="drug-shortage-coverage">
        <p class="card-label media-meta">{{ group.type }} · {{ group.date }}</p>
        <h3>{{ group.title }}</h3>
        <p>{{ group.summary }}</p>
        {% if group.related_work %}<p><span class="status-badge">Related research</span> {{ group.related_work }}</p>{% endif %}
        <details>
          <summary>View article links ({{ group.items | size }})</summary>
          <ul class="media-link-list">
            {% for item in group.items %}
              <li><span class="media-meta">{{ item.outlet }} · {{ item.date }}</span><br><a href="{{ item.url }}" target="_blank" rel="noopener noreferrer" data-analytics-event="media_impact_click">{{ item.title }}</a></li>
            {% endfor %}
          </ul>
        </details>
      </article>
    {% endfor %}
  </div>

  <h2>Selected media and expert articles</h2>
  <div class="media-grid">
    {% for item in media.selected_media %}
      <article class="card">
        <p class="card-label media-meta">{{ item.type }} · {{ item.date }}</p>
        <h3>{{ item.title }}</h3>
        <p><strong>{{ item.outlet }}</strong></p>
        <p>{{ item.summary }}</p>
        <p><a href="{{ item.url }}" target="_blank" rel="noopener noreferrer" data-analytics-event="media_impact_click">Read article</a></p>
      </article>
    {% endfor %}
  </div>

  <h2>Essays and columns</h2>
  <div class="media-grid">
    {% for item in media.essays_and_columns %}
      <article class="card">
        <p class="card-label media-meta">{{ item.type }} · {{ item.date }}</p>
        <h3>{{ item.title }}</h3>
        <p><strong>{{ item.outlet }}</strong></p>
        <p>{{ item.summary }}</p>
        <p><a href="{{ item.url }}" target="_blank" rel="noopener noreferrer" data-analytics-event="media_impact_click">Read column</a></p>
      </article>
    {% endfor %}
  </div>
</section>
