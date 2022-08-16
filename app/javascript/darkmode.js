$(document).on('turbolinks:load', function() {
  $("#dark").on('click',function(){
    $(".posts-body").css('background-color', '#1e1e1e');
    $(".posts-body").css('color', 'white');
    $(".youtube-title").find("a").css('color', 'white');
    $(".post-show").find("a").css('color', 'white');
    $(this).css('display', 'none');
    $('#light').css('display', 'block');
  });
  $("#light").on('click',function(){
    $(".posts-body").css('background-color', 'white');
    $(".posts-body").css('color', 'black');
    $(".post-show").find("a").css('color', 'black');
    $(this).css('display', 'none');
    $('#dark').css('display', 'block');
  });
});
