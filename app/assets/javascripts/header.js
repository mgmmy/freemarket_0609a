$(function () {

  $(".index-header__bottom__left__category").hover(function(){
    $("ul.acordion-category:not(:animated)", this).slideDown();
	}, function(){
		$("ul.acordion-category", this).slideUp();
  });

  $(".index-header__bottom__left__brand").hover(function(){
    $("ul.acordion-brand:not(:animated)", this).slideDown();
	}, function(){
		$("ul.acordion-brand", this).slideUp();
  });
  
});
