
<%@page import="com.armedialab.util.Utils"%>
<%@ page import="com.armedialab.entity.Menu" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'menu.label', default: 'Menu Group')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		<div class="portlet light bordered" id="show-menu" role="main">
			<div class="portlet-title">
				<div class="caption font-blue">
					<i class="icon-info"></i><g:message code="default.show.label" args="[entityName]" />
				</div>
				<div class="pull-right">
					<button type="button" class="btn blue-madison" onclick="location.href='${request.contextPath}/itemCategory/index?menuId=${menuInstance?.id}'">
						<span class="item"><i class="fa fa-sitemap" aria-hidden="true"></i> &nbsp;<g:message code="default.itemCategory.edit.label" default="Item Categories" /> </span>
					</button>
				</div>
			</div>
			<div class="portlet-body form">
					<g:if test="${flash.message}">
						<div class="message alert alert-info alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Info!</strong> ${flash.message}
			             </div>
					</g:if>
					<g:hasErrors bean="${menuInstance}">
					<div class="alert alert-danger alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Error!</strong>
							<ul class="errors" role="alert">
								<g:eachError bean="${menuInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
					</div>
					</g:hasErrors>
					<g:form class="form-horizontal" role="form" url="[resource:menuInstance, action:'delete']" method="DELETE">
					
					<div class="form-body">
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="menu.title.label" default="Title" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${menuInstance}" field="title"/></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="branch.label" default="Branch" />:</label>
										<p class="form-control-static">
										<g:link controller="branch" action="show" id="${menuInstance.branch.id}">${fieldValue(bean: menuInstance, field: "branch")}</g:link>
										</p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="menu.isActive.label" default="Is Active" />:</label>
										<p class="form-control-static"><g:formatBoolean boolean="${menuInstance?.isActive}" /></p>
								</div>
							</div>
							
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="menu.createdBy.label" default="Created By" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${menuInstance}" field="createdBy"/></p>
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="menu.dateCreated.label" default="Date Created" />:</label>
										<p class="form-control-static"><g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${menuInstance?.dateCreated}" /></p>
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="menu.updatedBy.label" default="Updated By" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${menuInstance}" field="updatedBy"/></p>
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="menu.lastUpdated.label" default="Last Updated" />:</label>
										<p class="form-control-static"><g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${menuInstance?.lastUpdated}" /></p>
								</div>
							</div>
					</div>
					<button type="button" class="btn blue-madison" onclick="location.href='${request.contextPath}/${controllerName }/edit/${menuInstance?.id}'">
						<i class="fa fa-pencil"></i><g:message code="default.button.edit.label" default="Edit" />
					</button>
					<g:actionSubmit class="delete btn red-sunglo" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</g:form>
			</div>
		</div>
	</body>
</html>
