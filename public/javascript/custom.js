messages = []

$(function(){
  closeModal();
})

var closeModal = function() {
  $('.all').on('click', function(){
    $('.modal').hide();
  })
}
// var setBoxHeight = function() {
//   var fullsize = $(window).height();
//   var header = $('.header').height();
//   var footer = $('.footer').height();
//   $('.chatMessages').height(fullsize - header - footer)
// }