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

  $("#championship_category_id").change(function() {
    var category_id = $(this).val();
    $.ajax({
      type: "GET",
      url: "/categorias/"+ category_id +"/pilotos",
      dataType: "JSON",
      success: function (data) {
        var options = '<option value=""></option>';
        for (var i = 0; i < data.length; i++) {
          options += '<option value="' + data[i].id + '">' + data[i].full_name + '</option>';
        }
        $("select#championship_one_id").html(options);
        $("select#championship_two_id").html(options);
        $("select#championship_three_id").html(options);
      }
    });
  });

});