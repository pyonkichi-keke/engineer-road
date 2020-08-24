$(document).on('turbolinks:load', ()=> {
  $('.top_header_title_new').hover(function(){
    $('.top_flash_new_group').css('display', 'block')
  }, function() {
    $('.top_flash_new_group').css('display', 'none')
  });

  $('.top_flash_new_group').hover(function(){
    $(this).css('display', 'block')
  }, function() {
    $(this).css('display', 'none')
  });

});
