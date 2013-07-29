$(document).ready(function() {

  $('#datePicker').val(new Date().toJSON().slice(0,10));

  $(document).on('click', '.add', function() {
    var condition = $('#add_one_health_condition').clone()
    condition.appendTo('.hidden_add_button').show();
    $('#add_one_health_condition .remove').on('click', function() {
      console.log("clicked delete button");
      $(this).closest('#add_one_health_condition').remove();
      });
  });

  $(document).on('click', '#changeDate', function(event){
    event.preventDefault();
    var date = $('#datePicker').val();
    $.ajax({
      type: "post",
      url: '/appointments/change',
      data: {date: date}
    }).done(function(response) {
      console.log(response);
      $('#allAppointments').html(response.replace(/"/g,""));
    });
  });
});


