
<%@ page import="com.armedialab.user.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		<div class="portlet light bordered" id="show-user" role="main">
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
					<g:hasErrors bean="${userInstance}">
					<div class="alert alert-danger alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Error!</strong>
							<ul class="errors" role="alert">
								<g:eachError bean="${userInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
					</div>
					</g:hasErrors>
					<g:form class="form-horizontal" role="form" url="[resource:userInstance, action:'delete']" method="DELETE">
					
					<div class="form-body">
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="user.username.label" default="Username" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${userInstance}" field="username"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="user.password.label" default="Password" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${userInstance}" field="password"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="user.createdBy.label" default="Created By" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${userInstance}" field="createdBy"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="user.passwordRecoveryQst.label" default="Password Recovery Qst" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${userInstance}" field="passwordRecoveryQst"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="user.passwordRecoveryAns.label" default="Password Recovery Ans" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${userInstance}" field="passwordRecoveryAns"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="user.lastLoggedIn.label" default="Last Logged In" />:</label>
									
										<p class="form-control-static"><g:formatDate date="${userInstance?.lastLoggedIn}" /></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="user.expiresOn.label" default="Expires On" />:</label>
									
										<p class="form-control-static"><g:formatDate date="${userInstance?.expiresOn}" /></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="user.updatedBy.label" default="Updated By" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${userInstance}" field="updatedBy"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="user.email.label" default="Email" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${userInstance}" field="email"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="user.middleName.label" default="Middle Name" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${userInstance}" field="middleName"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="user.accountExpired.label" default="Account Expired" />:</label>
									
										<p class="form-control-static"><g:formatBoolean boolean="${userInstance?.accountExpired}" /></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="user.accountLocked.label" default="Account Locked" />:</label>
									
										<p class="form-control-static"><g:formatBoolean boolean="${userInstance?.accountLocked}" /></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="user.dateCreated.label" default="Date Created" />:</label>
									
										<p class="form-control-static"><g:formatDate date="${userInstance?.dateCreated}" /></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="user.enabled.label" default="Enabled" />:</label>
									
										<p class="form-control-static"><g:formatBoolean boolean="${userInstance?.enabled}" /></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="user.firstName.label" default="First Name" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${userInstance}" field="firstName"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="user.lastName.label" default="Last Name" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${userInstance}" field="lastName"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="user.lastUpdated.label" default="Last Updated" />:</label>
									
										<p class="form-control-static"><g:formatDate date="${userInstance?.lastUpdated}" /></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="user.passwordExpired.label" default="Password Expired" />:</label>
									
										<p class="form-control-static"><g:formatBoolean boolean="${userInstance?.passwordExpired}" /></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="user.staff.label" default="Staff" />:</label>
									
										<p class="form-control-static"><g:link controller="staff" action="show" id="${userInstance?.staff?.id}">${userInstance?.staff?.encodeAsHTML()}</g:link></p>
									
									
								</div>
							</div>
					
					</div>
					<button type="button" class="btn blue-madison" onclick="location.href='${request.contextPath}/${controllerName }/edit/${userInstance?.id}'">
						<i class="fa fa-pencil"></i><g:message code="default.button.edit.label" default="Edit" />
					</button>
					<g:actionSubmit class="delete btn red-sunglo" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</g:form>
			</div>
		</div>
	</body>
</html>
