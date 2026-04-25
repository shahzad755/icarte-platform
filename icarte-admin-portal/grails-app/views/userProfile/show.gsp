
<%@ page import="com.armedialab.emergency.UserProfile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userProfile.label', default: 'UserProfile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		<div class="portlet light bordered" id="show-userProfile" role="main">
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
					<g:hasErrors bean="${userProfileInstance}">
					<div class="alert alert-danger alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Error!</strong>
							<ul class="errors" role="alert">
								<g:eachError bean="${userProfileInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
					</div>
					</g:hasErrors>
					<g:form class="form-horizontal" role="form" url="[resource:userProfileInstance, action:'delete']" method="DELETE">
					
					<div class="form-body">
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="userProfile.firstName.label" default="First Name" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${userProfileInstance}" field="firstName"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="userProfile.lastName.label" default="Last Name" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${userProfileInstance}" field="lastName"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="userProfile.mobile.label" default="Mobile" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${userProfileInstance}" field="mobile"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="userProfile.qatariId.label" default="Qatari Id" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${userProfileInstance}" field="qatariId"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="userProfile.bloodGroup.label" default="Blood Group" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${userProfileInstance}" field="bloodGroup"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="userProfile.nationality.label" default="Nationality" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${userProfileInstance}" field="nationality"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="userProfile.lat.label" default="Lat" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${userProfileInstance}" field="lat"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="userProfile.lon.label" default="Lon" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${userProfileInstance}" field="lon"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="userProfile.requestType.label" default="Request Type" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${userProfileInstance}" field="requestType"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="userProfile.dateCreated.label" default="Date Created" />:</label>
									
										<p class="form-control-static"><g:formatDate date="${userProfileInstance?.dateCreated}" /></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="userProfile.lastUpdated.label" default="Last Updated" />:</label>
									
										<p class="form-control-static"><g:formatDate date="${userProfileInstance?.lastUpdated}" /></p>
									
									
								</div>
							</div>
					
					</div>
					<button type="button" class="btn blue-madison" onclick="location.href='${request.contextPath}/${controllerName }/edit/${userProfileInstance?.id}'">
						<i class="fa fa-pencil"></i><g:message code="default.button.edit.label" default="Edit" />
					</button>
					<g:actionSubmit class="delete btn red-sunglo" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</g:form>
			</div>
		</div>
	</body>
</html>
