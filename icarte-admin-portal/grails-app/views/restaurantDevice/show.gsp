
<%@page import="com.armedialab.util.Utils"%>
<%@ page import="com.armedialab.entity.RestaurantDevice" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'restaurantDevice.label', default: 'Device')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		<div class="portlet light bordered" id="show-restaurantDevice" role="main">
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
					<g:hasErrors bean="${restaurantDeviceInstance}">
					<div class="alert alert-danger alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Error!</strong>
							<ul class="errors" role="alert">
								<g:eachError bean="${restaurantDeviceInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
					</div>
					</g:hasErrors>
					<g:form class="form-horizontal" role="form">
					
					<div class="form-body">
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurantDevice.registrationCode.label" default="Registration Code" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${restaurantDeviceInstance}" field="registrationCode"/></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurantDevice.deviceId.label" default="Device IMEI" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${restaurantDeviceInstance}" field="deviceId"/></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurantDevice.branch.label" default="Branch" />:</label>
										<p class="form-control-static">${restaurantDeviceInstance?.branch?.encodeAsHTML()}</p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurantDevice.deviceManufecturer.label" default="Device Manufecturer" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${restaurantDeviceInstance}" field="deviceManufecturer"/></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurantDevice.servingTable.label" default="Serving Table" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${restaurantDeviceInstance?.servingTable}" field="tableRefNumber"/></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurantDevice.applicationMode.label" default="Application Mode" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${restaurantDeviceInstance}" field="applicationMode"/></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurantDevice.isCustContactMandatory.label" default="Customer Contact Mandatory?" />:</label>
										<p class="form-control-static"><g:formatBoolean  false="No" true="Yes" boolean="${restaurantDeviceInstance?.isCustContactMandatory}" /></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurantDevice.isActive.label" default="Active?" />:</label>
										<p class="form-control-static"><g:formatBoolean  false="No" true="Yes" boolean="${restaurantDeviceInstance?.isActive}" /></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurantDevice.isBlocked.label" default="Blocked?" />:</label>
										<p class="form-control-static"><g:formatBoolean  false="No" true="Yes" boolean="${restaurantDeviceInstance?.isBlocked}" /></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurantDevice.blockedOn.label" default="Blocked On" />:</label>
										<p class="form-control-static"><g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${restaurantDeviceInstance?.blockedOn}" /></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurantDevice.blockedBy.label" default="Blocked By" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${restaurantDeviceInstance}" field="blockedBy"/></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurantDevice.lastLoginTime.label" default="Last Login Time" />:</label>
										<p class="form-control-static"><g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${restaurantDeviceInstance?.lastLoginTime}" /></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurantDevice.dateCreated.label" default="Created On" />:</label>
										<p class="form-control-static"><g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${restaurantDeviceInstance?.dateCreated}" /></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurantDevice.createdBy.label" default="Created By" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${restaurantDeviceInstance}" field="createdBy"/></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurantDevice.lastUpdated.label" default="Last Updated On" />:</label>
										<p class="form-control-static"><g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${restaurantDeviceInstance?.lastUpdated}" /></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurantDevice.updatedBy.label" default="Updated By" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${restaurantDeviceInstance}" field="updatedBy"/></p>
								</div>
							</div>
					</div>
					<div class="form-actions">
						<div class="row pull-right">
							<button type="button" class="btn blue-madison" onclick="location.href='${request.contextPath}/${controllerName }/edit/${restaurantDeviceInstance?.id}'">
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
