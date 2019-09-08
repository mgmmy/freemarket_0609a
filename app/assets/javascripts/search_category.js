$(function () {
  function appendOption(category) {
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChildCategory(insertHTML) {
    var childBoxHtml = "";
    childBoxHtml =  `<div class="select-wrap" id="child">
                      <select class="select-default" id="child-category">
                        <option value="---" data-category="---">---</option>
                        ${insertHTML}
                      </select>
                      <i class="fa fa-chevron-down" />
                    </div>`;
    $('#search_category').append(childBoxHtml);
  };

  function appendGrandchildBox(grandchild) {
    var html = `<input type="checkbox" class="grandchild" id="${grandchild.id}" name="q[category_id_eq]", value= ${grandchild.id} >
                <label class="check_style" id="select-grandchild" for="${grandchild.id}">${grandchild.name}</label> 
                `;
    return html;
  };

  function appendGrandchildCategory(insertHTML) {
    var grandchildBoxHtml = "";
    grandchildBoxHtml = `<div id="grandchild-box">
                          ${insertHTML}
                        </div>`;
    $('#search_category').append(grandchildBoxHtml);
  }; 

  $('#search-parent').on('change', function () {
    var parentName = document.getElementById('search-parent').value;
    if(parentName != "すべて") {
      $.ajax({
        url: 'search_category',
        type: 'GET',
        data: { parent_name: parentName },
        dataType: 'json'
      })
      .done(function(children) {
        $('#child').remove();
        $('#grandchild-box').remove();
        var insertHTML = "";
        children.forEach(function (child) {
          insertHTML += appendOption(child)
        });
        appendChildCategory(insertHTML);   
      })
    } else {
      $('#child').remove();
      $('#grandchild-box').remove();
    }
  })

  $(document).on('change', '#child-category', function () {
    var childId = $('#child-category option:selected').data('category');
    if(childId != 0) {
      $.ajax({
        url: 'search_grandchild_category',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren) {
        $('#grandchild-box').remove();
        var insertHTML = "";
        grandchildren.forEach(function (grandchild) {
          insertHTML += appendGrandchildBox(grandchild);
        })
        appendGrandchildCategory(insertHTML);
      });
    } else {
      $('#grandchild-box').remove();
    }
  })
});
  