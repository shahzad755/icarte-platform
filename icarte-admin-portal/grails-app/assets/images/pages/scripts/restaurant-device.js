jQuery(document).ready(function() {
	//To handle loading serving table list for valid application mode and in edit only
	if($("#applicationMode").val() != 1) { //if mode is not roaming, then load the serving table's list
		loadServingTableList();
	}
	
	// To load the service table list if the application mode is changed
	$("#applicationMode").change(function() {
		if( $("#applicationMode").val() == 1 || $("#applicationMode").val() =='') {
			$("#servingTable").children().remove();
			$("#servingTable").parent().removeClass("has-error");

		} else {
			loadServingTableList();
		}
	});
	
	// To load the service table list if the branch is changed and valid application mode is already selected
	$("#branch").change(function() {
		if( $("#applicationMode").val() == 1 || $("#applicationMode").val() =='') {
			$("#servingTable").children().remove();
		} else {
			loadServingTableList();
		}
	});

});

function loadServingTableList(){
	var frm = $("#orderItemManagementFrm");
	var portletBody = $('#restaurantDevice-portlet-body');
	var b = $("#branch").val();
	$.ajax({
		async: true,
		type : "GET",
		processData: true,
		data : "branchId="+b,
		url : _contextPath + "/restaurantDevice/loadServingTableList",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			portletBody.block(); 
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				portletBody.unblock();
				var json = $.parseJSON(jqXHR.responseText);
				fillSelectListWithJSONData($("#servingTable"), json, _servingTblRef, "-- Select Serving Table --");
			})
	.fail(
			function(jqXHR, textStatus) {
				portletBody.unblock();
				handleErrorResponse(jqXHR, textStatus, "#restaurantDevice-portlet-body");
			});
}