---
layout: page
title: Research
hide_page_header: true
description: Research themes, methods, publications, working papers, and selected work in progress.
---
{% assign portfolio = site.data.research_portfolio %}

<section class="section page-section" aria-labelledby="research-title">
  <p class="eyebrow">Research</p>
  <h1 id="research-title">Research portfolio</h1>

  <h2>Research Themes</h2>
  <div class="card-grid card-grid--four">{% for theme in portfolio.themes %}{% assign area = site.data.research_areas | where: "title", theme.title | first %}<article class="card research-theme-card"><h3>{{ theme.title }}</h3>{% if area %}<p>{{ area.summary }}</p>{% endif %}<h4>Representative papers</h4><ul class="representative-paper-list">{% for paper_id in theme.representative_papers %}{% assign paper = portfolio.peer_reviewed | where: "id", paper_id | first %}{% unless paper %}{% assign paper = portfolio.working_papers | where: "id", paper_id | first %}{% endunless %}{% if paper %}<li><a href="#publication-{{ paper_id }}">{{ paper.short_title | default: paper.citation }}</a></li>{% endif %}{% endfor %}</ul></article>{% endfor %}</div>

  <h2>Methodology</h2>
  <ul class="pill-list">{% for method in portfolio.methodology %}<li>{{ method }}</li>{% endfor %}</ul>

  <h2>Peer-Reviewed Journal Publications</h2>
  <ol class="publication-list">{% for paper in portfolio.peer_reviewed %}<li id="publication-{{ paper.id }}" class="publication-item"><p class="publication-citation">{{ paper.citation | replace: "Management Science", "<strong>Management Science</strong>" | replace: "Manufacturing & Service Operations Management", "<strong>Manufacturing &amp; Service Operations Management</strong>" | replace: "Journal of Operations Management", "<strong>Journal of Operations Management</strong>" | replace: "Production and Operations Management", "<strong>Production and Operations Management</strong>" }}</p>{% if paper.note %}<p class="muted">{{ paper.note }}</p>{% endif %}{% if paper.links %}<p class="link-row publication-links">{% for link in paper.links %}<a href="{{ link.url }}" data-analytics-event="publication_click">{{ link.label }}</a>{% unless forloop.last %}<span aria-hidden="true"> · </span>{% endunless %}{% endfor %}</p>{% endif %}</li>{% endfor %}</ol>

  <h2>Working Papers</h2>
  <ol class="publication-list">{% for paper in portfolio.working_papers %}<li id="publication-{{ paper.id }}" class="publication-item"><p class="publication-citation">{{ paper.citation }}</p><p><span class="status-badge">{{ paper.status }}</span></p>{% if paper.note %}<p class="muted">{{ paper.note }}</p>{% endif %}</li>{% endfor %}</ol>

  <h2>Book Chapter</h2>
  <ol class="publication-list">{% for item in portfolio.book_chapter %}<li>{{ item.citation }}</li>{% endfor %}</ol>

  <h2>Publications in Korean with Students</h2>
  <ol class="publication-list">{% for item in portfolio.korean_publications %}<li>{{ item }}</li>{% endfor %}</ol>

  <h2>Selected Work in Progress</h2>
  <ul>{% for item in portfolio.work_in_progress %}<li>{{ item }}</li>{% endfor %}</ul>

  <p><a class="button" href="{{ site.data.profile.cv_url }}" data-analytics-event="cv_download">Download full CV</a></p>
</section>
