
<%@page import="com.armedialab.util.Utils"%>
<%@ page import="com.armedialab.entity.Restaurant" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'restaurant.label', default: 'Restaurant')}" />
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
				<table class="table table-striped table-bordered table-hover dt-responsive" style="width:100%" id="restaurant_list">
					<thead>
						<tr>
							<th class="all"><g:message code="restaurant.restaurantCode.label" default="Restaurant Code" /></th>
							<th class="all"><g:message code="restaurant.name.label" default="Name" /></th>
							<th class="all"><g:message code="restaurant.accountType.label" default="Account Type" /></th>
							<sec:ifAnyGranted roles="ROLE_SUPERADMIN">							
								<th class="none"><g:message code="restaurant.accountBlocked.label" default="Account Blocked?" /></th>
								<th class="none"><g:message code="restaurant.accountCancelled.label" default="Account Cancelled?" /></th>
								<th class="none"><g:message code="restaurant.accountDeleted.label" default="Account Deleted?" /></th>
							</sec:ifAnyGranted>
							<th class="desktop"><g:message code="restaurant.activationDate.label" default="Activation Date" /></th>
							<th class="desktop"><g:message code="restaurant.billingPeriod.label" default="Billing Period" /></th>
							<th> <g:message code="default.button.edit.label" default="Edit" /> </th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${restaurantInstanceList}" status="i" var="restaurantInstance">
						<tr>
							<td width="10%"><g:link action="show" id="${restaurantInstance.id}">${fieldValue(bean: restaurantInstance, field: "restaurantCode")}</g:link></td>
							<td width="40%">${fieldValue(bean: restaurantInstance, field: "name")}</td>
							<td width="15%">${fieldValue(bean: restaurantInstance, field: "accountType.name")}</td>
							<sec:ifAnyGranted roles="ROLE_SUPERADMIN">
								<td width="5%">${fieldValue(bean: restaurantInstance, field: "accountBlocked")}</td>
								<td width="5%">${fieldValue(bean: restaurantInstance, field: "accountCancelled")}</td>
								<td width="5%">${fieldValue(bean: restaurantInstance, field: "accountDeleted")}</td>
							</sec:ifAnyGranted>
							<td width="15%"><g:formatDate format="${Utils.DATE_FORMAT}" date="${restaurantInstance.activationDate}" /></td>
							<td width="5%">${fieldValue(bean: restaurantInstance, field: "billingPeriod")}</td>
							<td><g:link action="edit" id="${restaurantInstance.id}" class="btn btn-circle btn-icon-only blue"><i class="icon-note"></i></g:link></td>
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>
