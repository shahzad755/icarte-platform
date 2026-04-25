
<%@page import="com.armedialab.util.Utils"%>
<%@ page import="com.armedialab.entity.Menu" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'menu.label', default: 'Menu Group')}" />
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
				<table class="table table-striped table-bordered table-hover dt-responsive" style="width:100%" id="menuList">
					<thead>
						<tr>
							<th class="all"><g:message code="menu.title.label" default="Title" /></th>
							<th class="all"><g:message code="branch.label" default="Branch" /></th>
							<th class="all"><g:message code="menu.isActive.label" default="Active" /></th>
							<th class="all"><g:message code="menu.updatedBy.label" default="Updated By" /></th>
							<th class="all"><g:message code="menu.createdBy.label" default="Created By" /></th>
							<th class="all"><g:message code="menu.dateCreated.label" default="Date Created" /></th>
							<th> <g:message code="default.button.edit.label" default="Edit" /> </th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${menuInstanceList}" status="i" var="menuInstance">
						<tr>
							<td><g:link action="show" id="${menuInstance.id}">${fieldValue(bean: menuInstance, field: "title")}</g:link></td>
							<td>${fieldValue(bean: menuInstance, field: "branch")}</td>
							<td><g:formatBoolean boolean="${menuInstance.isActive}"/></td>
							<td>${fieldValue(bean: menuInstance, field: "updatedBy")}</td>
							<td>${fieldValue(bean: menuInstance, field: "createdBy")}</td>
							<td><g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${menuInstance.dateCreated}" /></td>
							<td><g:link action="edit" id="${menuInstance.id}" class="btn btn-circle btn-icon-only blue"><i class="icon-note"></i></g:link></td>
							
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>
