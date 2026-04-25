
<%@ page import="com.armedialab.entity.Address" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
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
				<table class="table table-striped table-bordered table-hover dt-responsive" style="width:100%" id="sample_1">
					<thead>
						<tr>
						
							<th class="all"><g:message code="address.email.label" default="Email" /></th>
						
							<th class="all"><g:message code="address.street.label" default="Street" /></th>
						
							<th class="all"><g:message code="address.area.label" default="Area" /></th>
						
							<th class="all"><g:message code="address.city.label" default="City" /></th>
						
							<th class="all"><g:message code="address.country.label" default="Country" /></th>
						
							<th class="all"><g:message code="address.poBox.label" default="Po Box" /></th>
						
						</tr>
					</thead>
					<tbody>
					<g:each in="${addressInstanceList}" status="i" var="addressInstance">
						<tr>
						
							<td><g:link action="show" id="${addressInstance.id}">${fieldValue(bean: addressInstance, field: "email")}</g:link></td>
						
							<td>${fieldValue(bean: addressInstance, field: "street")}</td>
						
							<td>${fieldValue(bean: addressInstance, field: "area")}</td>
						
							<td>${fieldValue(bean: addressInstance, field: "city")}</td>
						
							<td>${fieldValue(bean: addressInstance, field: "country")}</td>
						
							<td>${fieldValue(bean: addressInstance, field: "poBox")}</td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>
