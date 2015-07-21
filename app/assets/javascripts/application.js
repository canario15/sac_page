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

	$('.fb-share-btn').on( 'click', function(e) {
		e.preventDefault();
		FB.ui( {
      method: 'feed',
      name: "Facebook API: Tracking Shares using the JavaScript SDK",
      link: "https://www.webniraj.com/2013/05/11/facebook-api-tracking-shares-using-the-javascript-sdk/",
      picture: "https://stackexchange.com/users/flair/557969.png",
      caption: "Tracking Facebook Shares on your website or application is a useful way of seeing how popular your articles are with your readers. In order to tracking Shares, you must used the Facebook JavaScript SDK."
    },
    function( response ) {
      if ( response !== null && typeof response.post_id !== 'undefined' ) {
        console.log( response );
        // ajax call to save response
        $.post( 'http://www.webniraj.com/', { 'meta': response }, function( result ) {
          console.log( result );
        }, 'json' );
      }
    });
  });


});


