---
layout: page
title: People
description: Students, alumni, MSBA capstone teams, and research opportunities for Hyun Seok ("Huck") Lee.
---
{% assign people = site.data.people %}
{% assign profile = site.data.profile %}

<section class="section page-section" aria-labelledby="people-title">
  <p class="eyebrow">People</p>
  <h1 id="people-title">Students, alumni, and mentored projects</h1>
  <p>{{ people.mentoring_approach }}</p>

  <h2>Current students</h2>
  <div class="card-grid card-grid--two">
    {% for student in people.current_students %}<article class="card"><h3>{{ student.name }}</h3><p>{{ student.program }}</p></article>{% endfor %}
  </div>

  <h2>Selected alumni and placements</h2>
  <ul class="timeline-list">
    {% for alum in people.alumni %}<li><time>{{ alum.year }}</time><span><strong>{{ alum.name }}</strong>: {{ alum.degree }}; {{ alum.placement }}{% if alum.note %}. {{ alum.note }}{% endif %}</span></li>{% endfor %}
  </ul>

  <h2>MSBA capstone mentoring outcomes</h2>
  <div class="table-wrap"><table class="data-table"><thead><tr><th>Graduation year</th><th>Team</th><th>Award</th><th>Placements</th></tr></thead><tbody>{% for team in people.msba_capstone %}<tr><td>{{ team.year }}</td><td>{{ team.team }}<br><span class="muted">{{ team.program }}</span></td><td>{{ team.award }}</td><td>{{ team.placements }}</td></tr>{% endfor %}</tbody></table></div>

  <h2>Research opportunities</h2>
  <p>{{ people.opportunity_summary }}</p>
  <p>When emailing, please include: {% for item in site.data.opportunities.email_guidance %}{{ item | downcase }}{% unless forloop.last %}, {% else %}.{% endunless %}{% endfor %}</p>
  <p><a class="button" href="mailto:{{ profile.email }}?subject=Research%20opportunities" data-analytics-event="student_opportunity_click">Email about research opportunities</a></p>
</section>
