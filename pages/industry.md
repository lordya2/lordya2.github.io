---
layout: page
title: Industry Collaboration
hide_page_header: true
description: Industry collaboration opportunities in empirical operations, business analytics, healthcare, retail, platforms, and supply-chain resilience.
---
{% assign industry = site.data.industry_collaboration %}
{% assign profile = site.data.profile %}

<section class="section page-section" aria-labelledby="industry-title">
  <p class="eyebrow">{{ industry.headline }}</p>
  <h1 id="industry-title">Research-based collaboration with companies and organizations</h1>
  <p>{{ industry.intro }}</p>
  <p>Collaboration is most productive when it begins with a clear operational or managerial question and a shared interest in rigorous evidence. Projects may involve operational data, field evidence, careful empirical evaluation, or student learning opportunities where appropriate.</p>

  <h2>Collaboration areas</h2>
  <div class="card-grid card-grid--three">
    {% for area in industry.collaboration_areas %}
      <article class="card"><h3>{{ area }}</h3></article>
    {% endfor %}
  </div>

  <h2>Selected organizations connected to prior collaboration</h2>
  <p>{{ industry.selected_collaborators.note }}</p>
  <div class="card-grid card-grid--two">
    {% for group in industry.selected_collaborators.groups %}
      <article class="card">
        <p class="card-label">{{ group.geography }}</p>
        <ul>
          {% for organization in group.organizations %}<li>{{ organization }}</li>{% endfor %}
        </ul>
      </article>
    {% endfor %}
  </div>

  <h2>Project modes</h2>
  <div class="card-grid card-grid--three">
    {% for mode in industry.project_modes %}
      <article class="card"><h3>{{ mode }}</h3></article>
    {% endfor %}
  </div>

  <h2>Collaboration principles</h2>
  <ul class="pill-list">
    {% for principle in industry.principles %}<li>{{ principle }}</li>{% endfor %}
  </ul>

  <h2>Contact</h2>
  <div class="card">
    <p>{{ industry.contact_cta.text }}</p>
    <p><a class="button" href="mailto:{{ profile.email }}?subject={{ industry.contact_cta.subject | uri_escape }}" data-analytics-event="industry_email_click">Email about industry collaboration</a></p>
  </div>
</section>
