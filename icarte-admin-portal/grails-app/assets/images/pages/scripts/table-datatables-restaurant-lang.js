'use strict';
var translationDataTable;

$(document).ready(function() {
    var $modal = $('#trans-create-modal');

    $('#btnAdd-trans').on('click', function(){
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
	initTranslationDataTable();
});

function initTranslationDataTable() {
    if (typeof translationDataTable == 'undefined') {
    	translationDataTable = $("#translation_tbl").DataTable( {
            "processing": true,
            "serverSide": true,
            "ajax":{
            	"url": _contextPath+"/restaurantTranslation/list?restaurantId="+_restaurantId, // json datasource
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
            	{ "targets": [-2], "width": "5%", "sortable": false, "searchable": false, "className"  : "centered-cell",
	        		"render"  : function (data, type, row) {
        				return '<a class="btn btn-circle btn-icon-only blue" data-url="'
        				+ _contextPath+'/restaurantTranslation/edit/'+ data +'" data-toggle="modal" onclick="javascript: loadTranslationForEdit(this);" title="Edit Translation"><i class="icon-note"></i></a>';
        			}
	            },
            	{ "targets": [-1], "width": "5%", "sortable": false, "searchable": false, "className"  : "centered-cell",
	        		"render"  : function (data, type, row) {
        				return '<a class="btn btn-circle btn-icon-only blue" href="javascript:deleteTranslation('+data+');" title="Delete Translation"><i class="icon-trash"></i></a>';
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

function loadTranslationForEdit(btn) {
	var $modal = $('#trans-edit-modal');

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

function createTranslation() {
	$.ajax({
		async: true,
		type : "POST",
		processData: true,
		data : $("#translationForm").serialize(),
		url : _contextPath + "/restaurantTranslation/save/",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			//showSpinner();
		},
		complete: function(){
			//hideSpinner();
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					showMessage(json.message, "#trans-portlet-body");
					translationDataTable.draw();
					$('#trans-create-modal').modal('hide');
				} else {
					alert("An error has occured, please report this incident to system administrator...");
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				handleErrorResponse(jqXHR, textStatus, "#trans-create-portlet-body");
			});
			
}

function editTranslation(id) {
	$.ajax({
		async: true,
		type : "POST",
		processData: true,
		data : $("#translationForm").serialize() + "&id=" + id,
		url : _contextPath + "/restaurantTranslation/save/",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			//showSpinner();
		},
		complete: function(){
			//hideSpinner();
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					$('#trans-edit-modal').modal('hide');
					translationDataTable.draw();
					showMessage(json.message, "#trans-portlet-body");
				} else {
					alert("An error has occured, please report this incident to system administrator...");
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				handleErrorResponse(jqXHR, textStatus, "#trans-edit-portlet-body");
			});
			
}

function deleteTranslation(id) {
	if(confirm("Are you sure you want to delete this record?")) {
		if(id!=null) {
			$.ajax({
				async: true,
				type : "DELETE",
				processData: false,
				url : _contextPath + "/restaurantTranslation/delete/"+id,
				"headers": {
				    "accept": "application/json",
				    "cache-control": "no-cache",
				  },
				beforeSend: function(){
					//showSpinner();
				},
				complete: function(){
					//hideSpinner();
				}
			})
			.done(
					function(data, textStatus, jqXHR) {
						var json = $.parseJSON(jqXHR.responseText);
						if (json.state == 'OK') {
							showMessage(json.message, "#trans-portlet-body");
							translationDataTable.draw();
						} else {
							handleErrorResponse(jqXHR, textStatus, "#trans-portlet-body");
						}
					})
			.fail(
					function(jqXHR, textStatus) {
						var json = $.parseJSON(jqXHR.responseText);
						handleErrorResponse(jqXHR, textStatus, "#trans-portlet-body");
					});
			}
	}
}