$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = ()=> {
    const html = `
                    <div class="user_file_field">
                        画像選択
                        <input type="file", class= "user_image"
                        name="image">
                      </label>
                      <div class= "user_remove">
                        <span>削除</span>
                      </div>
                    </div>
                `;
      return html;
  }

  // プレビュー用のimgタグを生成する関数
  const buildImg = (url)=> {
    const html = `<img src="${url}"  class= "user_img">`;
    return html;
  }

  $('.user_image_box').on('change', '.user_file_field', function(e) {
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    $('.user_previews').empty();
    $('.user_previews').append(buildImg(blobUrl));
  });
  
  $('.user_image_box').on('click', '.user_remove', function() {
    $(`img`).remove();
    $('.user_file_field').remove();
    $(this).remove();
    $('.user_image_box').append(buildFileField());
  });

});

