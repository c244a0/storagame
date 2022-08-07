$(document).on('turbolinks:load', function() {
  $("#dark").on('click',function(){
    $(".posts-index").css('background-color', '#1e1e1e');
    $(".posts-index").css('color', 'white');
    $(this).css('display', 'none');
    $('#light').css('display', 'block');
  });
  $("#light").on('click',function(){
    $(".posts-index").css('background-color', 'white');
    $(".posts-index").css('color', 'black');
    $(this).css('display', 'none');
    $('#dark').css('display', 'block');
  });
});
