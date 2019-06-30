$(function () {
  $(".purchase-form--accordion").each(function () {
    var accordion = $(this);
    $(this).find(".purchase-form--accordion-toggle").on('click', function() {
      var targetAcontents = $(this).next(".accordion-contents");
      if (targetAcontents.css("display") === "none") {
        accordion.find(".accordion-contents").slideUp();
        accordion.find(".accordion-icon.open").removeClass("open");
      }
      targetAcontents.slideToggle();
      $(".accordion-icon").toggleClass("open");
    })
  })
})