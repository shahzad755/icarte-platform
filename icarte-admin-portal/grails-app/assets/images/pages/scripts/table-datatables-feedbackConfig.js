'use strict';
var feedbackConfigDataTable;

$(document).ready(function() {
    //initialize the data table
	initFeedbackConfigDataTable();
	$("#feedbackConfigList").dataTable().fnFilterOnReturn();
});

function initFeedbackConfigDataTable() {
    if (typeof feedbackConfigDataTable == 'undefined') {
    	feedbackConfigDataTable = $("#feedbackConfigList").DataTable( {
            "processing": true,
            "serverSide": true,
            "ajax":{
            	"url": _contextPath+"/feedbackConfig/list", // json datasource
                type: "get",  // method  , by default get
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
               { "targets": [0], "width": "45%", "searchable": false,
            	   "render"  : function (data, type, row) {
       				return '<a href="'
       				+ _contextPath+'/feedbackConfig/show/'+ row['id'] +'" title="Show Record">'+ data +'</a>';
       				}               
               },
               { "targets": [1], "width": "15%", "searchable": false},
               { "targets": [2], "width": "30%", "searchable": false, "sortable": false},

            	{ "targets": [-1], "width": "5%", "sortable": false, "searchable": false, "className"  : "centered-cell",
	        		"render"  : function (data, type, row) {
        				return '<a class="btn btn-circle btn-icon-only blue" href="'
        				+ _contextPath+'/feedbackConfig/edit/'+ data +'" title="Edit"><i class="icon-note"></i></a>';
        			}
	            }
            ],
            "columns": [
                          { "data": "title" },
                          { "data": "feedbackType" },
                          { "data": "description"},
                          { "data": "isRequired"},
                          { "data": "isActive"},
                          
                          { "data": "id" }
                          ]
        } );
    	
    }

}