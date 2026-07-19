---
layout: page
title: 의약품 부족과 제약 공급망 회복탄력성
seo_title: 의약품 부족과 제약 공급망 회복탄력성 | 이현석 고려대 교수
hide_page_header: true
description: 미국 의약품 부족 4,741건과 136개 완제의약품 생산공장을 분석한 Management Science 연구를 바탕으로 회복 경험과 조직 학습이 제약 공급망 회복탄력성에 주는 의미를 설명합니다.
permalink: /ko/drug-shortage-recovery/
lang: ko
body_class: ko-content
schema_type: Article
article_section: 헬스케어·제약 공급망
date_published: '2026-07-20'
date_modified: '2026-07-20'
citation_url: 'https://doi.org/10.1287/mnsc.2024.08337'
---
{% assign profile = site.data.profile %}

<article class="section page-section research-explainer-page" lang="ko" aria-labelledby="drug-shortage-title">
  <header class="explainer-hero">
    <p class="eyebrow">Research Insight · Healthcare &amp; Pharmaceutical Supply Chains</p>
    <h1 id="drug-shortage-title">의약품 부족과 제약 공급망 회복탄력성</h1>
    <p class="lead-text">의약품 부족은 환자 치료와 의료기관 운영에 직접 영향을 미치는 공급망 문제입니다. 이현석 교수와 공동연구진은 미국 의약품 부족 사례와 생산공장 데이터를 연결해, 제약공장이 과거의 회복 경험에서 학습하는지, 어떤 경험이 다음 위기의 회복 속도를 높이는지 분석했습니다.</p>
    <p class="explainer-meta"><strong>연구 해설:</strong> 이현석 교수 · <strong>원 논문:</strong> <em>Management Science</em>, 2026년 5월 28일 온라인 게재</p>
    <div class="button-row">
      <a class="button" href="https://pubsonline.informs.org/doi/10.1287/mnsc.2024.08337" target="_blank" rel="noopener noreferrer" data-analytics-event="publication_click">Management Science 논문</a>
      <a class="button button--ghost" href="https://www.korea.ac.kr/bbs/ko/42/121868/artclView.do" target="_blank" rel="noopener noreferrer" data-analytics-event="media_impact_click">고려대학교 공식 소개</a>
      <a class="button button--ghost" href="{{ '/pages/industry.html' | relative_url }}#executive-workshops" data-analytics-event="industry_page_click">관련 강연·자문</a>
    </div>
    <nav class="page-jump-nav" aria-label="의약품 부족 연구 해설 바로가기">
      <a href="#summary">한눈에 보기</a>
      <a href="#research-question">연구 질문</a>
      <a href="#data-method">데이터와 방법</a>
      <a href="#findings">주요 결과</a>
      <a href="#interpretation">해석할 때 주의할 점</a>
      <a href="#implications">기업을 위한 질문</a>
      <a href="#sources">논문과 해설</a>
    </nav>
  </header>

  <section class="explainer-section" id="summary" aria-labelledby="summary-title">
    <p class="eyebrow">한눈에 보는 결론</p>
    <h2 id="summary-title">회복 경험은 공장 수준에서 축적되지만, 저절로 기업 전체의 역량으로 확산되지는 않습니다</h2>
    <div class="key-message">
      <p>과거에 더 많은 부족 사태를 해결한 생산공장은 이후 부족 사태에서 더 빠르게 회복했습니다. 그러나 학습 효과는 공장 내부에서 발생한 문제에 집중됐고, 같은 기업의 다른 공장으로는 충분히 이전되지 않았습니다.</p>
    </div>
    <div class="metric-grid" role="group" aria-label="연구 개요">
      <div class="metric-card"><strong>4,741건</strong><span>미국 의약품 부족 사례</span></div>
      <div class="metric-card"><strong>136개</strong><span>완제의약품 생산공장</span></div>
      <div class="metric-card"><strong>2015–2020년</strong><span>분석 기간</span></div>
      <div class="metric-card"><strong>2026년</strong><span>Management Science 온라인 게재</span></div>
    </div>
  </section>

  <section class="explainer-section" id="research-question" aria-labelledby="research-question-title">
    <p class="eyebrow">Research Question</p>
    <h2 id="research-question-title">생산공장은 위기에서 실제로 학습하는가</h2>
    <p>의약품 부족의 구조적·경제적 원인에 대해서는 많은 연구가 이루어졌지만, 생산공장이 불규칙하고 정형화하기 어려운 복구 과정에서 운영 지식을 축적하는지는 충분히 밝혀지지 않았습니다. 연구진은 다음 세 질문에 주목했습니다.</p>
    <ul class="feature-list feature-list--prominent">
      <li>과거에 해결한 부족 사태가 많을수록 현재의 부족 사태에서 더 빨리 회복하는가</li>
      <li>어떤 원인과 종류의 경험에서 학습 효과가 더 크게 나타나는가</li>
      <li>한 공장에서 축적한 회복 지식이 같은 기업의 다른 공장으로 이전되는가</li>
    </ul>
  </section>

  <section class="explainer-section" id="data-method" aria-labelledby="data-method-title">
    <p class="eyebrow">Data &amp; Method</p>
    <h2 id="data-method-title">부족 기록과 실제 생산공장을 연결했습니다</h2>
    <p>연구진은 미국 의약품 부족 기록을 FDA 의약품 데이터베이스와 연결해 어느 공장이 어떤 의약품을 생산했고, 부족 사태가 얼마나 오래 지속됐는지를 추적했습니다. FDA 의약품 라벨, 의약품 고유 식별번호인 NDC, 오렌지북과 원료의약품 정보 등을 함께 활용했습니다.</p>
    <p>과거 경험이 많은 공장은 원래부터 운영 역량이 우수할 가능성이 있습니다. 연구진은 이러한 차이가 결과에 미치는 영향을 줄이기 위해 도구변수 접근법을 사용해 과거 회복 경험과 현재 회복 시간의 관계를 분석했습니다.</p>
  </section>

  <section class="explainer-section" id="findings" aria-labelledby="findings-title">
    <p class="eyebrow">Key Findings</p>
    <h2 id="findings-title">경험의 양, 종류와 위치가 모두 중요했습니다</h2>
    <div class="finding-list">
      <article class="finding-card">
        <p class="card-label">01 · Cumulative learning</p>
        <h3>회복 경험은 다음 회복을 앞당겼습니다</h3>
        <p>과거 회복 경험이 1표준편차 증가할 때 현재 부족 사태의 회복 시간은 평균 10.3%, 약 17.5일 단축되는 것으로 추정됐습니다. 공급망 회복이 매번 처음부터 시작되는 것이 아니라 과거 복구 과정에서 축적한 운영 지식의 영향을 받는다는 결과입니다.</p>
      </article>
      <article class="finding-card">
        <p class="card-label">02 · Internal vs. external causes</p>
        <h3>모든 경험이 같은 학습을 만들지는 않았습니다</h3>
        <p>학습 효과는 제조 지연이나 품질 문제처럼 공장 내부에서 발생한 원인의 부족 사태에서 더 크게 나타났습니다. 내부 원인 부족에서는 과거 회복 경험에 따른 회복 시간 단축 효과가 평균 21.5%, 약 36.4일로 추정됐습니다.</p>
        <p>반면 원료 공급업체의 생산 차질이나 예상하지 못한 수요 증가 등 외부 원인에서 비롯된 부족 사태에서는 뚜렷한 학습 효과가 확인되지 않았습니다.</p>
      </article>
      <article class="finding-card">
        <p class="card-label">03 · Breadth of experience</p>
        <h3>경험의 다양성도 중요했습니다</h3>
        <p>과거의 회복 경험이 다양한 원료의약품과 여러 원인 범주에 걸쳐 있을수록 학습 효과가 더 크게 나타났습니다. 다양한 경험은 새로운 문제가 발생했을 때 원인을 진단하고 적합한 대응 방식을 선택할 수 있는 폭넓은 판단 기준을 제공합니다.</p>
      </article>
      <article class="finding-card">
        <p class="card-label">04 · Knowledge transfer</p>
        <h3>경험은 공장에 머무르는 경향이 있었습니다</h3>
        <p>한 생산공장에서 축적한 회복 지식이 같은 기업의 다른 공장으로 자연스럽게 이전된다는 뚜렷한 증거는 찾기 어려웠습니다. 기업 전체의 회복 역량으로 연결하려면 공장 간 지식 이전을 위한 별도의 장치가 필요하다는 점을 시사합니다.</p>
      </article>
    </div>
  </section>

  <section class="explainer-section" id="interpretation" aria-labelledby="interpretation-title">
    <p class="eyebrow">Interpretation</p>
    <h2 id="interpretation-title">연구 결과를 해석할 때 주의할 점</h2>
    <aside class="evidence-note" role="note">
      <ul class="feature-list">
        <li><strong>재고 확보가 불필요하다는 의미가 아닙니다.</strong> 이 연구는 재고정책과 학습 프로그램의 효과를 직접 비교하지 않았습니다.</li>
        <li><strong>21.5%와 약 36.4일은 모든 부족 사태에 적용되는 수치가 아닙니다.</strong> 공장 내부 원인 부족에서 추정한 평균적·조건부 효과입니다.</li>
        <li><strong>분석 대상은 2015~2020년 미국의 완제의약품 생산공장입니다.</strong> 한국이나 다른 산업에서 동일한 크기의 효과가 나타난다고 단정할 수 없습니다.</li>
        <li><strong>구체적인 사후 복기 제도의 효과를 직접 실험한 연구는 아닙니다.</strong> 지식 저장소와 공장 간 학습 장치에 관한 제안은 실증 결과에서 도출한 운영적 시사점입니다.</li>
      </ul>
    </aside>
  </section>

  <section class="explainer-section" id="implications" aria-labelledby="implications-title">
    <p class="eyebrow">Managerial Implications</p>
    <h2 id="implications-title">제약기업과 공급망 조직이 점검할 질문</h2>
    <p>다음 질문은 특정한 효과를 보장하는 처방이라기보다 조직의 회복 역량을 진단하기 위한 출발점입니다.</p>
    <div class="question-grid">
      <article class="card"><h3>복구 과정의 기록</h3><p>부족 사태가 끝난 뒤 원인, 대응 조치, 결과와 핵심 의사결정을 구조적으로 기록하는가?</p></article>
      <article class="card"><h3>사례의 검색 가능성</h3><p>의약품, 원료, 생산공정과 원인 유형별로 과거 복구 사례를 다시 찾을 수 있는가?</p></article>
      <article class="card"><h3>현장의 암묵지</h3><p>본사 보고서뿐 아니라 실제 복구를 수행한 공장의 판단과 시행착오를 포착하는가?</p></article>
      <article class="card"><h3>공장 간 이전</h3><p>한 공장의 경험을 다른 공장이 검토하고 적용할 수 있도록 사례 리뷰와 담당자 교류가 이루어지는가?</p></article>
      <article class="card"><h3>원인별 대응</h3><p>내부 원인과 외부 원인을 구분하고 서로 다른 대응 및 학습 체계를 갖추고 있는가?</p></article>
      <article class="card"><h3>지속적인 개선</h3><p>회복 시간과 재발 여부를 측정하고 그 결과를 바탕으로 대응 절차를 수정하는가?</p></article>
    </div>
    <p>연구 결과는 구조화된 사후 복기, 공장 간 학습 메커니즘, 다양한 회복 경험을 축적하고 활용하는 제도가 제약 공급망의 회복탄력성을 높이는 데 도움이 될 수 있음을 시사합니다.</p>
  </section>

  <section class="explainer-section" id="related-research" aria-labelledby="related-research-title">
    <p class="eyebrow">Related Research</p>
    <h2 id="related-research-title">함께 읽을 연구: 의약품 부족과 운영 투명성</h2>
    <p>회복 경험이 위기 발생 후 정상화하는 역량을 설명한다면, 운영 투명성은 위기를 더 일찍 알리고 시장의 대응을 유도하는 제도적 조건을 설명합니다.</p>
    <p>이현석 교수의 2021년 Management Science 연구는 생산중단 의무 보고가 의약품 부족을 완화하지만, 그 효과가 제품시장의 경쟁 구조에 따라 달라진다는 점을 보여줍니다. 보고와 투명성만으로 모든 시장에서 동일한 효과가 나타나는 것은 아니며 시장 구조를 함께 고려해야 한다는 결과입니다.</p>
    <div class="button-row">
      <a class="button button--ghost" href="https://pubsonline.informs.org/doi/10.1287/mnsc.2020.3857" target="_blank" rel="noopener noreferrer" data-analytics-event="publication_click">Alleviating Drug Shortages 논문</a>
      <a class="button button--ghost" href="{{ '/pages/research.html' | relative_url }}#publication-drug-shortage-transparency">연구 포트폴리오에서 보기</a>
    </div>
  </section>

  <section class="explainer-section" id="sources" aria-labelledby="sources-title">
    <p class="eyebrow">Paper &amp; Public Explanations</p>
    <h2 id="sources-title">논문과 공개 연구 해설</h2>
    <ul class="source-list">
      <li><a href="https://pubsonline.informs.org/doi/10.1287/mnsc.2024.08337" target="_blank" rel="noopener noreferrer">Management Science 논문</a><span>논문 원문, 초록과 온라인 부록</span></li>
      <li><a href="https://www.korea.ac.kr/bbs/ko/42/121868/artclView.do" target="_blank" rel="noopener noreferrer">고려대학교 공식 연구 소개</a><span>연구 데이터, 주요 결과와 시사점</span></li>
      <li><a href="https://dbr.donga.com/article/view/1201/article_no/12175" target="_blank" rel="noopener noreferrer">DBR 연구 해설</a><span>기업의 조직 학습과 위기 회복 관점에서 쓴 이현석 교수의 해설</span></li>
      <li><a href="{{ '/pages/media.html' | relative_url }}#drug-shortage-coverage">국내 언론 보도 모음</a><span>2026년 6월 연구 관련 보도</span></li>
    </ul>
    <p class="citation">Lee, H., Lee, J., Noh, I., and Staats, B. (2026). “Learning in Recovery from Disruption: Empirical Evidence from the U.S. Drug Shortages.” <em>Management Science</em>, Articles in Advance. <a href="https://doi.org/10.1287/mnsc.2024.08337" target="_blank" rel="noopener noreferrer">https://doi.org/10.1287/mnsc.2024.08337</a></p>
  </section>

  <section class="explainer-section explainer-cta" aria-labelledby="explainer-cta-title">
    <p class="eyebrow">Speaking · Advisory · Collaborative Research</p>
    <h2 id="explainer-cta-title">관련 강연·자문·공동연구</h2>
    <p>위기를 겪은 조직이 무엇을 기록하고, 경험을 어디에 축적하며, 다른 사업장으로 어떻게 이전할 것인가는 다양한 공급망과 운영 조직이 공통으로 마주하는 문제입니다. 관련 기업 강연, 임원 워크숍, 자문과 공동연구를 논의할 수 있습니다.</p>
    <div class="button-row">
      <a class="button" href="{{ '/pages/industry.html' | relative_url }}#executive-workshops" data-analytics-event="industry_page_click">공급망 강연·자문 보기</a>
      <a class="button button--ghost" href="{{ '/pages/inquiry.html' | relative_url }}?source=drug-shortage-explainer" data-analytics-event="inquiry_page_click">강연·협업 문의</a>
      <a class="button button--ghost" href="{{ '/assets/downloads/hyunseok-lee-speaker-one-pager-ko.pdf' | relative_url }}" data-analytics-event="speaker_onepager_download">Speaker One-pager PDF</a>
    </div>
    <p class="muted">이 페이지는 논문과 공개된 연구 해설을 일반 독자를 위해 요약한 것입니다. 특정 기업이나 의약품에 대한 진단 또는 동일한 정량적 효과를 보장하지 않습니다.</p>
  </section>
</article>
