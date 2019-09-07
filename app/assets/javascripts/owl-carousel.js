$(function(){
  $(".owl-carousel").owlCarousel({  
    items: 1,
  });
}); 

$(function() {	 
  dotcount = 1;

  $('.owl-dot').each(function() {
    $(this).addClass( 'dotnumber' + dotcount);
    $(this).attr('data-info', dotcount);
    dotcount=dotcount+1;
  });
  
  slidecount = 1;

  $('.owl-item').not('.cloned').each(function() {
    $(this).addClass( 'slidenumber' + slidecount);
    slidecount=slidecount+1;
  });
  
  $('.owl-dot').each(function() {
      grab = $(this).data('info');
      slidegrab = $('.slidenumber'+ grab +' img').attr('src');
      $(this).css("background-image", "url("+slidegrab+")");  
  });
  
  // amount = $('.owl-dot').length;
  // gotowidth = 100/amount;
  
  $('.owl-dot').css({'width': '20%'});
  // newwidth = $('.owl-dot').width();
  $('.owl-dot').css({"height": '60px'}); 	
});
