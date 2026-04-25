'use strict';
var ordersDataTable;
var ordersDetailsDataTable;
var ordersAddonDetailsDataTable;

$(document).ready(function() {
	$("#btnSearchOrders").on("click", function(){
		initOrdersDataTable();
	});
    $('.btn_header_create').hide();
	if (jQuery().datepicker) {
        $('.date').datepicker({
        	isRTL: App.isRTL(),
            rtl: App.isRTL(),
            orientation: "left",
            autoclose: true,
            format: "yyyy-mm-dd",
            todayBtn: true,
            pickerPosition: (App.isRTL() ? "bottom-right" : "bottom-left")	                
        });
    }
   
});

function initOrdersDataTable() {
    if (typeof ordersDataTable == 'undefined') {
    	ordersDataTable = $("#orderList").DataTable( {
            "processing": true,
            "serverSide": true,
            "ajax":{
            	"url": _contextPath+"/orders/list",
                type: "post",  // method  , by default get
                "data": function ( d ) {
                    return $.extend( {}, d, {
                    	"referenceNum": $("#referenceNum").val(),
                    	"tableRefNumber": $("#tableRefNumber").val(),
                    	"branchId": $("#branchId").val(),
                    	"orderDateFrom": $("#orderDateFrom").val(),
                    	"orderDateTo": $("#orderDateTo").val(),
                    	"statusTypeId": $("#statusTypeId").val(),
                    	"mobile": $("#mobile").val(),
                    	"staffCode": $("#staffCode").val(),
                        "isActive": $("#isActive").val()
                      } );
                },
                
                error: function(){  // error handling
                    alert('Error loading data from server');
                }
            },
            
            "language": {
                "aria": {
                    "sortAscending": ": activate to sort column ascending",
                    "sortDescending": ": activate to sort column descending"
                },
                "emptyTable": "No data available in table",
                "info": "Showing _START_ to _END_ of _TOTAL_ entries",
                "infoEmpty": "No entries found",
                "infoFiltered": "(filtered1 from _MAX_ total entries)",
                "lengthMenu": "_MENU_ entries",
                "search": "Search (Title):",
                "zeroRecords": "No matching records found"
            },
            buttons: [
                      { extend: 'pdf', className: 'btn green btn-outline' },
                      { extend: 'excel', className: 'btn yellow btn-outline ' },
                      { extend: 'colvis', className: 'btn dark btn-outline', text: 'Columns'}
            ],
            "responsive": true,
            "searching": false,
            "order": [[ 6, "desc" ]],
            "columnDefs": [
                { "targets": [0], "width": "10%", "searchable": false},
                { "targets": [1], "width": "5%", "searchable": false, "sortable": false},
                { "targets": [2], "width": "15%", "searchable": false},
                { "targets": [3], "width": "5%", "searchable": false, "sortable": false},
                { "targets": [4], "width": "2%", "searchable": false, "sortable": false},
                { "targets": [5], "searchable": false, "sortable": false},
                { "targets": [6], "width": "10%", "searchable": false, "sortable": true},
                { "targets": [7], "width": "5%", "searchable": false, "sortable": false},
                { "targets": [8], "width": "3%", "searchable": false, "sortable": true,
                	"render" : function (data, type, row) {
                		
                		var result = data.id;
                		switch(data.id){
	                		case '1': //New
	                			result = '<button onclick="showChangeStatusModal(\''+ row.referenceNum +'\','+ row.id +','+ data.id +');" type="button" class="status btn red yellow-casablanca btn-sm">'+ data.name +'</button>';
	                			break;
	                		case '2': //Approved
	                			result = '<button onclick="showChangeStatusModal(\''+ row.referenceNum +'\','+ row.id +','+ data.id +');" type="button" class="status btn green-jungle btn-sm">'+ data.name +'</button>';
	                			break;
	                		case '3': //In-Progress
	                			result = '<button onclick="showChangeStatusModal(\''+ row.referenceNum +'\','+ row.id +','+ data.id +');" type="button" class="status btn yellow-lemon btn-sm">'+ data.name +'</button>';
	                			break;
	                		case '4': //Cancelled
	                			result = '<button onclick="showChangeStatusModal(\''+ row.referenceNum +'\','+ row.id +','+ data.id +');" type="button" class="status btn yellow-casablanca btn-sm">'+ data.name +'</button>';
	                			break;
	                		case '6': //Void
	                			result = '<button onclick="showChangeStatusModal(\''+ row.referenceNum +'\','+ row.id +','+ data.id +');" type="button" class="status btn red-mint btn-sm">'+ data.name +'</button>';
	                			break;
	                		case '7': //Paid
	                			result = '<button onclick="showChangeStatusModal(\''+ row.referenceNum +'\','+ row.id +','+ data.id +');" type="button" class="status btn grey-cascade btn-sm">'+ data.name +'</button>';
	                			break;
	                		default: //Any other status
	                			result = '<button onclick="showChangeStatusModal(\''+ row.referenceNum +'\','+ row.id +','+ data.id +');" type="button" class="status btn blue-sharp btn-sm">'+ data.name +'</button>';
	                			break;
	                	}
                		return result;
                	}
                },
                { "targets": [9], "width": "5%", "searchable": false, "sortable": false},
            	{ "targets": [-1], "width": "5%", "sortable": false, "searchable": false, "className"  : "centered-cell",
	        		"render"  : function (data, type, row) {
        				return '<a class="btn btn-circle btn-icon-only blue" data-url="'
        				+ _contextPath+'/orders/details?orderId='+ data + '&orderRefNum='+ row.referenceNum +'" data-toggle="modal" onclick="javascript: viewOrderDetails(this);" title="Order Details"><i class="icon-list"></i></a>';
        			}
	            }
            ],
            "columns": [
                          { "data": "referenceNum" },
                          { "data": "totalPrice" },
                          { "data": "branch"},
                          { "data": "mobile"},
                          { "data": "tableRefNumber"},
                          { "data": "specialRemarks" },
                          { "data": "orderDate" },
                          { "data": "staffCode" },
                          { "data": "statusType" },
                          { "data": "isActive" },
                          { "data": "id" }
                          ],
           "dom": "<'row' <'col-md-12'B>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", // horizobtal scrollable datatable
                          
        } );
    } else {
    	ordersDataTable.draw();
    }

}

function showChangeStatusModal(orderRef, orderId, statusId){
     // create the backdrop and wait for next modal to be triggered
     $('body').modalmanager('loading');
     var el = $(this);
     var $modal = $('#order-status-modal');
         $modal.modal({
       	  backdrop: 'static',
       	  keyboard: true
       	  }
         );
     $modal.on('shown.bs.modal', function (e) {
    	 resetMessageAndErrors();
    	 //alert("statusId");
    	 $('#orderRef').html(orderRef);
    	 $('#orderId').val(orderId);
    	 $('#modalStatus').val(statusId);
    	 $('#statusChangeReason').val('');
     });
}

function updateOrderStatus() {
	$.ajax({
		async: true,
		type : "POST",
		processData: true,
		data : $("#orderStatusChangeFrm").serialize(),
		url : _contextPath + "/orders/updateStatus/",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			$('#order-status-modal').block(); 
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				$('#order-status-modal').unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					resetForm("#orderStatusChangeFrm");
					initOrdersDataTable();
					$('#order-status-modal').modal('hide');
					showMessage(json.message, "#orders-portlet-body");
				} else {
					alert("An error has occured, please report this incident to system administrator...");
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				$('#order-status-modal').unblock();
				handleErrorResponse(jqXHR, textStatus, "#order-status_modal-body");
			});
}

function statusChangedNotAllowed() {
	alert('Status of this order cannot be changed!');
}

function viewOrderDetails(btn) {
	var $modal = $('#order-detail-modal');
	// create the backdrop and wait for next modal to be triggered
	$('body').modalmanager('loading');
	var el = $(btn);
	setTimeout(function(){
		$modal.load(el.attr('data-url'), '', function(){
			$modal.modal({
				modalOverflow : true,
				backdrop: 'static',
				keyboard: true
			}
			);
		});
	}, 0);
    $modal.on('shown.bs.modal', function (e) {
    	initOrderDetailsDataTable();
    });
    $modal.on('hidden.bs.modal', function (e) {
    	ordersDetailsDataTable = undefined;
    	ordersAddonDetailsDataTable = undefined;

    	//$("#orderDetailsFrm #_orderId").val('');
    });
}

function initOrderDetailsDataTable() {
    if (typeof ordersDetailsDataTable  == 'undefined') {
    	ordersDetailsDataTable = $("#orderItemList").DataTable( {
            "processing": true,
            "serverSide": true,
            "ajax":{
            	"url": _contextPath+"/orders/orderItems",
                type: "post",  // method  , by default get
                "data": function ( d ) {
                    return $.extend( {}, d, {
                    	"orderId": $("#orderDetailsFrm #_orderId").val()
                      } );
                },
                
                error: function(){  // error handling
                    alert('Error loading data from server');
                }
            },
            
            "language": {
                "aria": {
                    "sortAscending": ": activate to sort column ascending",
                    "sortDescending": ": activate to sort column descending"
                },
                "emptyTable": "No data available in table",
                "info": "Showing _START_ to _END_ of _TOTAL_ entries",
                "infoEmpty": "No entries found",
                "infoFiltered": "(filtered1 from _MAX_ total entries)",
                "lengthMenu": "_MENU_ entries",
                "search": "Search (Title):",
                "zeroRecords": "No matching records found"
            },
            buttons: [
                      { extend: 'pdf', className: 'btn green btn-outline' },
                      { extend: 'excel', className: 'btn yellow btn-outline ' }
            ],
            "responsive": true,
            "searching": false,
            "order": [[ 1, "asc" ]],
            "columnDefs": [
                { "targets": [0], "searchable": false, "sortable": true},
                { "targets": [1], "searchable": false, "sortable": true},
                { "targets": [2], "searchable": false, "sortable": false},
	            { "targets": [3], "searchable": false, "sortable": false},
	            { "targets": [4], "searchable": false, "sortable": false},
	            { "targets": [5], "searchable": false, "sortable": false},
	            { "targets": [6], "searchable": false, "sortable": false},
	            { "targets": [7], "searchable": false, "sortable": false},
	            { "targets": [8], "searchable": false, "sortable": false},
	        	{ "targets": [-1], "width": "5%", "sortable": false, "searchable": false, "className"  : "centered-cell",
	        		"render"  : function (data, type, row) {
	    				return '<a class="btn btn-circle btn-icon-only blue" onclick="javascript: showItemManagement(true, '
	    				+ data + ', ' + row.quantity + ', \'' + row.item.title + '\', \'' + row.item.code + '\', \''+ row.remarks +'\');" title="Edit Item"><i class="icon-note"></i></a>';
	    			}
	            }
            ],
            "columns": [
                          { "data": "item.code"},
                          { "data": "item.mappingCode"},
                          { "data": "item.title"},
                          { "data": "item.unitPrice"},
                          { "data": "quantity"},
                          { "data": "discountRateApplied"},
                          { "data": "price" },
                          { "data": "remarks" },
                          { "data": "id" }
                          ],
           "dom": "<'row' <'col-md-12'B>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", // horizobtal scrollable datatable
                          
        } );
    } else {
    	ordersDetailsDataTable.draw();
    }
}
function initOrdersAddonDetailsDataTable() {
        if (typeof ordersAddonDetailsDataTable  == 'undefined') {
        	ordersAddonDetailsDataTable = $("#orderAddonList").DataTable( {
                "processing": true,
                "serverSide": true,
                "ajax":{
                	"url": _contextPath+"/orders/orderAddons",
                    type: "post",  // method  , by default get
                    "data": function ( d ) {
                        return $.extend( {}, d, {
                        	"orderItemVariantId": $("#orderItemManagementFrm #orderItemVariantId").val()
                          } );
                    },
                    
                    error: function(){  // error handling
                        alert('Error loading data from server');
                    }
                },
                
                "language": {
                    "aria": {
                        "sortAscending": ": activate to sort column ascending",
                        "sortDescending": ": activate to sort column descending"
                    },
                    "emptyTable": "No data available in table",
                    "info": "Showing _START_ to _END_ of _TOTAL_ entries",
                    "infoEmpty": "No entries found",
                    "infoFiltered": "(filtered1 from _MAX_ total entries)",
                    "lengthMenu": "_MENU_ entries",
                    "search": "Search (Title):",
                    "zeroRecords": "No matching records found"
                },
                buttons: [
                          { extend: 'pdf', className: 'btn green btn-outline' },
                          { extend: 'excel', className: 'btn yellow btn-outline ' }
                ],
                "responsive": true,
                "searching": false,
                "columnDefs": [
                    { "targets": [0], "searchable": false, "sortable": false},
                    { "targets": [1], "searchable": false, "sortable": false},
                    { "targets": [2], "searchable": false, "sortable": false},
    	            { "targets": [3], "searchable": false, "sortable": false},
    	        	{ "targets": [-1], "width": "5%", "sortable": false, "searchable": false, "className"  : "centered-cell",
    	        		"render"  : function (data, type, row) {
    	    				return '<a class="btn btn-circle btn-icon-only blue" onclick="javascript: showAddonManagement(true, '
    	    				+ data + ', ' + row.quantity + ', \'' + row.addon.title + '\', \''+ row.remarks +'\');" title="Edit Addon"><i class="icon-note"></i></a>';
    	    			}
    	            }
                ],
                "columns": [
                              { "data": "addon.title" },
                              { "data": "quantity"},
                              { "data": "price" },
                              { "data": "remarks" },
                              { "data": "id" }
                              ],
               "dom": "<'row' <'col-md-12'B>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", // horizobtal scrollable datatable
                              
            } );
        } else {
        	ordersAddonDetailsDataTable.draw();
        }
 }

/** Item Management related functions */
function showItemManagement(isEdit, itemVariantId, qty, _title, _code, _remarks){
	//event.preventDefault();
    // create the backdrop and wait for next modal to be triggered
    $('body').modalmanager('loading');
    var el = $(this);
    var $modal = $('#order-item-management-modal');
        $modal.modal({
      	  backdrop: 'static',
      	  keyboard: true
      	  }
        );
    $modal.on('shown.bs.modal', function (e) {
    	resetForm("#orderItemManagementFrm");
    	$.fn.select2.defaults.set("theme", "bootstrap");
    	if(isEdit == true) {
    		$('#btn_add_itemaddon').show();
    		$('#list-orderAddons').show();
    		
    		$("#btn-add-order-item").hide();
    		$("#btn-update-order-item").show();
    		$("#btn-delete-order-item").show();
    		$("#manageItemLabel").html("Edit");
       	 	
    		$('#orderItemVariantId').val(itemVariantId);
       	 	$('#quantity').val(qty);
       	 	$('#remarks').val(_remarks);
       	 	
       	 	var $s2 = $("#itemVariantId").select2();
       	 	$s2.select2("destroy");
       	 	$('#itemVariantId').children('option').remove();
       	 	$("#itemVariantId").append($("<option></option>").val(itemVariantId).html(_title + " (" + _code + ")"))
    		$("#itemVariantId").prop("disabled", true);
    		initOrdersAddonDetailsDataTable(); 
    	} else {
    		$('#btn_add_itemaddon').hide();
    		$('#list-orderAddons').hide();
    		
    		$('#order_id').val($('#orderDetailsFrm #_orderId').val());
    		$("#btn-add-order-item").show();
    		$("#btn-update-order-item").hide();
    		$("#btn-delete-order-item").hide();
    		$("#manageItemLabel").html("Add");

    		$("#itemVariantId").prop("disabled", false);
        	$("#itemVariantId").select2({
      		  ajax: {
      		    url: _contextPath+"/orders/loadItemList",
      		    dataType: 'json',
      		    delay: 1000,
      		    data: function (params) {
      		      return {
      		        q: params.term, // search term
      		        page: params.page
      		      };
      		    },
      		    processResults: function (data, params) {
      		      params.page = params.page || 1;

      		      return {
      		        results: data.items,
      		        pagination: {
      		          more: (params.page * 30) < data.total_count
      		        }
      		      };
      		    },
      		    cache: true
      		  },
  	    	    width: null,
      		  escapeMarkup: function (markup) { return markup; },
      		  minimumInputLength: 4,
      		  templateResult: formatItem,
      		  templateSelection: formatItemSelection
      		});
    	}
    });
    $modal.on('hidden.bs.modal', function (e) {
    	//ordersAddonDetailsDataTable = undefined;
    });
}

function updateOrderItem(){
	var frm = $("#orderItemManagementFrm")
	var mdl = $('#order-item-management-modal');
	$.ajax({
		async: true,
		type : "POST",
		processData: true,
		data : frm.serialize(),
		url : _contextPath + "/orders/updateOrderItem/",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			mdl.block(); 
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				mdl.unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					initOrderDetailsDataTable();
					resetForm(frm);
					mdl.modal('hide');
					showMessage(json.message, "#order-details-portlet-body");
				} else {
					alert("An error has occured, please report this incident to system administrator...");
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				mdl.unblock();
				handleErrorResponse(jqXHR, textStatus, "#order-item_modal-body");
			});
}

function addOrderItem(){
	var frm = $("#orderItemManagementFrm")
	var mdl = $('#order-item-management-modal');
	$.ajax({
		async: true,
		type : "POST",
		processData: true,
		data : frm.serialize(),
		url : _contextPath + "/orders/addOrderItem/",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			mdl.block(); 
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				mdl.unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					initOrderDetailsDataTable();
					resetForm(frm);
					mdl.modal('hide');
					showMessage(json.message, "#order-details-portlet-body");
				} else {
					alert("An error has occured, please report this incident to system administrator...");
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				mdl.unblock();
				handleErrorResponse(jqXHR, textStatus, "#order-item_modal-body");
			});
}

function deleteOrderItem(){
	if(confirm("Are you sure you want to delete this item?")) {
		var frm = $("#orderItemManagementFrm")
		var mdl = $('#order-item-management-modal');
		$.ajax({
			async: true,
			type : "POST",
			processData: true,
			data : frm.serialize(),
			url : _contextPath + "/orders/deleteOrderItem/",
			"headers": {
			    "accept": "application/json",
			    "cache-control": "no-cache",
			  },
			beforeSend: function(){
				mdl.block(); 
			}
		})
		.done(
				function(data, textStatus, jqXHR) {
					mdl.unblock();
					var json = $.parseJSON(jqXHR.responseText);
					if (json.state == 'OK') {
						initOrderDetailsDataTable();
						resetForm(frm);
						mdl.modal('hide');
						showMessage(json.message, "#order-details-portlet-body");
					} else {
						alert("An error has occured, please report this incident to system administrator...");
					}
				})
		.fail(
				function(jqXHR, textStatus) {
					mdl.unblock();
					handleErrorResponse(jqXHR, textStatus, "#order-item_modal-body");
				});
	}
}

/** Addon Management related functions */

function showAddonManagement(isEdit, addonId, qty, _title, _remarks){
	 //event.preventDefault();
    // create the backdrop and wait for next modal to be triggered
    $('body').modalmanager('loading');
    var el = $(this);
    var $modal = $('#order-addon-management-modal');
        $modal.modal({
      	  backdrop: 'static',
      	  keyboard: true
      	  }
        );
    $modal.on('shown.bs.modal', function (e) {
    	resetForm("#orderAddonManagementFrm");
    	$.fn.select2.defaults.set("theme", "bootstrap");
    	if(isEdit == true) {
    		$("#btn-add-order-addon").hide();
    		$("#btn-update-order-addon").show();
    		$("#btn-delete-order-addon").show();
    		$("#manageAddonLabel").html("Edit");
       	 	$('#orderItemAddonId').val(addonId);
       	 	$('#addonQuantity').val(qty);
       	 	$('#addonRemarks').val(_remarks);
       	 	
       	 	var $s2 = $("#addonId").select2();
       	 	$s2.select2("destroy");
       	 	$('#addonId').children('option').remove();
       	 	$("#addonId").append($("<option></option>").val(addonId).html(_title));
    		$("#addonId").prop("disabled", true);
    	} else {
    		$('#orderItemVarId').val($('#orderItemManagementFrm #orderItemVariantId').val());
    		$("#btn-add-order-addon").show();
    		$("#btn-update-order-addon").hide();
    		$("#btn-delete-order-addon").hide();
    		$("#manageAddonLabel").html("Add");

    		$("#addonId").prop("disabled", false);
        	$("#addonId").select2({
      		  ajax: {
      		    url: _contextPath+"/orders/loadAddonList",
      		    dataType: 'json',
      		    delay: 1000,
      		    data: function (params) {
      		      return {
      		        q: params.term, // search term
      		        page: params.page,
      		        orderItemVarId:	$("#orderItemManagementFrm #orderItemVariantId").val()
      		      };
      		    },
      		    processResults: function (data, params) {
      		      params.page = params.page || 1;

      		      return {
      		        results: data.items,
      		        pagination: {
      		          more: (params.page * 30) < data.total_count
      		        }
      		      };
      		    },
      		    cache: true
      		  },
  	    	    width: null,
      		  escapeMarkup: function (markup) { return markup; },
      		  minimumInputLength: 4,
      		  templateResult: formatAddon,
      		  templateSelection: formatAddonSelection
      		});
    	}
    });
}

function updateOrderAddon(){
	var frm = $("#orderAddonManagementFrm")
	var mdl = $('#order-addon-management-modal');
	$.ajax({
		async: true,
		type : "POST",
		processData: true,
		data : frm.serialize(),
		url : _contextPath + "/orders/updateOrderItemAddon/",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			mdl.block(); 
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				mdl.unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					initOrdersAddonDetailsDataTable();
					resetForm(frm);
					mdl.modal('hide');
					showMessage(json.message, "#order-item_modal-body");
				} else {
					alert("An error has occured, please report this incident to system administrator...");
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				mdl.unblock();
				handleErrorResponse(jqXHR, textStatus, "#order-addon_modal-body");
			});
}

function addOrderAddon(){
	var frm = $("#orderAddonManagementFrm")
	var mdl = $('#order-addon-management-modal');
	$.ajax({
		async: true,
		type : "POST",
		processData: true,
		data : frm.serialize(),
		url : _contextPath + "/orders/addOrderAddon/",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			mdl.block(); 
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				mdl.unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					initOrdersAddonDetailsDataTable();
					resetForm(frm);
					mdl.modal('hide');
					showMessage(json.message, "#order-item_modal-body");
				} else {
					alert("An error has occured, please report this incident to system administrator...");
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				mdl.unblock();
				handleErrorResponse(jqXHR, textStatus, "#order-addon_modal-body");
			});
}

function deleteOrderAddon(){
	if(confirm("Are you sure you want to delete this addon?")) {
		var frm = $("#orderAddonManagementFrm")
		var mdl = $('#order-addon-management-modal');
		$.ajax({
			async: true,
			type : "POST",
			processData: true,
			data : frm.serialize(),
			url : _contextPath + "/orders/deleteOrderItemAddon/",
			"headers": {
			    "accept": "application/json",
			    "cache-control": "no-cache",
			  },
			beforeSend: function(){
				mdl.block(); 
			}
		})
		.done(
				function(data, textStatus, jqXHR) {
					mdl.unblock();
					var json = $.parseJSON(jqXHR.responseText);
					if (json.state == 'OK') {
						initOrdersAddonDetailsDataTable();
						resetForm(frm);
						mdl.modal('hide');
						showMessage(json.message, "#order-item_modal-body");
					} else {
						alert("An error has occured, please report this incident to system administrator...");
					}
				})
		.fail(
				function(jqXHR, textStatus) {
					mdl.unblock();
					handleErrorResponse(jqXHR, textStatus, "#order-addon_modal-body");
				});
	}
}

function formatItem(repo) {
    if (repo.loading) return repo.text;
    
    return "<div>" + repo.title + " (" + repo.code + ")" +"</div>";
/*    return '<div>'
    		+ '<h4">' + repo.code + '</h4>'
    		+ '<p class="font-grey-mint">' + repo.title +  '</p>'
    		'</div>';*/
}

function formatItemSelection(repo) {
    return repo.title + " (" + repo.code + ")" ;
}

function formatAddon(repo) {
    if (repo.loading) return repo.text;
    return "<div>" + repo.title +"</div>";
}

function formatAddonSelection(repo) {
    return repo.title ;
}

