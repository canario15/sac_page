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
//= require turbolinks
//= require_tree .

$(document).ready(function () {

	$('.carousel').carousel({ interval: 5000 });


	$(".contact-form").validate({
		rules: {
			name: "required",
			tel: "required",
			email: {
				required: true,
				email: true
			},
			message: {
				required: true,
				minlength: 50
			}
		},
		messages: {
			name: "Por favor ingrese su nombre",
			tel: "Por favor ingrese su teléfono",
			email: {
				required: "Por favor ingrese su email",
				minlength: "Por favor ingrese un email válido"
			},
			message: {
				required: "Por favor ingrese mensaje",
				minlength: "Por favor ingrese al menos 50 caracteres"
			}
		}
	});
});