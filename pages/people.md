---
layout: page
title: 'Research Group & Opportunities'
hide_page_header: true
description: Current students, student-led research, research funding, conference presentations, alumni placements, and research opportunities in empirical operations management at Korea University.
keywords: Empirical Operations Management, LSOM, Korea University, Graduate Research, Healthcare Operations, Retail Operations, Supply Chain Resilience
---
{% assign people = site.data.people %}
{% assign profile = site.data.profile %}

<section class="section page-section people-page" aria-labelledby="people-title">
  <div class="people-intro">
    <p class="eyebrow">Research Group</p>
    <h1 id="people-title">Students, research, and opportunities</h1>
    <p class="lead-text">{{ people.mentoring_approach }}</p>
    <p>{{ people.group_intro }}</p>
  </div>

  <nav class="page-jump-nav" aria-label="Research group sections">
    <a href="#research-streams">Research streams</a>
    <a href="#current-students">Current students</a>
    <a href="#student-achievements">Student achievements</a>
    <a href="#conference-presentations">Presentations</a>
    <a href="#alumni">Alumni</a>
    <a href="#research-opportunities">Opportunities</a>
  </nav>

  <div class="people-section" id="research-streams">
    <p class="eyebrow">Active Research</p>
    <h2>What current students are studying</h2>
    <div class="card-grid card-grid--three research-stream-grid">
      {% for stream in people.research_streams %}
        <article class="card research-stream-card">
          <h3>{{ stream.title }}</h3>
          <p>{{ stream.summary }}</p>
          <p class="research-stream-card__students"><strong>Current student{% if stream.students.size > 1 %}s{% endif %}</strong><br>{{ stream.students | join: ', ' }}</p>
        </article>
      {% endfor %}
    </div>
  </div>

  <div class="people-section" id="current-students">
    <p class="eyebrow">Current Students</p>
    <h2>Student-led empirical operations research</h2>
    <div class="student-grid">
      {% for student in people.current_students %}
        <article class="student-card" id="{{ student.id }}">
          <header class="student-card__header">
            <p class="student-card__area">{{ student.area }}</p>
            <h3>{{ student.name }} <span lang="ko">{{ student.name_ko }}</span></h3>
            <p class="student-card__meta">{{ student.program }}{% if student.entry_year %} · Entered in {{ student.entry_year }}{% endif %}</p>
          </header>
          <div class="student-card__project">
            <p class="student-card__label">Current research</p>
            <p class="student-card__project-title"><strong>{{ student.project_title }}</strong></p>
            {% if student.working_paper_title %}<p class="student-card__paper-title">“{{ student.working_paper_title }}”</p>{% endif %}
            <p>{{ student.project_summary }}</p>
          </div>
          <ul class="tag-list" aria-label="Research topics for {{ student.name }}">
            {% for topic in student.topics %}<li>{{ topic }}</li>{% endfor %}
          </ul>
        </article>
      {% endfor %}
    </div>
  </div>

  <div class="people-section" id="student-achievements">
    <p class="eyebrow">Student Achievements</p>
    <h2>Research funding and recognition</h2>
    {% for achievement in people.student_achievements %}
      <article class="achievement-feature" id="{{ achievement.id }}">
        <div class="achievement-feature__meta">
          <p class="card-label">{{ achievement.category }}</p>
          <p><strong>{{ achievement.year }}</strong><br>{{ achievement.organization }}</p>
        </div>
        <div class="achievement-feature__body">
          <h3>{{ achievement.student }}: {{ achievement.title }}</h3>
          <p>{{ achievement.project_summary }}</p>
          <dl class="achievement-details">
            <dt>Program</dt><dd><span lang="ko">{{ achievement.program_ko }}</span></dd>
            <dt>Official project title</dt><dd lang="ko">{{ achievement.project_title_ko }}</dd>
            <dt>Project period</dt><dd>{{ achievement.duration }}</dd>
          </dl>
          <p><a href="{{ achievement.url | escape }}" target="_blank" rel="noopener noreferrer" data-analytics-event="student_grant_record_click">Open the official NRF selection lookup</a><br><span class="muted">{{ achievement.lookup_note }}</span></p>
        </div>
      </article>
    {% endfor %}
  </div>

  <div class="people-section" id="conference-presentations">
    <p class="eyebrow">Conference Presentations</p>
    <h2>Sharing developing research with the academic community</h2>
    <p>Recent student and alumni presentations at domestic and international conferences include:</p>
    <ul class="conference-list">
      {% for presentation in people.conference_presentations %}
        <li>
          <time datetime="{{ presentation.year }}">{{ presentation.year }}</time>
          <div>
            <h3>{{ presentation.conference }}</h3>
            <p class="conference-list__location">{{ presentation.location }}</p>
            <p><strong>{{ presentation.presenter }}{% if presentation.presenter_ko %} <span class="alumni-name-ko" lang="ko">({{ presentation.presenter_ko }})</span>{% endif %}</strong> · {{ presentation.role }}</p>
          </div>
        </li>
      {% endfor %}
    </ul>
  </div>

  <div class="people-section" id="alumni">
    <p class="eyebrow">Alumni</p>
    <h2>Selected alumni and placements</h2>
    <ul class="timeline-list">
      {% for alum in people.alumni %}<li><time datetime="{{ alum.year }}">{{ alum.year }}</time><span><strong>{{ alum.name }} <span class="alumni-name-ko" lang="ko">({{ alum.name_ko }})</span></strong>: {{ alum.degree }}; {{ alum.placement }}{% if alum.note %}. {{ alum.note }}{% endif %}</span></li>{% endfor %}
    </ul>

    <details class="expandable-section">
      <summary>View MSBA capstone advising outcomes</summary>
      <div class="table-wrap" tabindex="0" role="region" aria-label="MSBA capstone advising outcomes"><table class="data-table"><caption>Selected MSBA capstone teams, awards, and placements</caption><thead><tr><th scope="col">Graduation year</th><th scope="col">Team</th><th scope="col">Award</th><th scope="col">Placements</th></tr></thead><tbody>{% for team in people.msba_capstone %}<tr><td>{{ team.year }}</td><td>{{ team.team }}<br><span class="muted">{{ team.program }}</span></td><td>{{ team.award }}</td><td>{{ team.placements }}</td></tr>{% endfor %}</tbody></table></div>
    </details>
  </div>

  <div class="people-section opportunity-section" id="research-opportunities">
    <p class="eyebrow">Prospective Students</p>
    <h2>Research opportunities</h2>
    <p class="lead-text">{{ people.opportunity_summary }}</p>
    <div class="opportunity-grid">
      <article class="card">
        <h3>Who may be a fit</h3>
        <ul>
          {% for audience in site.data.opportunities.audiences %}<li>{{ audience }}</li>{% endfor %}
        </ul>
        <p>Relevant interests include empirical operations management, healthcare delivery, retail operations, supply-chain resilience, business analytics, and causal inference.</p>
      </article>
      <article class="card">
        <h3>What to include in an email</h3>
        <ul>
          {% for item in site.data.opportunities.email_guidance %}<li>{{ item }}</li>{% endfor %}
        </ul>
        <p class="muted">Email contact is for discussing research fit and does not replace the formal Korea University admissions process.</p>
      </article>
    </div>
    <div class="button-row opportunity-actions">
      <a class="button" href="mailto:{{ profile.email }}?subject=Research%20opportunities" data-analytics-event="student_opportunity_click">Email about research opportunities</a>
      <a class="button button--ghost" href="https://biz.korea.ac.kr/eng/msphd/intro.html" target="_blank" rel="noopener noreferrer" data-analytics-event="official_admissions_click">KUBS MS/PhD program</a>
    </div>
  </div>
</section>
