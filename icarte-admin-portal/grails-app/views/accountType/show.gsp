
<%@ page import="com.armedialab.entity.AccountType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'accountType.label', default: 'AccountType')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		<div class="portlet light bordered" id="show-accountType" role="main">
			<div class="portlet-title">
				<div class="caption font-blue">
					<i class="icon-info"></i><g:message code="default.show.label" args="[entityName]" />
				</div>
			</div>
			<div class="portlet-body form">
					<g:if test="${flash.message}">
						<div class="message alert alert-info alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Info!</strong> ${flash.message}
			             </div>
					</g:if>
					<g:hasErrors bean="${accountTypeInstance}">
						<div class="alert alert-danger alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Error!</strong>
							<ul class="errors" role="alert">
								<g:eachError bean="${accountTypeInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
						</div>
					</g:hasErrors>
					<g:form class="form-horizontal" role="form" url="[resource:accountTypeInstance, action:'delete']" method="DELETE">
					
					<div class="form-body">
					
						<g:if test="${accountTypeInstance?.name}">
							<div class="row row col-md-offset-0">
								<div class="form-group">
									<label class="control-label lead"><g:message code="accountType.name.label" default="Name" />:</label>
									
									
										<p class="form-control-static"><g:fieldValue bean="${accountTypeInstance}" field="name"/></p>
									
									
								</div>
							</div>
						</g:if>
					
						<g:if test="${accountTypeInstance?.description}">
							<div class="row row col-md-offset-0">
								<div class="form-group">
									<label class="control-label lead"><g:message code="accountType.description.label" default="Description" />:</label>
									
									
										<p class="form-control-static"><g:fieldValue bean="${accountTypeInstance}" field="description"/></p>
									
									
								</div>
							</div>
						</g:if>
					
						<g:if test="${accountTypeInstance?.updatedBy}">
							<div class="row row col-md-offset-0">
								<div class="form-group">
									<label class="control-label lead"><g:message code="accountType.updatedBy.label" default="Updated By" />:</label>
									
									
										<p class="form-control-static"><g:fieldValue bean="${accountTypeInstance}" field="updatedBy"/></p>
									
									
								</div>
							</div>
						</g:if>
					
						<g:if test="${accountTypeInstance?.createdBy}">
							<div class="row row col-md-offset-0">
								<div class="form-group">
									<label class="control-label lead"><g:message code="accountType.createdBy.label" default="Created By" />:</label>
									
									
										<p class="form-control-static"><g:fieldValue bean="${accountTypeInstance}" field="createdBy"/></p>
									
									
								</div>
							</div>
						</g:if>
					
						<g:if test="${accountTypeInstance?.dateCreated}">
							<div class="row row col-md-offset-0">
								<div class="form-group">
									<label class="control-label lead"><g:message code="accountType.dateCreated.label" default="Date Created" />:</label>
										<p class="form-control-static"><g:formatDate date="${accountTypeInstance?.dateCreated}" /></p>
								</div>
							</div>
						</g:if>
					
						<g:if test="${accountTypeInstance?.lastUpdated}">
							<div class="row row col-md-offset-0">
								<div class="form-group">
									<label class="control-label lead"><g:message code="accountType.lastUpdated.label" default="Last Updated" />:</label>
										<p class="form-control-static"><g:formatDate date="${accountTypeInstance?.lastUpdated}" /></p>
								</div>
							</div>
						</g:if>
					
						<div class="row" style="padding-left: 20px">
							<div class="form-group">
								<label class="control-label lead"><g:message
										code="accountType.isActive.label" default="Is Active" />:</label>
								<p class="form-control-static">
									<g:fieldValue bean="${accountTypeInstance}" field="isActive" />
								</p>
							</div>
						</div>
					
					</div>
					<button type="button" class="btn blue-madison" onclick="location.href='${request.contextPath}/${controllerName }/edit/${accountTypeInstance?.id}'">
						<i class="fa fa-pencil"></i><g:message code="default.button.edit.label" default="Edit" />
					</button>
					<g:actionSubmit class="delete btn red-sunglo" action="delete" value="${message(code: 'default.button.deactivated.label', default: 'De-activate')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</g:form>
			</div>
		</div>
	</body>
</html>
