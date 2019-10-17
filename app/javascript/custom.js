$(document).ready(function(){
  let btnText = "- See less fields";
  $("#more-less").click(function(){
    btnBeforeText = $("#more-less").text();
    $(this).text(btnText);
    btnText = btnBeforeText;
    $("#more-info").toggle();
  });

  $(".review").click(function(){
    $(".review").hide();
    $("#new_review").show();
    $("#cancel").show();
  });

  $("#cancel").click(function(){
    $(".review").show();
    $("#new_review").hide();
    $(this).hide();
  });

  $("#rating_form").raty({
    starType: 'i',
    scoreName: "review[rating]"
  });

  $(".review-rating").raty({
    readOnly: true,
    score: function() {
    return $(this).attr("data-score");
    },
    starType: 'i'
  });

  $('input.timepicker').timepicker({
    timeFormat: "h:mm p",
    "minTime": "10:00am",
    "maxTime": "11:30pm"
  });
});