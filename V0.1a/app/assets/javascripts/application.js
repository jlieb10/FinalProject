// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require vendor.js
//= require ui.js
//= require app.js
//= require_tree .

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
        
      }
    })
  })
})