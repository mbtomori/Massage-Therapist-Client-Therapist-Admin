$(document).ready(function() {

  $('.add').on('click', function() {
    $('#add_one_health_condition').clone().prependTo('.hidden_add_button').show();
    $('#add_one_health_condition .remove').on('click', function() {
      console.log("clicked delete button");
      $(this).parent().remove();
      });
  });
});
