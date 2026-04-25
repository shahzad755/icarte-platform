
<%@page import="com.armedialab.util.Utils"%>
<%@ page import="com.armedialab.entity.Addon" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'addon.label', default: 'Addon')}" />
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
             <div id="list-addon" class="portlet-body" role="main">
				<table class="table table-striped table-bordered table-hover dt-responsive" style="width:100%" id="addonList">
					<thead>
						<tr>
							<th class="all"><g:message code="addon.title.label" default="Title" /></th>
							<th class="all"><g:message code="addon.defaultPrice.label" default="Default Price" /></th>
							<th class="desktop"><g:message code="addon.description.label" default="Description" /></th>
							<th class="desktop"><g:message code="addon.dateCreated.label" default="Created On" /></th>
							<th class="desktop"><g:message code="addon.lastUpdated.label" default="Last Updated" /></th>
							<th> <g:message code="default.button.edit.label" default="Edit" /> </th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${addonInstanceList}" status="i" var="addonInstance">
						<tr>
							<td><g:link action="show" id="${addonInstance[0].id}">${fieldValue(bean: addonInstance[1], field: "title")}</g:link></td>
							<td>${fieldValue(bean: addonInstance[0], field: "defaultPrice")}</td>
							<td>${fieldValue(bean: addonInstance[1], field: "description")}</td>
							<td><g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${addonInstance[0].dateCreated}" /></td>
							<td><g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${addonInstance[0].lastUpdated}" /></td>
							<td><g:link action="edit" id="${addonInstance[0].id}" class="btn btn-circle btn-icon-only blue"><i class="icon-note"></i></g:link></td>							
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>
