$(function () {
  $('.mypage-tab_link').on("click", function() {
    $('.mypage-tab_link').removeClass('active-tab');
    $(this).addClass('active-tab');
    $('.tab_panel').removeClass('active-item');
    $($(this).attr("href")).addClass('active-item');
  });
});

$(function () {
  $('.purchase-tab_link').on("click", function() {
    $('.purchase-tab_link').removeClass('active-tab');
    $(this).addClass('active-tab');
    $('.tab_item').removeClass('active-item');
    $($(this).attr("href")).addClass('active-item');
  });
});

$(function(){
  $(".sidebar-list_contents").on('click', function(){
    $(".sidebar-list_contents .selected").removeClass("selected");
    $(this).addClass("selected");
  });
});
