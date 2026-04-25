'use strict';
var usersDataTable;

$(document).ready(function() {
	$("#btnSearchUsers").on("click", function(){
		initUsersDataTable();
	});
    var $modal = $('#user-role-modal');

    $('#btn-user-role').on('click', function(){
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

    if(_action == 'profile') {
    	$('.page-bar').hide();
    }
});

function initUsersDataTable() {
        if (typeof usersDataTable  == 'undefined') {
        	usersDataTable = $("#usersList").DataTable( {
                "processing": true,
                "serverSide": true,
                "ajax":{
                	"url": _contextPath+"/user/list",
                    type: "post",
                    "data": function ( d ) {
                        return $.extend( {}, d, {
                        	"username": $("#userSearchForm #username").val(),
                        	"email": $("#userSearchForm #email").val(),
                        	"staffCode": $("#userSearchForm #staffCode").val(),
                        	"mobile": $("#userSearchForm #mobile").val()
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
                    { "targets": [0], "searchable": false, "sortable": true},
                    { "targets": [1], "searchable": false, "sortable": true},
                    { "targets": [2], "searchable": false, "sortable": false},
                    { "targets": [3], "searchable": false, "sortable": false},
                    { "targets": [4], "searchable": false, "sortable": false},
                    { "targets": [5], "searchable": false, "sortable": false},
                    { "targets": [6], "searchable": false, "sortable": false},
                    { "targets": [7], "searchable": false, "sortable": true},
                    { "targets": [8], "searchable": false, "sortable": false},
    	        	{ "targets": [-1], "width": "5%", "sortable": false, "searchable": false, "className"  : "centered-cell",
    	        		"render"  : function (data, type, row) {
    	    				return '<a href="'+ _contextPath + '/'+ _controller + '/edit/'+ data +'" class="btn btn-circle btn-icon-only blue" title="Edit User"><i class="icon-note"></i></a>';
    	    			}
    	            }
                ],
                "columns": [
                              { "data": "username" },
                              { "data": "staffCode" },
                              { "data": "firstName" },
                              { "data": "lastName" },
                              { "data": "mobile" },
                              { "data": "email"},
                              { "data": "restaurant" },
                              { "data": "branch" },
                              { "data": "enabled" },
                              { "data": "id" }
                              ],
               "dom": "<'row' <'col-md-12'B>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", // horizobtal scrollable datatable
                              
            } );
        } else {
        	usersDataTable.draw();
        }
 }

function saveUserRoles(){
	var modalBody = "#user-roles-portlet-body";
	$.ajax({
		async: true,
		type : "POST",
		processData: true,
		data : $("#userRoleForm").serialize(),
		url : _contextPath + "/user/saveUserRoles/",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			$(modalBody).block(); 
		},
		complete: function(){
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				$(modalBody).unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					showMessage(json.message, modalBody);
				} else {
					alert("An error has occured, please report this incident to system administrator...");
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				debug("Error while processing save item addon");
				$(modalBody).unblock();
				handleErrorResponse(jqXHR, textStatus, modalBody);
			});

}
	
