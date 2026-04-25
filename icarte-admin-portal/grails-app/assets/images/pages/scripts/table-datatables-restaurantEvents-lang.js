'use strict';
var restaurantEventTranslationDataTable;

$(document).ready(function() {
    var $modal = $('#restaurantEvent-trans-modal');

    $('#btnAdd-restaurantEvent-trans').on('click', function(){
      // create the backdrop and wait for next modal to be triggered
      $('body').modalmanager('loading');
      var el = $(this);

      setTimeout(function(){
          $modal.load(el.attr('data-url'), '', function(){
          $modal.modal({
        	  backdrop: 'static',
        	  keyboard: true
        	  }
          );
        });
      }, 1000);
    });
    //initialize the translation data table
	initRestaurantEventTranslationDataTable();
});

function initRestaurantEventTranslationDataTable() {
    if (typeof restaurantEventTranslationDataTable == 'undefined') {
    	restaurantEventTranslationDataTable = $("#restuarantEvent_translation_tbl").DataTable( {
            "processing": true,
            "serverSide": true,
            "ajax":{
            	"url": _contextPath+"/restaurantEventTranslation/list?restaurantEventId="+_restaurantEventId, // json datasource
                type: "post",  // method  , by default get
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
            "responsive": true,
            "searching": true,
            "columnDefs": [
               { "targets": [0], "width": "35%"},
               { "targets": [1], "width": "5%"},
               { "targets": [2], "width": "45%", "sortable": false, "searchable": false},
              	{ "targets": [3], "width": "5%", "sortable": false, "searchable": false},
            	{ "targets": [-2], "width": "3%", "sortable": false, "searchable": false, "className"  : "centered-cell",
	        		"render"  : function (data, type, row) {
        				return '<a class="btn btn-circle btn-icon-only blue" data-url="'
        				+ _contextPath+'/restaurantEventTranslation/edit/'+ data +'" data-toggle="modal" onclick="javascript: loadRestaurantEventTranslationForEdit(this);" title="Edit Translation"><i class="icon-note"></i></a>';
        			}
	            },
            	{ "targets": [-1], "width": "3%", "sortable": false, "searchable": false, "className"  : "centered-cell",
	        		"render"  : function (data, type, row) {
        				return '<a class="btn btn-circle btn-icon-only blue" href="javascript:deleteRestaurantEventTranslation('+data+');" title="Delete Translation"><i class="icon-trash"></i></a>';
        			}
	            }
            ],
            "columns": [
                          { "data": "title" },
                          { "data": "language" },
                          { "data": "description"},
                          { "data": "showDescription"},
                          { "data": "id" },
                          { "data": "id" }
                          ]
        } );
    }

}

function loadRestaurantEventTranslationForEdit(btn) {
	var $modal = $('#restaurantEvent-trans-edit-modal');

    // create the backdrop and wait for next modal to be triggered
    $('body').modalmanager('loading');
    var el = $(btn);
    setTimeout(function(){
        $modal.load(el.attr('data-url'), '', function(){
        $modal.modal({
      	  backdrop: 'static',
      	  keyboard: true
      	  }
        );
      });
    }, 500);	
}

function createRestaurantEventTranslation() {
	$.ajax({
		async: true,
		type : "POST",
		processData: true,
		data : $("#restaurantEventTranslationForm").serialize(),
		url : _contextPath + "/restaurantEventTranslation/save/",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			$("#restaurantEventTranslation-create-portlet-body").block();
		},
		complete: function(){
			//hideSpinner();
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				$("#restaurantEventTranslation-create-portlet-body").unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					showMessage(json.message, "#restaurantEvent-portlet-body");
					restaurantEventTranslationDataTable.draw();
					$('#restaurantEvent-trans-modal').modal('hide');
				} else {
					alert("An error has occured, please report this incident to system administrator...");
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				$("#restaurantEventTranslation-create-portlet-body").unblock();
				handleErrorResponse(jqXHR, textStatus, "#restaurantEventTranslation-create-portlet-body");
			});
			
}

function editRestaurantEventTranslation(id) {
	$.ajax({
		async: true,
		type : "POST",
		processData: true,
		data : $("#restaurantEventTranslationEditForm").serialize() + "&id=" + id,
		url : _contextPath + "/restaurantEventTranslation/save/",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			$("#restaurantEventTranslation-edit-portlet-body").block(); 
		},
		complete: function(){
			//hideSpinner();
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				$("#restaurantEventTranslation-edit-portlet-body").unblock(); 
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					$('#restaurantEvent-trans-edit-modal').modal('hide');
					restaurantEventTranslationDataTable.draw();
					debug(json.message);
					showMessage(json.message, "#restaurantEvent-portlet-body");
				} else {
					alert("An error has occured, please report this incident to system administrator...");
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				$("#restaurantEventTranslation-edit-portlet-body").unblock(); 
				handleErrorResponse(jqXHR, textStatus, "#restaurantEventTranslation-edit-portlet-body");
			});
			
}

function deleteRestaurantEventTranslation(id) {
	if(confirm("Are you sure you want to delete this record?")) {
		if(id!=null) {
			$.ajax({
				async: true,
				type : "DELETE",
				processData: false,
				url : _contextPath + "/restaurantEventTranslation/delete/"+id,
				"headers": {
				    "accept": "application/json",
				    "cache-control": "no-cache",
				  },
				beforeSend: function(){
					$("#restaurantEvent-portlet-body").block();
				},
				complete: function(){
					//hideSpinner();
				}
			})
			.done(
					function(data, textStatus, jqXHR) {
						$("#restaurantEvent-portlet-body").unblock();
						var json = $.parseJSON(jqXHR.responseText);
						if (json.state == 'OK') {
							showMessage(json.message, "#restaurantEvent-portlet-body");
							restaurantEventTranslationDataTable.draw();
						} else {
							handleErrorResponse(jqXHR, textStatus, "#restaurantEvent-portlet-body");
						}
					})
			.fail(
					function(jqXHR, textStatus) {
						$("#restaurantEvent-portlet-body").unblock();
						var json = $.parseJSON(jqXHR.responseText);
						handleErrorResponse(jqXHR, textStatus, "#restaurantEvent-portlet-body");
					});
			}
	}
}