'use strict';
var feedbackConfigTranslationDataTable;

$(document).ready(function() {
    var $modal = $('#feedback-trans-modal');

    $('#btnAdd-feedback-trans').on('click', function(){
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
      }, 500);
    });
    //initialize the translation data table
	initFeedbackConfigTranslationDataTable();
});

function initFeedbackConfigTranslationDataTable() {
    if (typeof feedbackConfigTranslationDataTable == 'undefined') {
    	feedbackConfigTranslationDataTable = $("#feedback_translation_tbl").DataTable( {
            "processing": true,
            "serverSide": true,
            "ajax":{
            	"url": _contextPath+"/feedbackConfigTranslation/list?feedbackConfigId="+_feedbackConfigId, // json datasource
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
        				+ _contextPath+'/feedbackConfigTranslation/edit/'+ data +'" data-toggle="modal" onclick="javascript: loadFeedbackTranslationForEdit(this);" title="Edit Translation"><i class="icon-note"></i></a>';
        			}
	            },
            	{ "targets": [-1], "width": "5%", "sortable": false, "searchable": false, "className"  : "centered-cell",
	        		"render"  : function (data, type, row) {
        				return '<a class="btn btn-circle btn-icon-only blue" href="javascript:deleteFeedbackTranslation('+data+');" title="Delete Translation"><i class="icon-trash"></i></a>';
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

function loadFeedbackTranslationForEdit(btn) {
	var $modal = $('#feedback-trans-edit-modal');

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

function createFeedbackTranslation() {
	$.ajax({
		async: true,
		type : "POST",
		processData: true,
		data : $("#feedbackConfigTranslationForm").serialize(),
		url : _contextPath + "/feedbackConfigTranslation/save/",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			$("#feedback-create-portlet-body").block();
		},
		complete: function(){
			//hideSpinner();
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				$("#feedback-create-portlet-body").unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					showMessage(json.message, "#feedback-portlet-body");
					feedbackConfigTranslationDataTable.draw();
					$('#feedback-trans-modal').modal('hide');
				} else {
					alert("An error has occured, please report this incident to system administrator...");
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				$("#feedback-create-portlet-body").unblock();
				handleErrorResponse(jqXHR, textStatus, "#feedback-create-portlet-body");
			});
			
}

function editFeedbackConfigTranslation(id) {
	$.ajax({
		async: true,
		type : "POST",
		processData: true,
		data : $("#feedbackConfigTranslationEditForm").serialize() + "&id=" + id,
		url : _contextPath + "/feedbackConfigTranslation/save/",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			$("#feedback-edit-portlet-body").block(); 
		},
		complete: function(){
			//hideSpinner();
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				$("#feedback-edit-portlet-body").unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					$('#feedback-trans-edit-modal').modal('hide');
					feedbackConfigTranslationDataTable.draw();
					showMessage(json.message, "#feedback-portlet-body");
				} else {
					alert("An error has occured, please report this incident to system administrator...");
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				$("#feedback-edit-portlet-body").unblock();
				handleErrorResponse(jqXHR, textStatus, "#feedback-edit-portlet-body");
			});
			
}

function deleteFeedbackTranslation(id) {
	if(confirm("Are you sure you want to delete this record?")) {
		if(id!=null) {
			$.ajax({
				async: true,
				type : "DELETE",
				processData: false,
				url : _contextPath + "/feedbackConfigTranslation/delete/"+id,
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
							showMessage(json.message, "#itemCat-portlet-body");
							feedbackConfigTranslationDataTable.draw();
						} else {
							handleErrorResponse(jqXHR, textStatus, "#itemCat-portlet-body");
						}
					})
			.fail(
					function(jqXHR, textStatus) {
						var json = $.parseJSON(jqXHR.responseText);
						handleErrorResponse(jqXHR, textStatus, "#itemCat-portlet-body");
					});
			}
	}
}