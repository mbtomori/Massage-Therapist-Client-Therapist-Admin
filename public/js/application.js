$(document).ready(function() {

  $('.add').on('click', function() {
    var condition = $('#add_one_health_condition').clone()
    condition.appendTo('.hidden_add_button').show();
    $('#add_one_health_condition .remove').on('click', function() {
      console.log("clicked delete button");
      $(this).closest('#add_one_health_condition').remove();
      });
  });

});


