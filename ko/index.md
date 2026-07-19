---
layout: default
title: 이현석 교수 한국어 허브
seo_title: 이현석 고려대 교수 | 운영관리·공급망·헬스케어 운영 전문가
description: 고려대학교 경영대학 이현석 교수의 연구, 학생 지도, 공급망 강연, 운영관리 기업 자문, 산학협력 및 미디어 활동을 소개합니다.
keywords: 이현석 교수, 고려대학교 경영대학, 공급망 강연 교수, 운영관리 기업 자문, 헬스케어 공급망 전문가, 실증 운영관리, 산학협력
permalink: /ko/
lang: ko
alternate_url: /
body_class: ko-hub
---
{% assign profile = site.data.profile %}
{% assign people = site.data.people %}
{% assign industry = site.data.industry_collaboration %}
{% assign opportunities = site.data.opportunities %}

<section class="section ko-hero" aria-labelledby="ko-hero-title">
  <div class="ko-hero__content">
    <p class="eyebrow">{{ profile.affiliation_ko }}</p>
    <h1 id="ko-hero-title">{{ profile.name_ko }} 교수 <span>현장 데이터로 더 나은 운영 의사결정을 설계합니다</span></h1>
    <p class="ko-hero__title">{{ profile.display_title_ko }}</p>
    <p class="ko-hero__research">운영관리 · 공급망관리 · 헬스케어 운영 연구</p>
    <p class="ko-hero__positioning">{{ profile.positioning_ko }}</p>
    <nav class="button-row" aria-label="한국어 허브 주요 경로">
      <a class="button" href="#research">연구 보기</a>
      <a class="button button--secondary" href="#students">연구 그룹·학생</a>
      <a class="button button--secondary" href="#industry">기업 강연·자문</a>
    </nav>
    <nav class="ko-hero__utility-links" aria-label="프로필 자료와 언어 전환">
      <a href="{{ profile.cv_url | relative_url }}" data-analytics-event="cv_download">CV</a>
      <a href="{{ profile.links.google_scholar.url }}" target="_blank" rel="noopener noreferrer" data-analytics-event="google_scholar_click">Google Scholar</a>
      <a href="{{ '/' | relative_url }}" lang="en" data-analytics-event="language_switch_click">English site</a>
    </nav>
  </div>
  <figure class="ko-hero__portrait">
    <img src="{{ profile.headshot | relative_url }}" alt="{{ profile.headshot_alt_ko }}" width="1122" height="1402" fetchpriority="high">
  </figure>
</section>

<section class="section section--compact section--tinted" aria-labelledby="ko-paths-title">
  <p class="eyebrow">빠른 안내</p>
  <h2 id="ko-paths-title">방문 목적에 맞는 정보를 바로 찾으세요</h2>
  <nav class="ko-path-grid" aria-label="방문 목적별 안내">
    <a class="ko-path-card" href="#students">
      <span class="ko-path-card__label">예비학생</span>
      <strong>연구에 참여하고 싶다면</strong>
      <span>현재 학생들의 연구, 연구 기회와 연락 방법을 확인할 수 있습니다.</span>
    </a>
    <a class="ko-path-card" href="#industry">
      <span class="ko-path-card__label">기업·기관</span>
      <strong>운영 문제를 함께 풀고 싶다면</strong>
      <span>공급망 강연, 운영관리 자문·공동연구와 산학 프로젝트를 논의합니다.</span>
    </a>
    <a class="ko-path-card" href="#media">
      <span class="ko-path-card__label">언론·행사</span>
      <strong>연구 해설과 인터뷰가 필요하다면</strong>
      <span>헬스케어 공급망, 리테일, 플랫폼과 데이터 기반 의사결정을 설명합니다.</span>
    </a>
    <a class="ko-path-card" href="#academic">
      <span class="ko-path-card__label">연구자·학계</span>
      <strong>논문과 학술 협업을 찾는다면</strong>
      <span>대표 연구, 전체 연구 포트폴리오, CV와 학술 프로필로 연결합니다.</span>
    </a>
  </nav>
</section>

<section class="section section--compact" id="updates" aria-labelledby="ko-updates-title">
  <p class="eyebrow">최근 소식</p>
  <h2 id="ko-updates-title">연구, 학생 성과와 최근 활동</h2>
  {% assign recent_news = site.data.news | sort: "date" | reverse %}
  <ul class="timeline-list">
    {% for item in recent_news limit:4 %}
      <li>
        <time datetime="{{ item.date }}">{{ item.date }}</time>
        {% assign news_url = item.url_ko | default: item.url %}
        <span>{% if news_url %}<a href="{{ news_url | relative_url }}">{{ item.text_ko | default: item.text }}</a>{% else %}{{ item.text_ko | default: item.text }}{% endif %}</span>
      </li>
    {% endfor %}
  </ul>
  <p class="section-actions"><a href="{{ '/pages/news.html' | relative_url }}" data-analytics-event="news_archive_click">전체 소식 보기 <span class="ko-link-note">(영문)</span></a></p>
</section>

<section class="section section--tinted" id="research" aria-labelledby="ko-research-title">
  <p class="eyebrow">연구</p>
  <h2 id="ko-research-title">실제 운영 문제에서 출발하는 연구</h2>
  <p class="lead-text">기업과 기관의 운영 데이터, 현장실험과 인과추론을 활용해 어떤 정책과 운영 방식이 실제로 효과가 있는지 분석합니다.</p>
  <div class="card-grid card-grid--four ko-area-grid">
    {% for area in site.data.research_areas %}
      <article class="card">
        <h3>{{ area.title_ko }}</h3>
        <p>{{ area.summary_ko }}</p>
      </article>
    {% endfor %}
  </div>
</section>

<section class="section" id="students" aria-labelledby="ko-students-title">
  <p class="eyebrow">연구 그룹과 연구 기회</p>
  <h2 id="ko-students-title">학생이 질문을 발전시키고 분석을 주도하는 연구</h2>
  <p class="lead-text">{{ people.group_intro_ko }} {{ people.mentoring_approach_ko }}</p>
  <div class="card-grid card-grid--four ko-student-grid">
    {% for student in people.current_students %}
      <article class="card ko-student-card">
        <p class="ko-student-card__area">{{ student.area_ko }}</p>
        <h3>{{ student.name_ko }} <span lang="en">{{ student.name }}</span></h3>
        <p class="ko-student-card__meta">{{ student.program_ko }}{% if student.entry_year %} · {{ student.entry_year }}년 입학{% endif %}</p>
        <p><strong>{{ student.project_title_ko }}</strong></p>
        <p>{{ student.project_summary_ko }}</p>
        <p class="ko-student-card__link"><a href="{{ '/pages/people.html#' | append: student.id | relative_url }}">상세 보기 <span class="ko-link-note">(영문)</span></a></p>
      </article>
    {% endfor %}
  </div>
  <p class="section-actions"><a class="button" href="#ko-opportunity-title" data-analytics-event="student_opportunity_click">연구 참여 안내 바로가기</a></p>

  {% assign nrf_achievements = people.student_achievements | where: "id", "saeyoung-yoon-nrf-2026" %}
  {% assign student_achievement = nrf_achievements | first %}
  {% if student_achievement %}
    <article class="home-achievement ko-achievement" id="student-achievement">
      <div>
        <p class="card-label">학생 성과 · {{ student_achievement.year }}</p>
        <h3>윤세영 학생, 한국연구재단 박사과정생연구장려금지원사업 선정</h3>
        <p>윤세영 학생이 2026년도 {{ student_achievement.program_ko }}에 선정되었습니다. {{ student_achievement.duration_ko }} 동안 「{{ student_achievement.project_title_ko }}」을 주제로 연구를 수행합니다.</p>
      </div>
      <p><a class="button button--ghost" href="{{ '/pages/people.html#' | append: student_achievement.id | relative_url }}">선정 내용 자세히 보기 <span class="ko-button-note">(영문)</span></a></p>
    </article>
  {% endif %}

  <div class="ko-evidence-grid">
    <article class="card ko-evidence-card" aria-labelledby="ko-conferences-title">
      <p class="eyebrow">국제학회 발표</p>
      <h3 id="ko-conferences-title">학생과 졸업생의 연구 발표</h3>
      <ul>
        {% for presentation in people.conference_presentations %}
          <li><strong><span lang="en">{{ presentation.conference }}</span> · {{ presentation.year }}</strong><span>{{ presentation.presenter_ko }} · {{ presentation.location_ko }}</span></li>
        {% endfor %}
      </ul>
      <p><a href="{{ '/pages/people.html#conference-presentations' | relative_url }}">발표 이력 보기 <span class="ko-link-note">(영문)</span></a></p>
    </article>
    <article class="card ko-evidence-card" aria-labelledby="ko-alumni-title">
      <p class="eyebrow">졸업생 진로</p>
      <h3 id="ko-alumni-title">연구 경험을 다음 단계로 연결한 졸업생</h3>
      <ul>
        {% for alum in people.alumni %}
          <li><strong>{{ alum.name_ko }} <span lang="en">{{ alum.name }}</span></strong><span>{{ alum.degree_ko }} · {{ alum.year }}년 졸업</span><span>{{ alum.placement_ko }}{% if alum.note_ko %} · {{ alum.note_ko }}{% endif %}</span></li>
        {% endfor %}
      </ul>
    </article>
  </div>

  <aside class="ko-opportunity" id="ko-research-opportunities" aria-labelledby="ko-opportunity-title">
    <div>
      <p class="eyebrow">예비학생 안내</p>
      <h3 id="ko-opportunity-title">연구 참여에 관심이 있다면</h3>
      <p>{{ people.opportunity_summary_ko }}</p>
      <p><a class="button" href="{{ '/pages/people.html#research-opportunities' | relative_url }}" data-analytics-event="student_opportunity_click">연구 기회 상세 보기 <span class="ko-button-note">(영문)</span></a></p>
    </div>
    <div>
      <p><strong>이메일에 포함하면 좋은 내용</strong></p>
      <ul>
        {% for item in opportunities.email_guidance_ko %}<li>{{ item }}</li>{% endfor %}
      </ul>
      <p class="muted">이메일 연락은 연구 관심과 적합성을 논의하기 위한 것이며, 고려대학교의 공식 입학 절차를 대신하지 않습니다.</p>
      <p><a href="mailto:{{ profile.email }}?subject={{ '연구 참여 문의' | uri_escape }}" data-analytics-event="student_email_click">{{ profile.email }}</a></p>
      <p><a href="https://biz.korea.ac.kr/eng/msphd/intro.html" target="_blank" rel="noopener noreferrer" data-analytics-event="official_admissions_click">KUBS 석·박사과정 공식 안내 <span class="ko-link-note">(영문)</span></a></p>
    </div>
  </aside>
</section>

<section class="section section--tinted" id="research-impact" aria-labelledby="ko-research-impact-title">
  <p class="eyebrow">대표 연구와 임팩트</p>
  <h2 id="ko-research-impact-title">연구 질문, 주요 결과와 실무적 의미</h2>
  <p class="lead-text">의약품 공급망뿐 아니라 리테일 운영과 서비스 의사결정을 다룬 대표 연구를 소개합니다.</p>
  {% assign featured_papers = site.data.publications | where: "featured", true | sort: "featured_order" %}
  <div class="ko-paper-grid">
    {% for paper in featured_papers limit:5 %}
      <article class="mini-paper ko-paper-card">
        <p class="research-card__venue" lang="en">{{ paper.venue }} · {{ paper.year }}</p>
        <h3>{{ paper.featured_short_title_ko | default: paper.featured_short_title | default: paper.short_title }}</h3>
        <p class="ko-paper-card__finding"><strong>핵심 결과</strong> {{ paper.finding_ko }}</p>
        <details class="ko-paper-card__more">
          <summary>연구 질문과 실무적 의미 보기</summary>
          <dl class="ko-paper-card__details">
            <dt>연구 질문</dt><dd>{{ paper.question_ko }}</dd>
            <dt>실무적 의미</dt><dd>{{ paper.impact_ko }}</dd>
          </dl>
        </details>
        {% if paper.links %}
          <p class="link-row ko-paper-card__links">{% for link in paper.links %}<a href="{{ link.url }}" target="_blank" rel="noopener noreferrer" data-analytics-event="publication_click">{{ link.label }}</a>{% endfor %}</p>
        {% endif %}
      </article>
    {% endfor %}
  </div>
  <p class="section-actions"><a class="button button--ghost" href="{{ '/pages/research.html' | relative_url }}">전체 연구 포트폴리오 <span class="ko-button-note">(영문)</span></a></p>
</section>

<section class="section" id="industry" aria-labelledby="ko-industry-title">
  <p class="eyebrow">기업·기관 협력</p>
  <h2 id="ko-industry-title">공급망 강연부터 운영관리 자문·공동연구까지</h2>
  <p class="lead-text">{{ industry.intro }}</p>
  <div class="card-grid card-grid--three">
    {% for mode in industry.project_modes %}
      <article class="card engagement-card">
        <h3>{{ mode.title }}</h3>
        <p>{{ mode.description }}</p>
        <p><a class="button button--ghost" href="{{ '/pages/inquiry.html' | relative_url }}?type={{ mode.id | uri_escape }}&amp;source=korean-hub" data-analytics-event="{{ mode.event }}">{{ mode.cta }}</a></p>
      </article>
    {% endfor %}
  </div>
  <p class="collaboration-topics"><strong>주요 협력 주제:</strong> 수요예측·추천·재고, 현장실험과 효과평가, 공급망 회복탄력성, 헬스케어 운영, AI 기반 업무설계</p>
  <div class="button-row section-actions">
    <a class="button" href="{{ '/pages/industry.html' | relative_url }}" data-analytics-event="industry_page_click">협력 분야와 공개 사례</a>
    <a class="button button--ghost" href="{{ '/assets/downloads/hyunseok-lee-speaker-one-pager-ko.pdf' | relative_url }}" data-analytics-event="speaker_onepager_download">강연 소개 PDF</a>
    <a class="button button--ghost" href="{{ '/assets/downloads/hyunseok-lee-collaboration-brief-ko.pdf' | relative_url }}" data-analytics-event="collaboration_brief_download">산학협력 소개 PDF</a>
  </div>
</section>

<section class="section section--tinted" id="media" aria-labelledby="ko-media-title">
  <p class="eyebrow">미디어와 대외 소통</p>
  <h2 id="ko-media-title">연구를 기업과 사회의 언어로 설명합니다</h2>
  {% assign latest_selected_media = site.data.media_impact.selected_media | sort: "date" | reverse %}
  {% assign latest_selected_item = latest_selected_media | first %}
  {% assign featured_impact = site.data.media_impact.featured | first %}
  {% assign latest_columns = site.data.media_impact.essays_and_columns | sort: "date" | reverse %}
  {% assign latest_column = latest_columns | first %}
  <div class="media-grid">
    {% if latest_selected_item %}<article class="card">
      <p class="card-label">{{ latest_selected_item.type_ko }} · {{ latest_selected_item.date }}</p>
      <h3>{{ latest_selected_item.title }}</h3>
      <p><strong>{{ latest_selected_item.outlet }}</strong></p>
      <p>{{ latest_selected_item.summary_ko }}</p>
      <p><a href="{{ latest_selected_item.url }}" target="_blank" rel="noopener noreferrer" data-analytics-event="media_impact_click">기고문 읽기</a></p>
    </article>{% endif %}
    {% if featured_impact %}<article class="card">
      <p class="card-label">{{ featured_impact.type_ko }} · {{ featured_impact.date }}</p>
      <h3>의약품 부족 회복 연구 국내 언론 보도</h3>
      <p>{{ featured_impact.summary_ko }}</p>
      <p><a href="{{ featured_impact.url | relative_url }}" data-analytics-event="media_impact_click">보도 모음 보기</a></p>
    </article>{% endif %}
    {% if latest_column %}<article class="card">
      <p class="card-label">{{ latest_column.type_ko }} · {{ latest_column.date }}</p>
      <h3>{{ latest_column.title }}</h3>
      <p><strong>{{ latest_column.outlet }}</strong></p>
      <p>{{ latest_column.summary_ko }}</p>
      <p><a href="{{ latest_column.url }}" target="_blank" rel="noopener noreferrer" data-analytics-event="media_impact_click">칼럼 읽기</a></p>
    </article>{% endif %}
  </div>
  <div class="button-row section-actions">
    <a class="button button--ghost" href="{{ '/pages/media.html' | relative_url }}" data-analytics-event="media_impact_click">미디어 활동 전체 보기 <span class="ko-button-note">(영문)</span></a>
    <a class="button button--ghost" href="{{ '/pages/inquiry.html' | relative_url }}?type=media-interview&amp;source=korean-hub" data-analytics-event="inquiry_page_click">인터뷰·강연 문의</a>
  </div>
</section>

<section class="section" id="academic" aria-labelledby="ko-academic-title">
  <p class="eyebrow">연구자·학계</p>
  <h2 id="ko-academic-title">연구, 교육과 학술 활동</h2>
  <div class="card-grid card-grid--three academic-overview-grid">
    <article class="card academic-overview-card">
      <p class="card-label">연구와 수상</p>
      <h3>최근 연구 성과와 인정</h3>
      <ul class="compact-list compact-list--stacked">
        <li><strong>2026</strong> 한국기업경영학회 최우수논문상</li>
        <li><strong>2026</strong> SK Distinguished Research Award</li>
        <li><strong>2025–현재</strong> KUBS Research Fellow</li>
      </ul>
      <p><a href="{{ '/pages/award.html' | relative_url }}">수상 내역 보기 <span class="ko-link-note">(영문)</span></a></p>
    </article>
    <article class="card academic-overview-card">
      <p class="card-label">교육</p>
      <h3>연구 방법과 운영분석 교육</h3>
      <ul class="compact-list compact-list--stacked">
        {% for item in site.data.teaching.homepage_cards %}<li><strong>{{ item.title_ko }}</strong><br>{{ item.summary_ko }}</li>{% endfor %}
      </ul>
      <p><a href="{{ '/pages/teaching.html' | relative_url }}">교육 이력 보기 <span class="ko-link-note">(영문)</span></a></p>
    </article>
    <article class="card academic-overview-card">
      <p class="card-label">학술 활동</p>
      <h3>학술지와 학회 봉사</h3>
      <ul class="compact-list compact-list--stacked">
        <li><span lang="en">Journal of Operations Management</span> Editorial Review Board</li>
        <li><span lang="en">Decision Sciences</span> Editorial Review Board</li>
        <li>한국생산관리학회 이사 및 편집위원</li>
      </ul>
      <p><a href="{{ '/pages/award.html' | relative_url }}">학술봉사 보기 <span class="ko-link-note">(영문)</span></a></p>
    </article>
  </div>
  <nav class="button-row section-actions" aria-label="학술 프로필 링크">
    <a class="button" href="{{ '/pages/research.html' | relative_url }}">Research</a>
    <a class="button button--ghost" href="{{ profile.links.google_scholar.url }}" target="_blank" rel="noopener noreferrer">Google Scholar</a>
    <a class="button button--ghost" href="{{ profile.cv_url | relative_url }}">CV</a>
    <a class="button button--ghost" href="{{ profile.links.orcid.url }}" target="_blank" rel="noopener noreferrer">ORCID</a>
  </nav>
</section>

<section class="section section--contact section--tinted" id="contact" aria-labelledby="ko-contact-title">
  <div class="contact__intro">
    <p class="eyebrow">연락처</p>
    <h2 id="ko-contact-title">문의 목적에 맞는 경로를 이용해 주세요</h2>
    <p>학생 연구 참여, 기업 강연·자문, 언론 인터뷰와 학술 협업 문의를 구분하면 보다 빠르게 내용을 검토할 수 있습니다.</p>
    <nav class="button-row contact-pathways" aria-label="문의 유형">
      <a class="button" href="{{ '/pages/people.html#research-opportunities' | relative_url }}">학생 연구 참여</a>
      <a class="button button--secondary" href="{{ '/pages/inquiry.html' | relative_url }}?source=korean-hub" data-analytics-event="inquiry_page_click">기업·미디어 문의</a>
      <a class="button button--ghost" href="mailto:{{ profile.email }}" data-analytics-event="email_click">학술 문의</a>
    </nav>
    <p class="contact__name"><strong>{{ profile.name_ko }}</strong> <span lang="en">{{ profile.name }}</span></p>
    <p>{{ profile.display_title_ko }}<br>{{ profile.affiliation_ko }}</p>
  </div>
  <div class="contact__details">
    <dl class="contact-card">
      <div class="contact-card__row"><dt>이메일</dt><dd><a href="mailto:{{ profile.email }}" data-analytics-event="email_click">{{ profile.email }}</a></dd></div>
      <div class="contact-card__row"><dt>전화</dt><dd><a href="tel:{{ profile.office_phone | replace: '-', '' }}">{{ profile.office_phone }}</a></dd></div>
      <div class="contact-card__row"><dt>연구실</dt><dd>{{ profile.office }}</dd></div>
      <div class="contact-card__row"><dt>주소</dt><dd>{{ profile.address_ko }}</dd></div>
    </dl>
  </div>
</section>
