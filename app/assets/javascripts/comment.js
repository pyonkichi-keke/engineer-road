$(document).on('turbolinks:load', ()=> {
  function buildHTML(comment){
    let html = `
                <div class = "message_main_list_comment_area_content">
                  <div class = "message_main_list_comment_area_content_img">
                    <img src = "${comment.user.image.url}" class = "message_main_list_comment_area_content_img" onerror="this.style.display='none'"/>
                  </div>
                  <div class = "message_main_list_comment_area_content_name">
                    ${comment.user.name}
                  </div>
                  <div class = "message_main_list_comment_area_content_comment">
                    ${comment.comment}
                  </div>
                </div>
                `
    return html;
  }
  $('.message_main_list_comment_form').on('submit', '#new_comment', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
  })
    .done(function(data){
      let html = buildHTML(data); 
      $(`.message_main_list_comment_area`).append(html);
      $('.message_main_list_comment_form_text').val('');
      $('#comment_send').prop('disabled', false);
      $(`.message_main_list_comment_area`).animate({scrollTop: $(`.message_main_list_comment_area`)[0].scrollHeight });
    })
    .fail(function(){
      alert('コメントを行うにはログインが必要です');
    })
  })

});