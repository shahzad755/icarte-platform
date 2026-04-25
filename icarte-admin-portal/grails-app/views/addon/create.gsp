<%@ page import="com.armedialab.entity.Addon" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'addon.label', default: 'Addon')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		<div class="portlet light portlet-fit portlet-form bordered" id="create-addon" role="main">
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
					<g:hasErrors bean="${addonInstance}">
						<div class="alert alert-danger alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Error!</strong>
							<ul class="errors" role="alert">
								<g:eachError bean="${addonInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
						</div>
					</g:hasErrors>
					<g:form url="[resource:addonInstance, action:'save']" >					
						<div class="form-body">
						<sec:ifAnyGranted roles="ROLE_SUPERADMIN">	
							<div class="form-group form-md-line-input ${hasErrors(bean: addonInstance, field: 'restaurant', 'has-error')} required">
								<g:select id="restaurant" name="restaurant.id" from="${com.armedialab.entity.Restaurant.list()}" optionKey="id" required="" 
										value="${addonInstance?.restaurant?.id}" 
										optionValue="name" 
										class="many-to-one form-control"/>
								<label for="restaurant">
									<g:message code="addon.restaurant.label" default="Restaurant" />
									<span class="required" aria-required="true">*</span>
								</label>
								<span class="help-block"><g:message code="addon.help.restaurant" default="Select Restaurant..." /></span>
							</div>
						</sec:ifAnyGranted>
						
							<div class="form-group form-md-line-input ${hasErrors(bean: addonInstance?.addonTranslations?.getAt(0), field: 'title', 'has-error')} required">
								<g:textField name="title" maxlength="255" value="${fieldValue(bean: addonInstance?.addonTranslations?.getAt(0), field: 'title')}" required="" class="form-control"/>
								<label for="title">
									<g:message code="addon.title.label" default="Title" />
									<span class="required" aria-required="true">*</span>
									<asset:image class="pull-right" src="i18n/en.png"/>
								</label>
								<span class="help-block"><g:message code="addon.help.title" default="Enter Addon Title..." /></span>
							</div>
						
							<div class="form-group form-md-line-input ${hasErrors(bean: addonInstance?.addonTranslations?.getAt(0), field: 'description', 'has-error')} required">
								<g:textField name="description" maxlength="255" value="${fieldValue(bean: addonInstance?.addonTranslations?.getAt(0), field: 'description')}" required="" class="form-control"/>
								<label for="description">
									<g:message code="addon.description.label" default="Description" />
									<asset:image class="pull-right" src="i18n/en.png"/>
								</label>
								<span class="help-block"><g:message code="addon.help.description" default="Enter Description..." /></span>
							</div>
							
							<div class="form-group form-md-line-input ${hasErrors(bean: addonInstance, field: 'defaultPrice', 'has-error')} required">
								<g:textField type="number" name="defaultPrice" value="${fieldValue(bean: addonInstance, field: 'defaultPrice')}" required="" class="form-control"/>
								<label for="defaultPrice">
									<g:message code="addon.defaultPrice.label" default="Default Price" />
									<span class="required" aria-required="true">*</span>
								</label>
								<span class="help-block"><g:message code="addon.help.defaultPrice" default="Enter Default Price..." /></span>
							</div>
							<%--
							<div class="form-group form-md-line-input ${hasErrors(bean: addonInstance, field: 'imageUrl', 'has-error')} ">
								<g:textField name="imageUrl" value="${addonInstance?.imageUrl}" class="form-control"/>
						
								<label for="imageUrl">
									<g:message code="addon.imageUrl.label" default="Image Url" />
									
								</label>
								<span class="help-block"><g:message code="addon.help.imageUrl" default="Enter Image Url..." /></span>
							</div>
							--%>
							   	<div class="form-group md-checkbox">
									<g:checkBox name="showDescription" class="md-check" value="${addonInstance?.addonTranslations?.getAt(0)?.showDescription}" />
								
									<label for="showDescription">
										<span class="inc"></span>
										<span class="check"></span>
										<span class="box"></span>
									 	<g:message code="addon.showDescription.label" default="Show Description on Client" />
										
									</label>
								</div>
							
						      <div class="form-group md-checkbox">
								<g:checkBox name="isActive"class="md-check" value="${addonInstance?.isActive}" />
							
								<label for="isActive">
									<span class="inc"></span>
									<span class="check"></span>
									<span class="box"></span>
								 	<g:message code="addon.isActive.label" default="Is Active" />
									
								</label>
							</div>
						 
						</div>
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
