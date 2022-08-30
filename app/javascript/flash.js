$(document).on('turbolinks:load', function() {
    // フラッシュの通知を一定時間経過後に消滅させるJQuery
    setTimeout("$('.alert').fadeOut('slow')", 2000);
});