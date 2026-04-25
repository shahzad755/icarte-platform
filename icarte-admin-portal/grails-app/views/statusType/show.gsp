
<%@ page import="com.armedialab.entity.StatusType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'statusType.label', default: 'StatusType')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		<div class="portlet light bordered" id="show-statusType" role="main">
			<div class="portlet-title">
				<div class="caption font-blue">
					<i class="icon-info"></i><g:message code="default.show.label" args="[entityName]" />
				</div>
			</div>
			<div class="portlet-body form">
					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
					<g:hasErrors bean="${statusTypeInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${statusTypeInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
					</g:hasErrors>
					<g:form class="form-horizontal" role="form" url="[resource:statusTypeInstance, action:'delete']" method="DELETE">
					
					<div class="form-body">
					
						<g:if test="${statusTypeInstance?.name}">
							<div class="row row col-md-offset-0">
								<div class="form-group">
									<label class="control-label lead"><g:message code="statusType.name.label" default="Name" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${statusTypeInstance}" field="name"/></p>
									
									
								</div>
							</div>
						</g:if>
					
						<g:if test="${statusTypeInstance?.isActive}">
							<div class="row row col-md-offset-0">
								<div class="form-group">
									<label class="control-label lead"><g:message code="statusType.isActive.label" default="Is Active" />:</label>
									
										<p class="form-control-static"><g:formatBoolean boolean="${statusTypeInstance?.isActive}" /></p>
									
									
								</div>
							</div>
						</g:if>
					
						<g:if test="${statusTypeInstance?.description}">
							<div class="row row col-md-offset-0">
								<div class="form-group">
									<label class="control-label lead"><g:message code="statusType.description.label" default="Description" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${statusTypeInstance}" field="description"/></p>
									
									
								</div>
							</div>
						</g:if>
					</div>
					<sec:ifAnyGranted roles="ROLE_SUPERADMIN">			
					<button type="button" class="btn blue-madison" onclick="location.href='${request.contextPath}/${controllerName }/edit/${statusTypeInstance?.id}'">
						<i class="fa fa-pencil"></i><g:message code="default.button.edit.label" default="Edit" />
					</button>
						<g:actionSubmit class="delete btn red-sunglo" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</sec:ifAnyGranted>
				</g:form>
			</div>
		</div>
	</body>
</html>
