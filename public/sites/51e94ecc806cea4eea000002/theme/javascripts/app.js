(function() {
  $(function() {
    var loader, masonries, msnry;
    $(document).foundation();
    loader = $('#loader-img .loader').clone();
    masonries = $('.masonry');
    $('#loader-img').remove();
    masonries.masonry({
      itemSelector: '.article-entry',
      columnWidth: '.large-3'
    });
    msnry = masonries.data('masonry');
    $('img').load(function() {
      if (msnry) {
        return msnry.layout();
      }
    });
    $('#content').on('click', '.article-entry .title a', function(evt) {
      return evt.preventDefault();
    });
    $('#content').on('click', '.article-entry:not(.active):not(.no-link)', function() {
      var a, self, url;
      self = $(this);
      a = self.find('.title a');
      url = a.attr('href');
      return $('#entry').fadeOut(function() {
        $('.article-entry.active').find('.overlay').remove().end().removeClass('active');
        self.addClass('active').append('<div class="overlay"/>');
        history.pushState(null, null, url);
        $('body,html').animate({
          scrollTop: 0
        });
        return $(this).empty().html(loader.clone());
      }).fadeIn(function() {
        return $(this).load("" + url + " #entry > *");
      });
    });
    return masonries.infinitescroll({
      loading: {
        finishedMsg: '',
        img: loader.find('img').attr('src'),
        msgText: ''
      },
      itemSelector: '.article-entry:not(.single-entry)',
      nextSelector: '.next_page',
      navSelector: '.pagination'
    }, function(elems) {
      var $elems, self;
      self = $(this);
      $elems = $(elems);
      $elems.find('img').load(function() {
        return msnry.layout();
      });
      return self.masonry('appended', $elems);
    });
  });

}).call(this);
