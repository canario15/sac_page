//= require active_admin/base

$(function() {

  $(".close_race").click(function(e) {
    e.preventDefault();
    $.ajax({
      type: "POST",
      data: {race_id: $(".row-id td").text() },
      url: "/close_race",
      success: function (data) {
        alert(data.message)
      }
    });
  });

});