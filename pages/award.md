---
layout: page
title: Awards & Service
hide_page_header: true
description: Awards, teaching recognition, professional service, editorial boards, reviewing, and memberships.
---
{% assign data = site.data.awards_service %}
<section class="section page-section" aria-labelledby="awards-title">
  <p class="eyebrow">Awards &amp; Service</p>
  <h1 id="awards-title">Recognition and professional service</h1>

  <h2>Selected Awards</h2><ul class="timeline-list">{% for item in data.selected_awards %}<li><time>{{ item.date }}</time><span>{{ item.label }}</span></li>{% endfor %}</ul>
  <h2>Teaching Recognition</h2><ul class="timeline-list">{% for item in data.teaching_recognition %}<li><time>{{ item.date }}</time><span>{{ item.label }}</span></li>{% endfor %}</ul>
  <h2>Professional Service</h2><ul>{% for item in data.professional_service %}<li>{{ item }}</li>{% endfor %}</ul>
  <h2>Editorial Review Boards</h2><ul>{% for item in data.editorial_review_boards %}<li>{{ item }}</li>{% endfor %}</ul>
  <h2>Reviewing</h2><p><strong>Journals:</strong> {{ data.reviewing.journals }}</p><ul>{% for item in data.reviewing.conferences %}<li>{{ item }}</li>{% endfor %}</ul>
  <h2>Memberships</h2><ul class="pill-list">{% for item in data.memberships %}<li>{{ item }}</li>{% endfor %}</ul>
</section>
