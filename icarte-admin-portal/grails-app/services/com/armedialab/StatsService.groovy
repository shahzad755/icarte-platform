package com.armedialab

import grails.transaction.Transactional
import groovy.sql.Sql

import java.text.DecimalFormat

import com.armedialab.entity.Branch
import com.armedialab.entity.Months
import com.armedialab.entity.Orders
import com.armedialab.entity.Restaurant
import com.armedialab.util.Utils

@Transactional
class StatsService {

	def dataSource // datasource injection for complex queries
	def grailsApplication
	//def springSecurityService
	
	String LOAD_DAILY_SALES_QRY_BY_BRANCH = '''SELECT rest.id as restaurantId, rest.name as restaurantName, br.id as branchId, br.name as branchName, sum(ord.totalPrice) as totalOrderPrice FROM
                    Orders as ord, Restaurant as rest, Branch as br
                where
                    rest.id = br.restaurant
                and
                    br.id = ord.branch
                and
                    ord.orderDate > curdate()
                and
                    ord.statusType.id <> 4
                and
                    ord.branch = ?
                '''

	String LOAD_CURRENT_MONTH_SALES_QRY_BY_BRANCH = '''SELECT rest.id as restaurantId, rest.name as restaurantName, br.id as branchId, br.name as branchName, sum(ord.totalPrice) as totalOrderPrice FROM
                    Orders as ord, Restaurant as rest, Branch as br
                where
                    rest.id = br.restaurant
                and
                    br.id = ord.branch
                and
                    date_format(ord.orderDate, '%Y-%m') = date_format(now(), '%Y-%m')
                and
                    ord.statusType.id <> 4
                and
                    ord.branch = ?
                '''

	String LOAD_DAILY_SALES_QRY_BY_REST = '''SELECT rest.id as restaurantId, rest.name as restaurantName, sum(ord.totalPrice) as totalOrderPrice FROM
                    Orders as ord, Restaurant as rest
                where
                    rest.id = ord.restaurant
                and
                    ord.orderDate > curdate()
                and
                    ord.statusType.id <> 4
                and
                    ord.restaurant = ?
                '''
	String LOAD_MONTHLY_BRANCH_SALES_QRY =  '''select
                m.MONTH_NUM AS monthNumber,
                m.NAME AS month,
                IFNULL(YEAR(ord.order_date), date_format(now(), '%Y')) AS year,
                IFNULL(SUM(TOTAL_PRICE), 0) AS totalPrice,
				m.BAR_CHART_COLOR as backgroundColor
                    FROM months m left outer join orders ord on m.month_num = month(ord.order_date) 
                AND ord.status_type_id <> 4
                AND ord.order_date >= (CURRENT_DATE() - INTERVAL 1 YEAR)
                AND ord.BRANCH_ID =:branchId
             group by m.MONTH_NUM, year
             ORDER BY m.month_num'''

	public def loadDailySalesByBranch(Branch branch){
		def results = []
				if(branch) {
					def orders = Orders.executeQuery(
						LOAD_DAILY_SALES_QRY_BY_BRANCH, branch)
							results = orders?.collect {
						[
						 restaurantId: "${it[0]}",
						 restaurantName: "${it[1]}",
						 branchId: "${it[2]}",
						 branchName: "${it[3]}",
						 salesToday: "${it[4]?: 0}",
						 
						 ]
					}
				}
	}
			
	public def loadCurrentMonthSalesByBranch(Branch branch){
		def results = []
		if(branch) {
			def orders = Orders.executeQuery(LOAD_CURRENT_MONTH_SALES_QRY_BY_BRANCH, branch)
			results = orders?.collect {
				[
					restaurantId: "${it[0]}",
					restaurantName: "${it[1]}",
					branchId: "${it[2]}",
					branchName: "${it[3]}",
					salesThisMonth: "${it[4]?: 0}",

				]
			}
		}
	}
	
	public def loadDailySalesByRestaurant(Restaurant restaurant){
		def results = []
		if(restaurant) {
			def orders = Orders.executeQuery(LOAD_DAILY_SALES_QRY_BY_REST, restaurant)
			results = orders?.collect {
				[
					restaurantId: "${it[0]}",
					restaurantName: "${it[1]}",
					salesToday: "${it[2]?: 0}",

				]
			}
		}
	}

	public def loadDailyOrdersCount(Branch branch){
		def results = []
		if(branch) {
			def orders = Orders.executeQuery("Select br.name, count(ord.id) from Branch as br left outer join br.orders as ord where br=? and ord.orderDate > curdate() and ord.statusType.id <> 4", branch)
				results = orders?.collect {
				[
				 branchName: "${it[0]}",
				 totalOrdersToday: "${it[1]?: 0}",
				 ]
			}
		}
	}

	public def loadDailyOrdersCount(Restaurant restaurant){
		def results = []
		if(restaurant) {
			def orders = Orders.executeQuery("Select rest.name, count(ord.id) from Restaurant as rest left outer join rest.orders as ord where rest = ? and ord.orderDate > curdate() and ord.statusType.id <> 4", restaurant)
				results = orders?.collect {
				[
				 restaurantName: "${it[0]}",
				 totalOrdersToday: "${it[1]?: 0}",
				 ]
			}
		}
	}

	public def loadTotalItemCount(Restaurant restaurant){
		def results = []
		if(restaurant) {
			def orders = Orders.executeQuery("Select rest.name, count(item.id) from Item as item, Restaurant as rest where item.restaurant = rest and rest = ? and item.isActive = true and item.isDeleted = false", restaurant)
				results = orders?.collect {
				[
				 restaurantName: "${it[0]}",
				 totalItems: "${it[1]?: 0}",
				 ]
			}
		}
	}

	public def loadMonthlySalesDataByBranch(Branch branch){
		def results = []
		if(branch) {
			def config = grailsApplication.config
			def data = []
			def labels = []
			def backgroundColor = []
			BigDecimal orderTotal;
			BigDecimal grandTotal = new BigDecimal(0)
			def pattern = "${config.defaultCurrencySymbol} ##,###.##"
			def calendar = Calendar.getInstance(TimeZone.getDefault())
		    new Sql(dataSource).eachRow(LOAD_MONTHLY_BRANCH_SALES_QRY, branchId: branch.id) { row ->
				// Only show bars till the current month
				if(row.monthNumber.toInteger() <= (calendar.get(Calendar.MONTH) + 1)){
					orderTotal = (Math.round(row.totalPrice * 100) / 100)
					grandTotal = grandTotal.add(orderTotal)
					
					labels << "${row.month}"
					data << orderTotal
					backgroundColor << "${row.backgroundColor?: color.chart.bar.default}"
			    }
				results = [	"branchName": branch.name, 
							"year": Utils.getCurrentDateAsString("YYYY"),
							"defaultCurrencySymbol": config.defaultCurrencySymbol,
							"grandTotal": new DecimalFormat(pattern).format(grandTotal),
							"labels": labels, 
							"datasets": [
								   			[
							                  "label": "${config.label.sales.branch} for '${branch.name}'", 
							                  "backgroundColor": backgroundColor,
							                  "data": data
											]
						   				]
					      ]
		    }
		}
		
		return results
	}

	public def loadMonthlySalesDataByRestaurant(Restaurant restaurant){
		def results = []
		if(restaurant) {
			def config = grailsApplication.config
			def datasets = []
			def labels = Months.executeQuery("Select name as month FROM Months where MONTH_NUM <= month(curdate()) order by month_num asc")
			def backgroundColor = []
			def calendar = java.util.Calendar.getInstance(TimeZone.getDefault())
			BigDecimal orderTotal;
			BigDecimal grandTotal = new BigDecimal(0)
			def pattern = "${config.defaultCurrencySymbol} ##,###.##"
			
			def branches = Branch.executeQuery("Select id, name from Branch br where br.restaurant = ? order by br.id", restaurant)
			branches?.each() {
				def data = []
				
				new Sql(dataSource).eachRow(LOAD_MONTHLY_BRANCH_SALES_QRY, branchId: it[0]) { row ->
					if(row.monthNumber.toInteger() <= (calendar.get(Calendar.MONTH) + 1)){
						orderTotal = (Math.round(row.totalPrice * 100) / 100)
						grandTotal = grandTotal.add(orderTotal)
						data << orderTotal
					}
				}
				
				def options = [label: it[1], fill: false, lineTension: 0.5, borderCapStyle: 'butt', borderColor: getRandomColor(), borderJoinStyle: 'miter', pointRadius: 3, pointHitRadius: 10, data: data ]
				datasets << options
			}
			
			results = [	
						"restName": restaurant.name,
						"year": Utils.getCurrentDateAsString("YYYY"),
						"defaultCurrencySymbol": config.defaultCurrencySymbol,
						"grandTotal": new DecimalFormat(pattern).format(grandTotal),
						"data":  ["labels": labels, "datasets": datasets]
				 		]
		}
		return results
	}

	def getRandomColor() {
		def r = new java.util.Random();
		return "rgba(${r.nextInt(256)}, ${r.nextInt(256)}, ${r.nextInt(256)}, 1)"
	}
	
}
