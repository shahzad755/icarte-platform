<!DOCTYPE html>
<html>
	<head>
		<meta name="layout">
		<g:set var="entityName" value="${message(code: 'restaurantEventTranslation.label', default: 'Event Translation')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="portlet light portlet-fit portlet-form bordered" id="create-restaurantEventTranslation" role="main">
			<div class="portlet-title">
				<div class="caption font-blue">
					<i class="icon-note"></i><g:message code="default.create.label" args="[entityName]" />
				</div>
			</div>
			<div id="restaurantEventTranslation-create-portlet-body" class="portlet-body">
					<g:hasErrors bean="${restaurantEventTranslationInstance}">
					<div id="error" class="alert alert-danger alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Error!</strong>
							<ul class="errors" role="alert">
								<g:eachError bean="${restaurantEventTranslationInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
					</div>
					</g:hasErrors>
					<form id="restaurantEventTranslationForm" method="post">					
						<div class="form-body">
							<g:render template="form"/>
						</div>
						<div class="form-actions right">
							<button type="button" class="btn green-jungle" onclick="javascript: createRestaurantEventTranslation();">
								<i class="fa fa-pencil"></i><g:message code="default.button.create.label"/>
							</button>
							<button type="button" data-dismiss="modal" class="btn btn-outline dark">
								<g:message code="default.button.cancel.label"/>
							</button>
						</div>
					</form>
			</div>
		</div>
	</body>
</html>
