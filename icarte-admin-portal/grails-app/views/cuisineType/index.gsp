
<%@page import="com.armedialab.util.Utils"%>
<%@ page import="com.armedialab.entity.CuisineType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cuisineType.label', default: 'Cuisine Types')}" />
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
				<table class="table table-striped table-bordered table-hover dt-responsive" style="width:100%" id="cuisineTypeList">
					<thead>
						<tr>
							<th class="all"><g:message code="cuisineType.title.label" default="Title" /></th>
							<th class="desktop"><g:message code="cuisineType.description.label" default="Description" /></th>
							<th class="all"><g:message code="cuisineType.isActive.label" default="Is Active" /></th>
							<th class="all"><g:message code="cuisineType.createdBy.label" default="Created By" /></th>
							<th class="all"><g:message code="cuisineType.updatedBy.label" default="Updated By" /></th>
							<th> <g:message code="default.button.edit.label" default="Edit" /> </th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${cuisineTypeInstanceList}" status="i" var="cuisineTypeInstance">
						<tr>
							<td><g:link action="show" id="${cuisineTypeInstance[0].id}">${fieldValue(bean: cuisineTypeInstance[1], field: "title")}</g:link></td>
							<td>${fieldValue(bean: cuisineTypeInstance[1], field: "description")}</td>
							<td>${fieldValue(bean: cuisineTypeInstance[0], field: "isActive")}</td>
							<td>${fieldValue(bean: cuisineTypeInstance[0], field: "createdBy")}</td>
							<td>${fieldValue(bean: cuisineTypeInstance[0], field: "updatedBy")}</td>
							<td><g:link action="edit" id="${cuisineTypeInstance[0].id}" class="btn btn-circle btn-icon-only blue"><i class="icon-note"></i></g:link></td>
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>
