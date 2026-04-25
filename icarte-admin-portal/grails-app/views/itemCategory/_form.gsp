<%@page import="com.armedialab.util.Utils"%>
<%@ page import="com.armedialab.entity.ItemCategory" %>
	<div class="form-group form-md-line-input ${hasErrors(bean: itemCategoryInstance?.itemCategoryTranslations?.getAt(0), field: 'title', 'has-error')} required">
		<g:textField name="itemCategoryTranslations[0].title" maxlength="255" value="${fieldValue(bean: itemCategoryInstance?.itemCategoryTranslations?.getAt(0), field: 'title')}" required="" class="form-control"/>
		<label for="itemCategoryTranslations[0].title">
			<g:message code="itemCategory.title.label" default="Title" />
			<span class="required" aria-required="true">*</span>
			<asset:image class="pull-right" src="i18n/en.png"/>
		</label>
		<span class="help-block"><g:message code="itemCatgory.help.title" default="Enter Category Title..." /></span>
	</div>

	<div class="form-group form-md-line-input ${hasErrors(bean: itemCategoryInstance?.itemCategoryTranslations?.getAt(0), field: 'description', 'has-error')} required">
		<g:textField name="itemCategoryTranslations[0].description" maxlength="255" value="${fieldValue(bean: itemCategoryInstance?.itemCategoryTranslations?.getAt(0), field: 'description')}" required="" class="form-control"/>
		<label for="description">
			<g:message code="itemCategory.description.label" default="Description" />
			<span class="required" aria-required="true">*</span>
			<asset:image class="pull-right" src="i18n/en.png"/>
		</label>
		<span class="help-block"><g:message code="itemCategory.help.description" default="Enter Description..." /></span>
	</div>
	<sec:ifAnyGranted roles="ROLE_SUPERADMIN">
		<div class="form-group form-md-line-input ${hasErrors(bean: itemCategoryInstance, field: 'restaurant', 'has-error')} required">
			<g:textField readonly="true" id="restaurant" name="restaurant.id" value="${fieldValue(bean: itemCategoryInstance?.restaurant, field: 'name')}" class="form-control"/><%--
		
			<g:select id="restaurant" name="restaurant.id" from="${com.armedialab.entity.Restaurant.list()}" optionKey="id" required="" 
					value="${itemCategoryInstance?.restaurant?.id}" 
					optionValue="name" 
					class="many-to-one form-control"/>
			--%><label for="restaurant">
				<g:message code="itemCategory.restaurant.label" default="Restaurant" />
			</label>
			<span class="help-block"><g:message code="itemCategory.help.restaurant" default="Select Restaurant..." /></span>
		</div>
	</sec:ifAnyGranted>
	<div class="form-group form-md-line-input ${hasErrors(bean: itemCategoryInstance, field: 'parentCategory', 'has-error')} ">
		<g:select id="parentCategory" name="parentCategory" from="${parentCats}" 
			noSelection="['null':'-Select Parent Category-']"
			optionKey="id"
			optionValue="defaultTitle" 
			value="${itemCategoryInstance?.parentCategory?.id}" 
			class="many-to-one form-control"/>

		<label for="parentCategory">
			<g:message code="itemCategory.parentCategory.label" default="Parent Category" />
		</label>
		<span class="help-block"><g:message code="itemCategory.help.parentCategory" default="Enter Parent Category..." /></span>
	</div>
	<div class="form-group form-md-line-input ${hasErrors(bean: itemCategoryInstance, field: 'menuItemCategories', 'has-error')} required">
		<g:select id="menuItemCategories" 
			multiple="true"
			name="menuItemCategories" 
			from="${menus}" 
			optionKey="id" 
			optionValue="title"
			required="" 
			value="${itemCategoryInstance?.getCurrentItemCategoryMenus()*.menu.id}"
			class="many-to-one form-control"/>
		<label for="menu">
			<g:message code="itemCategory.menu.label" default="Menu Group" />
			<span class="required" aria-required="true">*</span>
		</label>
		<span class="help-block"><g:message code="itemCategory.help.menu" default="Select Menu Groups..." /></span>
	</div>
<%--
	<div class="form-group form-md-line-input ${hasErrors(bean: itemCategoryInstance, field: 'availableDurationStart', 'has-error')} ">
		<label class="control-label col-md-3" for="availableDurationStart">
			<g:message code="itemCategory.availableDurationStart.label" default="Available Duration Start" />
		</label>
        <div class="col-md-10">
			<div class="input-group date form_advance_datetime">        
				<g:field name="availableDurationStart" readonly="true" type="text" value="${itemCategoryInstance.availableDurationStart}" data-date="${itemCategoryInstance.availableDurationStart}" class="form-control"/>
				<span class="input-group-btn">
                    <button class="btn default date-reset" type="button">
                        <i class="fa fa-times"></i>
                    </button>
                    <button class="btn default date-set" type="button">
                        <i class="fa fa-calendar"></i>
                    </button>
                </span>
			</div>
		</div>
	</div>
		<div class="form-group form-md-line-input ${hasErrors(bean: itemCategoryInstance, field: 'availableDurationEnd', 'has-error')} ">
		<label class="control-label col-md-3" for="availableDurationEnd">
			<g:message code="itemCategory.availableDurationEnd.label" default="Available Duration End" />
		</label>
        <div class="col-md-10">
			<div class="input-group date form_advance_datetime">        
				<g:field name="availableDurationEnd" readonly="true" type="text" value="${itemCategoryInstance.availableDurationEnd}" data-date="${itemCategoryInstance.availableDurationEnd}" class="form-control"/>
				<span class="input-group-btn">
                    <button class="btn default date-reset" type="button">
                        <i class="fa fa-times"></i>
                    </button>
                    <button class="btn default date-set" type="button">
                        <i class="fa fa-calendar"></i>
                    </button>
                </span>
			</div>
		</div>
	</div>
	
	--%><%--
	<div class="form-group form-md-line-input ${hasErrors(bean: itemCategoryInstance, field: 'availableDurationEnd', 'has-error')} ">
		<g:field name="availableDurationEnd" type="text" value="${itemCategoryInstance.availableDurationEnd}" class="form-control date-picker"/>
		<label for="availableDurationEnd">
			<g:message code="itemCategory.availableDurationEnd.label" default="Available Duration End" />
		</label>
		<span class="help-block"><g:message code="itemCategory.help.availableDurationEnd" default="Enter Available Duration End..." /></span>
	</div>
    --%>
	<div class="form-group form-md-line-input ${hasErrors(bean: itemCategoryInstance?.mappingCode, field: 'mappingCode', 'has-error')}">
	    <g:textField id="mappingCode" name="mappingCode" maxlength="75" value="${itemCategoryInstance?.mappingCode}" placeholder="Item Category Mapping Code"  class="form-control"/>
		<label for="mappingCode">
			<g:message code="itemCategory.mappingCode.label" default="Mapping Code" />
		</label>
	    <span class="help-block"><g:message code="item.help.mappingCode" default="Enter Legacy System's Item Mapping Code..." /></span>
	</div>
    <div class="form-group md-checkbox ${hasErrors(bean: itemCategoryInstance, field: 'isActive', 'has-error')}">
		<g:checkBox name="isActive"class="md-check" value="${itemCategoryInstance?.isActive}" />
		<label for="isActive">
			<span class="inc"></span>
			<span class="check"></span>
			<span class="box"></span>
		 	<g:message code="itemCategory.isActive.label" default="Is Active" />
		</label>
	</div>	
	<g:hiddenField name="itemCategoryTranslations[0].id" value="${fieldValue(bean: itemCategoryInstance?.itemCategoryTranslations?.getAt(0), field: 'id')}"/>