var TableDatatablesResponsive = function () {

    var initTable1 = function () {
        var table = $('#restaurantEvents_list');

        var oTable = table.dataTable({
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
                "search": "Search:",
                "zeroRecords": "No matching records found"
            },

            // Or you can use remote translation file
            //"language": {
            //   url: '//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Portuguese.json'
            //},

            // setup buttons extentension: http://datatables.net/extensions/buttons/
            buttons: [
                      { extend: 'pdf', className: 'btn green btn-outline' },
                      { extend: 'csv', className: 'btn purple btn-outline ' },
                      { extend: 'colvis', className: 'btn dark btn-outline', text: 'Columns'}
            ],
            // setup responsive extension: http://datatables.net/extensions/responsive/
            responsive: {
                details: {
                   
                }
            },
            "responsive": true,
            "searching": true,
            "columnDefs": [
               { "targets": [0], "width": "50%"},
               { "targets": [1], "width": "15%", "sortable": false},
               { "targets": [2], "width": "15%", "sortable": false},
               { "targets": [3], "width": "10%", "sortable": false},
               { "targets": [4], "width": "5%", "sortable": false},
               { "targets": [5], "width": "5%", "sortable": false}
            ],
            "order": [
                [1, 'desc']
            ],
            
            "lengthMenu": [
                [10, 15, 20, -1],
                [10, 15, 20, "All"] // change per page values here
            ],
            "dom": "<'row' <'col-md-12'B>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", // horizobtal scrollable datatable

            // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
            // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js). 
            // So when dropdowns used the scrollable div should be removed. 
            //"dom": "<'row' <'col-md-12'T>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",
        });
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
    if(_action != 'index' || _action == 'show') {
	    if (jQuery().datetimepicker) {
	    	$(".datetime").datetimepicker({
	            isRTL: App.isRTL(),
	            format: "yyyy-mm-dd hh:ii",
	            autoclose: true,
	            todayBtn: true,
	            pickerPosition: (App.isRTL() ? "bottom-right" : "bottom-left"),
	            minuteStep: 10
	        });
	    	if (jQuery().datepicker) {
	            $('.date').datepicker({
	            	isRTL: App.isRTL(),
	                rtl: App.isRTL(),
	                orientation: "left",
	                autoclose: true,
	                format: "yyyy-mm-dd",
	                todayBtn: true,
		            pickerPosition: (App.isRTL() ? "bottom-right" : "bottom-left")	                
	            });
	        }
	    }
    }
});