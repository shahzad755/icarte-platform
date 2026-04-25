'use strict';
var itemDataTable;
var itemVariantDataTable;
var itemVarTranslationDataTable;

$(document).ready(function() {
	$("#btnSearchItems").on("click", function(){
		//itemDataTable.draw();
		initItemDataTable();
	});

    $('.btn_header_create').on('click', function(event){
    	 event.preventDefault();
      // create the backdrop and wait for next modal to be triggered
      $('body').modalmanager('loading');
      resetForm("#itemForm");
      var el = $(this);
      var $modal = $('#item-modal');

      setTimeout(function(){
          $modal.load(_contextPath+"/item/create", '', function(){
          $modal.modal({
        	  backdrop: 'static',
        	  keyboard: true
        	  }
          );
        });
      }, 0);
    });
    
});

function initItemDataTable() {
    if (typeof itemDataTable == 'undefined') {
    	itemDataTable = $("#itemList").DataTable( {
            "processing": true,
            "serverSide": true,
            "ajax":{
            	"url": _contextPath+"/item/list",
                type: "post",  // method  , by default get
                "data": function ( d ) {
                    return $.extend( {}, d, {
                    	"searchCode": $("#searchCode").val(),
                    	"searchTitle": $("#searchTitle").val(),
                    	"searchCategory": $("#searchCategory").val(),
                    	"searchMappingCode": $("#searchMappingCode").val(),
                    	/*"searchCuisineType": $("#searchCuisineType").val(),*/
                        "searchIsActive": $("#searchIsActive").val()
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
            "responsive": true,
            "searching": false,
            "columnDefs": [
                { "targets": [0], "width": "10%", "searchable": false, "className"  : "centered-cell"},
                { "targets": [1], "width": "45%", "searchable": false},
                { "targets": [2], "width": "10%", "searchable": false, "sortable": false},
                { "targets": [3], "width": "10%", "searchable": false, "sortable": false},
                { "targets": [4], "width": "5%", "searchable": false, "sortable": true},
                { "targets": [5], "width": "5%", "searchable": false, "sortable": false},
                { "targets": [6], "width": "5%", "searchable": false, "sortable": false},
                { "targets": [7], "width": "5%", "searchable": false, "sortable": false},
                { "targets": [8], "width": "10%", "searchable": false, "sortable": false},
				{ "targets": [9], "width": "10%", "searchable": false, "sortable": false},
            	{ "targets": [-2], "width": "3%", "sortable": false, "searchable": false, "className"  : "centered-cell",
	        		"render"  : function (data, type, row) {
        				return '<a class="btn btn-circle btn-icon-only blue" data-url="'
        				+ _contextPath+'/item/edit/'+ data +'" data-toggle="modal" onclick="javascript: loadItemForEdit(this);" title="Edit"><i class="icon-note"></i></a>';
        			}
	            },
            	{ "targets": [-1], "width": "3%", "sortable": false, "searchable": false, "className"  : "centered-cell",
	        		"render"  : function (data, type, row) {
        				return '<a class="btn btn-circle btn-icon-only blue" href="javascript:deleteItem('+data+');" title="Mark as Deleted"><i class="icon-trash"></i></a>';
        			}
	            }
            ],
            "columns": [
                          { "data": "code" },
                          { "data": "title" },
                          { "data": "price"},
                          { "data": "restaurant"},
                          { "data": "itemCategory"},
                          { "data": "isActive"},
                          { "data": "dateCreated" },
                          { "data": "lastUpdated" },
                          { "data": "mappingCode" },
                          { "data": "id" },
                          { "data": "id" }
                          ]
        } );
    } else {
    	itemDataTable.draw();
    }

}

function loadItemForEdit(btn) {
	var $modal = $('#item-edit-modal');
	$modal.on('hidden.bs.modal', function (e) {
		itemVariantDataTable = undefined;
		itemVarTranslationDataTable = undefined;
		});
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
	}, 0);
}

function loadItemForEditAfterSave(id) {
	var $modal = $('#item-edit-modal');
	$modal.on('hidden.bs.modal', function (e) {
		itemVariantDataTable = undefined;
		itemVarTranslationDataTable = undefined;
		});
    // create the backdrop and wait for next modal to be triggered
    $('body').modalmanager('loading');
    var url = _contextPath+'/item/edit/'+id;
    setTimeout(function(){
        $modal.load(url, '', function(){
	        $modal.modal({
	      	  backdrop: 'static',
	      	  keyboard: true
	      	  }
	        );
	      });
    }, 500);	
}


function saveItem(isEdit) {
	var formName = isEdit?"#itemEditForm": "#itemForm";
	var portletBodyName = isEdit?'#item-edit-portlet-body': '#item-portlet-body';
	$.ajax({
		async: true,
		type : "POST",
		processData: true,
		data : $(formName).serialize(),
		url : _contextPath + "/item/save",
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
						//$("#searchCode").val($("#itemForm #code").val()); this is select the newly created item in th grid only
						showMessage(json.message, portletBodyName);
						initItemDataTable();
						if(!isEdit) {
							debug ("CREATE MODE: "+ isEdit);
							if(confirm(json.message+"\r\n Would you like to continue editing this item?")) {
								$('#item-modal').modal('hide');
								loadItemForEditAfterSave(json.id);
							}else {
								$('#item-modal').modal('hide');
							}
						}
				} else {
					showError("An error has occured, please report this incident to system administrator...", 
							portletBodyName, false);
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				debug("Error while processing save item");
				$(portletBodyName).unblock();
				handleErrorResponse(jqXHR, textStatus, portletBodyName);
			});
			
}

function saveItemAddon() {
	$.ajax({
		async: true,
		type : "POST",
		processData: true,
		data : $("#itemAddonForm").serialize(),
		url : _contextPath + "/item/saveAddon/",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			$('#item-edit-portlet-body').block(blockUIOptions); 
		},
		complete: function(){
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				$('#item-edit-portlet-body').unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					showMessage(json.message, "#item-edit-portlet-body");
				} else {
					alert("An error has occured, please report this incident to system administrator...");
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				debug("Error while processing save item addon");
				$('#item-edit-portlet-body').unblock();
				handleErrorResponse(jqXHR, textStatus, "#item-edit-portlet-body");
			});
			
}

function deleteItem() {
	
}

function initItemVariantDataTable() {
    if (typeof itemVariantDataTable == 'undefined') {
    	itemVariantDataTable = $("#itemVariantList").DataTable( {
            "processing": true,
            "serverSide": true,
            "ajax":{
                "async ": true,
            	"url": _contextPath+"/item/listItemVariants",
                type: "post",  // method  , by default get
                "data": function ( d ) {
                    return $.extend( {}, d, {
                    	"itemId": $("#itemId").val()
                    	/*"searchTitle": $("#searchTitle").val(),
                    	"searchCategory": $("#searchCategory").val(),
                    	"searchSpiceType": $("#searchSpiceType").val(),
                    	"searchCuisineType": $("#searchCuisineType").val(),
                        "searchIsActive": $("#searchIsActive").val()*/
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
            "responsive": true,
            "searching": false,
            "columnDefs": [
                { "targets": [0], "width": "25%", "searchable": false, "className"  : "centered-cell"},
                { "targets": [1], "width": "25%", "searchable": false},
                { "targets": [2], "width": "5%", "searchable": false, "sortable": false},
                { "targets": [3], "width": "5%", "searchable": false, "sortable": false},
                { "targets": [4], "width": "20%", "searchable": false, "sortable": false},
                { "targets": [5], "width": "5%", "searchable": false, "sortable": false},
                { "targets": [6], "width": "5%", "searchable": false, "sortable": false},
				{ "targets": [7], "width": "5%", "searchable": false, "sortable": false},
				
            	{ "targets": [-2], "width": "3%", "sortable": false, "searchable": false, "className"  : "centered-cell",
	        		"render"  : function (data, type, row) {
        				return '<a class="btn btn-circle btn-icon-only blue" data-url="'
        				+ _contextPath+'/item/editItemVariant/'+ data +'" data-toggle="modal" onclick="javascript: loadItemVariantForEdit(this);" title="Edit"><i class="icon-note"></i></a>';
        			}
	            },
            	{ "targets": [-1], "width": "3%", "sortable": false, "searchable": false, "className"  : "centered-cell",
	        		"render"  : function (data, type, row) {
	        			if(row["isActive"]=="true"){
								return '<a class="btn btn-circle btn-icon-only blue" href="javascript:deleteItemVariant('+data+');" title="De-Activate Customization"><i class="icon-ban"></i></a>';
					    } else {
	        				return '<a class="btn btn-circle btn-icon-only blue" href="javascript:deleteItemVariant('+data+');" title="Activate Customization"><i class="icon-check"></i></a>';
	        			}
        			}
	            }
    	
            ],
            "columns": [
                          { "data": "title" },
                          { "data": "variant" },
                          { "data": "price"},
                          { "data": "approxPreparationTime"},
                          { "data": "description"},
                          { "data": "isActive"},
                          { "data": "dateCreated" },
                          { "data": "lastUpdated" },
                          { "data": "id" },
                          { "data": "id" }
                          ]
        } );
    } else {
    	itemVariantDataTable.draw();
    }

}

function createItemVariant() {
	var formName = "#itemVariantForm";
	var portletBodyName = '#item-variant-portlet-body';
	$.ajax({
		async: true,
		type : "POST",
		processData: true,
		data : $(formName).serialize(),
		url : _contextPath + "/item/saveItemVariant",
		"headers": {
			"accept": "application/json",
			"cache-control": "no-cache",
		},
		beforeSend: function(){
			$(portletBodyName).block(blockUIOptions); 
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				$(portletBodyName).unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					showMessage(json.message, '#item-edit-portlet-body');
					initItemVariantDataTable();
					$('#item-variant-modal').modal('hide');
				} else {
					showError("An error has occurred, please report this incident to system administrator...", 
							formName, false);
				}
			})
			.fail(
					function(jqXHR, textStatus) {
						debug("Error while processing save item variant");
						$(portletBodyName).unblock();
						handleErrorResponse(jqXHR, textStatus, formName);
					});
}

function updateItemVariant() {
	var formName = "#itemVariantEditForm"
	var portletBodyName = "#item-variant-edit-portlet-body";
	$.ajax({
		async: true,
		type : "POST",
		processData: true,
		data : $(formName).serialize(),
		url : _contextPath + "/item/saveItemVariant",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			$(portletBodyName).block(blockUIOptions); 
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				$(portletBodyName).unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
						showMessage(json.message, '#item-edit-portlet-body');
						initItemVariantDataTable();
						$('#item-variant-edit-modal').modal('hide');
				} else {
					showError("An error has occurred, please report this incident to system administrator...", 
							formName, false);
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				debug("Error while processing updating item variant");
				$(portletBodyName).unblock();
				handleErrorResponse(jqXHR, textStatus, formName);
			});
}

function loadItemVariantForEdit(btn) {
	var $modal = $('#item-variant-edit-modal');

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
    }, 0);
}

function deleteItem(id) {
	if(confirm("Are you sure you want to delete this record?")) {
		var portletBodyName = '#list-items';

		if(id!=null) {
			$.ajax({
				async: true,
				type : "DELETE",
				processData: false,
				url : _contextPath + "/item/deleteItem/"+id,
				"headers": {
				    "accept": "application/json",
				    "cache-control": "no-cache",
				  },
				beforeSend: function(){
					$(portletBodyName).block(blockUIOptions);
				}
			})
			.done(
					function(data, textStatus, jqXHR) {
						$(portletBodyName).unblock();
						var json = $.parseJSON(jqXHR.responseText);
						if (json.state == 'OK') {
							showMessage(json.message, portletBodyName);
							itemDataTable.draw();
						} else {
							handleErrorResponse(jqXHR, textStatus, portletBodyName);
						}
					})
			.fail(
					function(jqXHR, textStatus) {
						$(portletBodyName).unblock();
						var json = $.parseJSON(jqXHR.responseText);
						handleErrorResponse(jqXHR, textStatus, portletBodyName);
					});
			}
	}
	
}

function deleteItemVariant(id) {
	if(confirm("Are you sure you want to activate/de-activate this record?")) {
		var portletBodyName = '#item-edit-portlet-body';

		if(id!=null) {
			$.ajax({
				async: true,
				type : "DELETE",
				processData: false,
				url : _contextPath + "/item/toggleActivationOfItemVariant/"+id,
				"headers": {
				    "accept": "application/json",
				    "cache-control": "no-cache",
				  },
				beforeSend: function(){
					$(portletBodyName).block(blockUIOptions);
				}
			})
			.done(
					function(data, textStatus, jqXHR) {
						$(portletBodyName).unblock();
						var json = $.parseJSON(jqXHR.responseText);
						if (json.state == 'OK') {
							showMessage(json.message, portletBodyName);
							initItemVariantDataTable();
						} else {
							handleErrorResponse(jqXHR, textStatus, portletBodyName);
						}
					})
			.fail(
					function(jqXHR, textStatus) {
						$(portletBodyName).unblock();
						var json = $.parseJSON(jqXHR.responseText);
						handleErrorResponse(jqXHR, textStatus, portletBodyName);
					});
			}
	}
	
}

function initItemTranslationDataTable() {
    if (typeof itemVarTranslationDataTable == 'undefined') {
    	itemVarTranslationDataTable = $("#itemVariant_translation_tbl").DataTable( {
            "processing": true,
            "serverSide": true,
            "ajax":{
            	"url": _contextPath+"/itemTranslation/list?scope=item&itemId="+$("#itemId").val(), // json datasource
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
        				+ _contextPath+'/itemTranslation/edit/'+ data +'" data-toggle="modal" onclick="javascript: loadItemTranslationForEdit(this);" title="Edit Translation"><i class="icon-note"></i></a>';
        			}
	            },
            	{ "targets": [-1], "width": "5%", "sortable": false, "searchable": false, "className"  : "centered-cell",
	        		"render"  : function (data, type, row) {
        				return '<a class="btn btn-circle btn-icon-only blue" href="javascript:deleteItemTranslation('+data+');" title="Delete Translation"><i class="icon-trash"></i></a>';
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
    } else {
    	itemVarTranslationDataTable.draw();
    }
}

function createItemTranslation() {
	var formName = "#itemTranslationForm";
	var portletBodyName = '#itemTranslation-create-portlet-body';
	$.ajax({
		async: true,
		type : "POST",
		processData: true,
		data : $(formName).serialize(),
		url : _contextPath + "/itemTranslation/save",
		"headers": {
			"accept": "application/json",
			"cache-control": "no-cache",
		},
		beforeSend: function(){
			$(portletBodyName).block(blockUIOptions); 
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				$(portletBodyName).unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					showMessage(json.message, '#item-edit-portlet-body');
					initItemTranslationDataTable();
					$('#item-trans-modal').modal('hide');
				} else {
					showError("An error has occurred, please report this incident to system administrator...", 
							formName, false);
				}
			})
			.fail(
					function(jqXHR, textStatus) {
						debug("Error while processing save item variant");
						$(portletBodyName).unblock();
						handleErrorResponse(jqXHR, textStatus, formName);
					});
}

function loadItemTranslationForEdit(btn) {
	var $modal = $('#item-trans-edit-modal');

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
    }, 0);
}


function editItemTranslation() {
	var formName = "#itemTranslationEditForm";
	var portletBodyName = '#itemTranslation-edit-portlet-body';
	$.ajax({
		async: true,
		type : "POST",
		processData: true,
		data : $(formName).serialize(),
		url : _contextPath + "/itemTranslation/save",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			$(portletBodyName).block(blockUIOptions); 
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				$(portletBodyName).unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
						showMessage(json.message, '#item-edit-portlet-body');
						initItemTranslationDataTable();
						$('#item-trans-edit-modal').modal('hide');
				} else {
					showError("An error has occurred, please report this incident to system administrator...", 
							formName, false);
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				debug("Error while processing updating item variant");
				$(portletBodyName).unblock();
				handleErrorResponse(jqXHR, textStatus, formName);
			});
}

