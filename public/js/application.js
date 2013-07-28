$(document).ready(function() {

  $('.add').on('click', function() {
    var condition = $('#add_one_health_condition').clone();
    condition.appendTo('.hidden_add_button').show();
    $('#add_one_health_condition .remove').on('click', function() {
      console.log("clicked delete button");
      $(this).closest('#add_one_health_condition').remove();
      });
  });

  $('#add-apts').on('click', function() {
    //$event.preventDefault();
    var startTime = parseInt($('#start-time').val(), 10);
    var activityName = $('#activity-name').val();
    var duration = parseInt($('#duration').val(), 10);
    var gap = parseInt($('#gap').val(), 10);
    for (var i = 0; i < $('#amount').val(); i++) {
      $('#appointment-slot-list').append('<p>' + activityName + ' starting at ' + startTime + ' and ending at ' + (startTime + duration) + ' <button id="remove-apt">Remove?</button><p>');
      startTime = (startTime + (duration + gap));
    }
  });

  $('#clear').on('click', function() {
    $('#appointment-slot-list').empty();
  });

  var aptSlotList = document.getElementById("appointment-slot-list");
  aptSlotList.addEventListener("click", function(e){
    if (e.target && e.target.nodeName == "BUTTON" && e.target.innerText == "Remove?")
    {
      $(e.target).parent().remove();
    }
  });
});
