$(document).ready(function() {
  function setBackground() {
    var src = $(this).data('src');

    if (src.indexOf(',') > -1) {
      src = src.split(',');
      src = src[
        Math.floor(Math.random() * src.length) + 0
      ];
    }

    $(this).css({
      backgroundImage: 'url("' + src + '")',
      backgroundSize: 'cover'
    });
  }

  $('*[data-src]').each(setBackground);
});
