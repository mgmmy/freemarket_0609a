$(function () {
  function sizeOption(size) {
    
    var html = `<option value="${size.size}">${size.size}</option>`;
    return html;
  }
  function appendSize(insertHTML) {
    var sizeBoxHtml = "";
    sizeBoxHtml =  `<div class="form-group" id="size-form">
                      <label for="サイズ">サイズ
                        <span class="form-require">必須</span>
                          <div class="select-wrap" id="size">
                            <select class="select-default" id="size_id" name="size_id">
                              <option value="---" data-category="---">---</option>
                              ${insertHTML}
                            </select>
                            <i class="fa fa-chevron-down" />
                          </div>
                        </label>
                      </div>`;
    $('#category-form').append(sizeBoxHtml);
  } 

  function appendBrandForm() {
    var brandBoxHtml = "";
    brandBoxHtml = `<div class="form-group" id="brand-form">        
                      <label for="ブランド">ブランド
                        <span class="form-optional">任意</span>
                      </label>
                      <input class="input-default" value="" placeholder="例) シャネルなど" />
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

        var insertHTML = "";
        sizes.forEach(function (size) {
          insertHTML += sizeOption(size)
        });
        appendSize(insertHTML); 
        appendBrandForm();
      })
    } else {
      $('#size-form').remove();
      $('#brand-form').remove();
    }
  })
});