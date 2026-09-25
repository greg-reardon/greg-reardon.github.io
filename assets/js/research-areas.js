(function () {
    var topics = document.querySelector('.research-areas__topics');
    if (!topics) return;
    function updateSeparators() {
      var previousCenter = null;
      Array.prototype.forEach.call(topics.children, function (item) {
        var bounds = item.getBoundingClientRect();
        // Flex items share a vertical center even when a long topic spans two lines.
        var center = bounds.top + bounds.height / 2;
        var separator = item.querySelector('.research-areas__separator');
        if (separator) separator.hidden = previousCenter === null || Math.abs(center - previousCenter) > 2;
        previousCenter = center;
      });
    }
    updateSeparators();
    window.addEventListener('resize', updateSeparators);
    if (window.ResizeObserver) new ResizeObserver(updateSeparators).observe(topics);
    if (document.fonts) document.fonts.ready.then(updateSeparators);
  }());
