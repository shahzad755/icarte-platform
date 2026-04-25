'use strict';
var addoTranslationDataTable;

$(document).ready(function() {
    var $modal = $('#addon-trans-modal');

    $('#btnAdd-addon-trans').on('click', function(){
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
	initAddonTranslationDataTable();
});

function initAddonTranslationDataTable() {
    if (typeof addoTranslationDataTable == 'undefined') {
    	addoTranslationDataTable = $("#addon_translation_tbl").DataTable( {
            "processing": true,
            "serverSide": true,
            "ajax":{
            	"url": _contextPath+"/addonTranslation/list?addonId="+_addonid, // json datasource
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
        				+ _contextPath+'/addonTranslation/edit/'+ data +'" data-toggle="modal" onclick="javascript: loadAddonTranslationForEdit(this);" title="Edit Translation"><i class="icon-note"></i></a>';
        			}
	            },
            	{ "targets": [-1], "width": "5%", "sortable": false, "searchable": false, "className"  : "centered-cell",
	        		"render"  : function (data, type, row) {
        				return '<a class="btn btn-circle btn-icon-only blue" href="javascript:deleteAddonTranslation('+data+');" title="Delete Translation"><i class="icon-trash"></i></a>';
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

function loadAddonTranslationForEdit(btn) {
	var $modal = $('#addon-trans-edit-modal');

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

function createAddonTranslation() {
	$.ajax({
		async: true,
		type : "POST",
		processData: true,
		data : $("#addonTranslationForm").serialize(),
		url : _contextPath + "/addonTranslation/save/",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			$("#addonTranslation-create-portlet-body").block();
		},
		complete: function(){
			//hideSpinner();
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				$("#addonTranslation-create-portlet-body").unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					showMessage(json.message, "#addon-portlet-body");
					addoTranslationDataTable.draw();
					$('#addon-trans-modal').modal('hide');
				} else {
					alert("An error has occured, please report this incident to system administrator...");
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				$("#addonTranslation-create-portlet-body").unblock();
				handleErrorResponse(jqXHR, textStatus, "#addonTranslation-create-portlet-body");
			});
			
}

function editAddonTranslation(id) {
	$.ajax({
		async: true,
		type : "POST",
		processData: true,
		data : $("#addonTranslationEditForm").serialize() + "&id=" + id,
		url : _contextPath + "/addonTranslation/save/",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			$("#addonTranslation-edit-portlet-body").block();
		},
		complete: function(){
			//hideSpinner();
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				$("#addonTranslation-edit-portlet-body").unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					$('#addon-trans-edit-modal').modal('hide');
					addoTranslationDataTable.draw();
					showMessage(json.message, "#addon-portlet-body");
				} else {
					alert("An error has occured, please report this incident to system administrator...");
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				$("#addonTranslation-edit-portlet-body").unblock();
				handleErrorResponse(jqXHR, textStatus, "#addonTranslation-edit-portlet-body");
			});
			
}

function deleteAddonTranslation(id) {
	if(confirm("Are you sure you want to delete this record?")) {
		if(id!=null) {
			$.ajax({
				async: true,
				type : "DELETE",
				processData: false,
				url : _contextPath + "/addonTranslation/delete/"+id,
				"headers": {
				    "accept": "application/json",
				    "cache-control": "no-cache",
				  },
				beforeSend: function(){
					$("#addon-portlet-body").block();
				},
				complete: function(){
					//hideSpinner();
				}
			})
			.done(
					function(data, textStatus, jqXHR) {
						$("#addon-portlet-body").unblock();
						var json = $.parseJSON(jqXHR.responseText);
						if (json.state == 'OK') {
							showMessage(json.message, "#addon-portlet-body");
							addoTranslationDataTable.draw();
						} else {
							$("#addon-portlet-body").unblock();
							handleErrorResponse(jqXHR, textStatus, "#addon-portlet-body");
						}
					})
			.fail(
					function(jqXHR, textStatus) {
						var json = $.parseJSON(jqXHR.responseText);
						handleErrorResponse(jqXHR, textStatus, "#addon-portlet-body");
					});
			}
	}
}