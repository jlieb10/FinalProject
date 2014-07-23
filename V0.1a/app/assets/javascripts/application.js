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

  $('.addnewapt').click(function(){
    var form = $('.apt-form')
    $('tbody.apartments').append(form)
  });

  $('select.status').change(function(){
      $.ajax({
        type: 'Put',
        url: "/apartments/" + $(this).attr('id'),
        data: {"authenticity_token" : $("meta").last().attr("content"),
        "apartment" : {"status" : $("option:selected", this).text()}
      },
      dataType: 'json',
      success: function(data) {
        $("#" + data.id + ".status_success").fadeIn(500);
        $("#" + data.id + ".status_success").html("Status updated!");
        $("#" + data.id + ".status_success").fadeOut(2000);
      }
    });
     });

//add apt form opens when the side nav link is clicked
    $("a span.newapt").click(function(){
      console.log("Clicked");
      $("div .newaptcollapse").addClass("in").animate({height: "auto"},1500);
    });

//add hunt form opens when the side nav link is clicked
     $("a span.newhunt").click(function(){
      console.log("Clicked");
      $("div .newhuntcollapse").addClass("in").animate({height: "auto"},1500);
    });

    // $('.bxslider').bxSlider({
    // buildPager: function(slideIndex){

    //   switch(slideIndex){
    //     case 0:
    //       return '<img src="/images/thumbs/tree_root.jpg">';
    //     case 1:
    //       return '<img src="/images/thumbs/houses.jpg">';
    //     case 2:
    //       return '<img src="/images/thumbs/hill_fence.jpg">';
    //   }
    // }

    $('.bxslider').bxSlider({
      minSlides: 2,
      maxSlides: 4,
      slideWidth: 170,
      slideMargin: 10
    });
  });
});

