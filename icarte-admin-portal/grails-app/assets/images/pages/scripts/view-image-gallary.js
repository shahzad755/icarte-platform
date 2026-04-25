/**
 * 
 */
jQuery(document).ready(function() {
	document.getElementById('links').onclick = function (event) {
	    event = event || window.event;
	    var target = event.target || event.srcElement,
	        link = target.src ? target.parentNode : target,
	        options = {index: link, event: event},
	        links = this.getElementsByTagName('a');
	    blueimp.Gallery(links, options);
	};
});


/*
// Load & display existing files:
$.ajax({
	url:_contextPath+'/'+_controller+'/loadImages'+"?id="+$("#id").val(),
    dataType: 'json',
}).done(function (data, textStatus, jqXHR) {
	var json = $.parseJSON(jqXHR.responseText);
	var image = new Image();
    image.src = json.files[0].thumbnailUrl;
    image.onload = function () {
    	newlink = $('<a/>');
    	newlink.attr("href", json.files[0].url);
    	newlink.attr("title", json.files[0].originalName);
    	newlink.text(json.files[0].originalName +"  ");
        newlink.append(image);
        $('#links').empty().append(newlink);
    };
    
    
    image.onerror = function () {
        $('#links').empty().html('Error while loading image');
    }
  */  


