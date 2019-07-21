$(function(){
  $(document).on('click','(btn-address--next)', function(e) {
      Payjp.setPublicKey("pk_test_96c564d4594eefb82a8e0bfa"); 
      e.preventDefault(); 
      let card = {
        number: document.getElementById("card_number").value,
        cvc: document.getElementById("card_cvc").value,
        exp_month: document.getElementById("card_month").value,
        exp_year: document.getElementById("card_year").value
      }; 
      Payjp.createToken(card, (status, response) => {
        if (status === 200) { 
          $("card_number").removeAttr("name");
          $("card_cvc").removeAttr("name");
          $("card_month").removeAttr("name");
          $("card_year").removeAttr("name"); 
          $("#card_token").append(
            $('<input type="hidden" name="payjp-token">').val(response.id)
          ); 
          document.inputForm.submit();
          alert("登録が完了しました"); 
        } else {
          alert("カード情報が正しくありません。"); 
        }
      });
    });
  })

