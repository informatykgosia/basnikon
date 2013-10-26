// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require jquery-ui
//= require autocomplete-rails
//= require rails.validations

$(document).ready(function(){
	$(".miniprofil").hover(
		function(){
		$(this).animate({
			height: '+=80px'
		},'slow'
			       );
			       $('.border').animate({
				       height: '+=80px'
			       },'slow'
				  );
				$('.submenu').fadeIn("slow");
	},

	function(){
		$(this).animate({
			height: '-=80px'
		},'slow'
			       );
		$('.border').animate({
			height:'-=80px'
		},'slow'
				   );
				$('.submenu').fadeOut("fast");
	}
	);
});



$(document).ready(function(){
	$(".flip").click(function(){
		$(".authordescription").slideToggle("slow");
	});
});
$(document).ready(function(){
	$(".flipcomments").click(function(){
		$(".comments").slideToggle("slow");
	});
});
$(document).ready(function(){
	$(".flipillustrations").click(function(){
		$(".illustrations").slideToggle("slow");
	});
});
