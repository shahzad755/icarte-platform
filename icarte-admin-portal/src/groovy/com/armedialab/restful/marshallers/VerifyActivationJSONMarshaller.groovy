package com.armedialab.restful.marshallers

import grails.web.JSONBuilder

import com.armedialab.restful.CarteService
import com.armedialab.restful.dto.ServerResponse
import com.armedialab.util.Utils

class VerifyActivationJSONMarshaller implements Marshaller {

	CarteService carteService
	
	public VerifyActivationJSONMarshaller(CarteService carteService) {
		super();
		this.carteService = carteService;
	}

	@Override
	def String marshall(def verifyActivation) {
		def r = verifyActivation.restaurant
		def restaurantImagePath = carteService.getRestaurantImagesPath(r)
		def isAccountBlockedOrDeletedOrCancelled = r.accountBlocked || r.accountCancelled || r.accountDeleted || verifyActivation.device?.isBlocked || !verifyActivation.device?.isActive
		
		def builder = new JSONBuilder()
		def result = builder.build {
			responseCode = verifyActivation.responseCode
			requestType = verifyActivation.requestType
			isSuccess = verifyActivation.success
			errorDetails = verifyActivation.errorDetails
			if(verifyActivation.success && r) {
				model = {
					/*resturantId 	= r.id*/
					name			= r.name
					restaurantCode	= r.restaurantCode
					activationKey 	= r.activationKey
					isBlocked		= isAccountBlockedOrDeletedOrCancelled
					logoSmall		= Utils.joinImagePath(restaurantImagePath, r.logoSmall)
					logoLarge		= Utils.joinImagePath(restaurantImagePath, r.logoLarge)
					theme			= r.theme
					backgroundImage	= Utils.joinImagePath(restaurantImagePath, r.bgImage)
					deviceRegistrationCode = verifyActivation.device?.registrationCode
					applicationMode = verifyActivation.device?.applicationMode
					tableReference 	= verifyActivation.device?.servingTable?.tableRefNumber?:null
					contactNumberMandatory 	= verifyActivation.device?.isCustContactMandatory
					imagePath = verifyActivation.baseImageUrl
					if(!isAccountBlockedOrDeletedOrCancelled) {
						translations = {
							for (tr in verifyActivation.restaurantTranslations) {
								"${tr.language.code}" (translationId: tr.id, 
										title: tr.title, 
										description: tr.description,
										languageId: tr.language.id)
							}
						}
						
						accountType = {
							accountTypeId = verifyActivation.accountType.id
							accountName = verifyActivation.accountType.name
						}
						
						menus = array {
							for (m in verifyActivation.menus) {
								menu (menuId: m.id, name: m.title, 
									categories: carteService.convertCategoriesToMap(m.getActiveCategories(), r.id))
							}
						}
						
						events = array {
							def eventImagePath = null
							for (ev in verifyActivation.events) {
								eventImagePath = carteService.getEventsImagePath(ev)
								event (eventId: ev.id, eventDate: ev.eventDate, imageURL: Utils.joinImagePath(eventImagePath, ev.imageUrl),
									translations : ev.getActiveTranslations()
								)
							}
						}
						
						feedbackForm = {
							feedbackFields = array {
								for (feed in verifyActivation.feedbackConfigs) {
									feedbackField (feedbackFieldId: feed.id, feedbackType: feed.feedbackType.id, required: feed.isRequired, 
										translations: feed.getActiveTranslations())
								}
							}
						}
						
						branches = array {
							for (br in verifyActivation.branches) {
								branch (branchId: br.id, branchName: br.name,
									address : carteService.convertAddressToMap(br.address))
							}
						}
					}
				}
			}
		}
		return result.toString()
	}
}
