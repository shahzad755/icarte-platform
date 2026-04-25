package com.armedialab.entity

import com.armedialab.util.Constants.StatusTypeEnum

class StatusType {

	String name
	Boolean isActive = Boolean.TRUE
	String description
	//Restaurant restaurant
	Boolean isOrderStatus = Boolean.FALSE
	Boolean isEndStatus = Boolean.FALSE
	String validationRules
	Date dateCreated
	String createdBy
	String updatedBy
	Date lastUpdated

	static hasMany = [orders: Orders]
	static mapping = {
		id generator: 'assigned', column: "STATUS_TYPE_ID"
	}

	static constraints = {
		name maxSize: 100//, unique: ['restaurant', 'isOrderStatus']
		isActive nullable: true
		description nullable: true
		updatedBy nullable: true
		lastUpdated nullable: true
		validationRules nullable: true, maxSize: 4000
	}
	
	/**
	 * Validate the order transition from current state to new state. if the validationRules value is provided than that will be executed.
	 * Following state transitions are not allowed by default
	 * 
	 * Status transition not allowed
	 * 
	 * From new to in-progress
	 * From new to completed
	 * From new to void
	 * 
	 * From approved to new
	 * From approved to void
	 * 
	 * From In-Progress to new
	 * From In-Progress to Approved
	 * From In-Progress to Paid
	 * From In-Progress to Void
	 * 
	 * From Cancelled to New
	 * From Cancelled to In-Progress
	 * From Cancelled to Completed
	 * From Cancelled to Paid
	 * From Cancelled to Void
	 * 
	 * From Completed to New
	 * From Completed to In-Progress
	 * 
	 * No transition is allowed from Void and Paid
	 */
	
	public boolean validateOrderStateTransition(StatusType transtionToState){
		boolean validated = true;
		if(transtionToState && transtionToState.isOrderStatus) {
			//Default Validation
			if(!this.validationRules ){
				StatusTypeEnum currentStatus = StatusTypeEnum.getStatusTypeIdConstant(id)
				StatusTypeEnum newStatus = StatusTypeEnum.getStatusTypeIdConstant(transtionToState.id)
				
				switch(currentStatus) {
					case StatusTypeEnum.NEW: // From New Should only be Approved or Cancelled
						if(	!(newStatus.equals(StatusTypeEnum.APPROVED ) ||
							newStatus.equals(StatusTypeEnum.CANCELLED ) )) {
							validated = false
						}
						break;
					case StatusTypeEnum.APPROVED: // Can only be In Progress
						if(	!newStatus.equals(StatusTypeEnum.IN_PROGRESS )) {
							validated = false
						}
						break;
					case StatusTypeEnum.IN_PROGRESS://Only Prepared or cancelled is allowed
						if(	!(newStatus.equals(StatusTypeEnum.PREPARED) ||
							newStatus.equals(StatusTypeEnum.CANCELLED))) {
							validated = false
						}
						break;
					case StatusTypeEnum.PREPARED:
						if(	!(newStatus.equals(StatusTypeEnum.PAID ) ||
							newStatus.equals(StatusTypeEnum.VOID)) ) {
							validated = false
						}
						break;
					case StatusTypeEnum.PAID: 
					case StatusTypeEnum.CANCELLED: 
					case StatusTypeEnum.VOID: //End state
							validated = false
						break;
				}
			} else {
				validated = validateCustomOrderStateTransition(transtionToState)
			}
		}
		return validated
	}


/*	public boolean validateOrderStateTransition(StatusType transtionToState){
		boolean validated = true;
		if(transtionToState && transtionToState.isOrderStatus) {
			//Default Validation
			if(!this.validationRules ){
				StatusTypeEnum currentStatus = StatusTypeEnum.getStatusTypeIdConstant(id)
				StatusTypeEnum newStatus = StatusTypeEnum.getStatusTypeIdConstant(transtionToState.id)
				
				switch(currentStatus) {
					case StatusTypeEnum.NEW: // From New Should only be Approved or Cancelled
						if(	!newStatus.equals(StatusTypeEnum.APPROVED ) ||
							!newStatus.equals(StatusTypeEnum.CANCELLED )) {
							validated = false
						}
						break;
					case StatusTypeEnum.APPROVED:
						if(	newStatus.equals(StatusTypeEnum.NEW ) || 
							newStatus.equals(StatusTypeEnum.VOID)) {
							validated = false
						}
						break;
					case StatusTypeEnum.IN_PROGRESS://Only completed is allowed
						if(	!newStatus.equals(StatusTypeEnum.COMPLETED)) {
							validated = false
						}
						break;
					case StatusTypeEnum.COMPLETED:
						if(	newStatus.equals(StatusTypeEnum.NEW ) || 
							newStatus.equals(StatusTypeEnum.IN_PROGRESS)) {
							validated = false
						}
						break;
					case StatusTypeEnum.PAID: case StatusTypeEnum.CANCELLED: case StatusTypeEnum.VOID: //End state
							validated = false
						break;
				}
			} else {
				validated = validateCustomOrderStateTransition(transtionToState)
			}
		}
		if(!validated) {
			errors?.reject("order.statusupdate.notAllowed",
				[name, transtionToState.name],
				"Status change not allowed from ${name} to ${transtionToState.name}")
		}
		return validated
	}
*/
	private boolean validateCustomOrderStateTransition(StatusType newStatus) {
		boolean validated = true
		if(newStatus.validationRules) {
			
		}
		return validated
	}
}
