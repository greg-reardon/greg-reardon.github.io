(function () {
    var banner = document.querySelector('.publication-banner');
    if (!banner) return;
    var track = banner.querySelector('.publication-banner__track');
    var previous = banner.querySelector('[data-banner-prev]');
    var next = banner.querySelector('[data-banner-next]');
    var motion = window.matchMedia('(prefers-reduced-motion: reduce)');
    var paused = motion.matches;
    var hovered = false;
    var timer;
    if (!track.children.length) { banner.parentElement.hidden = true; return; }
    previous.hidden = false;
    next.hidden = false;
    function schedule() {
      window.clearTimeout(timer);
      if (paused || hovered || document.hidden || track.scrollWidth <= track.clientWidth + 2) return;
      timer = window.setTimeout(function () { advance(1); }, 4000);
    }
    function update() {
      previous.disabled = next.disabled = track.scrollWidth <= track.clientWidth + 2;
      schedule();
    }
    function advance(direction) {
      var styles = window.getComputedStyle(track);
      var step = track.children[0].getBoundingClientRect().width + parseFloat(styles.columnGap);
      // Snap positions include track padding; allow for that plus pixel rounding.
      var startTolerance = (parseFloat(styles.paddingLeft) || 0) + 2;
      var endTolerance = (parseFloat(styles.paddingRight) || 0) + 2;
      var end = Math.max(0, track.scrollWidth - track.clientWidth);
      var target = track.scrollLeft + direction * step;
      if (direction > 0 && track.scrollLeft >= end - endTolerance) target = 0;
      if (direction < 0 && track.scrollLeft <= startTolerance) target = end;
      track.scrollTo({ left: Math.max(0, Math.min(end, target)), behavior: 'auto' });
      update();
    }
    previous.addEventListener('click', function () { advance(-1); });
    next.addEventListener('click', function () { advance(1); });
    banner.addEventListener('mouseenter', function () { hovered = true; schedule(); });
    banner.addEventListener('mouseleave', function () { hovered = false; schedule(); });
    document.addEventListener('visibilitychange', schedule);
    motion.addEventListener('change', function () { paused = motion.matches; schedule(); });
    track.addEventListener('keydown', function (event) {
      if (event.target !== track) return;
      if (event.key === 'ArrowLeft' || event.key === 'ArrowRight') {
        event.preventDefault();
        advance(event.key === 'ArrowLeft' ? -1 : 1);
      }
    });
    track.addEventListener('scroll', update, { passive: true });
    window.addEventListener('resize', update);
    if (window.ResizeObserver) new ResizeObserver(update).observe(track);
    update();
  }());
