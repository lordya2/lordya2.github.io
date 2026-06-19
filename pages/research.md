---
layout: page
title: Research
hide_page_header: true
description: Research themes, methods, publications, working papers, and selected work in progress.
---
{% assign publications = site.data.publications %}
{% assign research_themes = site.data.research_themes %}
{% assign peer_reviewed = publications | where: "category", "peer_reviewed" %}
{% assign working_papers = publications | where: "category", "working_paper" %}
{% assign book_chapter = publications | where: "category", "book_chapter" %}
{% assign korean_publications = publications | where: "category", "korean_publication" %}
{% assign work_in_progress = publications | where: "category", "work_in_progress" %}

<section class="section page-section" aria-labelledby="research-title">
  <p class="eyebrow">Research</p>
  <h1 id="research-title">Research portfolio</h1>

  <h2>Research Themes</h2>
  <div class="card-grid card-grid--four">{% for theme in research_themes.themes %}{% assign area = site.data.research_areas | where: "title", theme.title | first %}<article class="card research-theme-card"><h3>{{ theme.title }}</h3>{% if area %}<p>{{ area.summary }}</p>{% endif %}<h4>Representative papers</h4><ul class="representative-paper-list">{% for paper_id in theme.representative_papers %}{% assign paper = publications | where: "id", paper_id | first %}{% if paper %}<li><a href="#publication-{{ paper.id }}">{{ paper.short_title | default: paper.title | default: paper.citation }}</a></li>{% endif %}{% endfor %}</ul></article>{% endfor %}</div>

  <h2>Methodology</h2>
  <ul class="pill-list">{% for method in research_themes.methodology %}<li>{{ method }}</li>{% endfor %}</ul>

  <h2>Peer-Reviewed Journal Publications</h2>
  <ol class="publication-list">{% for paper in peer_reviewed %}<li id="publication-{{ paper.id }}" class="publication-item"><p class="publication-citation">{{ paper.citation | replace: "Management Science", "<strong>Management Science</strong>" | replace: "Manufacturing & Service Operations Management", "<strong>Manufacturing &amp; Service Operations Management</strong>" | replace: "Journal of Operations Management", "<strong>Journal of Operations Management</strong>" | replace: "Production and Operations Management", "<strong>Production and Operations Management</strong>" }}</p>{% if paper.note %}<p class="muted">{{ paper.note }}</p>{% endif %}{% if paper.links %}<p class="link-row publication-links">{% for link in paper.links %}<a href="{{ link.url }}" data-analytics-event="publication_click">{{ link.label }}</a>{% unless forloop.last %}<span aria-hidden="true"> · </span>{% endunless %}{% endfor %}</p>{% endif %}</li>{% endfor %}</ol>

  <h2>Working Papers</h2>
  <ol class="publication-list">{% for paper in working_papers %}<li id="publication-{{ paper.id }}" class="publication-item"><p class="publication-citation">{{ paper.citation }}</p><p><span class="status-badge">{{ paper.status }}</span></p>{% if paper.note %}<p class="muted">{{ paper.note }}</p>{% endif %}</li>{% endfor %}</ol>

  <h2>Book Chapter</h2>
  <ol class="publication-list">{% for item in book_chapter %}<li id="publication-{{ item.id }}">{{ item.citation }}</li>{% endfor %}</ol>

  <h2>Publications in Korean with Students</h2>
  <ol class="publication-list">{% for item in korean_publications %}<li id="publication-{{ item.id }}">{{ item.citation }}</li>{% endfor %}</ol>

  <h2>Selected Work in Progress</h2>
  <ul>{% for item in work_in_progress %}<li id="publication-{{ item.id }}">{{ item.title | default: item.citation }}</li>{% endfor %}</ul>

  <p><a class="button" href="{{ site.data.profile.cv_url }}" data-analytics-event="cv_download">Download full CV</a></p>
</section>
