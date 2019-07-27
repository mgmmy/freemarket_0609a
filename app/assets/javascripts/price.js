$(function() {
  
  $('#price-form').on('input', function () {
    var inputPrice = $('#price-form').val();
    var fee = inputPrice * 0.1;
    var usersBenefit = inputPrice - fee;
    
    if(fee > 10 && inputPrice !== '' && inputPrice <= 9999999) {
      var fee = String(fee).replace(/(\d)(?=(\d\d\d)+$)/g, "$1,");
      $('#sales-fee').text(fee);
      var usersBenefit = String(usersBenefit).replace(/(\d)(?=(\d\d\d)+$)/g, "$1,");
      $('#sales-benefit').text(usersBenefit);
    }else{
      $('#sales-fee').text("-");
      $('#sales-benefit').text("-");
    };

  });
})
