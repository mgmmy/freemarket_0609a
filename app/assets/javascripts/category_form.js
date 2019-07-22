$(function () {
  function appendOption(category) {
    
    var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChildCategory(insertHTML) {
    var childBoxHtml = "";
    childBoxHtml =  `<div class="select-wrap" id="child">
                      <select class="select-default" id="child-category" name="category_id">
                        <option value="---" data-category="---">---</option>
                        ${insertHTML}
                      </select>
                      <i class="fa fa-chevron-down" />
                    </div>`;
    $('#category-form').append(childBoxHtml);
  } 
  function appendGrandchildCategory(insertHTML) {
    var grandchildBoxHtml = "";
    grandchildBoxHtml =  `<div class="select-wrap" id="grandchild">
                            <select class="select-default" id="grandchild-category" name="category_id">
                              <option value="---" data-category="---">---</option>
                              ${insertHTML}
                            </select>
                            <i class="fa fa-chevron-down" />
                          </div>`;
    $('#category-form').append(grandchildBoxHtml);
  } 

  $('#parent-category').on('change', function () {
    var parentName = document.getElementById('parent-category').value;
    if(parentName != "") {
      $.ajax({
        url: 'get_child_category',
        type: 'GET',
        data: { parent_name: parentName },
        dataType: 'json'
      })
      .done(function(children) {
        $('#child').remove();

        var insertHTML = "";
        children.forEach(function (child) {
          insertHTML += appendOption(child)
        });
        appendChildCategory(insertHTML);   
      })
    } else {
      $('#child').remove();
    }
  })

  $(document).on('change', '#child-category', function () {
    var childId = $('#child-category option:selected').data('category');
    if(childId != "---") {
      $.ajax({
        url: 'get_grandchild_category',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren) {
        $('#grandchild').remove();

        var insertHTML = "";
        grandchildren.forEach(function (grandchild) {
          insertHTML += appendOption(grandchild)
        });
        appendGrandchildCategory(insertHTML);
      })
    } else {
      $('#grandchild').remove();
    }
  })
});
  