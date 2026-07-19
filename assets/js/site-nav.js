(function () {
  'use strict';

  var nav = document.querySelector('.site-nav');
  var toggle = document.querySelector('.site-nav__toggle');
  if (!nav || !toggle) return;

  var mobileQuery = window.matchMedia('(max-width: 820px)');

  function closeMenu(returnFocus) {
    nav.classList.remove('is-open');
    toggle.setAttribute('aria-expanded', 'false');
    if (returnFocus) toggle.focus();
  }

  function openMenu() {
    nav.classList.add('is-open');
    toggle.setAttribute('aria-expanded', 'true');
  }

  toggle.addEventListener('click', function () {
    if (nav.classList.contains('is-open')) {
      closeMenu(false);
    } else {
      openMenu();
    }
  });

  nav.addEventListener('keydown', function (event) {
    if (event.key === 'Escape' && nav.classList.contains('is-open')) {
      closeMenu(true);
    }
  });

  nav.addEventListener('click', function (event) {
    if (event.target.closest('a') && mobileQuery.matches) closeMenu(false);
  });

  function handleViewportChange(event) {
    if (!event.matches) closeMenu(false);
  }

  if (typeof mobileQuery.addEventListener === 'function') {
    mobileQuery.addEventListener('change', handleViewportChange);
  } else {
    mobileQuery.addListener(handleViewportChange);
  }
}());
