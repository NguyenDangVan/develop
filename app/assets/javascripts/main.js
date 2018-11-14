$(function () {
// Slideshow 4
  $("#slider4").responsiveSlides({
    auto: true,
    pager: true,
    nav: true,
    speed: 500,
    namespace: "callbacks",
    before: function () {
      $('.events').append("<li>before event fired.</li>");
    },
    after: function () {
      $('.events').append("<li>after event fired.</li>");
    }
  });
});
$(document).ready(function() {
  $("#owl-demo").owlCarousel({
    items : 1,
    lazyLoad : true,
    autoPlay : true,
    navigation : true,
    navigationText :  false,
    pagination : true,
  });
});
$(document).on("turbolinks:load", function(){
  if (window.location.href.includes("/songs/")) {
    $("body audio")[0].play();
  }
});
$(document).ready(function(){
  if ($('textarea').length > 0) {
    var data = $('.ckeditor');
    $.each(data, function(i) {
      CKEDITOR.replace(data[i].id)
    });
  }
});
