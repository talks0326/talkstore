// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= stub admin/application
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require_tree .


window.addEventListener('load', () => {
   document.getElementById('message').onsubmit = () => {
       App.chat.put_message(document.getElementById('body').value);
       return false;
   }
});

$(document).on("change","input[type=checkbox].tickets",function(){
	if ($(this).prop('checked')) {
		$(this).next("label").addClass("checked");
	}else{
		$(this).next("label").removeClass("checked");
	}
});
/*
$(document).on("click",".soon",function(){
	if ($("#soon_sujest").css('display') == "none"){
		$("#soon_sujest").show();
		$("html,body").animate({scrollTop:$('#soon_sujest').offset().top});
	}else{
		$("#soon_sujest").hide();
	}
});*/