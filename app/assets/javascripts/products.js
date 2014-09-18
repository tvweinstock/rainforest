$(document).on('page:load ready', function() {
  var working = false;

  $('#search-form').submit(function(event) {
    event.preventDefault();
    var searchValue = $('#search').val();

    $.getScript('/products?search=' + searchValue);

  });


  $(window).on('scroll', function(){
    if (!working) {
      if ( $(window).scrollTop() > ($(document).height() * 0.65 )  ) {
        working = true;
        var nextPage = $('.pagination .next a');

        if ( nextPage.length > 0 ) {
        var href = nextPage.attr('href');
        $.getScript(href);
        
        }
      }
    }
  });
});

