messages = []

$(function(){
  closeModalHandler();
})

var closeModalHandler = function() {
  $('.all').on('click', function(){
    $('.modal').hide();
  })
}