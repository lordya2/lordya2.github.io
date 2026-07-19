---
layout: page
title: News
hide_page_header: true
description: Archive of recent news, awards, publications, teaching recognition, and professional updates.
---

<section class="section page-section" aria-labelledby="news-archive-title">
  <p class="eyebrow">News</p>
  <h1 id="news-archive-title">News archive</h1>
  <p>Recent updates on publications, awards, teaching recognition, service, and other professional activities.</p>
  <ul class="timeline-list">
    {% for item in site.data.news %}
      <li><time datetime="{{ item.date }}">{{ item.date }}</time><span>{% if item.url %}<a href="{{ item.url | relative_url }}">{{ item.text }}</a>{% else %}{{ item.text }}{% endif %}</span></li>
    {% endfor %}
  </ul>
</section>
