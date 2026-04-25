package com.armedialab.restful

import grails.transaction.Transactional
import grails.validation.ValidationException

import com.armedialab.FeedbackManagementService
import com.armedialab.ItemManagementService
import com.armedialab.OrdersManagementService;
import com.armedialab.ServingTableRequestManagementService
import com.armedialab.UserManagementService
import com.armedialab.entity.Addon
import com.armedialab.entity.Address
import com.armedialab.entity.CuisineType
import com.armedialab.entity.Customer
import com.armedialab.entity.CustomerComment
import com.armedialab.entity.FeedbackConfig
import com.armedialab.entity.FeedbackCustomer
import com.armedialab.entity.Item
import com.armedialab.entity.ItemAddon
import com.armedialab.entity.ItemCategory
import com.armedialab.entity.ItemVariant
import com.armedialab.entity.OrderItemAddon
import com.armedialab.entity.OrderItems
import com.armedialab.entity.Orders
import com.armedialab.entity.Restaurant
import com.armedialab.entity.RestaurantDevice
import com.armedialab.entity.RestaurantEvent
import com.armedialab.entity.ServingTable
import com.armedialab.entity.ServingTableRequestStatus
import com.armedialab.entity.Staff
import com.armedialab.entity.StatusType
import com.armedialab.reference.CuisineTypeManagementService
import com.armedialab.reference.ItemCategoryManagementService
import com.armedialab.reference.RestaurantEventManagementService
import com.armedialab.reference.RestaurantManagementService
import com.armedialab.user.User
import com.armedialab.util.Constants
import com.armedialab.util.IDUtils
import com.armedialab.util.Utils
import com.armedialab.util.Constants.StatusTypeEnum

@Transactional
class CarteService {

	def grailsApplication
	def restaurantManagementService
	def itemCategoryManagementService
	def restaurantEventManagementService
	def itemManagementService
	def cuisineTypeManagementService
	def servingTableRequestManagementService
	def feedbackManagementService
	def userManagementService
	def ordersManagementService
	def customerManagementService
	
    def recordLogin(RestaurantDevice rd){
		if(rd) {
			RestaurantDevice.executeUpdate("update RestaurantDevice rd set rd.lastLoginTime=:newDate where rd.id=:id",
				[newDate: new Date(), id: rd.id])
		}
    }
	
	def getRestaurantImagesPath(Restaurant restaurant) {
		return restaurantManagementService.getPath(restaurant, grailsApplication.config)
	}
	
	def getItemCategoryImagesPath(ItemCategory itemCat) {
		return itemCategoryManagementService.getPath(itemCat, grailsApplication.config)
	}
	
	def getEventsImagePath(RestaurantEvent event) {
		return restaurantEventManagementService.getPath(event, grailsApplication.config)
	}
	
	def getItemMediaContentImagesPath(Item item) {
		return itemManagementService.getPath(item, grailsApplication.config)
	}
	
	def getCuisineTypeImagesPath(CuisineType cuisineType) {
			return cuisineTypeManagementService.getPath(cuisineType, grailsApplication.config)
	}
	
	def loadItems(ItemCategory itemCategory, Restaurant restaurant) {
		return itemManagementService.loadItemsForCategory(itemCategory)
	}
	
	def loadItemVariants(Item item) {
		if(!item) return [:]
		def result = itemManagementService.loadItemVariantsForItem(item)?.collect {
			[itemVariantId: it.id,
				variantId: it.variant?.id,
				price: it.price,
				approxPreperationTime: it.approxPreperationTime,
				translations: it.getActiveTranslations()
				]
		}
		
		return result
	}

	def loadItemAddons (Item item) {
		if(!item) return [:]
		def result = itemManagementService.loadAddonsForItem(item)?.collect {
			[itemAddonId: it.id,
				addonId: it.addon?.id,
				price: it.addon?.defaultPrice,
				translations: it.addon?.getActiveTranslations()
				]
		}
		
		return result
	}
	
	def getItemMediaContent(def item) {
		if(!item) return [:]
		def tempPath = null
		def result = item.getActiveMediaContent()?.collect {
			
			tempPath = getItemMediaContentImagesPath(it.item)
			
			[itemMediaId: it.id,
						imageUrl: Utils.joinImagePath(tempPath, it.imageName)?:null,
						vedioUrl: Utils.joinImagePath(tempPath, it.videoUrl)?:null,
						displayOrder: it.displayOrder,
						videoSourceType: it.videoSourceType?.id
						]
					}
		return result
	}

	def convertCategoriesToMap(def categories, def restaurantId) {
		if(!categories) return [:]
		def tempPath = null
		def result = categories.collect {
			
			tempPath = getItemCategoryImagesPath(it)
			
			[itemCategoryId: it.id,
						imageUrl: Utils.joinImagePath(tempPath, it.imageUrl)?:null,
						smallIconUrl: Utils.joinImagePath(tempPath, it.smallIconUrl)?:null,
						largeIconUrl: Utils.joinImagePath(tempPath, it.smallIconUrl)?:null,
						parentCategory: it.parentCategory?.id,
						tags: it.tags?:null,
						availableDurationStart: it.availableDurationStart?:null,
						availableDurationEnd: it.availableDurationEnd?:null,
						restaurantId: restaurantId,
						translations: it.getTranslations()
						]
					}
		return result
	}

	def convertAddressToMap(Address address) {
		if(!address) return [:]
		
		def map = [addressId: address.id,
					description: address.description?:null,
					phone1: address.phone1?:null,
					phone2: address.phone2?:null,
					phone3: address.phone3?:null,
					phone4: address.phone4?:null,
					email: address.email?:null,
					lat: address.lat?:null,
					lon: address.lon?:null,
					mapsUrl: address.mapsUrl?:null]
/*		StringBuilder sb = new StringBuilder()
		if(phone1) sb.append(phone1)
		if(phone1 && phone2) {
			sb.append(', ').append(phone2)
		} else if(!phone1 && phone2) {
			sb.append(phone2)
		}
		if(phone2 && phone3) {
			sb.append(', ').append(phone3)
		} else if(!phone2 && phone2) {
			sb.append(phone2)
		}
		if(phone1 || phone2 || phone3 || phone4) {
			//"${phone1?:''}"
			map['phone1'] =
		}
*/
	return map
		
	}
	
	def callWaiterRequest(def servingTableRef, def assignedStaffCode, def customerMobile, def device) {
		
		ServingTableRequestStatus callWaiterReq = ServingTableRequestStatus.
			find("from ServingTableRequestStatus as tblReq where tblReq.servingTable.tableRefNumber=? and tblReq.statusType=?", 
				[servingTableRef, StatusType.load(Constants.StatusTypeEnum.REQUESTED.getStatusTypeId())])
/*			findByTableRefNumberAndStatusType(
				servingTableRef,
				StatusType.load(Constants.StatusTypeEnum.REQUESTED.getStatusTypeId()))
*/
		//this is the first request from this table
		if(callWaiterReq) {
			if(log.isDebugEnabled()) {
				log.debug("Call Waiter Request already exists.... Increasing count...")
			}
			callWaiterReq.requestCount = callWaiterReq.requestCount + 1
			callWaiterReq.updatedBy = "SYSTEM"
		} else {
			callWaiterReq = new ServingTableRequestStatus();
			//request[Constants.KEY_RESTAURANT] = restaurant
			callWaiterReq.servingTable = ServingTable.findByTableRefNumber(servingTableRef)
			callWaiterReq.restaurantDevice = device
			callWaiterReq.branch = callWaiterReq.servingTable?.branch
			callWaiterReq.statusType = StatusType.load(Constants.StatusTypeEnum.REQUESTED.getStatusTypeId())
			callWaiterReq.staff = Staff.findByStaffCode(assignedStaffCode)
			callWaiterReq.requestCount = 1

			if(customerMobile){
				callWaiterReq.customer = Customer.findByMobile(customerMobile)
			}
			callWaiterReq.createdBy = "SYSTEM"
		}
		servingTableRequestManagementService.createWaiterRequest(callWaiterReq)
	}
	
	def saveCustomerFeedback(def feedback, Restaurant restaurant, RestaurantDevice device) {
		if(feedback) {
			def customer = findOrInitializeCustomer(feedback.customer, restaurant)
			List<FeedbackCustomer> customerFeedbackList = new ArrayList(feedback.feedbackFields?.size())
			FeedbackCustomer feedbackCustomer// = new FeedbackCustomer()
			
			for (f in feedback.feedbackFields) {
				// for each feedback save feedbackcustomer record
				feedbackCustomer = new FeedbackCustomer()
				feedbackCustomer.customer = customer
				feedbackCustomer.feedbackConfig = FeedbackConfig.load(f.feedbackFieldId)
				feedbackCustomer.value = f.value
				feedbackCustomer.customerContact = customer.mobile
				feedbackCustomer.feedbackContext = feedback.order?.orderRefNumber==null? "GENERAL": "ORDER"
				feedbackCustomer.referenceId = feedback.order?.orderRefNumber
				customerFeedbackList.add(feedbackCustomer)
			}
			feedbackManagementService.saveCustomerFeedback(customer, customerFeedbackList)
		} else {
			throw new ValidationException("Required parameters are missing from the request. Please contact your administrator!", null)
		}
		
	}
	
	/**
	 * Return user object if authenticated successfully, otherwise returns null
	 * @param username
	 * @param password
	 * @throws ValidationException if username is null
	 * @return
	 */
	def autenticateStaffLogin(def username, def password) {
		if(username) {
			def user = User.findByUsername(username)
			if(	user &&
				!user.accountExpired &&
				!user.accountLocked &&
				user.enabled &&
				user.staff?.isActive &&
				userManagementService.authenticateUser(user, password)) { return user } else {
					throw new ValidationException("User account not found or disabled, Please contact your administrator for details!", user.errors)
			}
		} else {
			throw new ValidationException("Please provide a valid username!")
		}
	}
	
	def saveCustomerComment(def comment, Restaurant restaurant, RestaurantDevice device) {
		if(comment) {
			def customerComment = new CustomerComment()
			customerComment.restaurant = restaurant
			customerComment.device = device
			customerComment.customerContact = comment.contactNumber
			customerComment.customerName = comment.name?.toUpperCase()
			customerComment.commentType = comment.type?.toUpperCase()
			customerComment.comments = comment.comments
			customerComment.createdBy = "SYSTEM"
			customerComment.updatedBy = "SYSTEM"
			customerComment.save(true)
		} else {
			throw new ValidationException("Required parameters are missing from the request. Please contact your administrator!", null)
		}
		
	}
	
	def processOrder(def orderRequest, Restaurant restaurant, RestaurantDevice device) {
		ordersManagementService.processOrder(orderRequest, 
			findOrInitializeCustomer(orderRequest?.customer, restaurant), 
			restaurant, device)
	}
	
	private def findOrInitializeCustomer(def customerInfo, def restaurant) {
		def customer = Customer.findByMobileAndRestaurant(customerInfo?.mobile, restaurant)
		if(!customer) {
			if(log.isDebugEnabled()) {
				log.debug("Creating new customer..")
			}
			
			//create a new customer record
			customer = new Customer(restaurant: restaurant,
									code: customerManagementService.generateCustomerCode(),
									firstName: customerInfo?.firstName,
									lastName: customerInfo?.lastName,
									mobile: customerInfo?.mobile,
									email: customerInfo?.email,
									subscribeNewsLetter: customerInfo?.subscribedToNewsletter,
									isActive: true
									)
			customer.createdBy = "SYSTEM"
			customer.save(true)
		}
		return customer
	}
}
