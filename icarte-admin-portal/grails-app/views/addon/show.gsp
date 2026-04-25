
<%@page import="com.armedialab.util.Utils"%>
<%@ page import="com.armedialab.entity.Addon" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'addon.label', default: 'Addon')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		<div class="portlet light bordered" id="show-addon" role="main">
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
					<g:hasErrors bean="${addonInstance}">
						<div class="alert alert-danger alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Error!</strong>
							<ul class="errors" role="alert">
								<g:eachError bean="${addonInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
						</div>
					</g:hasErrors>
					<g:form class="form-horizontal" role="form" url="[resource:addonInstance, action:'delete']" method="DELETE">
					
					<div class="form-body">
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="addon.title.label" default="Addon Title" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${addonInstance?.addonTranslations[0]}" field="title"/></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="addon.description.label" default="Description" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${addonInstance?.addonTranslations[0]}" field="description"/></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="addon.defaultPrice.label" default="Default Price" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${addonInstance}" field="defaultPrice"/></p>
									
									
								</div>
							</div>
						<%--
					
						<g:if test="${addonInstance?.imageUrl}">
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="addon.imageUrl.label" default="Image Url" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${addonInstance}" field="imageUrl"/></p>
									
									
								</div>
							</div>
						</g:if>
					
						--%><%--
						
						<g:if test="${addonInstance?.updtaedBy}">
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="addon.updtaedBy.label" default="Updtaed By" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${addonInstance}" field="updtaedBy"/></p>
									
									
								</div>
							</div>
						</g:if>
					
						--%>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="addon.lastUpdated.label" default="Last Updated" />:</label>
									
										<p class="form-control-static"><g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}"  date="${addonInstance?.lastUpdated}" /></p>
									
									
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="addon.dateCreated.label" default="Date Created" />:</label>
									
										<p class="form-control-static"><g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${addonInstance?.dateCreated}" /></p>
									
									
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="addon.isActive.label" default="Is Active" />:</label>
									
										<p class="form-control-static"><g:formatBoolean boolean="${addonInstance?.isActive}" /></p>
									
									
								</div>
							</div>
					
					</div>
					<div class="form-actions right">
						<div class="row">
						<button type="button" class="btn blue-madison" onclick="location.href='${request.contextPath}/${controllerName }/edit/${addonInstance?.id}'">
							<i class="fa fa-pencil"></i><g:message code="default.button.edit.label" default="Edit" />
						</button>
						<g:actionSubmit class="delete btn red-sunglo" action="delete" value="${message(code: 'default.button.deactivated.label', default: 'De-activate')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</div>
					</div>										
				</g:form>
			</div>
		</div>
	</body>
</html>
