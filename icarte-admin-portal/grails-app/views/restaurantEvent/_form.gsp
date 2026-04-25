<%@ page import="com.armedialab.entity.RestaurantEvent" %>

	<sec:ifAnyGranted roles="ROLE_SUPERADMIN">	
		<div class="form-group form-md-line-input ${hasErrors(bean: restaurantEventInstance, field: 'restaurant', 'has-error')} required">
			<g:select id="restaurant" name="restaurant.id" from="${com.armedialab.entity.Restaurant.list()}" optionKey="id" required="" 
					value="${restaurantEventInstance?.restaurant?.id}" 
					optionValue="name" 
					class="many-to-one form-control"/>
			<label for="restaurant">
				<g:message code="restaurantEvent.restaurant.label" default="Restaurant" />
				<span class="required" aria-required="true">*</span>
			</label>
			<span class="help-block"><g:message code="restaurantEvent.help.restaurant" default="Select Restaurant..." /></span>
		</div>
	</sec:ifAnyGranted>
		<div class="form-group form-md-line-input ${hasErrors(bean: restaurantEventInstance?.restaurantEventTranslations?.getAt(0), field: 'title', 'has-error')} required">
			<g:textField name="title" maxlength="255" value="${fieldValue(bean: restaurantEventInstance?.restaurantEventTranslations?.getAt(0), field: 'title')}" required="" class="form-control"/>
			<label for="title">
				<g:message code="addon.title.label" default="Title" />
				<span class="required" aria-required="true">*</span>
				<asset:image class="pull-right" src="i18n/en.png"/>
			</label>
			<span class="help-block"><g:message code="restaurantEvent.help.title" default="Enter Event Title..." /></span>
		</div>
	
		<div class="form-group form-md-line-input ${hasErrors(bean: restaurantEventInstance?.restaurantEventTranslations?.getAt(0), field: 'description', 'has-error')} required">
			<g:textArea name="description" rows="3" maxlength="4000" value="${fieldValue(bean: restaurantEventInstance?.restaurantEventTranslations?.getAt(0), field: 'description')}" required="" class="form-control"/>
			<label for="description">
				<g:message code="restaurantEvent.description.label" default="Event Details" />
				<span class="required" aria-required="true">*</span>
				<asset:image class="pull-right" src="i18n/en.png"/>
			</label>
			<span class="help-block"><g:message code="restaurantEvent.help.description" default="Enter Description..." /></span>
		</div>

	<div class="form-group form-md-line-input ${hasErrors(bean: restaurantEventInstance, field: 'eventDate', 'has-error')} required">
		<%--<g:datePicker name="eventDate" precision="day"  value="${restaurantEventInstance?.eventDate}"  class="form-control"/>
		--%>
		<g:textField type="date" name="eventDate" value="${formatDate(format: 'yyyy-MM-dd HH:mm', date:restaurantEventInstance.eventDate)}"  class="form-control datetime"/>
		<label for="eventDate">
			<g:message code="restaurantEvent.eventDate.label" default="Event Date" />
			<span class="required" aria-required="true">*</span>
		</label>
		<span class="help-block"><g:message code="restaurantEvent.help.eventDate" default="Enter Event Date..." /></span>
	</div>
	<div class="form-group form-md-line-input ${hasErrors(bean: restaurantEventInstance, field: 'showEventStartDate', 'has-error')} required">
		<g:textField name="showEventStartDate" value="${formatDate(format: 'yyyy-MM-dd', date:restaurantEventInstance.showEventStartDate)}"  class="form-control date"/>
		<label for="showEventStartDate">
			<g:message code="restaurantEvent.showEventStartDate.label" default="Show Event Start Date" />
		</label>
		<span class="help-block"><g:message code="restaurantEvent.help.showEventStartDate" default="Enter Show Event Start Date..." /></span>
	</div>
	<div class="form-group form-md-line-input ${hasErrors(bean: restaurantEventInstance, field: 'showEventEndDate', 'has-error')} required">
		<g:textField name="showEventEndDate" value="${formatDate(format: 'yyyy-MM-dd', date:restaurantEventInstance.showEventEndDate)}"  class="form-control date"/>
		<label for="showEventEndDate">
			<g:message code="restaurantEvent.showEventEndDate.label" default="Show Event End Date" />
		</label>
		<span class="help-block"><g:message code="restaurantEvent.help.showEventEndDate" default="Enter Show Event End Date..." /></span>
	</div>
	<%--
	<div class="form-group form-md-line-input ${hasErrors(bean: restaurantEventInstance, field: 'imageUrl', 'has-error')} ">
		<g:textField name="imageUrl" value="${restaurantEventInstance?.imageUrl}" class="form-control"/>

		<label for="imageUrl">
			<g:message code="restaurantEvent.imageUrl.label" default="Image Url" />
			
		</label>
		<span class="help-block"><g:message code="restaurantEvent.help.imageUrl" default="Enter Image Url..." /></span>
	</div>
	
 
	<div class="form-group form-md-line-input ${hasErrors(bean: restaurantEventInstance, field: 'smallIconUrl', 'has-error')} ">
		<g:textField name="smallIconUrl" value="${restaurantEventInstance?.smallIconUrl}" class="form-control"/>

		<label for="smallIconUrl">
			<g:message code="restaurantEvent.smallIconUrl.label" default="Small Icon Url" />
			
		</label>
		<span class="help-block"><g:message code="restaurantEvent.help.smallIconUrl" default="Enter Small Icon Url..." /></span>
	</div>
	
 
	<div class="form-group form-md-line-input ${hasErrors(bean: restaurantEventInstance, field: 'originalImageName', 'has-error')} ">
		<g:textField name="originalImageName" value="${restaurantEventInstance?.originalImageName}" class="form-control"/>

		<label for="originalImageName">
			<g:message code="restaurantEvent.originalImageName.label" default="Original Image Name" />
			
		</label>
		<span class="help-block"><g:message code="restaurantEvent.help.originalImageName" default="Enter Original Image Name..." /></span>
	</div>
	
 
	--%> 
       <div class="form-group md-checkbox">
		<g:checkBox name="isActive"class="md-check" value="${restaurantEventInstance?.isActive}" />

		<label for="isActive">
			<span class="inc"></span>
			<span class="check"></span>
			<span class="box"></span>
		 	<g:message code="restaurantEvent.isActive.label" default="Is Active" />
			
		</label>
		</div>
