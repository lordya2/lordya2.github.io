---
layout: page
permalink: /pages/inquiry.html
title: 기업 강연·운영관리 자문 문의
seo_title: 기업 강연·운영관리 자문 문의 | 이현석 교수
hide_page_header: true
description: 이현석 교수의 공급망 기업 강연, 임원 워크숍, 운영관리 자문·공동연구와 산학 프로젝트 문의를 위한 안내 페이지입니다.
lang: ko
extra_css: /assets/themes/twitter/css/inquiry-form.css
extra_js: /assets/js/inquiry-form.js
---
{% assign profile = site.data.profile %}

<section class="section page-section inquiry-page" lang="ko" aria-labelledby="inquiry-title">
  <p class="eyebrow">Speaking &amp; Collaboration Inquiry</p>
  <h1 id="inquiry-title">기업 강연·운영관리 자문·공동연구 문의</h1>
  <p class="lead-text">강연, 공동연구, 산학 프로젝트 또는 인터뷰에 대해 문의해 주세요. 문의 유형을 선택하면 필요한 항목을 안내합니다.</p>
  <p class="inquiry-direct">간단한 문의는 <a href="mailto:{{ profile.email }}" data-analytics-event="email_click">{{ profile.email }}</a>로 바로 보내셔도 됩니다.</p>

  <div class="inquiry-notice" role="note" aria-labelledby="inquiry-privacy-title">
    <h2 id="inquiry-privacy-title">입력 전 확인해 주세요</h2>
    <p><strong>이 페이지는 입력 내용을 서버에 저장하거나 전송하지 않습니다.</strong> 아래 버튼을 누르면 사용 중인 이메일 앱에 문의 초안이 열립니다.</p>
    <p>활용 가능한 데이터의 <strong>종류와 범위만</strong> 간략히 적어 주세요. 연락에 필요한 본인의 성명·업무용 이메일·전화번호 외에, 제3자의 개인정보, 영업비밀, 민감정보 또는 원자료는 입력하거나 첨부하지 마십시오.</p>
  </div>

  <form class="inquiry-form" id="inquiry-form" action="mailto:{{ profile.email }}" method="post" enctype="text/plain" data-recipient="{{ profile.email }}">
    <fieldset>
      <legend>연락처</legend>
      <div class="form-grid form-grid--two">
        <div class="form-field">
          <label for="inquiry-name">성명 <span aria-hidden="true">*</span></label>
          <input id="inquiry-name" name="name" type="text" autocomplete="name" maxlength="80" required>
        </div>
        <div class="form-field">
          <label for="inquiry-company"><span id="company-label">회사·기관</span> <span aria-hidden="true">*</span></label>
          <input id="inquiry-company" name="company" type="text" autocomplete="organization" maxlength="120" required>
        </div>
        <div class="form-field">
          <label for="inquiry-role">부서·직함</label>
          <input id="inquiry-role" name="role" type="text" autocomplete="organization-title" maxlength="120">
        </div>
        <div class="form-field">
          <label for="inquiry-email">이메일 <span aria-hidden="true">*</span></label>
          <input id="inquiry-email" name="email" type="email" autocomplete="email" maxlength="254" required>
        </div>
        <div class="form-field">
          <label for="inquiry-phone">전화번호</label>
          <input id="inquiry-phone" name="phone" type="tel" autocomplete="tel" maxlength="40">
        </div>
      </div>
    </fieldset>

    <fieldset>
      <legend>문의 내용</legend>
      <div class="form-grid form-grid--two">
        <div class="form-field">
          <label for="inquiry-type">문의 유형 <span aria-hidden="true">*</span></label>
          <select id="inquiry-type" name="inquiry_type" required>
            <option value="">선택해 주세요</option>
            <option value="기업 강연·임원 워크숍" data-type-id="executive-workshops">기업 강연·임원 워크숍</option>
            <option value="자문·공동연구" data-type-id="advisory-research">자문·공동연구</option>
            <option value="산학 프로젝트" data-type-id="industry-projects">산학 프로젝트</option>
            <option value="미디어·인터뷰" data-type-id="media-interview">미디어·인터뷰</option>
            <option value="기타" data-type-id="other">기타</option>
          </select>
        </div>
        <div class="form-field">
          <label for="interest-topic">관심 주제 <span aria-hidden="true">*</span></label>
          <select id="interest-topic" name="interest_topic" required>
            <option value="">선택해 주세요</option>
            <option>AI와 조직·운영 의사결정</option>
            <option>데이터 기반 의사결정·인과추론</option>
            <option>공급망 회복탄력성과 리스크</option>
            <option>고객경험·리테일·서비스 운영</option>
            <option>수요예측·추천·재고</option>
            <option>헬스케어·제약</option>
            <option>기타</option>
          </select>
        </div>
        <p class="form-help form-field--wide" id="inquiry-type-help" aria-live="polite">문의 유형과 관심 주제를 선택한 뒤, 논의하고 싶은 내용을 적어 주세요.</p>
        <div class="form-field form-field--wide" data-inquiry-types="executive-workshops">
          <label for="inquiry-audience">대상·참석자 <span aria-hidden="true">*</span></label>
          <input id="inquiry-audience" name="audience" type="text" maxlength="200" placeholder="예: 본부장급 20명, 데이터·전략 실무자 50명" data-required-for="executive-workshops">
        </div>
        <div class="form-field form-field--wide">
          <label for="inquiry-schedule"><span id="schedule-label">희망 일정</span> <span id="schedule-required" aria-hidden="true" hidden>*</span></label>
          <input id="inquiry-schedule" name="schedule" type="text" maxlength="160" placeholder="예: 다음 달 평일 오후, 협의 가능" data-required-for="executive-workshops media-interview">
        </div>
        <div class="form-field form-field--wide" data-inquiry-types="advisory-research industry-projects">
          <label for="data-availability">활용 가능 데이터 <span aria-hidden="true">*</span></label>
          <select id="data-availability" name="data_availability" data-required-for="advisory-research industry-projects" aria-describedby="data-safety-note">
            <option value="">선택해 주세요</option>
            <option>미정·협의 필요</option>
            <option>현재 활용 가능한 데이터 없음</option>
            <option>비식별·집계 데이터 활용 가능</option>
            <option>원자료 활용 가능성 내부 검토 필요</option>
          </select>
          <p class="form-help" id="data-safety-note">데이터 파일을 보내지 말고, 보유 데이터의 종류와 활용 가능 수준만 선택해 주세요.</p>
        </div>
        <div class="form-field form-field--wide" data-inquiry-types="advisory-research industry-projects">
          <label for="data-summary">데이터 종류·범위 설명</label>
          <textarea id="data-summary" name="data_summary" rows="4" maxlength="500" placeholder="예: 최근 2년간 월별·상품군별 판매 및 재고 집계 데이터. 비식별·집계 수준에서 활용 가능 여부를 검토 중입니다."></textarea>
        </div>
        <div class="form-field form-field--wide">
          <label for="inquiry-message">문의 내용 <span aria-hidden="true">*</span></label>
          <textarea id="inquiry-message" name="message" rows="5" maxlength="1000" placeholder="논의하고 싶은 주제와 기대하는 내용을 간략히 적어 주세요." required></textarea>
        </div>
      </div>
    </fieldset>

    <input id="inquiry-source" name="source" type="hidden" value="direct">
    <div class="form-confirmation">
      <input id="privacy-confirm" name="privacy_confirm" type="checkbox" required>
      <label for="privacy-confirm">연락처 항목 외에 제3자의 개인정보, 영업비밀, 민감정보 또는 원자료를 입력하지 않았음을 확인합니다. <span aria-hidden="true">*</span></label>
    </div>

    <div class="button-row inquiry-form__actions">
      <button class="button" type="submit">이메일 문의 초안 열기</button>
      <button class="button button--ghost" id="copy-inquiry" type="button">문의 내용 복사</button>
    </div>
    <p class="form-status" id="inquiry-status" role="status" aria-live="polite"></p>
    <p class="form-help">이메일 앱이 열리지 않으면 ‘문의 내용 복사’를 누른 뒤 <a href="mailto:{{ profile.email }}" data-analytics-event="email_click">{{ profile.email }}</a>로 보내 주세요.</p>
    <noscript><p class="form-help">문의 유형에 맞는 항목 표시와 내용 복사에는 JavaScript가 필요합니다. 위 이메일 주소로 문의 내용을 직접 보내 주세요.</p></noscript>
  </form>

  <aside class="inquiry-resources" aria-labelledby="inquiry-resources-title">
    <h2 id="inquiry-resources-title">내부 검토용 자료</h2>
    <p>기업 내부 공유나 행사·프로젝트 검토에 활용할 수 있습니다.</p>
    <div class="button-row">
      <a class="button button--ghost" href="{{ '/assets/downloads/hyunseok-lee-speaker-one-pager-ko.pdf' | relative_url }}" data-analytics-event="speaker_onepager_download">Speaker One-pager PDF</a>
      <a class="button button--ghost" href="{{ '/assets/downloads/hyunseok-lee-collaboration-brief-ko.pdf' | relative_url }}" data-analytics-event="collaboration_brief_download">Collaboration Brief PDF</a>
    </div>
  </aside>
</section>
