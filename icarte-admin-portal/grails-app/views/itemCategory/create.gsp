<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'itemCategory.label', default: 'ItemCategory')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		<div class="portlet light portlet-fit portlet-form bordered" id="create-itemCategory" role="main">
			<div class="portlet-title">
				<div class="caption font-blue">
					<i class="icon-note"></i><g:message code="default.create.label" args="[entityName]" />
				</div>
			</div>
			<div class="portlet-body">
					<g:if test="${flash.message}">
						<div class="message alert alert-info alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Info!</strong> ${flash.message}
			             </div>
					</g:if>
					<g:hasErrors bean="${itemCategoryInstance}">
					<div class="alert alert-danger alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Error!</strong>
							<ul class="errors" role="alert">
								<g:eachError bean="${itemCategoryInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
					</div>
					</g:hasErrors>
					<g:form url="[resource:itemCategoryInstance, action:'save']" >					
						<div class="form-body">
							<div class="form-group form-md-line-input ${hasErrors(bean: itemCategoryInstance?.itemCategoryTranslations?.getAt(0), field: 'title', 'has-error')} required">
								<g:textField name="title" maxlength="255" value="${fieldValue(bean: itemCategoryInstance?.itemCategoryTranslations?.getAt(0), field: 'title')}" required="" class="form-control"/>
								<label for="title">
									<g:message code="itemCategory.title.label" default="Title" />
									<span class="required" aria-required="true">*</span>
									<asset:image class="pull-right" src="i18n/en.png"/>
								</label>
								<span class="help-block"><g:message code="itemCatgory.help.title" default="Enter Category Title..." /></span>
							</div>
						
							<div class="form-group form-md-line-input ${hasErrors(bean: itemCategoryInstance?.itemCategoryTranslations?.getAt(0), field: 'description', 'has-error')} required">
								<g:textField name="description" maxlength="255" value="${fieldValue(bean: itemCategoryInstance?.itemCategoryTranslations?.getAt(0), field: 'description')}" required="" class="form-control"/>
								<label for="description">
									<g:message code="itemCategory.description.label" default="Description" />
									<span class="required" aria-required="true">*</span>
									<asset:image class="pull-right" src="i18n/en.png"/>
								</label>
								<span class="help-block"><g:message code="itemCategory.help.description" default="Enter Description..." /></span>
							</div>
							<sec:ifAnyGranted roles="ROLE_SUPERADMIN">	
								<div class="form-group form-md-line-input ${hasErrors(bean: itemCategoryInstance, field: 'restaurant', 'has-error')} required">
									<g:select id="restaurant" name="restaurant.id" from="${com.armedialab.entity.Restaurant.list()}" optionKey="id" required="" 
											value="${itemCategoryInstance?.restaurant?.id}" 
											optionValue="name" 
											class="many-to-one form-control"/>
									<label for="restaurant">
										<g:message code="itemCategory.restaurant.label" default="Restaurant" />
										<span class="required" aria-required="true">*</span>
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
									value="${itemCategoryInstance?.menuItemCategories*.id}" 
									class="many-to-one form-control"/>
								<label for="menu">
									<g:message code="itemCategory.menu.label" default="Menu Groups" />
									<span class="required" aria-required="true">*</span>
								</label>
								<span class="help-block"><g:message code="itemCategory.help.menu" default="Select Menu Groups..." /></span>
							</div>
							
							<%--
							<div class="form-group form-md-line-input ${hasErrors(bean: itemCategoryInstance, field: 'tags', 'has-error')} ">
								<g:textArea name="tags" cols="40" rows="5" maxlength="500" value="${itemCategoryInstance?.tags}" class="form-control"/>
								<label for="tags">
									<g:message code="itemCategory.tags.label" default="Tags" />
								</label>
								<span class="help-block"><g:message code="itemCategory.help.tags" default="Enter Tags..." /></span>
							</div>
							--%><%--
							<div class="form-group form-md-line-input ${hasErrors(bean: itemCategoryInstance, field: 'availableDurationStart', 'has-error')} ">
								<g:datePicker name="availableDurationStart" precision="day"  value="${itemCategoryInstance?.availableDurationStart}" default="none" noSelection="['': '']" class="form-control"/>
								<label for="availableDurationStart">
									<g:message code="itemCategory.availableDurationStart.label" default="Available Duration Start" />
								</label>
								<span class="help-block"><g:message code="itemCategory.help.availableDurationStart" default="Enter Available Duration Start..." /></span>
							</div>
							<div class="form-group form-md-line-input ${hasErrors(bean: itemCategoryInstance, field: 'availableDurationEnd', 'has-error')} ">
								<g:datePicker name="availableDurationEnd" precision="day"  value="${itemCategoryInstance?.availableDurationEnd}" default="none" noSelection="['': '']" class="form-control"/>
								<label for="availableDurationEnd">
									<g:message code="itemCategory.availableDurationEnd.label" default="Available Duration End" />
								</label>
								<span class="help-block"><g:message code="itemCategory.help.availableDurationEnd" default="Enter Available Duration End..." /></span>
							</div>
						    --%>
							<div class="form-group form-md-line-input ${hasErrors(bean: itemCategoryInstance?.itemCategoryTranslations?.getAt(0), field: 'title', 'has-error')} required">
							    <g:textField id="mappingCode" name="mappingCode" maxlength="75" value="${itemCategoryInstance?.mappingCode}" placeholder="Item Category Mapping Code" class="form-control"/>
								<label for="mappingCode">
									<g:message code="item.mappingCode.label" default="Mapping Code" />
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
							</div><%--
							<div class="form-group form-md-line-input ${hasErrors(bean: itemCategoryInstance, field: 'displayOrder', 'has-error')} required">
								<g:field name="displayOrder" type="number" value="${itemCategoryInstance.displayOrder}" required="" class="form-control"/>
								<label for="displayOrder">
									<g:message code="itemCategory.displayOrder.label" default="Display Order" />
									<span class="required" aria-required="true">*</span>
								</label>
								<span class="help-block"><g:message code="itemCategory.help.displayOrder" default="Enter Display Order..." /></span>
							</div>
						--%></div>
						<div class="form-actions right">
							<div class="row">
								<div class="col-md-offset-1">
									<button type="submit" class="btn green-jungle">
										<i class="fa fa-pencil"></i><g:message code="default.button.create.label"/>
									</button>
									<button type="button" class="btn default" onclick="location.href='${request.contextPath}/${controllerName }/index'">
										<g:message code="default.button.cancel.label"/>
									</button>
								</div>
							</div>
						</div>
					</g:form>
			</div>
		</div>
	</body>
</html>
