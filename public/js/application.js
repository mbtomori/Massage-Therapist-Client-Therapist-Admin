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

  $('#add-apts').on('click', function() {
    //$event.preventDefault();
    var startTime = parseInt(formatTimeInput($('#start-time').val()), 10);
    var activityName = $('#activity-name').val();
    var duration = parseInt($('#duration').val(), 10);
    var gap = parseInt($('#gap').val(), 10);
    for (var i = 0; i < $('#amount').val(); i++) {
      if (startTime > 0 && (startTime + duration) < 1440) {
        $('#appointment-slot-list').append('<p class="new-apt">' + activityName + ' starting at ' + formatTimeOutput(startTime) + ' and ending at ' + formatTimeOutput(startTime + duration) + ' <button id="remove-apt">Remove</button></p>');
        startTime = (startTime + (duration + gap));
      }
    }
    $('#start-time').val(formatTimeOutput(startTime));
  });

  $('#clear').on('click', function() {
    $('#appointment-slot-list').empty();
  });

  $('#save').on('click', function() {
    parseDates();
  });

  var aptSlotList = document.getElementById("appointment-slot-list");
  aptSlotList.addEventListener("click", function(e){
    if (e.target && e.target.nodeName == "BUTTON" && e.target.innerText == "Remove")
    {
      $(e.target).parent().remove();
    }
  });
});

function formatTimeInput(inputString)
{
  console.log("formatTimeInput :: INPUT: " + inputString);
  var numbersBeforeColon = inputString.split(":");
  console.log("formatTimeInput :: Numbers Before Colon: " + numbersBeforeColon);
  var hours = parseInt(numbersBeforeColon[0], 10);
  console.log("formatTimeInput :: Hours: " + hours);
  var numbersAfterColon = numbersBeforeColon[1].split(" ");
  console.log("formatTimeInput :: Numbers After Colon: " + numbersAfterColon);
  var minutes = parseInt(numbersAfterColon[0], 10);
  console.log("formatTimeInput :: Minutes: " + minutes);
  var amPm = numbersAfterColon[1];
  console.log("formatTimeInput :: AM / PM?: " + amPm);
  var amPmVal = 0;
  if (amPm === "AM")
  {
    amPmVal = 0;
    console.log("formatTimeInput :: AM / PM Value: " + amPmVal);
  }
  else
  {
    amPmVal = 12;
    console.log("formatTimeInput :: AM / PM Value: " + amPmVal);
  }
  var timeInMinutes = (hours * 60) + (minutes + (amPmVal * 60));
  console.log("formatTimeInput :: OUTPUT: " + timeInMinutes);
  console.log(" ");
  return timeInMinutes;
}

function formatTimeOutput(timeInMinutes)
{
  console.log("formatTimeOutput :: INPUT: " + timeInMinutes);
  var totalHours = parseInt((timeInMinutes / 60), 10);
  console.log("formatTimeOutput :: Total Hours: " + totalHours);
  var minutes = (timeInMinutes % 60);
  console.log("formatTimeOutput :: Minutes: " + minutes);
  if (minutes < 10)
  {
    minutes = ("0" + minutes);
  }
  var amPm = "";
  var hours = 0;
  if (totalHours > 12)
  {
    amPm = "PM";
    console.log("formatTimeOutput :: AM / PM?: " + amPm);
    hours = (totalHours - 12);
    console.log("formatTimeOutput :: Hours: " + hours);
  }
  else
  {
    amPm = "AM";
    console.log("formatTimeOutput :: AM / PM?: " + amPm);
    hours = totalHours;
    console.log("formatTimeOutput :: Hours: " + hours);
  }
  var formattedTime = hours + ":" + minutes + " " + amPm;
  console.log("formatTimeOutput :: OUTPUT: " + formattedTime);
  console.log(" ");
  return formattedTime;
}

function parseDates()
{
  var array_counter = 0;
  $('.new-apt').each(function() {
    var activity_start = 0;
    var activity_end = ($(this).text().search("starting") - 1);
    var activity = $(this).text().substring(activity_start, activity_end);

    var startTime_start = (activity_end + 13);
    var startTime_end = (startTime_start + 8);
    var startTime = $(this).text().substring(startTime_start, startTime_end);

    var endTime_start = (startTime_end + 15);
    var endTime_end = (endTime_start + 8);
    var endTime = $(this).text().substring(endTime_start, endTime_end);

    $('#appointment-slot-list').append('<input type="hidden" name="apt[activity][' + array_counter + ']" value="' + activity + '" />');
    $('#appointment-slot-list').append('<input type="hidden" name="apt[starttime][' + array_counter + ']" value="' + startTime + '" />');
    $('#appointment-slot-list').append('<input type="hidden" name="apt[endtime][' + array_counter + ']" value="' + endTime + '" />');
    array_counter++;
  });
}

