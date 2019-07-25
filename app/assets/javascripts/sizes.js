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
                            <select class="select-default" id="size-form" name="size_id">
                              <option value="---" data-category="---">---</option>
                              ${insertHTML}
                            </select>
                            <i class="fa fa-chevron-down" />
                          </div>
                        </label>
                      </div>`;
    $('#category-form').append(sizeBoxHtml);
  } 
  $(document).on('change', '#grandchild-category', function () {
    var childId = $('#child-category option:selected').data('category');
    console.log(childId);
    if(childId !== "---") {
      $.ajax({
        url: 'get_sizes',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(sizes) {
        $('#size-form').remove();

        var insertHTML = "";
        sizes.forEach(function (size) {
          insertHTML += sizeOption(size)
        });
        appendSize(insertHTML);
      })
    } else {
      $('#size-form').remove();
    }
  })
});