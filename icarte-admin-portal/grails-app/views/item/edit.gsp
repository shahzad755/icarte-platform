<!DOCTYPE html>
<html>
	<head>
		<g:if test="${params.mode=='standard'}"><meta name="layout" content="main"></g:if>
		<g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
		<title><g:message code="default.manage.item.label" default="Manage Item" /></title>
	</head>
	<body>
	<g:if test="${params.mode=='standard'}"><g:render template="/layouts/pageheader"/></g:if>
		
		<div class="portlet light portlet-fit portlet-form bordered" id="manage-item" role="main">
			<div class="portlet-title">
				<div class="caption font-blue">
					<i class="icon-note"></i><g:message code="default.manage.item.label" default="Manage Item" />
				</div>
			</div>
			<div id="item-edit-portlet-body" class="portlet-body">
					<g:if test="${flash.message}">
						<div class="message alert alert-info alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Info!</strong> ${flash.message}
			             </div>
					</g:if>
					<g:hasErrors bean="${itemInstance}">
					<div class="alert alert-danger alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Error!</strong>
							<ul class="errors" role="alert">
								<g:eachError bean="${itemInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
					</div>
					</g:hasErrors>
					<div class="tabbable-custom">
						<ul class="nav nav-tabs">
							<li class="active">
								<a href="#tab_item" data-toggle="tab"> Item </a>
							</li>
							<li>
								<a href="#tab_item_addon" data-toggle="tab"> Addons </a>
							</li>
							<li>
								<a href="#tab_item_variant" data-toggle="tab"> Customizations </a>
							</li>
							<li>
								<a href="#tab_item_translation" data-toggle="tab"> Translations </a>
							</li>
							<li>
								<a href="#tab_item_image" data-toggle="tab"> Media </a>
							</li>
						</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tab_item">
							<form id="itemEditForm" method="post" class="form-horizontal">
								<div class="form-body">
									<g:hiddenField id="version" name="version" value="${itemInstance?.version}" />
									<g:hiddenField id="id" name="id" value="${itemInstance?.id}" />
									<g:render template="form"/>
								</div>
								<div class="form-actions right">
									<button type="button" class="btn green-jungle" onclick="javascript: saveItem(true);">
										<i class="fa fa-pencil"></i><g:message code="default.button.save.label" default="Save"/>
									</button>
									<button type="button" data-dismiss="modal" class="btn btn-outline dark" <g:if test="${params.mode=='standard'}">onclick="location.href='${request.contextPath}/${controllerName }/index'"</g:if>>
										<g:message code="default.button.cancel.label"/>
									</button>
								</div>
							</form>
						</div>
						<div class="tab-pane" id="tab_item_addon">
							<g:render template="itemAddon" />
						</div>
						<div class="tab-pane" id="tab_item_variant">
							<g:render template="itemVariant" />
						</div>
						<div class="tab-pane" id="tab_item_translation">
							<div class="table-toolbar">
							    <div class="row">
							        <div class="pull-right col-md-1">
							            <div class="btn-group">
							             	<a id="btnAdd-item-var-trans" class="btn btn blue btn-circle btn-icon-only btn-default" title="Create New Translation"
							             			data-url="${createLink(uri: '/itemTranslation/create', params: ["itemId": itemInstance?.id, scope: 'item'])}" 
													data-toggle="modal">
								   				<i class="icon-plus"></i>
											</a>
											</div>
							        </div>
							    </div>
							</div>
							<g:render template="itemVariantTranslations"/>
						</div>
						<div class="tab-pane" id="tab_item_image">
							<!-- START Image uploading tab -->
							<g:render template="/layouts/fileupload" model="[model: itemInstance, maxFiles: 5]"/>
							<div class="portlet-body form">
								<div class="form-actions right">
									<button type="button" data-dismiss="modal" class="btn btn-outline dark">
										<g:message code="default.button.cancel.label"/>
									</button>
								</div>
							</div>
							<div class="row">
								&nbsp;
							</div>
							<div class="row">
								&nbsp;
							</div>
							
							<!-- END Image uploading tab -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<asset:javascript src="pages/scripts/itemVariantList.js"/>
		<asset:javascript src="pages/scripts/item-form-fileupload.js" type="text/javascript"/>
	</body>
</html>
