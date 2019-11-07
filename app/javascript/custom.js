$(document).on('turbolinks:load', function(){
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
    numberMax : 5,
    number: 5,
    // path: "/assets/",
    starType: "i",
    scoreName: "review[rating]"
  });

  $(".review-rating").raty({
    numberMax : 5,
    number: 5,
    readOnly: true,
    score: function() {
    return $(this).attr("data-score");
    },
    // path: "/assets/"
    starType: "i"
  });

  $('input.timepicker').timepicker({
    timeFormat: "h:mm p",
    "minTime": "10:00am",
    "maxTime": "11:30pm"
  });

  if(navigator.geolocation){
    navigator.geolocation.getCurrentPosition(function(position){
      $("#location").val([ position.coords.latitude, position.coords.longitude ]);
    });
  }
});