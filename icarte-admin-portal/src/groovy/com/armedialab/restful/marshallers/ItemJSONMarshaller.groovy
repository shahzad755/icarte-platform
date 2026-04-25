package com.armedialab.restful.marshallers

import grails.web.JSONBuilder

import com.armedialab.restful.CarteService
import com.armedialab.util.Utils

class ItemJSONMarshaller implements Marshaller {

	CarteService carteService
	
	public ItemJSONMarshaller(CarteService carteService) {
		super();
		this.carteService = carteService;
	}

	@Override
	public String marshall(def itemServerResponse) {
		def r = itemServerResponse.restaurant
		def builder = new JSONBuilder()
		def result = builder.build {
			responseCode = itemServerResponse.responseCode
			requestType = itemServerResponse.requestType
			isSuccess = itemServerResponse.success
			errorDetails = itemServerResponse.errorDetails
			if(itemServerResponse.success && r) {
				model = {
					items = array {
						def primaryVariant = null
						for (i in itemServerResponse.items) {
							primaryVariant = i.primaryVariant
							item (itemId: i.id, categoryId: itemServerResponse.itemCategory?.id,
									primaryVariantId: primaryVariant.id,
									price: primaryVariant.price,
									approxPreperationTime: primaryVariant.approxPreperationTime,
									tags: i.tags,
									translations: primaryVariant.getActiveTranslations(),
									itemVariants: carteService.loadItemVariants(i),
									addons: carteService.loadItemAddons(i),
									spiceType: [spiceTypeId: i.spiceType?.id, imageUrl: i.spiceType?.imageUrl, 
										translations: i.spiceType?.getActiveTranslations()],
									cusineType: [cuisineTypeId: i.cuisineType?.id, 
										imageUrl: Utils.joinImagePath(carteService.getCuisineTypeImagesPath(i.cuisineType), i.cuisineType?.imageUrl), 
										translations: i.cuisineType?.getActiveTranslations()],
									mediaContents: carteService.getItemMediaContent(i)
								)
						}
					}
				}
			}
		}
		return result;
	}

}
