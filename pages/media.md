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
  <p class="muted">Korean media coverage may be represented as a search-result cluster when individual article URLs are not yet curated.</p>

  <h2>Featured media and impact</h2>
  <div class="media-grid">
    {% for item in media.featured %}
      <article class="card">
        <p class="card-label">{{ item.type }} · {{ item.date }}</p>
        <h3>{{ item.title }}</h3>
        <p><strong>{{ item.outlet }}</strong></p>
        <p>{{ item.summary }}</p>
        {% if item.related_work %}<p><span class="status-badge">Related research</span> {{ item.related_work }}</p>{% endif %}
        <p><a href="{{ item.url }}" target="_blank" rel="noopener noreferrer" data-analytics-event="media_impact_click">View coverage</a></p>
      </article>
    {% endfor %}
  </div>

  <h2>Archive categories</h2>
  <ul class="pill-list">
    <li>School news</li>
    <li>Media coverage</li>
    <li>Research impact</li>
    <li>Awards and recognition</li>
  </ul>
</section>
