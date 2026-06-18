---
layout: page
title: Research
description: Research themes, methods, publications, working papers, and selected work in progress.
---
{% assign portfolio = site.data.research_portfolio %}

<section class="section page-section" aria-labelledby="research-title">
  <p class="eyebrow">Research</p>
  <h1 id="research-title">Research portfolio</h1>

  <h2>Research Themes</h2>
  <div class="card-grid card-grid--four">{% for area in site.data.research_areas %}<article class="card"><h3>{{ area.title }}</h3><p>{{ area.summary }}</p></article>{% endfor %}</div>

  <h2>Methodology</h2>
  <ul class="pill-list">{% for method in portfolio.methodology %}<li>{{ method }}</li>{% endfor %}</ul>

  <h2>Peer-Reviewed Journal Publications</h2>
  <ol class="publication-list">{% for paper in portfolio.peer_reviewed %}<li><p>{{ paper.citation }}</p>{% if paper.note %}<p class="muted">{{ paper.note }}</p>{% endif %}{% if paper.links %}<p class="link-row">{% for link in paper.links %}<a href="{{ link.url }}" data-analytics-event="publication_click">{{ link.label }}</a>{% unless forloop.last %}<span aria-hidden="true"> · </span>{% endunless %}{% endfor %}</p>{% endif %}</li>{% endfor %}</ol>

  <h2>Working Papers</h2>
  <ol class="publication-list">{% for paper in portfolio.working_papers %}<li><p>{{ paper.citation }}</p><p class="review-note">{{ paper.status }}</p>{% if paper.note %}<p class="muted">{{ paper.note }}</p>{% endif %}</li>{% endfor %}</ol>

  <h2>Book Chapter</h2>
  <ol class="publication-list">{% for item in portfolio.book_chapter %}<li>{{ item.citation }}</li>{% endfor %}</ol>

  <h2>Publications in Korean with Students</h2>
  <ol class="publication-list">{% for item in portfolio.korean_publications %}<li>{{ item }}</li>{% endfor %}</ol>

  <h2>Selected Work in Progress</h2>
  <ul>{% for item in portfolio.work_in_progress %}<li>{{ item }}</li>{% endfor %}</ul>

  <p><a class="button" href="{{ site.data.profile.cv_url }}" data-analytics-event="cv_download">Download full CV</a></p>
</section>
