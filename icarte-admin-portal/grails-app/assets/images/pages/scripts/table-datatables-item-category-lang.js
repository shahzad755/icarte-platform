'use strict';
var itemCatTranslationDataTable;

$(document).ready(function() {
    var $modal = $('#itemCat-trans-modal');

    $('#btnAdd-itemCat-trans').on('click', function(){
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
	initItemCatTranslationDataTable();
});

function initItemCatTranslationDataTable() {
    if (typeof itemCatTranslationDataTable == 'undefined') {
    	itemCatTranslationDataTable = $("#itemCategory_translation_tbl").DataTable( {
            "processing": true,
            "serverSide": true,
            "ajax":{
            	"url": _contextPath+"/itemCategoryTranslation/list?itemCategoryId="+_itemCatId, // json datasource
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
        				+ _contextPath+'/itemCategoryTranslation/edit/'+ data +'" data-toggle="modal" onclick="javascript: loadItemCatTranslationForEdit(this);" title="Edit Translation"><i class="icon-note"></i></a>';
        			}
	            },
            	{ "targets": [-1], "width": "5%", "sortable": false, "searchable": false, "className"  : "centered-cell",
	        		"render"  : function (data, type, row) {
        				return '<a class="btn btn-circle btn-icon-only blue" href="javascript:deleteItemCatTranslation('+data+');" title="Delete Translation"><i class="icon-trash"></i></a>';
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

function loadItemCatTranslationForEdit(btn) {
	var $modal = $('#itemCat-trans-edit-modal');

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

function createItemCatTranslation() {
	$.ajax({
		async: true,
		type : "POST",
		processData: true,
		data : $("#itemCatTranslationForm").serialize(),
		url : _contextPath + "/itemCategoryTranslation/save/",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			$("#itemCatTranslation-create-portlet-body").block();
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				$("#itemCatTranslation-create-portlet-body").unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					showMessage(json.message, "#itemCat-portlet-body");
					itemCatTranslationDataTable.draw();
					$('#itemCat-trans-modal').modal('hide');
				} else {
					alert("An error has occured, please report this incident to system administrator...");
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				$("#itemCatTranslation-create-portlet-body").unblock();
				handleErrorResponse(jqXHR, textStatus, "#itemCatTranslation-create-portlet-body");
			});
			
}

function editItemCatTranslation(id) {
	$.ajax({
		async: true,
		type : "POST",
		processData: true,
		data : $("#itemCatTranslationEditForm").serialize() + "&id=" + id,
		url : _contextPath + "/itemCategoryTranslation/save/",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			$("#itemCatTranslation-edit-portlet-body").block();			
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				$("#itemCatTranslation-edit-portlet-body").unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					$('#itemCat-trans-edit-modal').modal('hide');
					itemCatTranslationDataTable.draw();
					showMessage(json.message, "#itemCat-portlet-body");
				} else {
					alert("An error has occured, please report this incident to system administrator...");
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				$("#itemCatTranslation-edit-portlet-body").unblock();
				handleErrorResponse(jqXHR, textStatus, "#itemCatTranslation-edit-portlet-body");
			});
			
}

function deleteItemCatTranslation(id) {
	if(confirm("Are you sure you want to delete this record?")) {
		if(id!=null) {
			$.ajax({
				async: true,
				type : "DELETE",
				processData: false,
				url : _contextPath + "/itemCategoryTranslation/delete/"+id,
				"headers": {
				    "accept": "application/json",
				    "cache-control": "no-cache",
				  },
				beforeSend: function(){
					$("#itemCat-portlet-body").block();
				}
			})
			.done(
					function(data, textStatus, jqXHR) {
						$("#itemCat-portlet-body").unblock();
						var json = $.parseJSON(jqXHR.responseText);
						if (json.state == 'OK') {
							showMessage(json.message, "#itemCat-portlet-body");
							itemCatTranslationDataTable.draw();
						} else {
							handleErrorResponse(jqXHR, textStatus, "#itemCat-portlet-body");
						}
					})
			.fail(
					function(jqXHR, textStatus) {
						$("#itemCat-portlet-body").unblock();
						var json = $.parseJSON(jqXHR.responseText);
						handleErrorResponse(jqXHR, textStatus, "#itemCat-portlet-body");
					});
			}
	}
}