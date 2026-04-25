<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'addon.label', default: 'Addon')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<script type="text/javascript">
			var _addonid = ${addonInstance?.id}
		</script>
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		
		<div class="portlet light portlet-fit portlet-form bordered" id="edit-addon" role="main">
			<div class="portlet-title">
				<div class="caption font-blue">
					<i class="icon-note"></i><g:message code="default.edit.label" args="[entityName]" />
				</div>
			</div>
			<div id="addon-portlet-body" class="portlet-body">
					<g:if test="${flash.message}">
						<div id="message" class="alert alert-info alert-dismissable">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Info!</strong> <div id="content" ${flash.message}></div>
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
					<div class="tabbable-custom">
						<ul class="nav nav-tabs">
							<li class="active">
								<a href="#tab_addon" data-toggle="tab"> Addon </a>
							</li>
							<li>
								<a href="#tab_addon_translation" data-toggle="tab"> Translations </a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tab_addon">
								<g:form url="[resource:addonInstance, action:'update']" method="PUT" >
									<g:hiddenField name="version" value="${addonInstance?.version}" />							
									<div class="form-body">
										<g:render template="form"/>
									</div>
									<div class="form-actions right">
										<div class="row">
											<div class="col-md-offset-1">
												<button type="submit" class="btn green-jungle">
													<i class="fa fa-pencil"></i><g:message code="default.button.update.label"/>
												</button>
												<button type="button" class="btn default" onclick="javascript: history.go(-1)">
													<g:message code="default.button.cancel.label"/>
												</button>
											</div>
										</div>
									</div>
								</g:form>
							</div>
							<div class="tab-pane" id="tab_addon_translation">
                                    <div class="table-toolbar">
                                        <div class="row">
                                            <div class="pull-right col-md-1">
                                                <div class="btn-group">
	                                                <a id="btnAdd-addon-trans" class="btn btn blue btn-circle btn-icon-only btn-default" title="Create New Translation"
	                                                data-url="${createLink(uri: '/addonTranslation/create', params: [addon: addonInstance?.id])}" 
															data-toggle="modal">
							        				<i class="icon-plus"></i>
							    					</a>
												</div>
                                            </div>
                                        </div>
                                    </div>							
								<table class="table table-striped table-hover table-bordered" id="addon_translation_tbl">
                                  <thead>
                                      <tr>
                                          <th> <g:message code="addon.title.label" default="Title" /> </th>
                                          <th> <g:message code="language.label" default="Language" /> </th>
                                          <th class="desktop"> <g:message code="addon.description.label" default="Description" /> </th>
                                          <th> <g:message code="addon.showDescription.label" default="Show Description" /> </th>
                                          <th> <g:message code="default.button.edit.label" default="Edit" /> </th>
                                          <th> <g:message code="default.button.deactivate.label" default="De-Activate" /> </th>
                                      </tr>
                                  </thead>
                                  <tbody>
                                  </tbody>
                               	</table>							
							</div>
						</div>
					</div>
			</div>
		</div>
		<div id="addon-trans-modal" class="modal fade" tabindex="-1"  data-width="760">
		</div>
		<div id="addon-trans-edit-modal" class="modal fade" tabindex="-1"  data-width="760">
		</div>
		<%--
		
        <div id="addon-create-modal" class="modal container fade" tabindex="-1" data-height="760">
            <div class="modal-body">
                <div class="row">
					<iframe id="addonTranslationModaliFrame"
						src="${createLink(uri: '/addonTranslation/create')}" frameborder="0" width="99.6%"></iframe>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn btn-outline dark">Close</button>
                <button type="button" class="btn green" onclick="javascript:alert();">Save changes</button>
            </div>
        </div>
	--%></body>
	
</html>
