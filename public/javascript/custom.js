messages = []

$(function(){
  closeModalHandler();
})

var closeModalHandler = function() {
  $('.all').on('click', function(){
    $('.modal').hide();
  })
}

var about = "Anonymish is a messageboard that will allow you to leave messages for other people in your immediate area. By default, you can see messages posted within 20 miles. You must be registered to post, but your registration data will not be shown to other users."
var error = "Incorrect username or password, please try again"