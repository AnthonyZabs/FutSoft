jQuery(document).ready(function() {
/*
	jQuery('div[id^="gti_div_"]').each(function(){
	    		jQuery(this).css("display", "none");
		});
*/


	jQuery('a[href="#gti_all"]').click(function(event) {
		event.preventDefault();
		jQuery('div[id^="gti_div_"]').each(function(){
	      	    jQuery(this).fadeIn("slow", "linear");
	      });

	});
	
	jQuery('a[id^="gti_sel_"]').click(function(event) {
		event.preventDefault();
		var thisID = jQuery(this).attr('id').replace('gti_sel_','');
		jQuery('div[id^="gti_div_"]').each(function(){
			if (jQuery(this).attr("id") != 'gti_div_' + thisID) {
	    		jQuery(this).css("display", "none");
			}
		});
		jQuery('div[id="gti_div_'+thisID+'"]').fadeIn("slow", "linear");
	});
});


