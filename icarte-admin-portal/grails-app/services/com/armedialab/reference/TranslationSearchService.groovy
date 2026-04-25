package com.armedialab.reference

import grails.transaction.Transactional

import com.armedialab.entity.CuisineTranslation
import com.armedialab.entity.FeedbackConfigTranslation
import com.armedialab.entity.Item
import com.armedialab.entity.ItemCategoryTranslation
import com.armedialab.entity.ItemVariant
import com.armedialab.entity.ItemVariantTranslation
import com.armedialab.entity.RestaurantEventTranslation
import com.armedialab.entity.RestaurantTranslation
import com.armedialab.util.Constants

@Transactional
class TranslationSearchService {

	def searchRestaurantTranslation (def _criteria) {
		log.debug("Searching for RestaurantTranslation with given search criteria:>${_criteria}")
		def criteria = RestaurantTranslation.createCriteria()
		
		def translations = criteria.list(max:_criteria.maxRows, offset:_criteria.rowOffset) {
	
			eq ("restaurant.id", _criteria.data.restaurantId as Long)

			language { // this closure allows innerjoin
				ne ("id", Constants.Languages.ENGLISH.getLanguagesId())
			}

			if(_criteria.data["search[value]"]) {
				like ("title", "%${_criteria.data['search[value]'].toUpperCase()}%")
			}
			if(_criteria.data.srchLanguage) {
				eq ("language.name", _criteria.data.srchLanguage)
			}
			
			order (_criteria.sortColumn, _criteria.sortOrder)
		}

		def results = translations.collect {
			[DT_RowId: "${it.id}",
				title: "${it.title?:'-'}",
				language: "${it.language?.name?:'-'}",
				description: "${it.description?:'-'}",
				showDescription: "${it.showDescription==true?'True':'False'}",
				id: "${it.id}"]
		}

		def totalRows = translations.totalCount
		def numberOfPages = Math.ceil(totalRows / _criteria.maxRows)

		if(log.debugEnabled) {
			log.debug("Total records found [${totalRows}] with given search criteria:>${_criteria}")
			log.debug("numberOfPages: ${numberOfPages}")
		}

		return ["totalRows": totalRows,
			"records": results,
			"numberOfPages": numberOfPages]
	}

	def searchCuisineTranslation (def _criteria) {
		log.debug("Searching for Cuisine with given search criteria:>${_criteria}")
		def criteria = CuisineTranslation.createCriteria()
		
		def translations = criteria.list(max:_criteria.maxRows, offset:_criteria.rowOffset) {
			
			eq ("cuisineType.id", _criteria.data.cuisineTypeId as Long)
			
			language { // this closure allows innerjoin
				ne ("id", Constants.Languages.ENGLISH.getLanguagesId())
			}

			if(_criteria.data["search[value]"]) {
				like ("title", "%${_criteria.data['search[value]'].toUpperCase()}%")
			}
			if(_criteria.data.srchLanguage) {
				eq ("language.name", _criteria.data.srchLanguage)
			}
			
			order (_criteria.sortColumn, _criteria.sortOrder)
		}
		
		def results = translations.collect {
			[DT_RowId: "${it.id}",
			 title: "${it.title?:'-'}",
			 language: "${it.language?.name?:'-'}",
			 description: "${it.description?:'-'}",
			 showDescription: "${it.showDescription==true?'True':'False'}",
			 id: "${it.id}"]
		}
		
		def totalRows = translations.totalCount
				def numberOfPages = Math.ceil(totalRows / _criteria.maxRows)
				
				if(log.debugEnabled) {
					log.debug("Total CuisineTranslation records found [${totalRows}] with given search criteria:>${_criteria}")
					log.debug("numberOfPages: ${numberOfPages}")
				}
		
		return ["totalRows": totalRows,
		        "records": results,
		        "numberOfPages": numberOfPages]
	}
	
	def searchItemCategoryTranslation (def _criteria) {
		log.debug("Searching for ItemCategoryTranslation with given search criteria:>${_criteria}")
		def criteria = ItemCategoryTranslation.createCriteria()
		
		def translations = criteria.list(max:_criteria.maxRows, offset:_criteria.rowOffset) {
	
			eq ("itemCategory.id", _criteria.data.itemCategoryId as Long)

			language { // this closure allows innerjoin
				ne ("id", Constants.Languages.ENGLISH.getLanguagesId())
			}

			if(_criteria.data["search[value]"]) {
				like ("title", "%${_criteria.data['search[value]'].toUpperCase()}%")
			}
			if(_criteria.data.srchLanguage) {
				eq ("language.name", _criteria.data.srchLanguage)
			}
			
			order (_criteria.sortColumn, _criteria.sortOrder)
		}

		def results = translations.collect {
			[DT_RowId: "${it.id}",
				title: "${it.title?:'-'}",
				language: "${it.language?.name?:'-'}",
				description: "${it.description?:'-'}",
				showDescription: "${it.showDescription==true?'True':'False'}",
				id: "${it.id}"]
		}

		def totalRows = translations.totalCount
		def numberOfPages = Math.ceil(totalRows / _criteria.maxRows)

		if(log.debugEnabled) {
			log.debug("Total ItemCategoryTranslation records found [${totalRows}] with given search criteria:>${_criteria}")
			log.debug("numberOfPages: ${numberOfPages}")
		}

		return ["totalRows": totalRows,
			"records": results,
			"numberOfPages": numberOfPages]
	}

	def searchItemVariantTranslation (def _criteria) {
		log.debug("Searching for ItemVariantTranslation with given search criteria:>${_criteria}")
		def criteria = ItemVariantTranslation.createCriteria()
		
		def translations = criteria.list(max:_criteria.maxRows, offset:_criteria.rowOffset) {
			if("item".equals(_criteria.data.scope)) {//if scope is item then only show the translations for primary item variant
				ItemVariant iVar = ItemVariant.findWhere(item: Item.load(_criteria.data.itemId?.toLong()), 
					isPrimary: true)
				eq ("itemVariant", iVar)
				language { // this closure allows innerjoin
					ne ("id", Constants.Languages.ENGLISH.getLanguagesId())
				}
			} else {
				eq ("itemVariant.id", _criteria.data.itemVariantId as Long)
					//eq ("isDefault", false) either use this or below
					language { // this closure allows innerjoin
						eq ("id", Constants.Languages.ENGLISH.getLanguagesId())
					}
			}
			
			if(_criteria.data["search[value]"]) {
				like ("title", "%${_criteria.data['search[value]'].toUpperCase()}%")
			}
			if(_criteria.data.srchLanguage) {
				eq ("language.name", _criteria.data.srchLanguage)
			}
			
			order (_criteria.sortColumn, _criteria.sortOrder)
		}

		def results = translations.collect {
			[DT_RowId: "${it.id}",
				title: "${it.title?:'-'}",
				language: "${it.language?.name?:'-'}",
				description: "${it.description?:'-'}",
				showDescription: "${it.showDescription==true?'True':'False'}",
				id: "${it.id}"]
		}

		def totalRows = translations.totalCount
		def numberOfPages = Math.ceil(totalRows / _criteria.maxRows)

		if(log.debugEnabled) {
			log.debug("Total ItemCategoryTranslation records found [${totalRows}] with given search criteria:>${_criteria}")
			log.debug("numberOfPages: ${numberOfPages}")
		}

		return ["totalRows": totalRows,
			"records": results,
			"numberOfPages": numberOfPages]
	}

	def searchFeedbackConfigTranslation (def _criteria) {
		log.debug("Searching for FeedbackConfigTranslation with given search criteria:>${_criteria}")
		def criteria = FeedbackConfigTranslation.createCriteria()
		
		def translations = criteria.list(max:_criteria.maxRows, offset:_criteria.rowOffset) {
	
			eq ("feedbackConfig.id", _criteria.data.feedbackConfigId as Long)
			
			language { // this closure allows innerjoin
				ne ("id", Constants.Languages.ENGLISH.getLanguagesId())
			}

			if(_criteria.data["search[value]"]) {
				like ("title", "%${_criteria.data['search[value]'].toUpperCase()}%")
			}
			if(_criteria.data.srchLanguage) {
				eq ("language.name", _criteria.data.srchLanguage)
			}
			
			order (_criteria.sortColumn, _criteria.sortOrder)
		}

		def results = translations.collect {
			[DT_RowId: "${it.id}",
				title: "${it.title?:'-'}",
				language: "${it.language?.name?:'-'}",
				description: "${it.description?:'-'}",
				showDescription: "${it.showDescription==true?'True':'False'}",
				id: "${it.id}"]
		}

		def totalRows = translations.totalCount
		def numberOfPages = Math.ceil(totalRows / _criteria.maxRows)

		if(log.debugEnabled) {
			log.debug("Total FeedbackConfigTranslation records found [${totalRows}] with given search criteria:>${_criteria}")
			log.debug("numberOfPages: ${numberOfPages}")
		}

		return ["totalRows": totalRows,
			"records": results,
			"numberOfPages": numberOfPages]
	}
	
	def searchRestaurantEventTranslation (def _criteria) {
		if(log.isDebugEnabled())
			log.debug("Searching for ${RestaurantEventTranslation} with given search criteria:>${_criteria}")
		def criteria = RestaurantEventTranslation.createCriteria()
		
		def translations = criteria.list(max:_criteria.maxRows, offset:_criteria.rowOffset) {
			
			eq ("restaurantEvent.id", _criteria.data.restaurantEventId as Long)
			
			language { // this closure allows innerjoin
				ne ("id", Constants.Languages.ENGLISH.getLanguagesId())
			}

			if(_criteria.data["search[value]"]) {
				like ("title", "%${_criteria.data['search[value]'].toUpperCase()}%")
			}
			if(_criteria.data.srchLanguage) {
				eq ("language.name", _criteria.data.srchLanguage)
			}
			
			order (_criteria.sortColumn, _criteria.sortOrder)
		}
		
		def results = translations.collect {
			[DT_RowId: "${it.id}",
			 title: "${it.title?:'-'}",
			 language: "${it.language?.name?:'-'}",
			 description: "${it.description?:'-'}",
			 showDescription: "${it.showDescription==true?'True':'False'}",
			 id: "${it.id}"]
		}
		
		def totalRows = translations.totalCount
				def numberOfPages = Math.ceil(totalRows / _criteria.maxRows)
				
				if(log.debugEnabled) {
					log.debug("Total RestaurantEventTranslation records found [${totalRows}] with given search criteria:>${_criteria}")
					log.debug("numberOfPages: ${numberOfPages}")
				}
		
		return ["totalRows": totalRows,
				"records": results,
				"numberOfPages": numberOfPages]
	}
}
