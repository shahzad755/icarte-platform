<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'servingTable.label', default: 'ServingTable')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		
		<div class="portlet light portlet-fit portlet-form bordered" id="edit-servingTable" role="main">
			<div class="portlet-title">
				<div class="caption font-blue">
					<i class="icon-note"></i><g:message code="default.edit.label" args="[entityName]" />
				</div>
			</div>
			<div class="portlet-body">
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
					<g:form url="[resource:servingTableInstance, action:'update']" method="PUT" >
						<g:hiddenField name="version" value="${servingTableInstance?.version}" />							
						<div class="form-body">
							<g:render template="form"/>
						</div>
						<div class="form-actions right">
							<div class="row">
								<div class="col-md-offset-1">
									<button type="submit" class="btn green-jungle">
										<i class="fa fa-pencil"></i><g:message code="default.button.edit.label"/>
									</button>
									<button type="button" class="btn default" onclick="javascript: history.go(-1)">
										<g:message code="default.button.cancel.label"/>
									</button>
								</div>
							</div>
						</div>
					</g:form>
			</div>
		</div>
	</body>
</html>
