// Kasi Tech Hub — small progressive enhancements (site works without JS)
(function () {
  var WA_NUMBER = '27799491794';

  // Mobile menu
  var toggle = document.querySelector('.menu-toggle');
  var nav = document.querySelector('nav.primary');
  if (toggle && nav) {
    toggle.addEventListener('click', function () {
      var open = nav.classList.toggle('open');
      toggle.setAttribute('aria-expanded', open ? 'true' : 'false');
    });
  }

  // Lightbox for example-work gallery
  var box = document.querySelector('.lightbox');
  if (box) {
    var boxImg = box.querySelector('img');
    var boxText = box.querySelector('p');
    document.querySelectorAll('.gallery figure').forEach(function (fig) {
      fig.addEventListener('click', function () {
        var img = fig.querySelector('img');
        boxImg.src = img.currentSrc || img.src;
        boxImg.alt = img.alt;
        boxText.textContent = fig.querySelector('figcaption').textContent.trim();
        box.classList.add('open');
      });
    });
    box.addEventListener('click', function (e) {
      if (e.target === box || e.target.tagName === 'BUTTON') box.classList.remove('open');
    });
    document.addEventListener('keydown', function (e) {
      if (e.key === 'Escape') box.classList.remove('open');
    });
  }

  // Enquiry form -> opens WhatsApp with the message pre-filled (no server needed)
  var form = document.getElementById('enquiry');
  if (form) {
    form.addEventListener('submit', function (e) {
      e.preventDefault();
      var d = new FormData(form);
      var msg = 'Hi Kasi Tech Hub, my name is ' + d.get('name') +
        '. I am interested in: ' + d.get('programme') +
        '. Preferred time: ' + d.get('time') +
        (d.get('message') ? '. ' + d.get('message') : '') +
        '. My number: ' + d.get('phone');
      window.open('https://wa.me/' + WA_NUMBER + '?text=' + encodeURIComponent(msg), '_blank', 'noopener');
    });
  }

  // Current year in footer
  document.querySelectorAll('[data-year]').forEach(function (el) {
    el.textContent = new Date().getFullYear();
  });
})();
