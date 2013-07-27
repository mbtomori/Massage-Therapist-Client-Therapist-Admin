$(document).ready(function() {
  

  $('#add').on('click', function() {
    $('#add_one_health_condition').prependTo('.hidden_add_button').show();
  });

  $('.add').on('click', function() {
    $('#add_one_health_condition').clone().prependTo('.hidden_add_button').show();
  });

  

  //Removes the field from the DOM
//   $('#add_one_health_condition').on('click', '.removeVar', function() {
//     $(this).parent().remove();
//   });
// });

