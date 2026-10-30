---
layout: default
title: '2026 KOPOMS Fall Conference: Presentations and Paper Awards'
seo_title: 'Five Student Presentations and Two Paper Awards at the 2026 KOPOMS Fall Conference | Hyun Seok Lee'
description: 'Five student researchers presented coauthored work at the 2026 KOPOMS Fall Conference in Seoul, where two of the papers received awards.'
keywords: KOPOMS, Operations Management, Healthcare Operations, Retail Operations, Supply Chain Resilience, Student Research
permalink: /updates/2026-kopoms-fall-conference/
body_class: conference-update-page
og_image: /assets/events/kopoms-2026/group.jpg
og_image_alt: 'Hyun Seok Lee and five student presenters making K hand gestures at the 2026 KOPOMS Fall Conference.'
---
{% assign conference = site.data.people.conference_presentations | first %}

<article class="conference-update">
  <section class="section" aria-labelledby="conference-update-title">
    <div class="conference-update__intro">
      <p class="eyebrow">Research Group · October 23, 2026</p>
      <h1 id="conference-update-title">Five student presentations and two paper awards at the 2026 KOPOMS Fall Conference</h1>
      <p class="lead-text">Our students shared five ongoing projects at Sookmyung Women’s University in Seoul, spanning healthcare, retail, and supply-chain operations. Two of these coauthored papers received paper awards.</p>
      <p>All five studies were presented by students and coauthored with Hyun Seok (Huck) Lee. The discussions offered valuable feedback as the research continues to develop.</p>
    </div>
    <figure class="conference-update__hero">
      <img src="{{ '/assets/events/kopoms-2026/group.jpg' | relative_url }}" alt="{{ page.og_image_alt }}" width="1536" height="1152" fetchpriority="high">
      <figcaption>Student presenters and Huck Lee making K hand gestures at the conference.</figcaption>
    </figure>
  </section>

  {% if conference.awards %}
  <section class="section" id="conference-awards" aria-labelledby="conference-awards-title">
    <p class="eyebrow">Paper Awards · October 23, 2026</p>
    <h2 id="conference-awards-title">Recognition for student-presented, coauthored research</h2>
    <div class="card-grid card-grid--two">
      {% for award in conference.awards %}
        <article class="card" id="{{ award.id }}">
          <p class="card-label" lang="ko">{{ award.label_ko }}</p>
          <h3>{{ award.label_en }}</h3>
          <p><strong>{{ award.title }}</strong></p>
          <p><strong>Coauthors:</strong> {{ award.authors }}</p>
          <p><strong>Student presenter:</strong> {{ award.presenter }}</p>
        </article>
      {% endfor %}
    </div>
  </section>
  {% endif %}

  <section class="section section--tinted" aria-labelledby="conference-talks-title">
    <p class="eyebrow">Conference Presentations</p>
    <h2 id="conference-talks-title">Research questions across operating settings</h2>
    <ol class="conference-update__talks">
      {% for talk in conference.talks %}
        <li><strong>{{ talk.presenter }}</strong> — “{{ talk.title }}”</li>
      {% endfor %}
    </ol>
  </section>

  <section class="section" aria-labelledby="conference-gallery-title">
    <p class="eyebrow">At the Conference</p>
    <h2 id="conference-gallery-title">Presenting and discussing the work</h2>
    <div class="conference-update__gallery">
      {% for talk in conference.talks %}
        {% if talk.photo %}
          <figure>
            <img src="{{ talk.photo | relative_url }}" alt="{{ talk.photo_alt }}" width="1536" height="1152" loading="lazy">
            <figcaption>{{ talk.photo_caption }}</figcaption>
          </figure>
        {% endif %}
      {% endfor %}
    </div>
  </section>

  <section class="section section--tinted" aria-labelledby="conference-opportunities-title">
    <p class="eyebrow">Research Group & Opportunities</p>
    <h2 id="conference-opportunities-title">Interested in empirical operations research?</h2>
    <p>Explore our current projects and opportunities for prospective PhD, MS, and undergraduate researchers.</p>
    <p><a class="button" href="{{ '/pages/people.html#research-opportunities' | relative_url }}">Meet the research group</a></p>
  </section>
</article>
