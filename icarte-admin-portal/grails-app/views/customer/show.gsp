
<%@page import="com.armedialab.util.Utils"%>
<%@ page import="com.armedialab.entity.Customer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		<div class="portlet light bordered" id="show-customer" role="main">
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
					<g:hasErrors bean="${customerInstance}">
					<div class="alert alert-danger alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Error!</strong>
							<ul class="errors" role="alert">
								<g:eachError bean="${customerInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
					</div>
					</g:hasErrors>
					<g:form class="form-horizontal" role="form" url="[resource:customerInstance, action:'delete']" method="DELETE">
					
					<div class="form-body">
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="customer.code.label" default="Code" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${customerInstance}" field="code"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="customer.firstName.label" default="First Name" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${customerInstance}" field="firstName"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="customer.lastName.label" default="Last Name" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${customerInstance}" field="lastName"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="customer.mobile.label" default="Mobile" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${customerInstance}" field="mobile"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="customer.email.label" default="Email" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${customerInstance}" field="email"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="customer.subscribeNewsLetter.label" default="Subscribe News Letter" />:</label>
									
										<p class="form-control-static"><g:formatBoolean  false="No" true="Yes" boolean="${customerInstance?.subscribeNewsLetter}" /></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="customer.isActive.label" default="Is Active" />:</label>
									
										<p class="form-control-static"><g:formatBoolean  false="No" true="Yes" boolean="${customerInstance?.isActive}" /></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="customer.dateCreated.label" default="Date Created" />:</label>
										<p class="form-control-static"><g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${customerInstance?.dateCreated}" /></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="customer.createdBy.label" default="Created By" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${customerInstance}" field="createdBy"/></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="customer.lastUpdated.label" default="Last Updated On" />:</label>
										<p class="form-control-static"><g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${customerInstance?.lastUpdated}" /></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="customer.updatedBy.label" default="Updated By" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${customerInstance}" field="updatedBy"/></p>
								</div>
							</div>
					
					</div>
					<div class="form-actions">
						<div class="row pull-right">
							<button type="button" class="btn blue-madison" onclick="location.href='${request.contextPath}/${controllerName }/edit/${customerInstance?.id}'">
								<i class="fa fa-pencil"></i><g:message code="default.button.edit.label" default="Edit" />
							</button>
							<button type="button" class="btn default" onclick="location.href='${request.contextPath}/${controllerName }/index'">
								<g:message code="default.button.cancel.label"/>
							</button>
						</div>
					</div>
				</g:form>
			</div>
		</div>
	</body>
</html>
