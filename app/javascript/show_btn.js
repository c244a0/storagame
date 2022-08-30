$(document).on('turbolinks:load', function() {
  // ハンバーガーメニューの処理を行うJQuery
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