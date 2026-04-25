'use strict';
var itemCatTranslationDataTable;

$(document).ready(function() {
    var $modal = $('#cuisine-trans-modal');

    $('#btnAdd-cuisine-trans').on('click', function(){
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
	initCuisineTranslationDataTable();
});

function initCuisineTranslationDataTable() {
    if (typeof itemCatTranslationDataTable == 'undefined') {
    	itemCatTranslationDataTable = $("#cuisine_translation_tbl").DataTable( {
            "processing": true,
            "serverSide": true,
            "ajax":{
            	"url": _contextPath+"/cuisineTranslation/list?cuisineTypeId="+_cuisineTypeId, // json datasource
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
            	{ "targets": [-2], "width": "5%", "sortable": false, "searchable": false, "className"  : "centered-cell",
	        		"render"  : function (data, type, row) {
        				return '<a class="btn btn-circle btn-icon-only blue" data-url="'
        				+ _contextPath+'/cuisineTranslation/edit/'+ data +'" data-toggle="modal" onclick="javascript: loadCuisineTranslationForEdit(this);" title="Edit Translation"><i class="icon-note"></i></a>';
        			}
	            },
            	{ "targets": [-1], "width": "5%", "sortable": false, "searchable": false, "className"  : "centered-cell",
	        		"render"  : function (data, type, row) {
        				return '<a class="btn btn-circle btn-icon-only blue" href="javascript:deleteCuisineTranslation('+data+');" title="Delete Translation"><i class="icon-trash"></i></a>';
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

function loadCuisineTranslationForEdit(btn) {
	var $modal = $('#cuisine-trans-edit-modal');

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

function createCuisineTranslation() {
	$.ajax({
		async: true,
		type : "POST",
		processData: true,
		data : $("#cuisineTranslationForm").serialize(),
		url : _contextPath + "/cuisineTranslation/save/",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			$("#cuisineTranslation-create-portlet-body").block();
		},
		complete: function(){
			//hideSpinner();
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				$("#cuisineTranslation-create-portlet-body").unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					showMessage(json.message, "#cuisine-portlet-body");
					itemCatTranslationDataTable.draw();
					$('#cuisine-trans-modal').modal('hide');
				} else {
					alert("An error has occured, please report this incident to system administrator...");
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				$("#cuisineTranslation-create-portlet-body").unblock();
				handleErrorResponse(jqXHR, textStatus, "#cuisineTranslation-create-portlet-body");
			});
			
}

function editCuisineTranslation(id) {
	$.ajax({
		async: true,
		type : "POST",
		processData: true,
		data : $("#cuisineTranslationEditForm").serialize() + "&id=" + id,
		url : _contextPath + "/cuisineTranslation/save/",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			$("#cuisineTranslation-edit-portlet-body").block(); 
		},
		complete: function(){
			//hideSpinner();
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				$("#cuisineTranslation-edit-portlet-body").unblock(); 
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					$('#cuisine-trans-edit-modal').modal('hide');
					itemCatTranslationDataTable.draw();
					showMessage(json.message, "#cuisine-portlet-body");
				} else {
					alert("An error has occured, please report this incident to system administrator...");
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				$("#cuisineTranslation-edit-portlet-body").unblock(); 
				handleErrorResponse(jqXHR, textStatus, "#cuisineTranslation-edit-portlet-body");
			});
			
}

function deleteCuisineTranslation(id) {
	if(confirm("Are you sure you want to delete this record?")) {
		if(id!=null) {
			$.ajax({
				async: true,
				type : "DELETE",
				processData: false,
				url : _contextPath + "/cuisineTranslation/delete/"+id,
				"headers": {
				    "accept": "application/json",
				    "cache-control": "no-cache",
				  },
				beforeSend: function(){
					$("#cuisine-portlet-body").block();
				},
				complete: function(){
					//hideSpinner();
				}
			})
			.done(
					function(data, textStatus, jqXHR) {
						$("#cuisine-portlet-body").unblock();
						var json = $.parseJSON(jqXHR.responseText);
						if (json.state == 'OK') {
							showMessage(json.message, "#cuisine-portlet-body");
							itemCatTranslationDataTable.draw();
						} else {
							handleErrorResponse(jqXHR, textStatus, "#cuisine-portlet-body");
						}
					})
			.fail(
					function(jqXHR, textStatus) {
						$("#cuisine-portlet-body").unblock();
						var json = $.parseJSON(jqXHR.responseText);
						handleErrorResponse(jqXHR, textStatus, "#cuisine-portlet-body");
					});
			}
	}
}