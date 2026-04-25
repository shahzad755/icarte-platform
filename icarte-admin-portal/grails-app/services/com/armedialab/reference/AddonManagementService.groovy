package com.armedialab.reference

import grails.transaction.Transactional

import com.armedialab.entity.AddonTranslation
import com.armedialab.util.Constants

@Transactional
class AddonManagementService {

	def searchAddonTranslation (def _criteria) {
		log.info("Searching for AddonTranslation with given search criteria:>${_criteria}")
		def criteria = AddonTranslation.createCriteria()
		
		def translations = criteria.list(max:_criteria.maxRows, offset:_criteria.rowOffset) {
	
			eq ("addon.id", _criteria.data.addonId as Long)
			language { // this closure allows innerjoin
				ne ("id", Constants.Languages.ENGLISH.getLanguagesId())
			}

/*			if(_criteria.data.srchRequestType) {
				eq ("requestType.id", _criteria.data.srchRequestType as Long)
			}*/
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

		log.info("Total AddonTranslation records found [${totalRows}] with given search criteria:>${_criteria}")
		log.info("numberOfPages: ${numberOfPages}")

		return ["totalRows": totalRows,
			"records": results,
			"numberOfPages": numberOfPages]
	}

}
