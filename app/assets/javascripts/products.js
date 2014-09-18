$(document).on('page:load ready', function() {
  $('#search-form').submit(function(event) {
    event.preventDefault();
    var searchValue = $('#search').val();

    $.getScript('/products?search=' + searchValue);

  });

  // $(".pagination a").on('click', function(event){
  //   var self = $(this)
  //   var href = self.attr('href');  
  //   event.preventDefault();

  //   $.ajax({
  //     type: 'GET',
  //     dataType: 'html',
  //     url: href,

  //   }).done(function(data) {
  //     $('#products').html(data);
  //   });
  // });
  $(window).on('scroll', function(){
    if ( $(window).scrollTop() > ($(document).height() * 0.65 ) ) {
      var nextPage = $('.pagination .next a');

      if ( nextPage.length > 0 ) {
      var href = nextPage.attr('href');
      $.getScript(href);
      }

      
    };
  });
});

