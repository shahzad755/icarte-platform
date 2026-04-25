<%@page import="com.armedialab.util.Utils"%>
<%@ page import="com.armedialab.entity.CuisineType"%>
<div class="form-group form-md-line-input ${hasErrors(bean: cuisineTypeInstance?.cuisineTranslations?.getAt(0), field: 'title', 'has-error')} required">
	<g:textField name="title" maxlength="255"
		value="${fieldValue(bean: cuisineTypeInstance?.cuisineTranslations?.getAt(0), field: 'title')}" required="" class="form-control" />
		<label for="title">
			<g:message code="cusineType.title.label" default="Title" /> 
			<span class="required" aria-required="true">*</span>
			<asset:image class="pull-right" src="i18n/en.png" />
		</label>
		<span class="help-block">
			<g:message code="cuisineType.help.title" default="Enter Cuisine Title..." />
		</span>
</div>

<div class="form-group form-md-line-input ${hasErrors(bean: cuisineTypeInstance?.cuisineTranslations?.getAt(0), field: 'description', 'has-error')} required">
	<g:textField name="description" maxlength="255" value="${fieldValue(bean: cuisineTypeInstance?.cuisineTranslations?.getAt(0), field: 'description')}"
		required="" class="form-control" />
	<label for="description">
		<g:message code="cuisineType.description.label" default="Description" />
		<asset:image class="pull-right" src="i18n/en.png" />
	</label>
	<span class="help-block">
		<g:message code="cuisineType.help.description" default="Enter Description..." />
	</span>
</div>
<sec:ifAnyGranted roles="ROLE_SUPERADMIN">
	<div
		class="form-group form-md-line-input ${hasErrors(bean: cuisineTypeInstance, field: 'restaurant', 'has-error')} required">
		<g:select id="restaurant" name="restaurant.id"
			from="${com.armedialab.entity.Restaurant.list()}" optionKey="id"
			required="" value="${cuisineTypeInstance?.restaurant?.id}"
			optionValue="name" class="many-to-one form-control" />
		<label for="restaurant"> <g:message
				code="cuisineType.restaurant.label" default="Restaurant" /> <span
			class="required" aria-required="true">*</span>
		</label> <span class="help-block"><g:message
				code="cuisineType.help.restaurant" default="Select Restaurant..." /></span>
	</div>
</sec:ifAnyGranted>
<div class="form-group ${hasErrors(bean: cuisineTypeInstance, field: 'isActive', 'has-error')}">
	<g:checkBox name="isActive" value="${cuisineTypeInstance?.isActive}" />
	<label for="isActive">
	 	<g:message code="cuisineType.isActive.label" default="Is Active" />
	</label>
</div>
<g:hiddenField name="cuisineTranslations[0].id" value="${fieldValue(bean: cuisineTypeInstance?.cuisineTranslations?.getAt(0), field: 'id')}"/>