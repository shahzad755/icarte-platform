<!DOCTYPE html>
<html>
	<head>
		<meta name="layout">
		<g:set var="entityName" value="${message(code: 'itemVariant.label', default: 'Item Customization')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="portlet light portlet-fit portlet-form bordered" id="create-itemVariant" role="main">
			<div class="portlet-title">
				<div class="caption font-blue">
					<i class="icon-note"></i><g:message code="default.create.label" args="[entityName]" />
				</div>
			</div>
			<div id="item-variant-portlet-body" class="portlet-body">
					<g:if test="${flash.message}">
						<div class="message alert alert-info alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Info!</strong> ${flash.message}
			             </div>
					</g:if>
					<g:hasErrors bean="${itemVariantInstance}">
					<div class="alert alert-danger alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Error!</strong>
							<ul class="errors" role="alert">
								<g:eachError bean="${itemVariantInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
					</div>
					</g:hasErrors>
					<form id="itemVariantForm" method="post" class="form-horizontal">					
						<div class="form-body">
							<g:hiddenField name="itemId" value="${itemId}" />
							<g:render template="/itemVariant/form"/>
						</div>
						<div class="form-actions right">
							<div class="row">
								<div class="col-md-offset-1">
									<button type="button" class="btn green-jungle" onclick="javascript: createItemVariant();">
										<i class="fa fa-pencil"></i><g:message code="default.button.create.label"/>
									</button>
									<button type="button" class="btn default" data-dismiss="modal" >
										<g:message code="default.button.cancel.label"/>
									</button>
								</div>
							</div>
						</div>
					</form>
			</div>
		</div>
	</body>
</html>
