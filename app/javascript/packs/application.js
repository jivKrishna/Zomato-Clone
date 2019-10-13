// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery.raty")
require("jquery-timepicker/jquery.timepicker")
require("bootstrap-datepicker/dist/js/bootstrap-datepicker.min")
require("lightbox2/dist/js/lightbox.min.js")
require("autocomplete_location")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("bootstrap/dist/js/bootstrap")
require("jquery/dist/jquery")

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
    path: "/assets/",
    scoreName: "review[rating]"
  });

  $(".review-rating").raty({
    readOnly: true,
    score: function() {
    return $(this).attr("data-score");
    },
    path: "/assets/"
  });

  $('input.timepicker').timepicker({
    timeFormat: "h:mm p",
    "minTime": "10:00am",
    "maxTime": "11:30pm"
  });

  // $("#changePassword").click(function(){
  //   $("#changeConatiner").show();
  //   $("#password").show();
 
  // });

  // $("#changeImage").click(function(){
  //   $("#changeConatiner").show();
  //   $("#password").hide();
  //   $("#name").hide();
  //   $("#phone").hide();
  //   $("#image").show();
  // });

  // $("#changeName").click(function(){
  //   $("#changeConatiner").show();
  //   $("#password").hide();
  //   $("#name").show();
  //   $("#phone").hide();
  //   $("#image").hide();
  // });

  // $("#changePhone").click(function(){
  //   $("#changeConatiner").show();
  //   $("#password").hide();
  //   $("#name").hide();
  //   $("#phone").show();
  //   $("#image").hide();
  // });

});