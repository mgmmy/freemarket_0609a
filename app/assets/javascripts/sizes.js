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
