$(document).on('turbolinks:load', function() {
  $(".c-btn").on('click',function(){
    $(".comment-forms").css('display', 'block');
    $(".comment-form").css('display', 'block');
    $(this).css('display', 'none');
  });
});
