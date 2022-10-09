/* ダークモード */
$(document).on('turbolinks:load', function() {
  var date = new Date(),
       hour = date.getHours();

    if (hour >= 16 || hour <= 6) {
       $('body').addClass('Dark-Mode');
   } else {
       $('body').removeClass('Dark-Mode');
   }

   $('#DarkModeSwitcher > button').click(function () {
       $('body').toggleClass('Dark-Mode');
   });
   
  $("#dark").on('click',function(){
    $(".posts-body").css('background-color', '#1e1e1e');
    $(".post-show-content-area").css('background-color', '#1e1e1e');
    $(".posts-body").css('color', 'white');
    $(".youtube-title").find("a").css('color', 'white');
    $(".youtube-container").css('background-color', '#1e1e1e');
    $(".post-show").find("a").css('color', 'white');
    $(this).css('display', 'none');
    $('#light').css('display', 'block');
  });
  $("#light").on('click',function(){
    $(".posts-body").css('background-color', 'white');
    $(".post-show-content-area").css('background-color', 'white');
    $(".posts-body").css('color', 'black');
    $(".youtube-title").find("a").css('color', 'black');
    $(".post-show").find("a").css('color', 'black');
    $(".youtube-container").css('background-color', 'white');
    $(this).css('display', 'none');
    $('#dark').css('display', 'block');
  });
});
