<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'feedbackConfig.label', default: 'Feedback Configuration')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<script type="text/javascript">
			var _feedbackConfigId = ${feedbackConfigInstance?.id};
		</script>
		
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		
		<div class="portlet light portlet-fit portlet-form bordered" id="edit-feedbackConfig" role="main">
			<div class="portlet-title">
				<div class="caption font-blue">
					<i class="icon-note"></i><g:message code="default.edit.label" args="[entityName]" />
				</div>
			</div>
			<div id="feedback-portlet-body" class="portlet-body">
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
					<div class="tabbable-custom">
						<ul class="nav nav-tabs">
							<li class="active">
								<a href="#tab_feedbackConfig" data-toggle="tab"> Feedback Configuration </a>
							</li>
							<li>
								<a href="#feedbackConfig_translation" data-toggle="tab"> Translations </a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tab_feedbackConfig">
								<g:form url="[resource:feedbackConfigInstance, action:'update']" method="PUT" >
									<g:hiddenField name="version" value="${feedbackConfigInstance?.version}" />							
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
							<div class="tab-pane" id="feedbackConfig_translation">
		                        <div class="table-toolbar">
		                            <div class="row">
		                                <div class="pull-right col-md-1">
		                                    <div class="btn-group">
		                                     <a id="btnAdd-feedback-trans" class="btn btn blue btn-circle btn-icon-only btn-default" title="Create New Translation"
		                                     data-url="${createLink(uri: '/feedbackConfigTranslation/create', params: [feedbackConfig: feedbackConfigInstance?.id])}" 
												data-toggle="modal">
									   				<i class="icon-plus"></i>
													</a>
											</div>
		                                </div>
		                            </div>
		                        </div>
								<table class="table table-striped table-hover table-bordered" id="feedback_translation_tbl">
		                           <thead>
		                               <tr>
		                                   <th> <g:message code="title.label" default="Title" /> </th>
		                                   <th> <g:message code="language.label" default="Language" /> </th>
		                                   <th class="desktop"> <g:message code="description.label" default="Description" /> </th>
		                                   <th> <g:message code="showDescription.label" default="Show Description" /> </th>
		                                   <th> <g:message code="default.button.edit.label" default="Edit" /> </th>
		                                   <th> <g:message code="default.button.delete.label" default="Delete" /> </th>
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
		<div id="feedback-trans-modal" class="modal fade" tabindex="-1"  data-width="760">
		</div>
		<div id="feedback-trans-edit-modal" class="modal fade" tabindex="-1"  data-width="760">
		</div>
	</body>
</html>
