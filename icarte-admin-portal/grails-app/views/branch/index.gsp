
<%@ page import="com.armedialab.entity.Branch" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'branch.label', default: 'Branch')}" />
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
				<table class="table table-striped table-bordered table-hover dt-responsive" style="width:100%" id="branchList">
					<thead>
						<tr>
							<th width="10%" class="all"><g:message code="branch.branchCode.label" default="Branch Code" /></th>
							<th width="40%" class="all"><g:message code="branch.name.label" default="Name" /></th>
							<sec:ifAnyGranted roles="ROLE_SUPERADMIN">
								<th width="30%" class="all"><g:message code="branch.restaurant.label" default="Restaurant" /></th>
							</sec:ifAnyGranted>
							<th width="5%" class="all"><g:message code="branch.managerId.label" default="Manager Id" /></th>
							<th width="5%" class="all"><g:message code="branch.isActive.label" default="Is Active" /></th>
							<th width="5%" class="all">Edit</th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${branchInstanceList}" status="i" var="branchInstance">
						<tr>
							<td><g:link action="show" id="${branchInstance.id}">${fieldValue(bean: branchInstance, field: "branchCode")}</g:link></td>
							<td>${fieldValue(bean: branchInstance, field: "name")}</td>
							<sec:ifAnyGranted roles="ROLE_SUPERADMIN">
								<td>
									<g:link controller="restaurant" action="show" id="${branchInstance.restaurant.id}">${fieldValue(bean: branchInstance, field: "restaurant.name")}</g:link>
								</td>
							</sec:ifAnyGranted>
							<td>${fieldValue(bean: branchInstance, field: "managerId")}</td>
							<td><g:formatBoolean boolean="${branchInstance.isActive}"/></td>
							<td><g:link action="edit" id="${branchInstance.id}" class="btn btn-circle btn-icon-only blue"><i class="icon-note"></i></g:link></td>
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>
