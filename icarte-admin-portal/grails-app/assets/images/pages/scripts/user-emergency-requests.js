var branchName = '';

$(document).ready(function(){
	loadEmergencyRequests();
	
    $('#btnReloadTableReq').on('click', function(event){ loadEmergencyRequests(); });
    $('#branchId').on('change', function(event){ loadEmergencyRequests(); });
    setInterval('loadEmergencyRequests()', _refreshInterval);
});

function loadEmergencyRequests() {
	var target = $('#emergencyRequestsContainer');
	$.ajax({
		async: true,
		type : "GET",
		processData: true,
		url : _contextPath + "/"+ _controller +"/loadEmergencyRequests",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			target.block({ message: $('#throbber1'), css: {width:'0px', border: '0px'},
                overlayCSS: { backgroundColor: '#FFF', opacity: 0.6, border: '0px' } }); 
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				target.unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					clearContainer($(".tiles"));
					$("#emergencyRequestsContainer").append('<div class="tiles"></div>');
					$.each(data.data, function() {
						appendTableRequestToContainer($(".tiles"), this);
					});
				} else {
					debug("Failed to process: Response State:"+ data.state);
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				debug("Error while loading loadEmergencyRequests");
				target.unblock();
			});
}

var categories = ["bg-green-meadow", "bg-yellow-lemon", "bg-red-sunglo"];

function appendTableRequestToContainer(container, data) {
	var category = categories[0];
	if(data.requestType=="ACCIDENT") {
		category = categories[2];
	} else if(data.requestType=="SITUATION"){
		category = categories[1];
	}
/*	var div = 
		'<div id="'+ data.id +'" class="tile '+ category +'" onclick="mapAlert(this, '+ data.id +')"><div class="tile-body"><i>'
				+ data.requestType + '</i><span class="text-center">Name: ' + data.mobile + '</span></div>'+
			'<div class="tile-object"><div class="name">['+ data.firstName + ' ' + data.lastName + ']</div>' +
			'</div>' +
    	'</div>';
*/	
	var div = 
		'<div id="'+ data.id +'" class="tile double '+ category +'" onclick="mapAlert(this, '+ data.id +')">'+
			'<div class="tile-body"><h3>'+ data.mobile + '</h3>'
				+ '<p>' + data.firstName + ' ' + data.lastName +'</p>' 
				+ '<p>Nationality:' + data.nationality + '</p>' 
				+ '<p>Qatari ID:' + data.qId + '</p>' 
				+ '</div>'
			+ '<div class="tile-object pull-right"><div class="name">['+ data.requestType + ']</div>' +
			'</div>' +
    	'</div>';
	container.append(div);
}

function mapAlert(container, id){
		var $modal = $('#map-modal');
		$('body').modalmanager('loading');
	    var url = _contextPath+'/userProfile/mapAlert/'+id;
	    setTimeout(function(){
	        $modal.load(url, '', function(){
		        $modal.modal({
		      	  keyboard: true
		      	  }
		        );
		      });
	    }, 200);		
}

function clearContainer(container){
    //container.remove();
	$(container).animate({
        'height': 0,
        'opacity': 0
    }, 750, function() {
        container.remove();
    });
}
