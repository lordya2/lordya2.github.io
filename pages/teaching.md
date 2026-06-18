---
layout: page
title: Teaching
description: Complete institution, course, audience, language, and semester history from the CV.
---
{% assign teaching = site.data.teaching %}
<section class="section page-section" aria-labelledby="teaching-title">
  <p class="eyebrow">Teaching</p>
  <h1 id="teaching-title">Teaching portfolio</h1>
  <div class="card-grid card-grid--four">{% for card in teaching.homepage_cards %}<article class="card"><h2>{{ card.title }}</h2><p>{{ card.summary }}</p></article>{% endfor %}</div>

  <h2>Teaching Awards</h2><ul>{% for award in teaching.teaching_awards %}<li>{{ award }}</li>{% endfor %}</ul>

  <h2>Course History</h2>
  {% for institution in teaching.institutions %}
    <h3>{{ institution.name }}</h3>
    <div class="table-wrap"><table class="data-table"><thead><tr><th>Course</th><th>Audience</th><th>Language</th><th>Semesters</th></tr></thead><tbody>{% for course in institution.courses %}<tr><td>{{ course.course }}{% if course.code and course.code != '' %} ({{ course.code }}){% endif %}</td><td>{{ course.audience }}</td><td>{{ course.language }}</td><td>{{ course.semesters }}</td></tr>{% endfor %}</tbody></table></div>
  {% endfor %}
</section>
