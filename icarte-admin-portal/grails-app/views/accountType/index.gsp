
<%@page import="com.armedialab.util.Utils"%>
<%@ page import="com.armedialab.entity.AccountType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'accountType.label', default: 'AccountType')}" />
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
				<table class="table table-striped table-bordered table-hover dt-responsive" style="width:100%" id="accountTypeList">
					<thead>
						<tr>
						
							<th class="all"><g:message code="accountType.name.label" default="Name" /></th>
							<th class="all"><g:message code="accountType.description.label" default="Description" /></th>
							<th class="all"><g:message code="accountType.isActive.label" default="Is Active" /></th>
							<th class="all"><g:message code="accountType.updatedBy.label" default="Updated By" /></th>
							<th class="all"><g:message code="accountType.createdBy.label" default="Created By" /></th>
							<th class="all"><g:message code="accountType.dateCreated.label" default="Date Created" /></th>
							<th class="all"><g:message code="accountType.lastUpdated.label" default="Last Updated" /></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${accountTypeInstanceList}" status="i" var="accountTypeInstance">
						<tr>
							<td><g:link action="show" id="${accountTypeInstance.id}">${fieldValue(bean: accountTypeInstance, field: "name")}</g:link></td>
							<td>${fieldValue(bean: accountTypeInstance, field: "description")}</td>
							<td>${fieldValue(bean: accountTypeInstance, field: "isActive")}</td>
							<td>${fieldValue(bean: accountTypeInstance, field: "updatedBy")}</td>
							<td>${fieldValue(bean: accountTypeInstance, field: "createdBy")}</td>
							<td><g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${accountTypeInstance.dateCreated}" /></td>
							<td><g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${accountTypeInstance.lastUpdated}" /></td>
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>
