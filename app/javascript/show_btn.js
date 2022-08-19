
$(document).on('turbolinks:load', function() {
  $("#bars").on('click',function(){
    $(".show-list").css('display', 'block')
    $("#bars-none").css('display', 'block')
    $(this).css('display', 'none')
  });
  $("#bars-none").on('click',function(){
    $(".show-list").css('display', 'none')
    $("#bars").css('display', 'block')
    $(this).css('display', 'none')
  });
});