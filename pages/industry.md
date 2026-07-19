---
layout: page
title: 기업 강연·자문·공동연구
seo_title: 공급망 강연·운영관리 기업 자문 | 이현석 고려대 교수
hide_page_header: true
description: 고려대학교 경영대학 이현석 교수의 공급망 리스크·회복탄력성 강연, 데이터 기반 운영관리 자문·공동연구, 헬스케어·제약 공급망 및 산학 프로젝트를 소개합니다.
lang: ko
body_class: ko-content
schema_type: Service
---
{% assign industry = site.data.industry_collaboration %}
{% assign profile = site.data.profile %}

<section class="section page-section industry-page" lang="ko" aria-labelledby="industry-title">
  <header class="industry-hero">
    <p class="eyebrow">Speaking · Advisory · Research Collaboration</p>
    <h1 id="industry-title">{{ industry.title }}</h1>
    <p class="lead-text">{{ industry.intro }}</p>
    <nav class="page-jump-nav" aria-label="기업 강연과 협력 페이지 바로가기">
      <a href="#executive-workshops">공급망 강연</a>
      <a href="#advisory-research">운영관리 자문</a>
      <a href="#healthcare-pharma">헬스케어·제약 공급망</a>
      <a href="#industry-projects">산학 프로젝트</a>
      <a href="#selected-cases">공개 사례</a>
      <a href="#inquiry">문의</a>
    </nav>
    <div class="button-row" role="group" aria-label="기업 협력 소개 자료">
      <a class="button" href="{{ '/pages/inquiry.html' | relative_url }}?source=industry-page" data-analytics-event="inquiry_page_click">기업 강연·협업 문의</a>
      <a class="button button--ghost" href="{{ '/assets/downloads/hyunseok-lee-speaker-one-pager-ko.pdf' | relative_url }}" data-analytics-event="speaker_onepager_download">Speaker One-pager PDF</a>
      <a class="button button--ghost" href="{{ '/assets/downloads/hyunseok-lee-collaboration-brief-ko.pdf' | relative_url }}" data-analytics-event="collaboration_brief_download">Collaboration Brief PDF</a>
    </div>
  </header>

  <section class="industry-section" id="executive-workshops" aria-labelledby="executive-workshops-title">
    <p class="eyebrow">Corporate Speaking &amp; Executive Workshops</p>
    <h2 id="executive-workshops-title">{{ industry.speaking.title }}</h2>
    <p class="lead-text">{{ industry.speaking.summary }}</p>
    <div class="content-grid content-grid--two">
      <article class="card">
        <h3>대표 강연·워크숍 주제</h3>
        <ul class="feature-list">
          {% for topic in industry.speaking.topics %}<li>{{ topic }}</li>{% endfor %}
        </ul>
      </article>
      <aside class="card">
        <h3>대상과 구성</h3>
        <p>{{ industry.speaking.audience }}</p>
        <p class="muted">기업 특강, 리더 세미나, 임원 워크숍 등 목적과 시간에 맞춰 구성하며, 구체적인 사례와 강조점은 사전에 협의합니다.</p>
      </aside>
    </div>
    <p class="section-actions"><a class="button" href="{{ '/pages/inquiry.html' | relative_url }}?type=executive-workshops&amp;source=industry-page" data-analytics-event="corporate_speaking_click">강연·임원 워크숍 문의</a></p>
  </section>

  <section class="industry-section" id="advisory-research" aria-labelledby="advisory-research-title">
    <p class="eyebrow">Operations Advisory &amp; Collaborative Research</p>
    <h2 id="advisory-research-title">{{ industry.advisory.title }}</h2>
    <p class="lead-text">{{ industry.advisory.summary }}</p>
    <div class="content-grid content-grid--two">
      <article class="card">
        <h3>함께 다룰 수 있는 질문</h3>
        <ul class="feature-list">
          {% for question in industry.advisory.questions %}<li>{{ question }}</li>{% endfor %}
        </ul>
      </article>
      <article class="card">
        <h3>진행 과정</h3>
        <ol class="process-list">
          {% for step in industry.advisory.process %}<li><span>{{ forloop.index }}</span><strong>{{ step }}</strong></li>{% endfor %}
        </ol>
        <p class="muted">협업 범위와 결과물은 데이터 접근 가능성, 분석의 실행 가능성과 연구 적합성을 검토한 뒤 협의합니다.</p>
      </article>
    </div>

    <h3 class="subsection-title">검토할 수 있는 운영 문제</h3>
    <div class="card-grid card-grid--three">
      {% for area in industry.collaboration_areas %}
        <article class="card">
          <h3>{{ area.title }}</h3>
          <p>{{ area.description }}</p>
        </article>
      {% endfor %}
    </div>
    <p class="section-actions"><a class="button" href="{{ '/pages/inquiry.html' | relative_url }}?type=advisory-research&amp;source=industry-page" data-analytics-event="advisory_research_click">운영관리 자문·공동연구 논의</a></p>
  </section>

  <section class="industry-section industry-section--featured" id="healthcare-pharma" aria-labelledby="healthcare-pharma-title">
    <p class="eyebrow">Healthcare &amp; Pharmaceutical Supply Chains</p>
    <h2 id="healthcare-pharma-title">{{ industry.healthcare_pharma.title }}</h2>
    <p class="lead-text">{{ industry.healthcare_pharma.summary }}</p>
    <div class="card-grid card-grid--two">
      {% for study in industry.healthcare_pharma.research %}
        <article class="card">
          <p class="card-label">Management Science</p>
          <h3>{{ study.title }}</h3>
          <p>{{ study.description }}</p>
        </article>
      {% endfor %}
    </div>
    <div class="button-row section-actions">
      <a class="button" href="{{ '/ko/drug-shortage-recovery/' | relative_url }}" data-analytics-event="drug_shortage_explainer_click">의약품 부족 연구 해설</a>
      <a class="button button--ghost" href="{{ '/pages/inquiry.html' | relative_url }}?source=industry-page" data-analytics-event="inquiry_page_click">헬스케어·제약 강연·자문 문의</a>
    </div>
  </section>

  <section class="industry-section" id="industry-projects" aria-labelledby="industry-projects-title">
    <p class="eyebrow">Industry Projects</p>
    <h2 id="industry-projects-title">현장 데이터를 활용하는 산학 프로젝트</h2>
    <p class="lead-text">기업 현안을 고려대학교 MSBA 캡스톤 또는 연구 프로젝트와 연결해 수요예측, 추천, 고객·운영 분석과 효과평가 과제를 수행합니다. 기업의 질문과 데이터에 맞춰 학생 학습과 기업의 실무적 활용 가능성을 함께 고려합니다.</p>
    <p class="section-actions"><a class="button" href="{{ '/pages/inquiry.html' | relative_url }}?type=industry-projects&amp;source=industry-page" data-analytics-event="industry_project_click">산학 프로젝트 제안</a></p>
  </section>

  <section class="industry-section" id="selected-cases" aria-labelledby="selected-cases-title">
    <p class="eyebrow">Selected Contexts</p>
    <h2 id="selected-cases-title">MSBA 캡스톤 및 산학 프로젝트 공개 사례</h2>
    <p>{{ industry.capstone_intro }}</p>
    <p class="muted">{{ industry.case_disclaimer }}</p>
    <div class="card-grid card-grid--two capstone-grid">
      {% for project in industry.capstone_projects %}
        <article class="card capstone-card">
          <p class="card-label">{{ project.partner }}</p>
          <h3>{{ project.title }}</h3>
          {% if project.problem %}
            <dl class="case-study__details">
              <dt>문제</dt><dd>{{ project.problem }}</dd>
              <dt>데이터</dt><dd>{{ project.data }}</dd>
              <dt>방법</dt><dd>{{ project.method }}</dd>
              <dt>의사결정 초점</dt><dd>{{ project.decision_relevance }}</dd>
            </dl>
          {% else %}
            <p>{{ project.description }}</p>
          {% endif %}
          {% if project.video_url %}
            <div class="video-embed">
              <iframe src="{{ project.video_url }}" title="{{ project.title }} 발표 영상" loading="lazy" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
            </div>
          {% endif %}
        </article>
      {% endfor %}
    </div>
  </section>

  <section class="industry-section" aria-labelledby="organizations-title">
    <h2 id="organizations-title">연결된 조직 및 산업 맥락</h2>
    <p class="muted">{{ industry.selected_collaborators.note }}</p>
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
  </section>

  <section class="industry-section" aria-labelledby="principles-title">
    <h2 id="principles-title">협업 원칙</h2>
    <ul class="pill-list">
      {% for principle in industry.principles %}<li>{{ principle }}</li>{% endfor %}
    </ul>
  </section>

  <section class="industry-section" id="inquiry" aria-labelledby="industry-inquiry-title">
    <h2 id="industry-inquiry-title">기업 강연·자문·공동연구 문의</h2>
    <div class="card inquiry-card">
      <p>{{ industry.contact_cta.text }}</p>
      <div class="button-row">
        <a class="button" href="{{ '/pages/inquiry.html' | relative_url }}?source=industry-page" data-analytics-event="inquiry_page_click">{{ industry.contact_cta.button }}</a>
        <a class="button button--ghost" href="mailto:{{ profile.email }}?subject={{ industry.contact_cta.subject | uri_escape }}" data-analytics-event="industry_email_click">이메일로 직접 문의</a>
      </div>
      <p class="muted">문의: <a href="mailto:{{ profile.email }}?subject={{ industry.contact_cta.subject | uri_escape }}" data-analytics-event="industry_email_click">{{ profile.email }}</a></p>
    </div>
  </section>
</section>
