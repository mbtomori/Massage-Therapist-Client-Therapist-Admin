$(document).ready(function() {
    var displayCount = 1;
    var $node = '<div class="node"><p><label for="var'+displayCount+'">Health Condition: </label><input type="text" name="var'+displayCount+'" id="var'+displayCount+'"><span class="removeVar">Remove</span></p></div>';
  // }

  //added to the DOM
  $('#add_condition').after($node);
  //Removes the field from the DOM
  $('.node').on('click', '.removeVar', function() {
    $(this).parent().remove();
  });

//adds a new node//
  // $('#addVar').on('click', function() {
  //   varCount++;
  //   $node = '<p><label for="var'+varCount+'">Health Condition: </label><input type="text" name="var'+displayCount+'" id="var'+displayCount+'"><span class="removeVar">Remove</span></p>';
  //   $(this).parent().before($node);
  // });

});
