package com.armedialab

import grails.transaction.Transactional
import grails.validation.ValidationException

import java.text.SimpleDateFormat

import com.armedialab.entity.Addon
import com.armedialab.entity.Item
import com.armedialab.entity.ItemAddon
import com.armedialab.entity.ItemVariant
import com.armedialab.entity.OrderItemAddon
import com.armedialab.entity.OrderItems
import com.armedialab.entity.Orders
import com.armedialab.entity.Restaurant
import com.armedialab.entity.RestaurantDevice
import com.armedialab.entity.ServingTable
import com.armedialab.entity.Staff
import com.armedialab.entity.StatusType
import com.armedialab.util.Constants
import com.armedialab.util.IDUtils
import com.armedialab.util.Utils
import com.armedialab.util.Constants.StatusTypeEnum

@Transactional
class OrdersManagementService {
	def grailsApplication
	
	private static final String ORDER_DETAIL_QRY = '''FROM
			OrderItems as orderItems, 
			ItemVariant as itemVariant,
			Item as item,
			ItemVariantTranslation trans
			where
			orderItems.order.id = ?
			and orderItems.itemVariant = itemVariant.id
			and orderItems.item = item.id
			and trans.itemVariant = itemVariant.id
			and trans.language.id = ?'''

	private static final String ORDER_ADDON_DETAIL_QRY = '''FROM
		        OrderItemAddon as orderAddon, 
		        ItemAddon as itemAddon,
				Addon as addon,
		        AddonTranslation trans
		        where
		        orderAddon.orderItem.id = ?
		        and orderAddon.itemAddon = itemAddon.id
		        and itemAddon.addon = addon.id
		        and trans.addon = addon.id
		        and trans.language.id = ?'''

	private String LOAD_ITEM_QRY = '''FROM
				ItemVariant as itemVariant,
				Item as item,
				ItemVariantTranslation trans
				where
				item.isActive = true
				and item.isDeleted = false
				and (item.code LIKE UPPER(?)
				or trans.title LIKE UPPER(?))
				and itemVariant.item = item.id
				and trans.itemVariant = itemVariant.id
				and trans.language.id = ? order by item.code asc
				'''
	
	private String LOAD_ITEM_BY_RESTAURANT_QRY = '''FROM
		        ItemVariant as itemVariant,
		        Item as item,
		        ItemVariantTranslation trans
		        where
				item.restaurant.id = ?
		        and item.isActive = true
		        and item.isDeleted = false
				and (item.code LIKE UPPER(?)
				or trans.title LIKE UPPER(?))
		        and itemVariant.item = item.id
		        and trans.itemVariant = itemVariant.id
		        and trans.language.id = ? order by item.code asc
        		'''
	
	private String LOAD_ADDON_QRY = '''FROM
				ItemAddon itemAddon,
				Addon as addon,
				Item as item,
				AddonTranslation trans
				where
				item.isActive = true
				and addon.isActive = true
				and item.isDeleted = false
				and itemAddon.isDeleted = false
				and trans.title LIKE ?
				and itemAddon.item = item.id
				and itemAddon.addon = addon.id
				and trans.addon = addon.id
				and trans.language.id = ?
				and itemAddon.item.id = ?
				'''
	private String LOAD_ADDON_BY_RESTAURANT_QRY = '''FROM
                ItemAddon itemAddon,
                Addon as addon,
                Item as item,
                AddonTranslation trans
                where
				item.restaurant = ?
                and item.isActive = true
                and addon.isActive = true
                and item.isDeleted = false
                and itemAddon.isDeleted = false
				and trans.title LIKE ?
                and itemAddon.item = item.id
                and itemAddon.addon = addon.id
                and trans.addon = addon.id
                and trans.language.id = ?
                and itemAddon.item.id = ?
				'''
	
	def springSecurityService
	
	def searchOrders(def _criteria) {
		if(log.isDebugEnabled())
			log.debug("Searching for orders with given search criteria:>${_criteria}")
		def criteria = Orders.createCriteria()
		def user = springSecurityService.loadCurrentUser()
		
		def isAdmin = false
		def isOwner = false
		def isNormalStaff = false
		
		springSecurityService.authentication.authorities.each {
			if(it.authority == "ROLE_SUPERADMIN") {
				isAdmin = true
			} else {
				if (it.authority == "ROLE_RESTAURANT_OWNER") {
					isOwner = true
				} else {
					isNormalStaff = true
				}
			}
		}
		
		
		def orders = criteria.list(max:_criteria.maxRows, offset:_criteria.rowOffset) {
	
			//eq ("isActive", Boolean.FALSE)
			
			//allow only items which belongs to user's restaurant
			if(isOwner && !isAdmin){
				if(log.isDebugEnabled()) {
					log.debug("User is owner of the restaurant. Only allow his/her restaurant orders")
				}
				restaurant {
					eq ("id", Staff.findByUser(user)?.restaurant.id)
				}
			}

			if(_criteria.data.referenceNum) {
				like ("referenceNum", _criteria.data.referenceNum.toUpperCase()+"%")
			}

			if(_criteria.data.isActive) {
				eq ("isActive", _criteria.data.isActive.toBoolean())
			}
			
			def dateFormat = Utils.DATE_FORMAT//grailsApplication.config.search.dateFormat
			SimpleDateFormat sf = new SimpleDateFormat(dateFormat)
			
			//orderDate
			if(_criteria.data.orderDateFrom && !_criteria.data.orderDateTo) {
				between ("orderDate", sf.parse(_criteria.data.orderDateFrom), sf.parse(_criteria.data.orderDateFrom) + 30)
			}
			if(_criteria.data.orderDateTo && !_criteria.data.orderDateFrom) {
				between ("orderDate", sf.parse(_criteria.data.orderDateTo) - 30, sf.parse(_criteria.data.orderDateTo))
			}
			if(_criteria.data.orderDateTo && _criteria.data.orderDateFrom) {
				between ("orderDate", sf.parse(_criteria.data.orderDateFrom), sf.parse(_criteria.data.orderDateTo) + 1)//adding 1 to make "to date" inclusive
			}

			servingTable {
				if(_criteria.data.tableRefNumber) {
					like ("tableRefNumber", _criteria.data.tableRefNumber.toUpperCase()+"%")
				}
			}
			staff {
				if(_criteria.data.staffCode) {
					like ("staffCode", _criteria.data.staffCode.toUpperCase()+"%")
				}
			}
			branch {
				//if the user is not owner, he/she can be admin or normal staff, in both cases
				if(isNormalStaff && !isAdmin && !isOwner){
					if(log.isDebugEnabled()) {
						log.debug("User is normal staff, only allow branch orders")
					}
					eq ("id", Staff.findByUser(user)?.branch.id)
				} else {
					if(_criteria.data.branchId) {
						eq ("id", _criteria.data.branchId as Long)
					}
				}
			}
			customer {
				if(_criteria.data.mobile) {
					eq ("mobile", _criteria.data.mobile)
				}
			}
			statusType {
				if(_criteria.data.statusTypeId) {
					eq ("id", _criteria.data.statusTypeId as Long)
				}
			}

			// ----------------------- Sorting ----------------------
			//Handle Title as sorting column differently...
			if("branchCode".equals(_criteria.sortColumn)){
				branch {
					order ("branchCode", _criteria.sortOrder)
				}
			} else if("statusTypeId".equals(_criteria.sortColumn)){
				statusType {
					order ("id", _criteria.sortOrder)
				}
			} else {
				order (_criteria.sortColumn, _criteria.sortOrder)
			}
		}
		def variant = null;
		
		def results = orders.collect {
			[DT_RowId: "${it.id}",
				referenceNum: "${it.referenceNum?:'-'}",
				totalPrice: "${it.totalPrice?:'0'}",
				branch: "${it.branch?.branchCode?:'-'}",
				mobile: "${it.customer?.mobile?:'-'}",
				tableRefNumber: "${it.servingTable?.tableRefNumber?:'-'}",
				specialRemarks: "${it.specialRemarks?:'-'}",
				orderDate: "${it.orderDate?.format('yyyy-MM-dd')}",
				staffCode: "${it.staff?.staffCode?:'-'}",
				//statusType: "${it.statusType?.name?:'-'}",
				statusType: [id: "${it.statusType?.id}", name: "${it.statusType?.name}"],
				isActive: "${it.isActive?'True':'False'}",
				id: "${it.id}"]
		}

		def totalRows = orders.totalCount
		def numberOfPages = Math.ceil(totalRows / _criteria.maxRows)

		if(log.isDebugEnabled()){
			log.debug("Total Records found [${totalRows}], numberOfPages: ${numberOfPages}")
		}

		return ["totalRows": totalRows,
			"records": results,
			"numberOfPages": numberOfPages]
	}
	
	def listOrdersDetails(_criteria){
		def totalRows = 0
		def numberOfPages = 0
		def results = []
		if(_criteria.data.orderId){
			def orders = OrderItems.executeQuery(ORDER_DETAIL_QRY + ' order by '+ _criteria.sortColumn+ ' ' +_criteria.sortOrder,
					[_criteria.data.orderId as Long, Constants.Languages.ENGLISH.getLanguagesId()],
					[max:_criteria.maxRows, offset:_criteria.rowOffset])

			 results = orders.collect {
				[
					DT_RowId: "${it[0].id}",
					//order: [id: "${it[0].order.id}", referenceNum: "${it[0].order.referenceNum}"],
					item: [itemId: "${it[2].id}", itemVariantId: "${it[1].id}", code: "${it[2].code?:'-'}", mappingCode: "${it[2].mappingCode?:'-'}", title: "${it[3].title}", unitPrice: "${it[1].price}"],
					quantity: "${it[0].quantity}",
					discountRateApplied: "${it[0].discountAppliedPct?:0}",
					price: "${it[0].orderPrice}",
					remarks: "${it[0].specialRemarks?:''}",
					id: "${it[0].id}"
				]
			}
			totalRows = OrderItems.executeQuery("SELECT COUNT(1) ${ORDER_DETAIL_QRY}",
							[_criteria.data.orderId as Long, Constants.Languages.ENGLISH.getLanguagesId()],
							[max:_criteria.maxRows, offset:_criteria.rowOffset])[0]
			numberOfPages = Math.ceil(totalRows / _criteria.maxRows)
		
		}
		if(log.isDebugEnabled()){
			log.debug("Total Records found [${totalRows}], numberOfPages: ${numberOfPages}")
		}
		return ["totalRows": totalRows,
			"records": results,
			"numberOfPages": numberOfPages]
	}

	def listOrderAddonDetails(_criteria){
		def totalRows = 0
		def numberOfPages = 0
		def results = []
		if(_criteria.data.orderItemVariantId){
			def orders = OrderItemAddon.executeQuery(ORDER_ADDON_DETAIL_QRY + ' order by '+ _criteria.sortColumn+ ' ' +_criteria.sortOrder,
					[_criteria.data.orderItemVariantId as Long, Constants.Languages.ENGLISH.getLanguagesId()],
					[max:_criteria.maxRows, offset:_criteria.rowOffset])

			 results = orders.collect {
				[
					DT_RowId: "${it[0].id}",
					addon: [title: "${it[3].title}"],
					quantity: "${it[0].quantity}",
					price: "${it[0].price}",
					remarks: "${it[0].specialRemarks}",
					id: "${it[0].id}"
				]
			}
			totalRows = OrderItems.executeQuery("SELECT COUNT(1) ${ORDER_ADDON_DETAIL_QRY}",
							[_criteria.data.orderItemVariantId as Long, Constants.Languages.ENGLISH.getLanguagesId()],
							[max:_criteria.maxRows, offset:_criteria.rowOffset])[0]
			numberOfPages = Math.ceil(totalRows / _criteria.maxRows)
		
		}
		if(log.isDebugEnabled()){
			log.debug("Total Records found [${totalRows}], numberOfPages: ${numberOfPages}")
		}
		return ["totalRows": totalRows,
			"records": results,
			"numberOfPages": numberOfPages]
	}

	def loadItemList(_filter, isAdmin){
		def filter = []
		if(isAdmin){
			filter = [_filter['q'], _filter['q'], Constants.Languages.ENGLISH.getLanguagesId()]
		} else {
			filter = [Staff.findByUser(springSecurityService.loadCurrentUser())?.restaurant.id, 
					_filter['q'], _filter['q'], Constants.Languages.ENGLISH.getLanguagesId()]
		}
		def items = Item.executeQuery(isAdmin? LOAD_ITEM_QRY: LOAD_ITEM_BY_RESTAURANT_QRY, 
				filter)
			 return items.collect {
				[
					id: "${it[0].id}",
					code: "${it[1].code?:'-'}",
					mappingCode: "${it[1].mappingCode?:'-'}",
					title: "${it[2].title}"
				]
			}
	}

	def loadAddonList(_filter, isAdmin){
		def filter = []
		def item = OrderItems.executeQuery("from OrderItems orderItems where id = ?" , _filter.orderItemVarId as Long)
		if(isAdmin){
			filter = [_filter['q']+'%', Constants.Languages.ENGLISH.getLanguagesId(), item[0]?.item?.id]
		} else {
			filter = [Staff.findByUser(springSecurityService.loadCurrentUser())?.restaurant, 
					_filter['q']+'%', Constants.Languages.ENGLISH.getLanguagesId(), item[0]?.item?.id]
		}
		def items = Item.executeQuery(isAdmin? LOAD_ADDON_QRY: LOAD_ADDON_BY_RESTAURANT_QRY, 
				filter)
			 return items.collect {
				[
                    id: "${it[0].id}",
                    title: "${it[3].title}"
				]
			}
	}
	
	def addItemToOrder(Long orderId, Long itemVariantId, Integer quantity, String remarks) {
		def orderItemsInstance
		if(orderId && itemVariantId && quantity) {
			def order = Orders.findById(orderId, [fetch: [orderItemses: "eager"]])
			def itemVariant = ItemVariant.get(itemVariantId)
			if(order && itemVariant){
				def status = order.statusType
				if(StatusTypeEnum.CANCELLED.getStatusTypeId().equals(status.id) ||
						StatusTypeEnum.VOID.getStatusTypeId().equals(status.id) || 
						StatusTypeEnum.PAID.getStatusTypeId().equals(status.id)) {
					order.errors.reject("invalid.orderUpdate", [status.name] as Object[], 
						"Order update is not allowed in '\${status.name}\' status")
					throw new ValidationException("Order Cannot be updated", order.errors)
				} 
				else {
					orderItemsInstance = new OrderItems()
					orderItemsInstance.order = order
					orderItemsInstance.itemVariant = itemVariant
					orderItemsInstance.item = itemVariant?.item
					orderItemsInstance.quantity = quantity
					//orderItemsInstance.orderPrice = itemVariant?.price.multiply(quantity)
					orderItemsInstance.applyDiscount();
					orderItemsInstance.specialRemarks = remarks
					orderItemsInstance.createdBy = springSecurityService.principal.username
					if(orderItemsInstance.validate()) {
						order.addToOrderItemses(orderItemsInstance)
						order.updateCalculations()
						order.createdBy = springSecurityService.principal.username
						order.save()
					}
					else {
						throw new ValidationException("Order Item validation failed!", orderItemsInstance.errors)
					}
				}
			}
		} else {
			throw new ValidationException("Required parameters are missing from the request. Please contact your administrator!", null)
		}
		return orderItemsInstance
	}
	
	def updateItemInOrder(Long orderItemId, Integer quantity, String remarks) {
		def orderItemsInstance
		if(orderItemId && quantity) {
			orderItemsInstance = OrderItems.get(orderItemId)
			if(orderItemsInstance){
				def order = orderItemsInstance?.order
				def status = order.statusType
				if(StatusTypeEnum.CANCELLED.getStatusTypeId().equals(status.id) ||
						StatusTypeEnum.VOID.getStatusTypeId().equals(status.id) || 
						StatusTypeEnum.PAID.getStatusTypeId().equals(status.id)) {
					order.errors.reject("invalid.orderUpdate", [status.name] as Object[], 
						"Order update is not allowed in '\${status.name}\' status")
					throw new ValidationException("Order Cannot be updated", order.errors)
				}
				else {
					orderItemsInstance.quantity = quantity
					//orderItemsInstance.orderPrice = orderItemsInstance.itemVariant?.price.multiply(quantity)
					orderItemsInstance.applyDiscount();
					orderItemsInstance.specialRemarks = remarks?:null
					orderItemsInstance.updatedBy = springSecurityService.principal.username
					if(orderItemsInstance.validate()) {
						orderItemsInstance.save(flush:true)
						order.updateCalculations()
						order.updatedBy = springSecurityService.principal.username
						order.save()
					}
					else {
						throw new ValidationException("Order Item validation failed!", orderItemsInstance.errors)
					}
				}
			}
		} else {
			throw new ValidationException("Required parameters are missing from the request. Please contact your administrator!", null)
		}
		return orderItemsInstance
	}

	def deleteItemFromOrder(Long orderItemId){
		def orderItemsInstance
		if(orderItemId) {
			orderItemsInstance = OrderItems.get(orderItemId)
			if(orderItemsInstance){
				def order = orderItemsInstance?.order
				def status = order.statusType
				if(StatusTypeEnum.NEW.getStatusTypeId().equals(status.id)) {
					orderItemsInstance.delete(flush:true)
					order.updateCalculations()
					order.updatedBy = springSecurityService.principal.username
					order.save(flush:true)
				}
				else {
					order.errors.reject("invalid.orderUpdate", [status.name] as Object[], 
						"Order update is not allowed in '\${status.name}\' status")
					throw new ValidationException("Item Cannot be deleted", order.errors)
				}
			}
		} else {
			throw new ValidationException("Required parameters are missing from the request. Please contact your administrator!", null)
		}
		return orderItemsInstance
	}
	
	def addAddonToOrderItem(Long addonId, Long itemVariantId, Integer quantity, String remarks) {
		def orderItemsAddonInstance
		if(addonId && itemVariantId && quantity) {
			def orderItem = OrderItems.load(itemVariantId)
			Orders order = Orders.findById(orderItem.order.id, [fetch: [orderItemses: "eager"]])
			if(order && orderItem){
				def status = order.statusType
				if(StatusTypeEnum.CANCELLED.getStatusTypeId().equals(status.id) ||
						StatusTypeEnum.VOID.getStatusTypeId().equals(status.id) || 
						StatusTypeEnum.PAID.getStatusTypeId().equals(status.id)) {
					order.errors.reject("invalid.orderUpdate", [status.name] as Object[], 
						"Order update is not allowed in '\${status.name}\' status")
					throw new ValidationException("Order Cannot be updated", order.errors)
				}
				else {
					orderItemsAddonInstance = new OrderItemAddon()
					orderItemsAddonInstance.orderItem = orderItem
					orderItemsAddonInstance.itemAddon = ItemAddon.get(addonId)
					orderItemsAddonInstance.price = orderItemsAddonInstance.itemAddon?.addon?.defaultPrice.multiply(quantity)
					
					orderItemsAddonInstance.quantity = quantity
					orderItemsAddonInstance.specialRemarks = remarks
					orderItemsAddonInstance.createdBy = springSecurityService.principal.username
					if(orderItemsAddonInstance.validate()) {
						orderItemsAddonInstance.save(flush: true)
						order.updateCalculations()
						order.createdBy = springSecurityService.principal.username
						order.save()
					}
					else {
						throw new ValidationException("Addon validation failed!", orderItemsAddonInstance.errors)
					}
				}
			}
		} else {
			throw new ValidationException("Required parameters are missing from the request. Please contact your administrator!", null)
		}
		return orderItemsAddonInstance
	}

	def updateAddonInOrderItem(Long orderItemAddonId, Integer quantity, String remarks) {
		OrderItemAddon orderItemsAddonInstance
		if(orderItemAddonId && quantity) {
			orderItemsAddonInstance = OrderItemAddon.load(orderItemAddonId)
			def order = orderItemsAddonInstance?.orderItem?.order
			if(order && orderItemsAddonInstance){
				def status = order.statusType
				if(StatusTypeEnum.CANCELLED.getStatusTypeId().equals(status.id) ||
						StatusTypeEnum.VOID.getStatusTypeId().equals(status.id) || 
						StatusTypeEnum.PAID.getStatusTypeId().equals(status.id)) {
					order.errors.reject("invalid.orderUpdate", [status.name] as Object[], 
						"Order update is not allowed in '\${status.name}\' status")
					throw new ValidationException("Order Cannot be updated", order.errors)
				}
				else {
					orderItemsAddonInstance.quantity = quantity
					orderItemsAddonInstance.price = orderItemsAddonInstance.itemAddon?.addon?.defaultPrice.multiply(quantity)
					orderItemsAddonInstance.specialRemarks = remarks
					orderItemsAddonInstance.updatedBy = springSecurityService.principal.username
					if(orderItemsAddonInstance.validate()) {
						orderItemsAddonInstance.save(flush: true)
						order.updateCalculations()
						order.updatedBy = springSecurityService.principal.username
						order.save()
					}
					else {
						throw new ValidationException("Addon validation failed!", orderItemsAddonInstance.errors)
					}
				}
			}
		} else {
			throw new ValidationException("Required parameters are missing from the request. Please contact your administrator!", null)
		}
		return orderItemsAddonInstance
	}
	
	def deleteAddonFromOrder(Long orderItemAddonId) {
		OrderItemAddon orderItemsAddonInstance
		if(orderItemAddonId) {
			orderItemsAddonInstance = OrderItemAddon.load(orderItemAddonId)
			def order = orderItemsAddonInstance?.orderItem?.order
			if(order && orderItemsAddonInstance){
				def status = order.statusType
				if(StatusTypeEnum.NEW.getStatusTypeId().equals(status.id)) {
					orderItemsAddonInstance.delete(flush: true)
					order.updateCalculations()
					order.updatedBy = springSecurityService.principal.username
					order.save(flush:true)
				}
				else {
					order.errors.reject("invalid.orderUpdate", [status.name])
					throw new ValidationException("Order Cannot be updated", order.errors)
				}
			}
		} else {
			throw new ValidationException("Required parameters are missing from the request. Please contact your administrator!", null)
		}
		return orderItemsAddonInstance
	}
	
	def updateOrderStatus(Long orderId, Long newStatusId, String statusChangeReason) {
		if(orderId && newStatusId) {
			def order = Orders.get(orderId)
			def newStatus = StatusType.get(newStatusId)
			if(order && newStatus) {
				Boolean validated = order.statusType.validateOrderStateTransition(newStatus)
				if(validated){
					if((StatusTypeEnum.CANCELLED.getStatusTypeId().equals(newStatus.id) || 
						StatusTypeEnum.VOID.getStatusTypeId().equals(newStatus.id)) 
						&& !statusChangeReason ) {
						order.errors?.reject("order.statusupdate.statusChangeReason")
						throw new ValidationException("Order Status cannot be updated", order.errors)
					}
					order.statusType = newStatus
					order.statusChangeReason = statusChangeReason
					order.save(flush: true)
				} else {
					order.errors?.reject("order.statusupdate.notAllowed",
							[order.statusType.name, newStatus.name] as Object[],
							"Status change not allowed from \'${order.statusType.name}\' to \'${newStatus.name}\'")
					throw new ValidationException("Order Status cannot be updated", order.errors)
				}
				return order
			} else {
				throw new ValidationException("Required parameters are missing from the request. Please contact your administrator!", null)
			}
		}
	}
	
	def processOrder(def orderRequest, def customer, Restaurant restaurant, RestaurantDevice device) {
		if(orderRequest && restaurant && device) {
			def orderItemReqList = orderRequest.orderItemList
			if(orderRequest?.orderItemList?.size()>0) {
				Orders order = new Orders()
				order.orderDate = new Date()
				order.referenceNum = generateOrderRefNumber()
				order.customer = customer
				order.specialRemarks = orderRequest.specialRemarks
				order.staff = Staff.findByStaffCode(orderRequest.staffCode)
				order.branch = order.staff?.branch
				order.restaurant = restaurant
				order.servingTable = ServingTable.findByTableRefNumber(orderRequest.servingTable)
				order.isActive = true
				order.createdBy = "SYSTEM"
				if(restaurant.autoApproveOrders)
					order.statusType = StatusType.load(StatusTypeEnum.APPROVED.getStatusTypeId())
				else
					order.statusType = StatusType.load(StatusTypeEnum.NEW.getStatusTypeId())
				
				def orderItem = null
				def orderItemAddon = null
				BigDecimal orderTotal = new BigDecimal(0)
				BigDecimal addonsTotal = new BigDecimal(0)
				def itemVariant = null
				
				orderItemReqList?.each { orderItemReq ->
					itemVariant = ItemVariant.get(orderItemReq.itemVariantId as Long)
					if(!itemVariant)
						throw new ValidationException("Invalid Item Variant ID provided. Please contact your administrator!", null)
					
					//create OrderItems instance
					orderItem = new OrderItems(
							itemVariant: itemVariant,
							item: Item.load(orderItemReq.itemId as Long),
							quantity: orderItemReq.quantity,
							specialRemarks: orderItemReq.specialRemarks,
							order: order,
							createdBy: "SYSTEM")
					orderItem.applyDiscount();
					order.addToOrderItemses(orderItem)
					orderTotal = orderTotal.add(orderItem.orderPrice)
					
					orderItemReq.itemAddons?.each { orderItemAddonReq ->
						orderItemAddon = new OrderItemAddon(
									specialRemarks: orderItemAddonReq.specialRemarks,
									quantity: orderItemAddonReq.quantity?:1,
									orderItem: orderItem,
									itemAddon: ItemAddon.load(orderItemAddonReq.itemAddonId as Long),
									createdBy: "SYSTEM"
								)
						orderItemAddon.price = Addon.get(orderItemAddonReq.addonId as Long)?.defaultPrice?.multiply(orderItemAddon.quantity)
						orderItem.addToOrderItemAddons(orderItemAddon)
						addonsTotal = addonsTotal.add(orderItemAddon.price)
					}
				}
				//add total of order items and order item addons
				orderTotal = orderTotal.add(addonsTotal)
				order.totalPrice = orderTotal
				if(order.validate(true))
					order.save(flush:true)
				else {
					throw new ValidationException("Order Processing validation failed!", order.errors)
				}
			}
		} else {
			throw new ValidationException("Required parameters are missing from the request. Please contact your administrator!", null)
		}
	}
	
	def generateOrderRefNumber() {
		def orderNumLen = grailsApplication.config.lengthOfOrderRefNumber as Integer
		def notGenerated = true
		def refNum
		while(notGenerated) {
			refNum = new IDUtils().generateID(orderNumLen)
			if(Orders.executeQuery("SELECT 1 from Orders ord WHERE ord.referenceNum = ?", refNum).empty) 
				notGenerated = false
			else 
				log.warn("Collision detected while generating order reference num")
		}
		return notGenerated? null: refNum
	}
	
	
}
