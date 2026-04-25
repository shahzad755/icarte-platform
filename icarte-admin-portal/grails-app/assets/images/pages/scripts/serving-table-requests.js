var branchName = '';

$(document).ready(function(){
    loadTableRequests();
	
    $('#btnReloadTableReq').on('click', function(event){ loadTableRequests(); });
    $('#branchId').on('change', function(event){ loadTableRequests(); });
    setInterval('loadTableRequests()', _refreshInterval);
});

function loadTableRequests() {
	var target = $('#tableRequestsContainer');
	$.ajax({
		async: true,
		type : "GET",
		processData: true,
		url : _contextPath + "/"+ _controller +"/loadServingTableRequests?branchId="+$("#branchId").val(),
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
					$("#tableRequestsContainer").append('<div class="tiles"></div>');
					$.each(data.data, function() {
						appendTableRequestToContainer($(".tiles"), this);
					});
				} else {
					debug("Failed to process: Response State:"+ data.state);
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				debug("Error while loading loadTableRequests");
				target.unblock();
			});
}

var categories = ["bg-green-meadow", "bg-yellow-lemon", "bg-red-sunglo"];

function appendTableRequestToContainer(container, data) {
	var category = categories[0];
	if(data.requestCount>1 && data.requestCount<=5) {
		category = categories[1];
	} else if(data.requestCount>5){
		category = categories[2];
	}
	var div = 
		'<div id="'+ data.id +'" class="tile '+ category +'" onclick="dismissAlert(this, '+ data.id +')"><div class="tile-body"><i>'
				+ data.tableRef + '</i><span class="text-center">No. of Calls: ' + data.requestCount + '</span></div>'+
			'<div class="tile-object"><div class="name">['+ data.firstName + ' ' + data.lastName + ']</div>' +
			'</div>' +
    	'</div>';
	container.append(div);
}

function dismissAlert(container, id){
	$.ajax({
		async: true,
		type : "POST",
		processData: true,
		data : "id="+id,
		url : _contextPath + "/"+ _controller +"/dismissServingTableRequest/",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			$(container).block({ message: $('#throbber1'), css: {width:'0px', border: '0px'},
                overlayCSS: { backgroundColor: '#FFF', opacity: 0.6, border: '0px' } }); 
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				$(container).unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (data.state == 'OK') {
					clearContainer(container);
				} else {
					alert("An error has occured, please report this incident to system administrator...");
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				$(container).unblock();
				alert("An error has occured, please report this incident to system administrator...");
			});
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
