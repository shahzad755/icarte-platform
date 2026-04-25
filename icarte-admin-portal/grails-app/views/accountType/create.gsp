<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'accountType.label', default: 'AccountType')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		<div class="portlet light portlet-fit portlet-form bordered" id="create-accountType" role="main">
			<div class="portlet-title">
				<div class="caption font-blue">
					<i class="icon-note"></i><g:message code="default.create.label" args="[entityName]" />
				</div>
			</div>
			<div class="portlet-body">
					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
					<g:hasErrors bean="${accountTypeInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${accountTypeInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
					</g:hasErrors>
					<g:form url="[resource:accountTypeInstance, action:'save']" >					
						<div class="form-body">
							<g:render template="form"/>
						</div>
						<div class="form-actions">
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
