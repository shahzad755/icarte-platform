package com.armedialab

import org.springframework.security.core.context.SecurityContextHolder;

import grails.converters.JSON

import com.armedialab.entity.Staff
import com.armedialab.util.Utils;

class DashboardController {

	def springSecurityService
	def StatsService statsService
	
    def index() {
//		log.debug(">>>>>>>>>>>>>>>>>>>>> ${request.session.attributeNames*.toString()}")
	}
	
	def loadDailySalesByBranch(){
		if(!request.isUserInRole("ROLE_SUPERADMIN")) {
			def user = springSecurityService.loadCurrentUser()
			def staff = Staff.findByUser(user)
			def results = statsService.loadDailySalesByBranch(staff?.branch)
			def jsonData = [data: results?.getAt(0), state: "OK"]
					
			render jsonData as JSON
		}
	}
	
	def loadDailyOrdersCountByBranch(){
		if(!request.isUserInRole("ROLE_SUPERADMIN")) {
			def user = springSecurityService.loadCurrentUser()
			def staff = Staff.findByUser(user)
			def results = statsService.loadDailyOrdersCount(staff?.branch)
			def jsonData = [data: results?.getAt(0), state: "OK"]
			render jsonData as JSON
		}
	}

	def loadCurrentMonthSalesByBranch(){
		if(!request.isUserInRole("ROLE_SUPERADMIN")) {
			def user = springSecurityService.loadCurrentUser()
			def staff = Staff.findByUser(user)
			def results = statsService.loadCurrentMonthSalesByBranch(staff?.branch)
			def jsonData = [data: results?.getAt(0), state: "OK"]
			
			render jsonData as JSON
		}
	}

	def loadDailySalesByRestaurant(){
		if(!request.isUserInRole("ROLE_SUPERADMIN")) {
			def user = springSecurityService.loadCurrentUser()
			def staff = Staff.findByUser(user)
			def results = statsService.loadDailySalesByRestaurant(staff?.restaurant)
			def jsonData = [data: results?.getAt(0), state: "OK"]
			
			render jsonData as JSON
		}
	}

	def loadDailyOrdersCountByRestaurant(){
		if(!request.isUserInRole("ROLE_SUPERADMIN")) {
			def user = springSecurityService.loadCurrentUser()
			def staff = Staff.findByUser(user)
			def results = statsService.loadDailyOrdersCount(staff?.restaurant)
			def jsonData = [data: results?.getAt(0), state: "OK"]
			
			render jsonData as JSON
		}
	}
	
	def loadTotalItemCount(){
		if(!request.isUserInRole("ROLE_SUPERADMIN")) {
			def user = springSecurityService.loadCurrentUser()
			def staff = Staff.findByUser(user)
			def results = statsService.loadTotalItemCount(staff?.restaurant)
			def jsonData = [data: results?.getAt(0), state: "OK"]
			
			render jsonData as JSON
		}
	}

	def loadMonthlySalesByBranch(){
		if(!request.isUserInRole("ROLE_SUPERADMIN")) {
			def user = springSecurityService.loadCurrentUser()
			def staff = Staff.findByUser(user)
			def branch = staff?.branch
			def jsonData = ["sales": statsService.loadMonthlySalesDataByBranch(branch), state: "OK"]
			render jsonData as JSON
		}
	}
	
	def loadMonthlySalesByRestaurant(){
		if(!request.isUserInRole("ROLE_SUPERADMIN")) {
			def user = springSecurityService.loadCurrentUser()
			def jsonData = ["sales": statsService.loadMonthlySalesDataByRestaurant(Staff.findByUser(user)?.restaurant), state: "OK"]
			render jsonData as JSON
		}
	}
}
