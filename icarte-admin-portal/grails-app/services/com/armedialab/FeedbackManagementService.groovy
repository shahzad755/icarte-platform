package com.armedialab

import grails.transaction.Transactional
import grails.validation.ValidationException

import com.armedialab.entity.Customer
import com.armedialab.entity.FeedbackConfig
import com.armedialab.entity.FeedbackCustomer
import com.armedialab.entity.Staff
import com.armedialab.util.Constants

@Transactional
class FeedbackManagementService {
	def springSecurityService
	def grailsApplication

	def searchFeedbackConfig (def _criteria) {
		log.info("Searching for FeedbackConfig with given search criteria:>${_criteria}")
		def criteria = FeedbackConfig.createCriteria()
		def user = springSecurityService.loadCurrentUser()
		
		def authority = springSecurityService.authentication.authorities.find {
			it.authority == "ROLE_SUPERADMIN"
		}

		def feedbackConfigList = criteria.list(max:_criteria.maxRows, offset:_criteria.rowOffset) {
	
			//allow only items which belongs to user's restaurant
			if(!authority){
				if(log.isDebugEnabled()) {
					log.debug("User is not admin, only allow restaurant related items")
				}
				restaurant {
					eq ("id", Staff.findByUser(user)?.restaurant.id)
				}
			}

			feedbackConfigTranslations {
				eq("language.id", Constants.Languages.ENGLISH.getLanguagesId())
			}
			
			if(_criteria.data['search[value]']) {
				feedbackConfigTranslations {
					and {
						ilike ("title", _criteria.data['search[value]']+"%")
					}
				}
			}
			
/*			if(_criteria.data.srchFeedbackType) {
				feedbackType {
					eq ("id", _criteria.data.srchFeedbackType)
				}
			}
			
*/			//Handle Title as sorting column differently...
			if("title".equals(_criteria.sortColumn)){
				feedbackConfigTranslations {
					eq("language.id", Constants.Languages.ENGLISH.getLanguagesId())
					order ("title", _criteria.sortOrder)
				}
			} else if("feedbackType".equals(_criteria.sortColumn)){
					feedbackType {
						order ("name", _criteria.sortOrder)
					}
				} else {
					order (_criteria.sortColumn, _criteria.sortOrder)
					}
				
		}

		def translation = null
		def results = feedbackConfigList.collect {
			translation = it.getTranslation()
			[DT_RowId: "${it.id}", 
				title: "${translation.title?:'-'}",
				feedbackType: "${it.feedbackType?.name?:'-'}",
				description: "${translation.description?:'-'}",
				isRequired: "${it.isRequired==true?'True':'False'}",
				isActive: "${it.isActive==true?'True':'False'}",
				id: "${it.id}"]
		}

		def totalRows = feedbackConfigList.totalCount
		def numberOfPages = Math.ceil(totalRows / _criteria.maxRows)
		if(log.isDebugEnabled()) {
			log.debug("Total AddonTranslation records found [${totalRows}] with given search criteria:>${_criteria}, numberOfPages: ${numberOfPages}")
		}
		return ["totalRows": totalRows,
			"records": results,
			"numberOfPages": numberOfPages]
	}
	
	def saveCustomerFeedback(Customer customer, List<FeedbackCustomer> feedback){
		if(feedback){
			for (f in feedback) {
				f.save(true)
			}
		}else {
			throw new ValidationException("Required parameters are missing from the request. Please contact your administrator!", null)
		}
	}

}
