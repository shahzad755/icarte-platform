
<%@page import="com.armedialab.util.Utils"%>
<%@ page import="com.armedialab.entity.FeedbackConfig" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'feedbackConfig.label', default: 'FeedbackConfig')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		<div class="portlet light bordered" id="show-feedbackConfig" role="main">
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
					<g:hasErrors bean="${feedbackConfigInstance}">
					<div class="alert alert-danger alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Error!</strong>
							<ul class="errors" role="alert">
								<g:eachError bean="${feedbackConfigInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
					</div>
					</g:hasErrors>
					<g:form class="form-horizontal" role="form" url="[resource:feedbackConfigInstance, action:'delete']" method="DELETE">
					
					<div class="form-body">
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="feedbackConfig.feedbackType.label" default="Feedback Type" />:</label>
										<p class="form-control-static">${feedbackConfigInstance?.feedbackType?.encodeAsHTML()}</p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="feedbackConfig.title.label" default="Title" />:</label>
										<p class="form-control-static">${fieldValue(bean: feedbackConfigInstance?.feedbackConfigTranslations?.getAt(0), field: 'title')}</p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="feedbackConfig.description.label" default="Description" />:</label>
										<p class="form-control-static">${fieldValue(bean: feedbackConfigInstance?.feedbackConfigTranslations?.getAt(0), field: 'description')}</p>
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="feedbackConfig.isRequired.label" default="Is Required" />:</label>
									
										<p class="form-control-static"><g:formatBoolean boolean="${feedbackConfigInstance?.isRequired}" /></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="feedbackConfig.isActive.label" default="Is Active" />:</label>
									
										<p class="form-control-static"><g:formatBoolean boolean="${feedbackConfigInstance?.isActive}" /></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="feedbackConfig.createdBy.label" default="Created By" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${feedbackConfigInstance}" field="createdBy"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="feedbackConfig.dateCreated.label" default="Created On" />:</label>
									
										<p class="form-control-static"><g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${feedbackConfigInstance?.dateCreated}" /></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="feedbackConfig.updatedBy.label" default="Updated By" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${feedbackConfigInstance}" field="updatedBy"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="feedbackConfig.lastUpdated.label" default="Updated On" />:</label>
									
										<p class="form-control-static"><g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${feedbackConfigInstance?.lastUpdated}" /></p>
									
									
								</div>
							</div>
					
						<div class="form-actions right">
							<div class="row">
								<div class="col-md-offset-1">
									<button type="button" class="btn blue-madison" onclick="location.href='${request.contextPath}/${controllerName }/edit/${feedbackConfigInstance?.id}'">
										<i class="fa fa-pencil"></i><g:message code="default.button.edit.label" default="Edit" />
									</button>
									<g:actionSubmit class="delete btn red-sunglo" action="delete" value="${message(code: 'default.button.deactivated.label', default: 'Deactivate')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
								</div>
							</div>
						</div>
					</div>
				</g:form>
			</div>
		</div>
	</body>
</html>
