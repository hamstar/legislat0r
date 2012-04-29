$(function() {
	
	$(".load_activities").click( function() {
		$("#activities").html('');
		url = "/sections/"+$(this).attr("title")+"/activities";
		$.getJSON( url, function(t) {
			$("#activities").html( t.html );
		});

		return false;
	});

});