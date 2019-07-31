$(function () {
  $('.index-header__bottom__left__category').hover(function(){
    $(this).css('color','#0099e8');
    $('.acordion-category').stop(true).show();
  }, function(){
    $(this).css('color','#333');
    $('.acordion-category').hide();
  });
  $('.index-header__bottom__left__brand').hover(function(){
    $(this).css('color','#0099e8');
    $('.acordion-brand').show();
  }, function(){
    $(this).css('color','#333');
    $('.acordion-brand').hide();
  });
})