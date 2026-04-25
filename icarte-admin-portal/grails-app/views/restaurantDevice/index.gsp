
<%@ page import="com.armedialab.entity.RestaurantDevice" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'restaurantDevice.label', default: 'Restaurant Devices')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		<g:if test="${flash.message}">
			<div class="message alert alert-info alert-dismissable" role="status">
               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
               <strong>Info!</strong> ${flash.message}
             </div>
		</g:if>
		<div class="portlet light bordered">
             <div class="portlet-title">
                 <div class="caption font-dark">
                     <i class="icon-list font-dark"></i>
                     <span class="caption-subject bold uppercase">
                     	<g:message code="default.list.label" args="[entityName]" />
                     </span>
                 </div>
                 <div class="tools"> </div>
             </div>
             <div id="list-accountType" class="portlet-body" role="main">
				<table class="table table-striped table-bordered table-hover dt-responsive" style="width:100%" id="restaurantDeviceList">
					<thead>
						<tr>
							<th class="all"><g:message code="restaurantDevice.deviceId.label" default="Device IMEI#" /></th>
							<th class="all"><g:message code="restaurantDevice.registrationCode.label" default="Reg Code" /></th>
							<th class="all"><g:message code="restaurantDevice.branch.label" default="Branch" /></th>
							<th class="desktop"><g:message code="restaurantDevice.deviceManufecturer.label" default="Device Manufecturer" /></th>
							<th class="desktop"><g:message code="restaurantDevice.applicationMode.label" default="Mode" /></th>
							<th class="all"><g:message code="restaurantDevice.isActive.label" default="Active?" /></th>
							<th class="all"><g:message code="restaurantDevice.isBlocked.label" default="Blocked?" /></th>
							<th> <g:message code="default.button.edit.label" default="Edit" /> </th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${restaurantDeviceInstanceList}" status="i" var="restaurantDeviceInstance">
						<tr>
							<td><g:link action="show" id="${restaurantDeviceInstance.id}">${fieldValue(bean: restaurantDeviceInstance, field: "deviceId")}</g:link></td>
							<td>${fieldValue(bean: restaurantDeviceInstance, field: "registrationCode")}</td>
							<td>${fieldValue(bean: restaurantDeviceInstance, field: "branch.name")}</td>
							<td>${fieldValue(bean: restaurantDeviceInstance, field: "deviceManufecturer")}</td>
							<td>${fieldValue(bean: restaurantDeviceInstance, field: "applicationMode")}</td>
							<td><g:formatBoolean false="No" true="Yes" boolean="${restaurantDeviceInstance.isActive}" /></td>
							<td><g:formatBoolean false="No" true="Yes"  boolean="${restaurantDeviceInstance.isBlocked}" /></td>
							<td><g:link action="edit" id="${restaurantDeviceInstance.id}" class="btn btn-circle btn-icon-only blue"><i class="icon-note"></i></g:link></td>
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>
