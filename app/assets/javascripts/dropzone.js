$(document).on("turbolinks:load", function() {
  var dropzone = $(".dropzone-container__drop-field");
  var dropzone2 = $(".dropzone-container__drop-field2");
  var dzContainer2 = $(".dropzone-container2");
  var upload_area = $(".dropzone-container__upload-area");
  var preview = $("#preview");
  var preview2 = $("#preview2");

  var images = [];
  var upload_images = [];

  $(document).on('change', 'input[type="file"].upload-image', function() {
    var file = $(this).prop('files')[0];
    
    upload_images.push(file)
    var reader = new FileReader();
  

    var img = $(`<div class="preview-image"><div class="preview-image_area"><img class="item-img"></div></div>`);
    var btn_wrapper = $('<div class="btn-wrapper"><a class="btn-wrapper_edit">編集</a><a class="btn-wrapper_delete">削除</a></div>');

    img.append(btn_wrapper);

    reader.onload = function(e) {
      img.find("img").attr({
        src: e.target.result
      });      
    };
    

    reader.readAsDataURL(file);
    images.push(img);

    if (images.length <= 4) {
      $('#preview').empty();
      $.each(images, function(index, image) { 
        image.data('image', index);
        preview.append(image);  
        
      })
      
      dropzone.css({
        'width': `calc(100% - (20% * ${images.length} ))`
      })

    }else if (images.length == 5) {
      $("#preview").empty();
      $.each(images, function(index, image) {
        image.data('image', index);
        preview.append(image);
        
      })
      dzContainer2.css({
        'display': 'block'
      })
      dropzone2.css({
        'width': '100%',
        'display': 'block'
      })
      dropzone.css({
        'display': 'none'
      })
      preview2.empty();

    } else if (images.length >= 6) {

      var pickup_images = images.slice(5);

      $.each(pickup_images, function(index, image) {
        image.data("image", index + 5);
        preview2.append(image);
        dropzone2.css({
          'width': `calc(100% - (20% * ${images.length - 5}))`
        });
      });

      if (images.length == 10) {
        dropzone2.css({
          'display': "none"
        })
      }
    }

    var new_image = $(
      `<input multiple= "multiple" name="item_images[image][]" class="upload-image" data-image=${images.length} type="file" id="upload-image">`
    );
    upload_area.append(new_image);
  });

  $(document).on('click', '.btn-wrapper_delete', function() {
    var delete_image = $(this).parent().parent();
    var delete_image_num = delete_image.data('image');

    delete_image.remove();

    images.splice(delete_image_num, 1);
    upload_images.splice(delete_image_num, 1);

    if(images.length == 0) {
      $('input[type= "file"].upload-image').attr({
        'data-image' : 0
      })
    }

    if(images.length <= 4) {
      $('#preview').empty();
      $.each(images, function(index, image) {
        image.data('image', index);
        preview.append(image);
      })
      dropzone.css({
        'width': `calc(100% - (20% * ${images.length}))`,
        'display': 'block'
      })
      dzContainer2.css ({
        'display': 'none'
      })
      
    } else if(images.length == 5) {
      
      $('#preview').empty();
      $.each(images, function(index, image) {
        image.data('image', index);
        preview.append(image);
      })

      dzContainer2.css ({
        'display': 'block'
      })

      dropzone2.css ({
        'width': '100%'
      })

      dropzone.css ({
        'display': 'none'
      })

      preview2.empty();

    } else {  

      var image_count_6 = images.slice(5);

      $.each(image_count_6, function(index, image) {
        image.data('image', index + 5);
        preview2.append(image);
        dropzone2.css({
          'display': 'block',
          'width': `calc(100% - (20% * ${images.length - 5}))`
        })
      })
    }
  })

  $('#new-product').on('submit', function(e) {
    e.preventDefault();
    var formData = new formData($(this).get(0));

    if (upload_images.length == 0) {
      form.Data.append("new_images[images][]", " ")
      
    } else {
      
      upload_images.forEach(function(file) {
        formData.append("new_images[images][]", file)
      });
    }

    $.ajax({
      url: '/products',
      type: "POST",
      data: formData,
      contentType: false,
      processData: false
    })
  });
});