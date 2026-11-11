(function () {
  'use strict';

  var form = document.getElementById('inquiry-form');
  if (!form) return;

  var copyButton = document.getElementById('copy-inquiry');
  var status = document.getElementById('inquiry-status');
  var sourceInput = document.getElementById('inquiry-source');
  var typeSelect = document.getElementById('inquiry-type');
  var companyLabel = document.getElementById('company-label');
  var scheduleLabel = document.getElementById('schedule-label');
  var scheduleInput = document.getElementById('inquiry-schedule');
  var scheduleRequired = document.getElementById('schedule-required');
  var messageInput = document.getElementById('inquiry-message');
  var typeHelp = document.getElementById('inquiry-type-help');
  var params = new URLSearchParams(window.location.search);
  var allowedSources = [
    'speaker-one-pager',
    'collaboration-brief',
    'homepage',
    'industry-page',
    'drug-shortage-explainer',
    'korean-hub',
    'navigation',
    'ai-operations-book',
    'direct'
  ];

  var typeGuidance = {
    'executive-workshops': {
      help: '참석 대상과 희망 일정을 알려 주세요. 일정이 정해지지 않았다면 “협의 가능”으로 적으셔도 됩니다.',
      message: '강연에서 다루고 싶은 질문, 기대하는 내용과 행사 형식을 적어 주세요.'
    },
    'advisory-research': {
      help: '함께 풀고 싶은 운영 문제와 데이터 활용 가능 수준을 알려 주세요. 데이터가 미정이어도 문의하실 수 있습니다.',
      message: '해결하고 싶은 운영 문제, 현재의 의사결정 방식과 기대하는 결과를 적어 주세요.'
    },
    'industry-projects': {
      help: '프로젝트에서 다룰 질문과 활용 가능한 데이터를 알려 주세요. 구체적인 범위와 일정은 함께 논의할 수 있습니다.',
      message: '프로젝트의 목표, 다루고 싶은 질문과 기대하는 결과물을 적어 주세요.'
    },
    'media-interview': {
      help: '매체·기관명, 인터뷰 주제와 희망 일정 또는 마감을 알려 주세요.',
      message: '인터뷰 주제, 보도 목적과 예상 질문을 간략히 적어 주세요.'
    },
    'other': {
      help: '문의하실 내용을 간략히 적어 주세요. 일정은 필요한 경우에만 입력하시면 됩니다.',
      message: '논의하고 싶은 주제와 기대하는 내용을 간략히 적어 주세요.'
    }
  };

  function setStatus(message) {
    status.textContent = message;
  }

  function track(eventName) {
    if (typeof window.gtag !== 'function') return;
    window.gtag('event', eventName, {
      page_path: window.location.pathname
    });
  }

  function initialiseFromQuery() {
    var requestedType = params.get('type');
    var source = params.get('source');

    if (source && allowedSources.indexOf(source) !== -1) {
      sourceInput.value = source;
    }

    if (!requestedType) return;
    Array.prototype.some.call(typeSelect.options, function (option) {
      if (option.getAttribute('data-type-id') === requestedType) {
        option.selected = true;
        return true;
      }
      return false;
    });
  }

  function selectedTypeId() {
    var selected = typeSelect.options[typeSelect.selectedIndex];
    return selected ? selected.getAttribute('data-type-id') || '' : '';
  }

  function appliesTo(typeList, typeId) {
    return typeList.split(' ').indexOf(typeId) !== -1;
  }

  function updateFieldsForType() {
    var typeId = selectedTypeId();
    var guidance = typeGuidance[typeId];

    Array.prototype.forEach.call(form.querySelectorAll('[data-inquiry-types]'), function (group) {
      var visible = appliesTo(group.getAttribute('data-inquiry-types'), typeId);
      group.hidden = !visible;
      Array.prototype.forEach.call(group.querySelectorAll('input, select, textarea'), function (field) {
        field.disabled = !visible;
      });
    });

    Array.prototype.forEach.call(form.querySelectorAll('[data-required-for]'), function (field) {
      field.required = !field.disabled && appliesTo(field.getAttribute('data-required-for'), typeId);
    });

    var isInterview = typeId === 'media-interview';
    companyLabel.textContent = isInterview ? '매체·기관' : '회사·기관';
    scheduleLabel.textContent = isInterview ? '희망 인터뷰 일정·마감' : '희망 일정';
    scheduleInput.placeholder = isInterview ? '예: 다음 주 중 인터뷰, 기사 마감일, 협의 가능' : '예: 다음 달 평일 오후, 협의 가능';
    scheduleRequired.hidden = !scheduleInput.required;
    typeHelp.textContent = guidance ? guidance.help : '문의 유형과 관심 주제를 선택한 뒤, 논의하고 싶은 내용을 적어 주세요.';
    messageInput.placeholder = guidance ? guidance.message : '논의하고 싶은 주제와 기대하는 내용을 간략히 적어 주세요.';
    setStatus('');
  }

  function valueOf(name) {
    var field = form.elements.namedItem(name);
    return field && !field.disabled ? String(field.value || '').trim() : '';
  }

  function buildMessage() {
    var rows = [
      ['문의 유형', valueOf('inquiry_type')],
      ['관심 주제', valueOf('interest_topic')],
      ['대상·참석자', valueOf('audience')],
      [scheduleLabel.textContent, valueOf('schedule')],
      ['활용 가능 데이터', valueOf('data_availability')],
      ['데이터 종류·범위', valueOf('data_summary')],
      ['문의 내용', valueOf('message')],
      ['', ''],
      ['성명', valueOf('name')],
      [companyLabel.textContent, valueOf('company')],
      ['부서·직함', valueOf('role')],
      ['회신 이메일', valueOf('email')],
      ['전화번호', valueOf('phone')],
      ['문의 경로', valueOf('source')]
    ];

    return rows.filter(function (row) {
      return row[0] === '' || row[1] !== '';
    }).map(function (row) {
      return row[0] === '' ? '' : row[0] + ': ' + row[1];
    }).join('\n');
  }

  function validate() {
    if (form.checkValidity()) return true;
    form.reportValidity();
    setStatus('필수 항목을 확인해 주세요.');
    return false;
  }

  function copyWithFallback(text) {
    var textarea = document.createElement('textarea');
    textarea.value = text;
    textarea.setAttribute('readonly', '');
    textarea.style.position = 'fixed';
    textarea.style.opacity = '0';
    document.body.appendChild(textarea);
    try {
      textarea.select();
      return document.execCommand('copy');
    } catch (error) {
      return false;
    } finally {
      document.body.removeChild(textarea);
    }
  }

  initialiseFromQuery();
  updateFieldsForType();
  typeSelect.addEventListener('change', updateFieldsForType);

  form.addEventListener('input', function handleFirstInput() {
    track('form_start');
    form.removeEventListener('input', handleFirstInput);
  });

  form.addEventListener('submit', function (event) {
    event.preventDefault();
    if (!validate()) return;

    var company = valueOf('company');
    var subject = '[hyunseoklee.com] ' + valueOf('inquiry_type') + ' 문의 - ' + company;
    var recipient = form.getAttribute('data-recipient');
    var mailto = 'mailto:' + recipient + '?subject=' + encodeURIComponent(subject) + '&body=' + encodeURIComponent(buildMessage());

    track('inquiry_email_draft_open');
    setStatus('이메일 앱에서 문의 내용을 확인한 뒤 직접 보내 주세요.');
    window.location.href = mailto;
  });

  copyButton.addEventListener('click', function () {
    if (!validate()) return;
    var text = buildMessage();

    if (navigator.clipboard && window.isSecureContext) {
      navigator.clipboard.writeText(text).then(function () {
        track('inquiry_details_copy');
        setStatus('문의 내용을 복사했습니다. 이메일 본문에 붙여 넣어 주세요.');
      }).catch(function () {
        if (copyWithFallback(text)) {
          track('inquiry_details_copy');
          setStatus('문의 내용을 복사했습니다. 이메일 본문에 붙여 넣어 주세요.');
        } else {
          setStatus('자동 복사에 실패했습니다. 입력 내용을 직접 선택해 복사해 주세요.');
        }
      });
      return;
    }

    if (copyWithFallback(text)) {
      track('inquiry_details_copy');
      setStatus('문의 내용을 복사했습니다. 이메일 본문에 붙여 넣어 주세요.');
    } else {
      setStatus('자동 복사에 실패했습니다. 입력 내용을 직접 선택해 복사해 주세요.');
    }
  });
}());
