
<%@ page import="com.armedialab.entity.ServingTable" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'servingTable.label', default: 'ServingTable')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		<div class="portlet light bordered" id="show-servingTable" role="main">
			<div class="portlet-title">
				<div class="caption font-blue">
					<i class="icon-info"></i><g:message code="default.show.label" args="[entityName]" />
				</div>
			</div>
			<div class="portlet-body form">
					<g:if test="${flash.message}">
						<div class="message alert alert-info alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Info!</strong> ${flash.message}
			             </div>
					</g:if>
					<g:hasErrors bean="${servingTableInstance}">
					<div class="alert alert-danger alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Error!</strong>
							<ul class="errors" role="alert">
								<g:eachError bean="${servingTableInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
					</div>
					</g:hasErrors>
					<g:form class="form-horizontal" role="form" url="[resource:servingTableInstance, action:'delete']" method="DELETE">
					
					<div class="form-body">
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="servingTable.tableRefNumber.label" default="Table Ref Number" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${servingTableInstance}" field="tableRefNumber"/></p>
									
									
								</div>
							</div>
					
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="servingTable.floor.label" default="Floor" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${servingTableInstance}" field="floor"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="servingTable.description.label" default="Description" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${servingTableInstance}" field="description"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="servingTable.branch.label" default="Branch" />:</label>
									
										<p class="form-control-static"><g:link controller="branch" action="show" id="${servingTableInstance?.branch?.id}">${servingTableInstance?.branch?.name?.encodeAsHTML()}</g:link></p>
									
									
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="servingTable.isActive.label" default="Is Active" />:</label>
									
										<p class="form-control-static"><g:formatBoolean boolean="${servingTableInstance?.isActive}" /></p>
									
									
								</div>
							</div>
					
					
					</div>
					<div class="form-actions right">
						<div class="row">
							<div class="col-md-offset-1">
								<button type="button" class="btn blue-madison" onclick="location.href='${request.contextPath}/${controllerName }/edit/${servingTableInstance?.id}'">
									<i class="fa fa-pencil"></i><g:message code="default.button.edit.label" default="Edit" />
								</button>
							</div>
						</div>
					</div>
				</g:form>
		</div>
	</body>
</html>
