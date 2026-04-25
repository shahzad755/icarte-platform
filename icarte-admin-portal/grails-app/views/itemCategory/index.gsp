
<%@page import="com.armedialab.util.Utils"%>
<%@ page import="com.armedialab.entity.ItemCategory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'itemCategory.label', default: 'ItemCategory')}" />
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
		<div id="itemCatListBody" class="portlet light bordered">
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
				<table class="table table-striped table-bordered table-hover dt-responsive" style="width:100%" id="itemCatgoryList">
					<thead>
						<tr>
							<th class="all"><g:message code="itemCategory.title.label" default="Title" /></th>
							<th class="desktop"><g:message code="itemCategory.description.label" default="Description" /></th>
							<th class="desktop"><g:message code="itemCategory.mappingCode.label" default="Mapping Code" /></th>
							<%--
							<th class="desktop"><g:message code="itemCategory.availableDurationStart.label" default="Available Duration Start" /></th>
							<th class="desktop"><g:message code="itemCategory.availableDurationEnd.label" default="Available Duration End" /></th>
							<th class="desktop"><g:message code="itemCategory.displayOrder.label" default="Display Order" /></th>
							--%>
							<th class="all"><g:message code="itemCategory.menu.label" default="Menu Groups" /></th>
							<th class="all"><g:message code="itemCategory.isActive.label" default="Is Active" /></th>
							<th> <g:message code="default.button.edit.label" default="Edit" /> </th>
						</tr>
					</thead>
					<tbody id="sortable"><%--
					<g:each in="${itemCategoryInstanceList}" status="i" var="itemCategoryInstance">
						<tr id="displayorder_${itemCategoryInstance[0].id}">
							<td><g:link action="show" id="${itemCategoryInstance[0].id}">${fieldValue(bean: itemCategoryInstance[1], field: "title")}</g:link></td>
							<td><g:link action="show" id="${itemCategoryInstance[0].parentCategory?.id}">${fieldValue(bean: itemCategoryInstance[0], field: "parentCategory")}</g:link></td>
							<td>${fieldValue(bean: itemCategoryInstance[1], field: "description")}</td>
							<td>${fieldValue(bean: itemCategoryInstance[0], field: "mappingCode")}</td>
							
							<td><g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${itemCategoryInstance[0].availableDurationStart}" /></td>
							<td><g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${itemCategoryInstance[0].availableDurationEnd}" /></td>
							<td>${fieldValue(bean: itemCategoryInstance[0], field: "displayOrder")}</td>
							
							<td>${fieldValue(bean: itemCategoryInstance[0], field: "menu.title")}</td>
							<td><g:formatBoolean boolean="${itemCategoryInstance[0].isActive}"/></td>
							<td><g:link action="edit" id="${itemCategoryInstance[0].id}" class="btn btn-circle btn-icon-only blue"><i class="icon-note"></i></g:link></td>
						</tr>
					</g:each>
					--%></tbody>
				</table>
			</div>
		</div><%--
		<ul id="sortable" class="ui-sortable">
  <li id="1" class="ui-state-default ui-sortable-handle">Item 1</li>
  <li id="2" class="ui-state-default ui-sortable-handle">Item 2</li>
  <li id="3" class="ui-state-default ui-sortable-handle">Item 3</li>
  <li id="4" class="ui-state-default ui-sortable-handle">Item 4</li>
  <li id="5" class="ui-state-default ui-sortable-handle">Item 5</li>
</ul>
 
	--%></body>
</html>
