<%@ page import="com.armedialab.entity.RestaurantEventTranslation" %>

	<g:hiddenField id="restaurantEvent" name="restaurantEvent.id" value="${restaurantEventTranslationInstance?.restaurantEvent?.id}"/>
	
	<div class="form-group form-md-line-input ${hasErrors(bean: restaurantEventTranslationInstance, field: 'language', 'has-error')} required">
 		<g:if test="${actionName == 'create'}">
			<g:select id="language.id" name="language.id" from="${com.armedialab.entity.RefLanguage.findAll('from RefLanguage as l where l.id!=1L')}" optionKey="id" value="${restaurantEventTranslationInstance?.language?.id}" class="many-to-one form-control" />
			<label for="language.id">
				<g:message code="language.label" default="Language" />
				<span class="required" aria-required="true">*</span>
			</label>
			<span class="help-block"><g:message code="help.language" default="Enter Language..." /></span>
		</g:if>
 		<g:else>
 			<g:textField readonly="true" name="name" value="${restaurantEventTranslationInstance?.language?.name}"  class="form-control" />
			<label for="language">
				<g:message code="language.label" default="Language" />
				<span class="required" aria-required="true">*</span>
			</label>
 		</g:else>
	</div>
	<div class="form-group form-md-line-input ${hasErrors(bean: restaurantEventTranslationInstance, field: 'title', 'has-error')} required">
		<g:textField name="title" maxlength="255" value="${restaurantEventTranslationInstance?.title}" class="form-control" required=""/>

		<label for="title">
			<g:message code="title.label" default="Event Title" />
			<span class="required" aria-required="true">*</span>
		</label>
		<span class="help-block"><g:message code="help.title" default="Enter Event Title..." /></span>
	</div>

 
	<div class="form-group form-md-line-input ${hasErrors(bean: restaurantEventTranslationInstance, field: 'description', 'has-error')} ">
		<g:textArea name="description" rows="5" required="" maxlength="4000" value="${restaurantEventTranslationInstance?.description}" class="form-control"/>

		<label for="description">
			<g:message code="description.label" default="Event Details" />
			<span class="required" aria-required="true">*</span>			
		</label>
		<span class="help-block"><g:message code="help.description" default="Enter Event Details..." /></span>
	</div>

	<div class="form-group">
		<g:checkBox name="showDescription" value="${restaurantEventTranslationInstance?.showDescription}" />
		<label for="showDescription">
		 	<g:message code="showDescription.label" default="Show Description" />
		</label>
	</div>