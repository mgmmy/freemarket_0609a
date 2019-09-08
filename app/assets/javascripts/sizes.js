$(function () {
  function sizeOption(size) {
    
    var html = `<option value="${size.id}">${size.size}</option>`;
    return html;
  }
  function appendSize(insertHTML) {
    var sizeBoxHtml = "";
    sizeBoxHtml =  `<div class="form-group" id="size-form">
                      <label for="size_id">サイズ
                        <span class="form-require">必須</span>
                      </label>
                      <div class="select-wrap" id="size">
                        <select class="select-default" id="size_id" name="product[size_id]">
                          <option value="---" data-category="---">---</option>
                          ${insertHTML}
                        </select>
                        <i class="fa fa-chevron-down" />
                      </div>   
                    </div>`;
    $('#category-form').append(sizeBoxHtml);
  } 

  function appendBrandForm() {
    var brandBoxHtml = "";
    brandBoxHtml = `<div class="form-group" id="brand-form">        
                      <label for="ブランド">ブランド
                        <span class="form-optional">任意</span>
                      </label>
                      <input class="input-default" value="" placeholder="例) シャネルなど" name="product[brand_id]" />
                    </div>`;
    $('#category-form').append(brandBoxHtml);
  }       

  $(document).on('change', '#grandchild-category', function () {
    var childId = $('#child-category option:selected').data('category');
    if(childId !== "---") {
      $.ajax({
        url: 'get_sizes',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(sizes) {
        $('#size-form').remove();
        $('#brand-form').remove();

        if (sizes.length != 0) {
           var insertHTML = "";
        sizes.forEach(function (size) {
          insertHTML += sizeOption(size)
        });
        appendSize(insertHTML); 
        }
      appendBrandForm();
      })   
    } else {
      $('#size-form').remove();
      $('#brand-form').remove();
    }
  })
});

$(function (){
  function sizeBox(size){
    var html = `<input type="checkbox" class="size_box" id="${size.id}" name="q[size_id_eq]", value= ${size.id} >
                <label class="check_style" id="size_checkbox" for="${size.id}">${size.size}</label> 
              `;
    return html;
  }
  function appendSizeBox(insertHTML) {
    var sizeBoxHtml = "";
    sizeBoxHtml =  `<div id="check_size">
                      ${insertHTML}
                    </div>
                    `;
    $('#search_sizes').append(sizeBoxHtml);
  };

  $('#size-select').on('change', function(){  
    var sizeId = document.getElementById('size-select').value;
    if(sizeId != "") {
      $.ajax({
        url: 'search_size_id',
        type: 'GET',
        data: { size_id: sizeId },
        dataType: 'json'
      })
      .done(function(sizes) {
        $('#check_size').remove();
        var insertHTML = "";
        sizes.forEach(function (size) {
          insertHTML += sizeBox(size);
        });  
        appendSizeBox(insertHTML);
      });
    } else {
      $('#check_size').remove();
    }
  });
});
