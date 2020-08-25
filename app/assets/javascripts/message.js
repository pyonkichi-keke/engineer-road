$(document).on('turbolinks:load', ()=> {
  // プレビュー用のimgタグを生成する関数
  const buildImg = (url)=> {
    const html = `<img src="${url}" width="350px" height="250px" class= "message_img">`;
    return html;
  }

  $('.image_box').on('change', '.file_field', function(e) {
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    $(`img`).remove();
    $('.previews').append(buildImg(blobUrl));
  });
  
  $('.image_box').on('click', '.remove', function() {
    $(`img`).remove();
    $('.image').val('');
  });

  $('.message_main_lists_title_my').on('click', function() {
    $(`.message_main_list_favo`).css('display', 'none');
    $(`.message_main_list`).css('display', 'block');
    $(this).css('background-color', 'black')
    $('.message_main_lists_title_favo').css('background-color', 'rgb(170, 169, 169)')
  });

  $('.message_main_lists_title_favo').on('click', function() {
    $(`.message_main_list_favo`).css('display', 'block');
    $(`.message_main_list`).css('display', 'none');
    $(this).css('background-color', 'black')
    $('.message_main_lists_title_my').css('background-color', 'rgb(170, 169, 169)')
  });

});