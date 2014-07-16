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
//= require jquery/dist/jquery
//= require angular/angular
//= require angular-route/angular-route
//= require angular-animate/angular-animate
//= require underscore/underscore-min
//= require angular-bootstrap/ui-bootstrap-tpls
//= require jquery-spinner/dist/jquery.spinner
//= require seiyria-bootstrap-slider/js/bootstrap-slider
//= require jquery-steps/build/jquery.steps
//= require toastr/toastr
//= require bootstrap-file-input/bootstrap.file-input
//= require jquery.slimscroll/jquery.slimscroll
//= require holderjs/holder
//= require raphael/raphael
//= require morris.js/morris
//= require flot/jquery.flot
//= require flot.tooltip/js/jquery.flot.tooltip
//= require gauge.js/dist/gauge
//= require jquery.easy-pie-chart/dist/jquery.easypiechart
//= require angular-wizard/dist/angular-wizard
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
      dataType: 'json',
    });
  });
});
