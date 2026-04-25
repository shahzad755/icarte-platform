<!DOCTYPE html>
<html>
	<head>
		<g:if test="${params.mode=='standard'}"><meta name="layout" content="main"></g:if>
		<g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
	<g:if test="${params.mode=='standard'}"><g:render template="/layouts/pageheader"/></g:if>
			<div class="portlet light portlet-fit portlet-form bordered" id="manage-item" role="main">
				<div class="portlet-title">
					<div class="caption font-blue">
						<i class="icon-note"></i><g:message code="default.create.label" args="[entityName]" />
					</div>
				</div>
				<div id="item-portlet-body" class="portlet-body">
						<g:if test="${flash.message}">
							<div class="message alert alert-info alert-dismissable" role="status">
				               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
				               <strong>Info!</strong> ${flash.message}
				             </div>
						</g:if>
						<g:hasErrors bean="${itemInstance}">
						<div class="alert alert-danger alert-dismissable" role="status">
				               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
				               <strong>Error!</strong>
								<ul class="errors" role="alert">
									<g:eachError bean="${itemInstance}" var="error">
									<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
									</g:eachError>
								</ul>
						</div>
						</g:hasErrors>
						<form id="itemForm" method="post" class="form-horizontal">
							<div class="form-body">
								<g:render template="form"/>
							</div>
							<div class="form-actions right">
								<button type="button" class="btn green-jungle" onclick="javascript: saveItem(false);">
									<i class="fa fa-pencil"></i><g:message code="default.button.save.label" default="Save"/>
								</button>
								<button type="button" data-dismiss="modal" class="btn btn-outline dark" <g:if test="${params.mode=='standard'}">onclick="location.href='${request.contextPath}/${controllerName }/index'"</g:if>>
									<g:message code="default.button.cancel.label"/>
								</button>
							</div>
						</form>
				</div>
			</div>
	</body>
</html>
