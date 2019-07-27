$(function () {
  function appendDeliveryOption(package) {

    var html = `<option value="${package.package}" data-method=${package.id}">${package.package}</option>`
    return html;
  }

  function appendDeliveryMethod(insertHTML) {
    var methodBoxHtml = "";
    methodBoxHtml = `<div class="form-group" id="delivery-method-form">
                      <label for="delivery_method_id">配送の方法
                        <span class="form-require">必須</span>
                      </label>
                      <div class="select-wrap" id="delivery-method">
                        <select class="select-default" id="delivery_method_id" name="delivery_method_id">
                          <option value="---" data-category="---">---</option>
                          ${insertHTML}
                        </select>
                        <i class="fa fa-chevron-down" />
                      </div>   
                    </div>`;
    $('#shipping-form').append(methodBoxHtml);                
  }

  $(document).on('change', '#charge-form', function () {
    var chargeId = document.getElementById('charge-form').value;
    
    if(chargeId != "") {
      $.ajax({
        url: 'get_delivery_method',
        type: 'GET',
        data: { charge_id: chargeId },
        dataType: 'json'
      })
      .done(function(packages) {
        console.log(packages);
        $('#delivery-method-form').remove();
        
        var insertHTML = "";
        packages.forEach(function (package) {
          insertHTML += appendDeliveryOption(package)
  
        });
        appendDeliveryMethod(insertHTML);
      })
    } else {
      $('#delivery-method-form').remove();
    }
  })
})
