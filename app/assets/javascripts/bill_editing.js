section_edit = function() {

  // Get the URL and ID
  url = $(this).attr('href') + "_form";
  id = $(this).parents('span').attr('title'); // get the revision id

  // Make sure we are not already editing this one
  if ( $("#revision-"+id+"-edit").size() > 0 )
    return false;

  // Get some important divs
  wrapper = $("div.revision-"+id+"-wrapper");
  orig_div = $("div.revision-"+id);
  edit_div = $("<div>").attr("id", "revision-"+id+"-edit");

  // Get the edit form from the server
  $.getJSON( url, function( t ) {
  	edit_div.append( t.html ); // chuck it in
  	orig_div.hide(); // hide the old text
  	wrapper.append(edit_div); // add the editable one to the wrapper

    // Build a cancel button
  	cancel_button = $('<button>').addClass("cancel")
	.text("Cancel")
	.click(function() {
	  edit_div.remove();
	  orig_div.show();
	  return false;
	});

	// Add it in
	edit_div.find(".actions").append( cancel_button );

    // Capture the click on the update button
	edit_div.find("input[type=submit]").click(function() {
	  	
	  	// Get all the details the server needs to save the data
	  	form = $(this).parents("form");
	  	data = form.serializeArray();
	  	url = form.attr("action") + ".json";
	  	
	  	// Post it off
	  	$.post( url, data, function(t) {
	  		
	  		// Check we got our new section description back
	  		if ( !t.html )
	  		  alert("Something went wrong...");

	  		// Chuck it in place of the other one
	  		wrapper.replaceWith( t.html );
	  		$("span.edit_link a").click( section_edit ); // make sure its edit button works

	  	}, 'json');
	  	return false;
	  });
  });

  return false;
};	

$(function() {

  $("span.edit_link a").click( section_edit );
});