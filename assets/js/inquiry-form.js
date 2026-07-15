(function () {
  'use strict';

  var form = document.getElementById('inquiry-form');
  if (!form) return;

  var copyButton = document.getElementById('copy-inquiry');
  var status = document.getElementById('inquiry-status');
  var sourceInput = document.getElementById('inquiry-source');
  var typeSelect = document.getElementById('inquiry-type');
  var params = new URLSearchParams(window.location.search);
  var allowedSources = [
    'speaker-one-pager',
    'collaboration-brief',
    'homepage',
    'industry-page',
    'navigation',
    'direct'
  ];

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

  function valueOf(name) {
    var field = form.elements.namedItem(name);
    return field ? String(field.value || '').trim() : '';
  }

  function buildMessage() {
    var rows = [
      ['문의 유형', valueOf('inquiry_type')],
      ['관심 주제', valueOf('interest_topic')],
      ['대상·참석자', valueOf('audience')],
      ['희망 일정', valueOf('schedule')],
      ['활용 가능 데이터', valueOf('data_availability')],
      ['데이터 종류·범위', valueOf('data_summary')],
      ['추가 내용', valueOf('message')],
      ['', ''],
      ['성명', valueOf('name')],
      ['회사·기관', valueOf('company')],
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
