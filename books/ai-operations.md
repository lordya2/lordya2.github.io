---
layout: default
title: AI는 어떻게 회사를 움직이는가
seo_title: AI는 어떻게 회사를 움직이는가 | 이현석 지음 · 한경사
description: AI를 성과로 바꾸는 운영관리의 힘. 고려대학교 경영대학 이현석 교수의 신간 소개, 목차, 교보문고·알라딘·YES24 구매 안내.
permalink: /books/ai-operations/
lang: ko
body_class: ko-content book-page
schema_type: Book
og_image: /assets/books/ai-operations-cover.jpg
og_image_alt: AI는 어떻게 회사를 움직이는가 — 이현석 지음, 한경사. 보라색 바탕에 주황색과 흰색 제목의 책 표지.
---
{% assign book = site.data.book %}

<section class="section book-hero" aria-labelledby="book-title">
  <figure class="book-hero__cover">
    <img src="{{ book.cover | relative_url }}" alt="{{ page.og_image_alt }}" width="862" height="1271" fetchpriority="high">
  </figure>
  <div class="book-hero__content">
    <p class="eyebrow">신간 · 2026년 10월 출간</p>
    <h1 id="book-title">{{ book.title }}</h1>
    <p class="book-subtitle">{{ book.subtitle }}</p>
    <p class="book-byline">{{ book.author }} 지음 · {{ book.publisher }}</p>
    <p class="lead-text">AI의 예측과 분석은 어떻게 회사의 결정과 실행으로 이어질까요?</p>
    <p>{{ book.description_ko }}</p>
    <div class="book-buy" id="buy">
      <p class="book-buy__label">온라인 서점에서 구매하기</p>
      <div class="button-row" aria-label="종이책 구매처">
        {% for retailer in book.retailers %}<a class="button{% unless forloop.first %} button--secondary{% endunless %}" href="{{ retailer.url }}" target="_blank" rel="noopener noreferrer" data-analytics-event="book_buy_{{ retailer.id }}">{{ retailer.name }}<span class="sr-only">에서 종이책 구매 (새 창)</span></a>{% endfor %}
      </div>
    </div>
    <p class="book-meta">한국어 도서 · {{ book.pages }}쪽 · ISBN {{ book.isbn }}</p>
    <nav class="book-section-links" aria-label="책 소개 바로가기"><a href="#inside">책에서 다루는 질문</a><a href="#contents">목차</a><a href="#english" lang="en">English overview</a></nav>
  </div>
</section>

<section class="section section--tinted" id="inside" aria-labelledby="inside-title">
  <p class="eyebrow">책에서 다루는 질문</p>
  <h2 id="inside-title">AI가 만든 답을, 회사가 움직이는 방식으로</h2>
  <p class="lead-text">AI의 결과를 어디에 사용할지, 누가 판단하고 실행할지, 무엇을 성과로 확인할지. 이 책은 기업의 일상적인 운영에서 출발해 이 질문들을 함께 살펴봅니다.</p>
  <div class="card-grid card-grid--three">
    <article class="card"><h3>어떤 결정을 바꿀 것인가</h3><p>수요예측이 정확해졌을 때 발주·재고·인력 배치가 어떻게 달라져야 하는지 생각합니다.</p></article>
    <article class="card"><h3>현장에서 어떻게 실행할 것인가</h3><p>추천과 배송, 챗봇과 상담원, AI와 의료진처럼 서로 연결된 일의 흐름을 살펴봅니다.</p></article>
    <article class="card"><h3>효과를 어떻게 확인할 것인가</h3><p>도입 전후의 변화에서 한 걸음 더 나아가, 비교 설계를 통해 AI의 효과를 검증하는 관점을 배웁니다.</p></article>
  </div>
</section>

<section class="section" aria-labelledby="readers-title">
  <p class="eyebrow">이런 독자에게</p>
  <h2 id="readers-title">AI를 실제 업무와 경영에 연결하고 싶은 분들께</h2>
  <div class="card-grid card-grid--three">
    <article class="card"><h3>경영자와 현장 실무자</h3><p>AI 도입의 목적을 정하고, 업무 흐름과 책임, 성과지표를 함께 고민하는 분.</p></article>
    <article class="card"><h3>데이터·AI 프로젝트 담당자</h3><p>분석 결과가 실제 의사결정과 실행에 쓰이도록 현업과 협력하는 분.</p></article>
    <article class="card"><h3>경영을 배우고 가르치는 분</h3><p>MBA와 경영학 수업, 기업교육에서 AI와 운영관리를 사례와 질문으로 토론하고 싶은 분.</p></article>
  </div>
</section>

<section class="section section--tinted" id="contents" aria-labelledby="contents-title">
  <p class="eyebrow">책의 구성</p>
  <h2 id="contents-title">네 개의 부, 열다섯 개의 장</h2>
  <div class="book-parts">
    {% assign chapter_number = 1 %}
    {% for part in book.parts %}
    <article class="book-part">
      <p class="eyebrow">{{ forloop.index }}부</p>
      <h3>{{ part.title }}</h3>
      <p>{{ part.summary }}</p>
      <details><summary>장별 목차 보기</summary><ol start="{{ chapter_number }}">{% for chapter in part.chapters %}<li>{{ chapter }}</li>{% assign chapter_number = chapter_number | plus: 1 %}{% endfor %}</ol></details>
    </article>
    {% endfor %}
  </div>
  <p class="book-appendix"><strong>부록</strong> AI 도입 전 운영 진단 체크리스트 · 장별 핵심 질문 · 주요 용어 정리 · 저자 연구와 본문 연결</p>
</section>

<section class="section" id="author" aria-labelledby="author-title">
  <div class="content-grid content-grid--two">
    <div>
      <p class="eyebrow">저자 소개</p>
      <h2 id="author-title">이현석</h2>
      <p>고려대학교 경영대학 부교수이자 연구부학장으로, 운영관리와 비즈니스 애널리틱스를 가르칩니다. 헬스케어와 의약품 공급망, 리테일·서비스·플랫폼 운영을 연구하며, 데이터 분석과 인과추론을 통해 현장의 의사결정이 조직의 성과에 미치는 영향을 살펴봅니다.</p>
      <p>이 책에서는 다양한 산업의 사례와 연구를 바탕으로, AI의 예측을 현장의 행동으로 연결하고 그 효과를 검증하는 운영관리의 관점을 소개합니다.</p>
      <p><a href="{{ '/ko/' | relative_url }}">저자의 연구·교육·활동 보기</a></p>
    </div>
    <aside class="card book-teaching">
      <p class="eyebrow">강의·기업교육</p>
      <h3>책의 질문을 함께 토론합니다</h3>
      <p>2026년 10월 말부터 시작하는 고려대학교 MBA 강의에서 이 책을 교재로 활용할 예정입니다.</p>
      <p>AI와 운영 의사결정, 데이터 기반 성과 검증을 주제로 기업 강연과 워크숍도 논의할 수 있습니다.</p>
      <a class="button button--secondary" href="{{ '/pages/inquiry.html' | relative_url }}?type=executive-workshops&amp;source=ai-operations-book" data-analytics-event="book_speaking_inquiry">강연·워크숍 문의</a>
    </aside>
  </div>
</section>

<section class="section section--tinted" id="english" lang="en" aria-labelledby="english-title">
  <p class="eyebrow">English overview · Published in Korean</p>
  <h2 id="english-title">Connecting AI to the decisions that run a company</h2>
  <p class="lead-text">This book by Hyun Seok (Huck) Lee examines how AI predictions and analysis become operating decisions, actions, and measurable outcomes.</p>
  <p>Drawing on examples from demand forecasting, inventory, delivery, recommendations, customer service, healthcare, retail, and platforms, it explores three questions: Which decisions should change? How will those changes be implemented? And how can we tell whether they work?</p>
  <p>Written for managers, practitioners, and business students, the book brings an operations management perspective to the use and evaluation of AI in organizations.</p>
  <p><strong>Published by Hankyungsa, October 2026.</strong> Korean-language edition, 280 pages. ISBN 9788968445903.</p>
  <div class="button-row"><a class="button" href="#buy">Buy the Korean edition</a><a class="button button--secondary" href="{{ '/' | relative_url }}">About the author</a></div>
</section>

<section class="section section--compact book-closing" aria-label="책 구매 안내">
  <h2>{{ book.title }}</h2>
  <p>{{ book.subtitle }}</p>
  <div class="button-row">{% for retailer in book.retailers %}<a class="button button--secondary" href="{{ retailer.url }}" target="_blank" rel="noopener noreferrer" data-analytics-event="book_buy_{{ retailer.id }}">{{ retailer.name }}<span class="sr-only">에서 종이책 구매 (새 창)</span></a>{% endfor %}</div>
</section>
