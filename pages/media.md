---
layout: page
title: Media & Impact
hide_page_header: true
description: Media coverage, research impact, and public essays on operations, university life, learning, and career choices.
---
{% assign media = site.data.media_impact %}

<section class="section page-section" aria-labelledby="media-title">
  <p class="eyebrow">Media &amp; Impact</p>
  <h1 id="media-title">Research, essays, and public engagement</h1>
  <p>Selected media coverage and expert articles on operations research, alongside public essays on university life, learning, and career choices.</p>

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
      <article class="card media-group"{% if group.id %} id="{{ group.id }}"{% endif %}>
        <p class="card-label media-meta">{{ group.type }} · {{ group.date }}</p>
        <h3>{{ group.title }}</h3>
        <p>{{ group.summary }}</p>
        {% if group.related_work %}<p><span class="status-badge">Related research</span> {{ group.related_work }}</p>{% endif %}
        <p><a href="{{ '/ko/drug-shortage-recovery/' | relative_url }}" lang="ko" data-analytics-event="drug_shortage_explainer_click">Read the Korean research insight</a></p>
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
      <article class="card"{% if item.id %} id="{{ item.id }}"{% endif %}>
        <p class="card-label media-meta">{{ item.type }} · {{ item.date }}</p>
        <h3>{{ item.title }}</h3>
        <p><strong>{{ item.outlet }}</strong></p>
        <p>{{ item.summary }}</p>
        <p class="link-row"><a href="{{ item.url }}" target="_blank" rel="noopener noreferrer" data-analytics-event="media_impact_click">{{ item.link_label | default: 'Read column' }}</a>{% if item.first_article_url %}<a href="{{ item.first_article_url }}" target="_blank" rel="noopener noreferrer" data-analytics-event="media_impact_click">Read the first essay</a>{% endif %}</p>
      </article>
    {% endfor %}
  </div>
</section>
