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
      <li><time>{{ item.date }}</time><span>{{ item.text }}</span></li>
    {% endfor %}
  </ul>
</section>
