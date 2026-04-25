<!DOCTYPE html>
<html>
	<head>
		<meta name="layout">
		<g:set var="entityName" value="${message(code: 'itemVariant.label', default: 'Item Customization')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="portlet light portlet-fit portlet-form bordered" id="edit-itemVariant" role="main">
			<div class="portlet-title">
				<div class="caption font-blue">
					<i class="icon-note"></i><g:message code="default.edit.label" args="[entityName]" />
				</div>
			</div>
			<div id="item-variant-edit-portlet-body" class="portlet-body">
				<g:if test="${flash.message}">
					<div class="message alert alert-info alert-dismissable" role="status">
		               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
		               <strong>Info!</strong> ${flash.message}
		             </div>
				</g:if>
				<g:hasErrors bean="${itemVariantInstance}">
				<div class="alert alert-danger alert-dismissable" role="status">
		               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
		               <strong>Error!</strong>
						<ul class="errors" role="alert">
							<g:eachError bean="${itemVariantInstance}" var="error">
							<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
							</g:eachError>
						</ul>
				</div>
				</g:hasErrors>
				<div class="tabbable-custom">
					<ul class="nav nav-tabs">
						<li class="active">
							<a href="#tab_item_var" data-toggle="tab"> Item Customization </a>
						</li>
						<li>
							<a href="#tab_item_var_trans" data-toggle="tab"> Translations </a>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tab_item_var">
							<form id="itemVariantEditForm" method="post" class="form-horizontal">					
								<div class="form-body">
									<g:hiddenField name="itemVariantId" value="${itemVariantInstance.id}" />
									<g:hiddenField name="version" value="${itemVariantInstance.version}" />
									<g:render template="/itemVariant/form"/>
								</div>
								<div class="form-actions right">
									<div class="row">
										<div class="col-md-offset-1">
											<button type="button" class="btn green-jungle" onclick="javascript: updateItemVariant();">
												<i class="fa fa-pencil"></i><g:message code="default.button.edit.label"/>
											</button>
											<button type="button" class="btn default" data-dismiss="modal" >
												<g:message code="default.button.cancel.label"/>
											</button>
										</div>
									</div>
								</div>
							</form>
						</div>
						<div class="tab-pane" id="tab_item_var_trans">
							<div class="table-toolbar">
							    <div class="row">
							        <div class="pull-right col-md-1">
							            <div class="btn-group">
							             	<a id="btnAdd-item-var2-trans" class="btn btn blue btn-circle btn-icon-only btn-default" title="Create New Translation"
							             			data-url="${createLink(uri: '/itemTranslation/create', params: [id: itemVariantInstance?.id, scope: 'itemVariant'])}" 
													data-toggle="modal">
								   				<i class="icon-plus"></i>
											</a>
											</div>
							        </div>
							    </div>
							</div>
							<table class="table table-striped table-hover table-bordered" id="itemVariant_translation_tbl">
   <thead>
       <tr>
           <th> <g:message code="title.label" default="Title" /></th>
           <th> <g:message code="language.label" default="Language" /> </th>
           <th class="desktop"> <g:message code="description.label" default="Description" /> </th>
           <th> <g:message code="showDescription.label" default="Show Description on Client" /> </th>
           <th> <g:message code="default.button.edit.label" default="Edit" /> </th>
           <th> <g:message code="default.button.delete.label" default="Delete" /> </th>
       </tr>
   </thead>
   <tbody>
   </tbody>
</table>
<div class="form-actions right">
	<button type="button" data-dismiss="modal" class="btn btn-outline dark">
		<g:message code="default.button.cancel.label"/>
	</button>
</div>
<div id="item-var-trans-modal" class="modal container fade" tabindex="-1" data-width="760"></div>
<div id="item-var-trans-edit-modal" class="modal container fade" tabindex="-1" data-width="760"></div>
				</div>
			</div>
		</div>
	</div>
</div>
		<script type="text/javascript">
	    	$('#btnAdd-item-var2-trans').on('click', function(event){
	    		console.log('I am the button...');
			});
		</script>
	</body>
</html>
