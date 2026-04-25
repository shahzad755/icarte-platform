jQuery(document).ready(function() {
	$("#menuItemCategories").select2();
});
/*
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
}*/