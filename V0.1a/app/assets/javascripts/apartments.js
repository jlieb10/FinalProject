
$(document).ready(function(){
  $('input.con, input.pro').change(function(){
    var form = $(this.form);

    var data = {
      authenticity_token: form.find("input[name='authenticity_token']").val(),
      detail: {procon: $(this).val()}
    };

    $.ajax({
      type: 'Put',
      url: form.attr('action'),
      data: data,
      dataType: 'json'
    }).success(function(data){
      $('li[data-id="' + data.id + '"]').remove();
      var listItem = "<li data-id='"+ data.id + "'>" + data.content + "</li>"
      if (data.procon === "pro") {
        $("ul.pro").append(listItem);
      }
      else {
        $("ul.con").append(listItem);
      }
    });
  });
});

$(document).ready(function(){
  $('#apartment_status').change(function(){
    $.ajax({
      type: 'Put',
      url: $(this).parent().siblings().children().attr("href"),
      data: {"authenticity_token" : $("meta").last().attr("content"), 
              "apartment" : {"status" : $("#apartment_status option:selected").text()}
            },
      dataType: 'json',
      success: function(data) {
        debugger
      }
    })
  })
})


