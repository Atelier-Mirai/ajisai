//= require semantic-ui

$(function(){
  $('.ui.dropdown').dropdown()
  $('.message .close').on('click', function() {
    $(this).closest('.message')
           .transition('fade');
  });
})
