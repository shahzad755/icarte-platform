<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		
		<div class="portlet light portlet-fit portlet-form bordered" id="edit-user" role="main">
			<div class="portlet-title">
				<div class="caption font-blue">
					<i class="icon-note"></i><g:message code="default.edit.label" args="[entityName]" />
				</div>
				<div class="pull-right">
					<button id="btn-user-role" type="button" class="btn blue-madison" data-url="${createLink(uri: '/user/userRoles', params: [id: userInstance?.id])}" 
												data-toggle="modal">
						<span class="userBtnSpan"><span class="icon-key" aria-hidden="true"></span>&nbsp;Roles </span>
					</button>
				</div>				
			</div>
			<div class="portlet-body">
					<g:if test="${flash.message}">
						<div class="message alert alert-info alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Info!</strong> ${flash.message}
			             </div>
					</g:if>
					<g:hasErrors bean="${userInstance}">
					<div class="alert alert-danger alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Error!</strong>
							<ul class="errors" role="alert">
								<g:eachError bean="${userInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
					</div>
					</g:hasErrors>
					<g:form url="[resource:userInstance, action:'update']" method="PUT" class="form-horizontal" >
						<g:hiddenField name="version" value="${userInstance?.version}" />							
						<div class="form-body">
							<g:render template="form"/>
						</div>
						<div class="form-actions">
							<div class="row pull-right">
								<button type="submit" class="btn green-jungle">
									<i class="fa fa-pencil"></i><g:message code="default.button.update.label"/>
								</button>
								<button type="button" class="btn default" onclick="javascript: history.go(-1)">
									<g:message code="default.button.cancel.label"/>
								</button>
							</div>
						</div>
					</g:form>
			</div>
		</div>
		<div id="user-role-modal" class="modal container fade" tabindex="-1" data-width="700"></div>
	</body>
</html>
