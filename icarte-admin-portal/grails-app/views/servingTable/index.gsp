
<%@ page import="com.armedialab.entity.ServingTable" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'servingTable.label', default: 'ServingTable')}" />
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
             <div id="list-servigTable" class="portlet-body" role="main">
				<table class="table table-striped table-bordered table-hover dt-responsive" style="width:100%" id="servingTableList">
					<thead>
						<tr>
							<th class="all"><g:message code="servingTable.tableRefNumber.label" default="Table Ref Number" /></th>
							<th class="all"><g:message code="servingTable.floor.label" default="Floor" /></th>
							<th class="desktop"><g:message code="servingTable.description.label" default="Description" /></th>
							<th class="all"><g:message code="servingTable.branch.label" default="Branch" /></th><%--
							<sec:ifAnyGranted roles="ROLE_SUPERADMIN">
								<th class="all"><g:message code="servingTable.restaurant.label" default="Restaurant" /></th>
							</sec:ifAnyGranted>
							--%><th class="all"><g:message code="servingTable.isActive.label" default="Is Active" /></th>
							<th class="desktop"> <g:message code="default.button.edit.label" default="Edit" /> </th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${servingTableInstanceList}" status="i" var="servingTableInstance">
						<tr>
							<td><g:link action="show" id="${servingTableInstance.id}">${fieldValue(bean: servingTableInstance, field: "tableRefNumber")}</g:link></td>
							<td>${fieldValue(bean: servingTableInstance, field: "floor")}</td>
							<td>${fieldValue(bean: servingTableInstance, field: "description")}</td>
							<td>${fieldValue(bean: servingTableInstance, field: "branch.name")}</td><%--
							<sec:ifAnyGranted roles="ROLE_SUPERADMIN">
								<td>${fieldValue(bean: servingTableInstance, field: "restaurant.name")}</td>
							</sec:ifAnyGranted>
							--%><td><g:formatBoolean boolean="${servingTableInstance.isActive}" /></td>
							<td><g:link action="edit" id="${servingTableInstance.id}" class="btn btn-circle btn-icon-only blue"><i class="icon-note"></i></g:link></td>
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>
