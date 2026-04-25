
<%@ page import="com.armedialab.emergency.UserProfile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userProfile.label', default: 'Emergency Requests')}" />
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
                     	${ entityName}
                     </span>
                 </div>
                 <div class="tools"> </div>
             </div>
             <div id="list-accountType" class="portlet-body" role="main">
				<table class="table table-striped table-bordered table-hover dt-responsive" style="width:100%" id="profileList">
					<thead>
						<tr>
							<th class="all"><g:message code="userProfile.requestType.label" default="Request Type" /></th>
						
							<th class="all"><g:message code="userProfile.firstName.label" default="First Name" /></th>
						
							<th class="all"><g:message code="userProfile.lastName.label" default="Last Name" /></th>
						
							<th class="all"><g:message code="userProfile.mobile.label" default="Mobile" /></th>
						
							<th class="all"><g:message code="userProfile.qatariId.label" default="Qatari Id" /></th>
						
							<th class="all"><g:message code="userProfile.bloodGroup.label" default="Blood Group" /></th>
						
							<th class="all"><g:message code="userProfile.nationality.label" default="Nationality" /></th>
						
						</tr>
					</thead>
					<tbody>
					<g:each in="${userProfileInstanceList}" status="i" var="userProfileInstance">
						<tr>
							<td>${fieldValue(bean: userProfileInstance, field: "requestType")}</td>
						
							<td><g:link action="show" id="${userProfileInstance.id}">${fieldValue(bean: userProfileInstance, field: "firstName")}</g:link></td>
						
							<td>${fieldValue(bean: userProfileInstance, field: "lastName")}</td>
						
							<td>${fieldValue(bean: userProfileInstance, field: "mobile")}</td>
						
							<td>${fieldValue(bean: userProfileInstance, field: "qatariId")}</td>
						
							<td>${fieldValue(bean: userProfileInstance, field: "bloodGroup")}</td>
						
							<td>${fieldValue(bean: userProfileInstance, field: "nationality")}</td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>
