$(function() {
   $(window).on("load resize", init);
   function init() {
    var _width = $(window).width();
    if(_width <= 1067){
      $('.sidebar').insertAfter('.mypage');
    }
  }
});