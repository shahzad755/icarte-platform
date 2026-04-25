var branchName = '';

$(document).ready(function(){
    initSalesStats();
	initGeneralStats();
	initSalesCharts();
	
    $('#btnReoloadSalesStats').on('click', function(event){ initSalesStats(); });
    
    $('#btnReoloadGeneralStats').on('click', function(event){ initGeneralStats(); });
    
    $('#btnReoloadSalesGraphs').on('click', function(event){ initSalesCharts(); });
	
});

function initSalesStats(){
	loadDailySalesByBranch();
	loadCurrentMonthSalesByBranch();
	loadDailySalesByRest();
}

function initGeneralStats(){
	loadDailyOrdersCountByBranch();
	loadDailyOrdersCountByRestaurant();
	loadTotalItemCountByRestaurant();
}
/*
 statusCode: {
			401: function(){
			location.href = "/login/auth";
			} 
		}
 */
function loadDailySalesByBranch() {
	var target = $('#dailySalesByBranch');
	var targetVal = $('#dailySalesByBranchVal');
	var targetDesc = $('#dailySalesByBranchDesc');

	$.ajax({
		async: true,
		type : "GET",
		processData: true,
		url : _contextPath + "/dashboard/loadDailySalesByBranch",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			target.block({ message: $('#throbber1'), css: {width:'0px', border: '0px'},
                overlayCSS: { backgroundColor: '#212F3C', opacity: 0.6, border: '0px' } }); 
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				target.unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					
					targetVal.attr("data-value", json.data.salesToday);
					targetVal.counterUp();
					targetDesc.html(json.data.branchName); ;
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				debug("Error while loading dailySalesByBranch");
				target.unblock();
			});
}

function loadDailyOrdersCountByBranch() {
	var target = $('#dailyOrdersCountByBranch');
	var targetVal = $('#dailyOrdersCountByBranchVal');
	var targetDesc = $('#dailyOrdersCountByBranchDesc');

	$.ajax({
		async: true,
		type : "GET",
		processData: true,
		url : _contextPath + "/dashboard/loadDailyOrdersCountByBranch",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			target.block({ message: $('#throbber4'), css: {width:'0px', border: '0px'},
                overlayCSS: { backgroundColor: '#212F3C', opacity: 0.6, border: '0px' } }); 
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				target.unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					
					targetVal.attr("data-value", json.data.totalOrdersToday);
					targetVal.counterUp();
					targetDesc.html(json.data.branchName); ;
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				debug("Error while loading loadDailyOrdersCountByBranch");
				target.unblock();
			});
}

function loadCurrentMonthSalesByBranch() {
	var target = $('#currentMonthSalesByBranch');
	var targetVal = $('#currentMonthSalesByBranchVal');
	var targetDesc = $('#currentMonthSalesByBranchDesc');

	$.ajax({
		async: true,
		type : "GET",
		processData: true,
		url : _contextPath + "/dashboard/loadCurrentMonthSalesByBranch",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			target.block({ message: $('#throbber2'), css: {width:'0px', border: '0px'},
                overlayCSS: { backgroundColor: '#212F3C', opacity: 0.6, border: '0px' } }); 
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				target.unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					
					targetVal.attr("data-value", json.data.salesThisMonth);
					targetVal.counterUp();
					targetDesc.html(json.data.branchName); ;
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				debug("Error while loading currentMonthSalesByBranch");
				target.unblock();
			});
}

function loadDailySalesByRest() {
	var target = $('#dailySalesByRest');
	var targetVal = $('#dailySalesByRestVal');
	var targetDesc = $('#dailySalesByRestDesc');
	
	$.ajax({
		async: true,
		type : "GET",
		processData: true,
		url : _contextPath + "/dashboard/loadDailySalesByRestaurant",
		"headers": {
			"accept": "application/json",
			"cache-control": "no-cache",
		},
		beforeSend: function(){
			target.block({ message: $('#throbber3'), css: {width:'0px', border: '0px'},
				overlayCSS: { backgroundColor: '#212F3C', opacity: 0.6, border: '0px' } }); 
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				target.unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					
					targetVal.attr("data-value", json.data.salesToday);
					targetVal.counterUp();
					targetDesc.html(json.data.restaurantName); ;
				}
			})
			.fail(
					function(jqXHR, textStatus) {
						debug("Error while loading dailySalesByRest");
						target.unblock();
					});
}

function loadDailyOrdersCountByRestaurant() {
	var target = $('#dailyOrdersCountByRest');
	var targetVal = $('#dailyOrdersCountByRestVal');
	var targetDesc = $('#dailyOrdersCountByRestDesc');

	$.ajax({
		async: true,
		type : "GET",
		processData: true,
		url : _contextPath + "/dashboard/loadDailyOrdersCountByRestaurant",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			target.block({ message: $('#throbber5'), css: {width:'0px', border: '0px'},
                overlayCSS: { backgroundColor: '#212F3C', opacity: 0.6, border: '0px' } }); 
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				target.unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					
					targetVal.attr("data-value", json.data.totalOrdersToday);
					targetVal.counterUp();
					targetDesc.html(json.data.restaurantName); ;
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				debug("Error while loading dailyOrdersCountByRestaurant");
				target.unblock();
			});
}

function loadTotalItemCountByRestaurant() {
	var target = $('#totalItemCountByRest');
	var targetVal = $('#totalItemCountByRestVal');
	var targetDesc = $('#totalItemCountByRestDesc');

	$.ajax({
		async: true,
		type : "GET",
		processData: true,
		url : _contextPath + "/dashboard/loadTotalItemCount",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			target.block({ message: $('#throbber6'), css: {width:'0px', border: '0px'},
                overlayCSS: { backgroundColor: '#212F3C', opacity: 0.6, border: '0px' } }); 
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				target.unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					
					targetVal.attr("data-value", json.data.totalItems);
					targetVal.counterUp();
					targetDesc.html(json.data.restaurantName); ;
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				debug("Error while loading dailyOrdersCountByRestaurant");
				target.unblock();
			});
}

function initSalesCharts(){
	loadMonthlySalesByBranch();
	loadMonthlySalesByRestaurant();
}


function loadMonthlySalesByBranch() {
	var target = $('#branchSalesDiv');
	$.ajax({
		async: true,
		type : "GET",
		processData: true,
		url : _contextPath + "/dashboard/loadMonthlySalesByBranch",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			target.block({ message: $('#throbber7'), css: {width:'0px', border: '0px'},
                overlayCSS: { backgroundColor: '#212F3C', opacity: 0.6, border: '0px' } }); 
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				target.unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					$("#branchSales").html(data.sales.branchName);
					$("#defaultCurrency").html(data.sales.defaultCurrencySymbol);
					$("#branchSalesForYear").html(data.sales.year);
					$("#branchMonthlyGrandTotal").html(data.sales.grandTotal);
					
				    var ctx = jQuery("#branchMonthlySalesChart").get(0).getContext("2d");
				    var bar = new Chart.Bar(ctx, {data: data.sales, options: {
				        // String - Template string for single tooltips
				        tooltipTemplate: "<%if (label){%><%=label %>: <%}%><%= value + ' %' %>",
				         scales: {
				            yAxes: [{
				                ticks: {
				                	beginAtZero: true,
				                	/*min: 20,
				                	max: 100*/
				                }
				            }]
				        }
				    }});
					//$("#legend").html(bar.generateLegend());
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				debug("Error while loading dailyOrdersCountByRestaurant");
				target.unblock();
			});
}

function loadMonthlySalesByRestaurant() {
	var target = $('#restSalesDiv');
	$.ajax({
		async: true,
		type : "GET",
		processData: true,
		url : _contextPath + "/dashboard/loadMonthlySalesByRestaurant",
		"headers": {
		    "accept": "application/json",
		    "cache-control": "no-cache",
		  },
		beforeSend: function(){
			target.block({ message: $('#throbber8'), css: {width:'0px', border: '0px'},
                overlayCSS: { backgroundColor: '#212F3C', opacity: 0.6, border: '0px' } }); 
		}
	})
	.done(
			function(data, textStatus, jqXHR) {
				target.unblock();
				var json = $.parseJSON(jqXHR.responseText);
				if (json.state == 'OK') {
					$("#restSales").html(data.sales.restName);
					$("#defaultCurrencyRest").html(data.sales.defaultCurrencySymbol);
					$("#restSalesForYear").html(data.sales.year);
					$("#restMonthlyGrandTotal").html(data.sales.grandTotal);
					console.log(data);
				    var ctx = jQuery("#restMonthlySalesChart").get(0).getContext("2d");
				    var bar = new Chart.Line(ctx, {data: data.sales.data, options: {
				    }});
					//$("#legend").html(bar.generateLegend());
				}
			})
	.fail(
			function(jqXHR, textStatus) {
				debug("Error while loading dailyOrdersCountByRestaurant");
				target.unblock();
			});
}
