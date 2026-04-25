<!DOCTYPE html>
<html>
	<head>
		<meta name="layout">
		<g:set var="entityName" value="${message(code: 'itemCategoryTranslation.label', default: 'Item Category Translation')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="portlet light portlet-fit portlet-form bordered" id="create-itemCatTranslation" role="main">
			<div class="portlet-title">
				<div class="caption font-blue">
					<i class="icon-note"></i><g:message code="default.create.label" args="[entityName]" />
				</div>
			</div>
			<div id="itemCatTranslation-create-portlet-body" class="portlet-body">
					<g:hasErrors bean="${itemCategoryTranslationInstance}">
					<div id="error" class="alert alert-danger alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Error!</strong>
							<ul class="errors" role="alert">
								<g:eachError bean="${itemCategoryTranslationInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
					</div>
					</g:hasErrors>
					<form id="itemCatTranslationForm" method="post">					
						<div class="form-body">
							<g:render template="form"/>
						</div>
						<div class="form-actions right">
							<div class="row">
								<div class="col-md-offset-1">
									<button type="button" class="btn green-jungle" onclick="javascript: createItemCatTranslation();">
										<i class="fa fa-pencil"></i><g:message code="default.button.create.label"/>
									</button>
									<button type="button" data-dismiss="modal" class="btn btn-outline dark">
										<g:message code="default.button.cancel.label"/>
									</button>
								</div>
							</div>
						</div>
					</form>
			</div>
		</div>
	</body>
</html>
