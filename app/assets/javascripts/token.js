document.addEventListener(
  "DOMContentLoaded", e => {
    if (document.getElementById("token_submit") != null) { //token_submitというidがnullの場合、下記コードを実行しない
      Payjp.setPublicKey("pk_test_96c564d4594eefb82a8e0bfa"); //ここに公開鍵を直書き
      let btn = document.getElementById("token_submit"); //IDがtoken_submitの場合に取得されます
      btn.addEventListener("click", e => { //ボタンが押されたときに作動します
        e.preventDefault(); //ボタンを一旦無効化します
        let card = {
          number: document.getElementById("card_number").value,
          cvc: document.getElementById("card_cvc").value,
          exp_month: document.getElementById("card_month").value,
          exp_year: document.getElementById("card_year").value
        }; //入力されたデータを取得します。
        Payjp.createToken(card, (status, response) => {
          if (status === 200) { //成功した場合
            $("card_number").removeAttr("name");
            $("card_cvc").removeAttr("name");
            $("card_month").removeAttr("name");
            $("card_year").removeAttr("name"); //データを自サーバにpostしないように削除
            $("#card_token").append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            ); //取得したトークンを送信できる状態にします
            document.inputForm.submit();
            alert("登録が完了しました"); //確認用
          } else {
            alert("カード情報が正しくありません。"); //確認用
          }
        });
      });
    }
  },
  false
);

// $(function(){
//   $(document).on('click','(登録ボタンのIDやクラス名)', function(e) {
//     e.preventDefault();
//     Payjp.setPublicKey('（Pay.jpを登録した時に取得できる公開鍵）');
//     var card = {
//       number: parseInt($("（カード番号入力欄のIDやクラス名）").val()),
//       cvc: parseInt($("（セキュリティーコード入力欄のIDやクラス名）").val()),
//       exp_month: parseInt($("（有効月入力欄のIDやクラス名）").val()),
//       exp_year: parseInt($("（有効年入力欄のIDやクラス名）").val())
//     };
//     Payjp.createToken(card, function(status, response) {
//       if (status == 200) {
//         //トークン作成成功時の処理
//       }
//       else {
//         //トークン作成失敗時の処理
//       }
//     });
//   })
// })