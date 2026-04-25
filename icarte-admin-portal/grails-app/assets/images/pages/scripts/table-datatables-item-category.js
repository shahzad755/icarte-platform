var TableDatatablesResponsive = function () {

    var initTable1 = function () {
        var table = $('#itemCatgoryList');

        var oTable = table.dataTable({
            "processing": true,
            "serverSide": true,
            "ajax":{
            	"url": _contextPath+"/"+_controller+"/list", // json datasource
                type: "post",  // method  , by default get
                error: function(){  // error handling
                    alert('Error loading data from server');
                }
            },
        	
            // Internationalisation. For more info refer to http://datatables.net/manual/i18n
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

            // Or you can use remote translation file
            //"language": {
            //   url: '//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Portuguese.json'
            //},

            // setup buttons extentension: http://datatables.net/extensions/buttons/
            buttons: [
                      { extend: 'copy', className: 'btn red btn-outline' },
                      { extend: 'pdf', className: 'btn green btn-outline' },
                      { extend: 'excel', className: 'btn yellow btn-outline ' },
                      { extend: 'csv', className: 'btn purple btn-outline ' },
                      { extend: 'colvis', className: 'btn dark btn-outline', text: 'Columns'}
            ],
            "columnDefs": [
                           { "targets": [0], "width": "30%", "searchable": false,
                        	   "render"  : function (data, type, row) {
                   				return '<a href="'
                   				+ _contextPath+'/'+_controller+'/show/'+ row['id'] +'" title="Show Record">'+ data +'</a>';
                   				}               
                           },
                           { "targets": [2], "searchable": false, "sortable": false},
                           { "targets": [3], "searchable": true, "sortable": true},
                           { "targets": [4], "searchable": true, "sortable": false},
                           { "targets": [5], "width": "1%", "searchable": true, "sortable": false},
                           { "targets": [-1], "width": "1%", "sortable": false, "searchable": false, "className"  : "centered-cell",
                        	   "render"  : function (data, type, row) {
                   					return '<a class="btn btn-circle btn-icon-only blue" href="'
                   					+ _contextPath+'/'+_controller+'/edit/'+ data +'" title="Edit"><i class="icon-note"></i></a>';
                   				}
                           }
                       ],
                       
                       	"columns": [
                         { "data": "title" },
                         { "data": "description"},
                         { "data": "mappingCode"},
                         { "data": "menuTitle"},
                         { "data": "isActive"},
                         
                         { "data": "id" }
                        ],
            
            // setup responsive extension: http://datatables.net/extensions/responsive/
            responsive: true,
            "searching": true,
            "aaSorting": []
           // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
            // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js). 
            // So when dropdowns used the scrollable div should be removed. 
            //"dom": "<'row' <'col-md-12'T>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",
        });
        
        oTable.fnFilterOnReturn();
    }

    return {

        //main function to initiate the module
        init: function () {

            if (!jQuery().dataTable) {
                return;
            }

            initTable1();
          
        }

    };

}();

jQuery(document).ready(function() {
    TableDatatablesResponsive.init();
    
    var sortable = $("#sortable").sortable({
    	items: "tr",
    	cursor: 'move',
    	helper: fixHelper,
    	opacity: 0.6,
    	update: function() {
			$("#itemCatListBody").block(blockUIOptions); 
		    var orderedList = sortable.sortable( "serialize" );
			$.ajax({
				async: true,
				type : "POST",
				processData: true,
		        url: _contextPath+ "/" + _controller +"/updateDisplayOrder",
		        data: orderedList,
				"headers": {
				    "accept": "application/json",
				    "cache-control": "no-cache",
				  }
			})
			.done(
					function(data, textStatus, jqXHR) {
						resetMessageAndErrors();
						$("#itemCatListBody").unblock(); 
						var json = $.parseJSON(jqXHR.responseText);
						if (json.state == 'OK') {
							showMessage(json.message, "#itemCatListBody");
						} else {
							alert("An error has occured, please report this incident to system administrator...");
						}
					})
			.fail(
					function(jqXHR, textStatus) {
						resetMessageAndErrors();
						$("#itemCatListBody").unblock(); 
						handleErrorResponse(jqXHR, textStatus, "#itemCatListBody");
					});
        }
    });
    sortable.disableSelection();
	showMessage("Note: You can 'drag and drop' the category to change the display order on the client", "#itemCatListBody");

});