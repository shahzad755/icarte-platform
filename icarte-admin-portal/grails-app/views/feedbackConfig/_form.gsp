<%@ page import="com.armedialab.entity.FeedbackConfig" %>
	<sec:ifAnyGranted roles="ROLE_SUPERADMIN">							
		<div class="form-group form-md-line-input ${hasErrors(bean: feedbackConfigInstance, field: 'restaurant', 'has-error')} required">
			<g:select id="restaurant" name="restaurant.id" from="${com.armedialab.entity.Restaurant.list()}" 
			optionKey="id" 
			optionValue="restuarantNameWithCode" 
			required="" value="${feedbackConfigInstance?.restaurant?.id}" class="many-to-one form-control"/>
			<label for="restaurant">
				<g:message code="feedbackConfig.restaurant.label" default="Restaurant" />
				<span class="required" aria-required="true">*</span>
			</label>
			<span class="help-block"><g:message code="feedbackConfig.help.restaurant" default="Enter Restaurant..." /></span>
		</div>
	</sec:ifAnyGranted>
	<div class="form-group form-md-line-input ${hasErrors(bean: feedbackConfigInstance, field: 'feedbackType', 'has-error')} required">
		<g:select id="feedbackType" name="feedbackType.id" from="${com.armedialab.entity.FeedbackType.findAllByIsActive('true')}" 
			optionKey="id" 
			optionValue="name" 
			required="" value="${feedbackConfigInstance?.feedbackType?.id}" class="many-to-one form-control"/>
		<label for="feedbackType">
			<g:message code="feedbackConfig.feedbackType.label" default="Feedback Type" />
			<span class="required" aria-required="true">*</span>
		</label>
		<span class="help-block"><g:message code="feedbackConfig.help.feedbackType" default="Enter Feedback Type..." /></span>
	</div>
	<div class="form-group form-md-line-input ${hasErrors(bean: feedbackConfigInstance?.feedbackConfigTranslations?.getAt(0), field: 'title', 'has-error')} required">
		<g:textField name="title" maxlength="255" value="${fieldValue(bean: feedbackConfigInstance?.feedbackConfigTranslations?.getAt(0), field: 'title')}" required="" class="form-control"/>
		<label for="title">
			<g:message code="feedbackConfig.title.label" default="Title" />
			<span class="required" aria-required="true">*</span>
			<asset:image class="pull-right" src="i18n/en.png"/>
		</label>
		<span class="help-block"><g:message code="itemCatgory.help.title" default="Enter Category Title..." /></span>
	</div>

	<div class="form-group form-md-line-input ${hasErrors(bean: feedbackConfigInstance?.feedbackConfigTranslations?.getAt(0), field: 'description', 'has-error')} required">
		<g:textField name="description" maxlength="255" value="${fieldValue(bean: feedbackConfigInstance?.feedbackConfigTranslations?.getAt(0), field: 'description')}" class="form-control"/>
		<label for="description">
			<g:message code="feedbackConfig.description.label" default="Description" />
			<asset:image class="pull-right" src="i18n/en.png"/>
		</label>
		<span class="help-block"><g:message code="feedbackConfig.help.description" default="Enter Description..." /></span>
	</div>
    <div class="form-group md-checkbox">
		<g:checkBox name="isRequired"class="md-check" value="${feedbackConfigInstance?.isRequired}" />
		<label for="isRequired">
			<span class="inc"></span>
			<span class="check"></span>
			<span class="box"></span>
		 	<g:message code="feedbackConfig.isRequired.label" default="Is Required" />
		</label>
	</div>
    <div class="form-group md-checkbox">
		<g:checkBox name="isActive"class="md-check" value="${feedbackConfigInstance?.isActive}" />
		<label for="isActive">
			<span class="inc"></span>
			<span class="check"></span>
			<span class="box"></span>
		 	<g:message code="feedbackConfig.isActive.label" default="Is Active" />
		</label>
	</div>