<!DOCTYPE html>
<html>
	<head>
		<meta name="layout">
		<g:set var="entityName" value="${message(code: 'userRole.label', default: 'User Roles')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="portlet light portlet-fit portlet-form bordered" role="main">
			<div class="portlet-title">
				<div class="caption font-blue">
					<i class="icon-note"></i><g:message code="default.userRole.label" default="User Role Management" />
				</div>
			</div>
			<div id="user-roles-portlet-body" class="portlet-body">
				<g:hasErrors bean="${userInstance}">
				<div id="error" class="alert alert-danger alert-dismissable" role="status">
		               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
		               <strong>Error!</strong>
						<ul class="errors" role="alert">
							<g:eachError bean="${userInstance}" var="error">
							<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
							</g:eachError>
						</ul>
				</div>
				</g:hasErrors>
				<form id="userRoleForm" method="post" class="form-horizontal form-row-seperated">
					<g:hiddenField name="userId" value="${userInstance?.id}" />							
					<div class="form-body">
						<div class="row">
						    <div class="col-md-9 pull-right">
						        <div class="form-group form-md-line-input ">
									<label for="userRoles" class="control-label"><g:message code="user.help.role" default="Select Roles..." /></label>
									<g:select id="userRoles" name="userRoles" 
											from="${roles}"
											optionKey="id"
											optionValue="name"
											value="${userInstance?.getAuthorities()*.id}"
											multiple="true"
											class="multi-select"/>
						        </div>
						    </div>
						</div>
					</div>
					<div class="form-actions right">
						<button type="button" class="btn green-jungle" onclick="javascript: saveUserRoles();">
							<i class="fa fa-pencil"></i><g:message code="default.button.save.label" default="Save"/>
						</button>
						<button type="button" data-dismiss="modal" class="btn btn-outline dark">
							<g:message code="default.button.cancel.label"/>
						</button>
					</div>
				</form>
			</div>
		</div>
		<script>
		$('#userRoles').multiSelect();
		</script>
	</body>
</html>
