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
  $('#new_comment').on('submit', function(e){
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
      $(`.message_main_list_comment_area[data-index="${data.message_id}"`).append(html);
      $('.message_main_list_comment_form_text').val('');
      $('#comment_send').prop('disabled', false);
      $(`div[data-index="${data.message_id}"`).animate({scrollTop: $(`div[data-index="${data.message_id}"`)[0].scrollHeight });
    })
    .fail(function(){
      alert('コメントを行うにはログインが必要です');
    })
  })
});