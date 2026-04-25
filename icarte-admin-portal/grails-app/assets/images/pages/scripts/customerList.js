'use strict';
var customerDataTable;

$(document).ready(function() {
	$("#btnSearchCustomers").on("click", function(){
		//customerDataTable.draw();
		initCustomerDataTable();
	});
	
    $('.btn_header_create').on('click', function(event){
	   	 event.preventDefault();
	     // create the backdrop and wait for next modal to be triggered
	     $('body').modalmanager('loading');
	     resetForm("#customerForm");
	     var el = $(this);
	     var $modal = $('#customer-modal');
	
	     setTimeout(function(){
	         $modal.load(_contextPath+"/"+_controller+"/create?mode=dlg", '', function(){
	         $modal.modal({
	       	  backdrop: 'static',
	       	  keyboard: true
	       	  }
	         );
	       });
	     }, 0);
   });


});


function initCustomerDataTable() {
	if (typeof customerDataTable == 'undefined') {
	customerDataTable = $("#customerList").DataTable( {
        "processing": true,
        "serverSide": true,
        "ajax":{
        	"url": _contextPath+"/"+_controller+"/list", // json datasource
            type: "post",  // method  , by default get
            "data": function ( d ) {
                return $.extend( {}, d, {
                	"searchCode": $("#searchCode").val(),
                	"searchMobile": $("#searchMobile").val(),
                	"searchFname": $("#searchFname").val(),
                	"searchLname": $("#searchLname").val(),
                    "searchIsActive": $("#searchIsActive").val()
                  } );
            },
            
            error: function(){  // error handling
                alert('Error loading data from server! Please contact administrator.');
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
            "zeroRecords": "No matching records found"
        },
        "order": [[ 1, "asc" ]],
        "responsive": true,
        "searching": false,
        "columnDefs": [
           { "targets": [0], "width": "5%", "searchable": false, "sortable": false,
        	   "render"  : function (data, type, row) {
   				return '<a href="'
   				+ _contextPath+'/'+_controller+'/show/'+ row['id'] +'" title="Show Record">'+ data +'</a>';
   				}               
           },
	        { "targets": [1], "width": "3%", "searchable": false, "sortable": true},
	        { "targets": [2], "width": "10%", "searchable": false, "sortable": true},
	        { "targets": [3], "width": "10%", "searchable": false, "sortable": true},
			{ "targets": [4], "width": "10%", "searchable": false, "sortable": false},
			{ "targets": [5], "width": "2%", "searchable": false, "sortable": false},
			{ "targets": [6], "width": "1", "searchable": false, "sortable": false},
	    	{ "targets": [-2], "width": "1%", "sortable": false, "searchable": false, "className"  : "centered-cell",
	    		"render"  : function (data, type, row) {
					return '<a class="btn btn-circle btn-icon-only blue" data-url="'
					+ _contextPath +'/'+_controller+'/edit/'+ data +'" data-toggle="modal" onclick="javascript: loadCustomerForEdit(this);" title="Edit"><i class="icon-note"></i></a>';
				}
	        },
	    	{ "targets": [-1], "width": "1%", "sortable": false, "searchable": false, "className"  : "centered-cell",
	    		"render"  : function (data, type, row) {
					return '<a class="btn btn-circle btn-icon-only blue" href="javascript:deactivateCustomer('+data+');" title="Activate/Deactivate"><i class="icon-trash"></i></a>';
				}
	        }
        ],
        "columns": [
                      { "data": "code" },
                      { "data": "firstName" },
                      { "data": "lastName"},
                      { "data": "mobile"},
                      { "data": "email"},
                      { "data": "isActive"},
                      { "data": "restaurant" },
                      { "data": "id" },
                      { "data": "id" }
                      ]
    } );
} else {
	customerDataTable.draw();
	}
}

function saveCustomer(isEdit) {
	var formName = isEdit?"#customerEditForm": "#customerForm";
	var portletBodyName = isEdit?'#customer-edit-portlet-body': '#customer-portlet-body';
	$.ajax({
		async: true,
		type : "POST",
		processData: true,
		data : $(formName).serialize(),
		url : _contextPath + "/"+ _controller +"/save",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			$(portletBodyName).block(blockUIOptions); 
		},
		complete: function(){
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				$(portletBodyName).unblock();

				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
						showMessage(json.message, "#customerList-portlet-body");
						initCustomerDataTable();
						if(isEdit)
							$('#customer-edit-modal').modal('hide');
						else
							$('#customer-modal').modal('hide');
				} else {
					showError("An error has occured, please report this incident to system administrator...", 
							portletBodyName, false);
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				debug("Error while processing save Customer information");
				$(portletBodyName).unblock();
				handleErrorResponse(jqXHR, textStatus, portletBodyName);
			});
			
}

function loadCustomerForEdit(btn) {
	var $modal = $('#customer-edit-modal');
/*	$modal.on('hidden.bs.modal', function (e) {
		customerDataTable = undefined;
		});*/
	// create the backdrop and wait for next modal to be triggered
	$('body').modalmanager('loading');
	var el = $(btn);
	setTimeout(function(){
		$modal.load(el.attr('data-url')+"/?mode=dlg", '', function(){
			$modal.modal({
				backdrop: 'static',
				keyboard: true
			}
			);
		});
	}, 0);
}
