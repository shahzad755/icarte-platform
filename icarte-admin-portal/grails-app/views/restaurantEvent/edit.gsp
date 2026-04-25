<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'restaurantEvent.label', default: 'Restaurant Event')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<script type="text/javascript">
			var _restaurantEventId = ${restaurantEventInstance?.id}
			var _maxAllowedFiles = 1;
		</script>
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		
		<div class="portlet light portlet-fit portlet-form bordered" id="edit-restaurantEvent" role="main">
			<div class="portlet-title">
				<div class="caption font-blue">
					<i class="icon-note"></i><g:message code="default.edit.label" args="[entityName]" />
				</div>
			</div>
			<div id="restaurantEvent-portlet-body" class="portlet-body">
					<g:if test="${flash.message}">
						<div class="message alert alert-info alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Info!</strong> ${flash.message}
			             </div>
					</g:if>
					<g:hasErrors bean="${restaurantEventInstance}">
					<div class="alert alert-danger alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Error!</strong>
							<ul class="errors" role="alert">
								<g:eachError bean="${restaurantEventInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
					</div>
					</g:hasErrors>
					<div class="tabbable-custom">
						<ul class="nav nav-tabs">
							<li class="active">
								<a href="#tab_rest_events" data-toggle="tab"> Event </a>
							</li>
							<li>
								<a href="#tab_rest_events_translation" data-toggle="tab"> Translations </a>
							</li>
							<li>
								<a href="#tab_rest_events_image" data-toggle="tab"> Media </a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tab_rest_events">
								<g:form url="[resource:restaurantEventInstance, action:'update']" method="PUT" >
									<g:hiddenField name="version" value="${restaurantEventInstance?.version}" />							
									<div class="form-body">
										<g:render template="form"/>
									</div>
									<div class="form-actions pull-right">
										<div class="row">
												<button type="submit" class="btn green-jungle">
													<i class="fa fa-pencil"></i><g:message code="default.button.edit.label"/>
												</button>
												<button type="button" class="btn default" onclick="javascript: history.go(-1)">
													<g:message code="default.button.cancel.label"/>
												</button>
										</div>
									</div>
								</g:form>
							</div>
						<div class="tab-pane" id="tab_rest_events_translation">
	                        <div class="table-toolbar">
	                            <div class="row">
	                                <div class="pull-right col-md-1">
	                                    <div class="btn-group">
	                                     <a id="btnAdd-restaurantEvent-trans" class="btn btn blue btn-circle btn-icon-only btn-default" title="Create New Translation"
	                                     data-url="${createLink(uri: '/restaurantEventTranslation/create', params: [restaurantEvent: restaurantEventInstance?.id])}" 
											data-toggle="modal">
								   				<i class="icon-plus"></i>
												</a>
										</div>
	                                </div>
	                            </div>
	                        </div>	
							<table class="table table-striped table-hover table-bordered" id="restuarantEvent_translation_tbl">
	                           <thead>
	                               <tr>
	                                   <th> <g:message code="title.label" default="Title" /> </th>
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
						</div>
							<div class="tab-pane" id="tab_rest_events_image">
								<div class="container">
									<div class="panel panel-danger col-md-11">
		                                <div class="panel-heading">
		                                    <h3 class="panel-title">Instructions!</h3>
		                                </div>
		                                <div class="panel-body">
		                                    <ul>
		                                       	<li> Only <strong>1</strong> file is allowed to be uploaded</li>
		                                        <li> The maximum file size for uploads in is
		                                            <strong>600 KB</strong> </li>
		                                        <li> Only image files (
		                                            <strong>JPG, GIF, PNG</strong>) are allowed</li>
		                                        <li> You can click <strong>Add file</strong> button below or just 
		                                        	<strong>Drag and drop</strong> your file anywhere on the page</li>
		                                    </ul>
		                                </div>
		                            </div>
		                            
								    <!-- The file upload form used as target for the file upload widget -->
								    <form id="fileupload"  
								    	method="POST" enctype="multipart/form-data">
								    	<g:hiddenField name="id" value="${restaurantEventInstance?.id}" />
								        <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
								        <div class="row fileupload-buttonbar">
								            <div class="col-lg-7">
								                <!-- The fileinput-button span is used to style the file input field as button -->
                                        <span class="btn green fileinput-button">
                                            <i class="fa fa-plus"></i>
								                    <span>Add file...</span>
								                    <input type="file" name="catImage">
								                </span>
								        	</div>
								        </div>
								        <!-- The table listing the files available for upload/download -->
								        <table role="presentation" class="table table-striped"><tbody class="files"></tbody></table>
								    </form>
								    <br>
								</div>
								<!-- The blueimp Gallery widget -->
								<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls" data-filter=":even">
								    <div class="slides"></div>
								    <h3 class="title"></h3>
								    <a class="prev">‹</a>
								    <a class="next">›</a>
								    <a class="close">×</a>
								    <a class="play-pause"></a>
								    <ol class="indicator"></ol>
								</div>
<!-- The template to display files available for upload -->
<script id="template-upload" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload fade">
        <td>
            <span class="preview"></span>
        </td>
        <td>
            <p class="name">{%=file.name%}</p>
            <strong class="error text-danger"></strong>
        </td>
        <td>
            <p class="size">Processing...</p>
            <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="progress-bar progress-bar-success" style="width:0%;"></div></div>
        </td>
        <td>
            {% if (!i && !o.options.autoUpload) { %}
                <button class="btn btn-primary start" disabled>
                    <i class="glyphicon glyphicon-upload"></i>
                    <span>Start</span>
                </button>
            {% } %}
            {% if (!i) { %}
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Cancel</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
	</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-download fade">
        <td>
            <span class="preview">
                {% if (file.thumbnailUrl) { %}
                    <a href="{%=file.url%}" title="{%=file.originalName%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
                {% } %}
            </span>
        </td>
        <td>
            <p class="name">
                {% if (file.url) { %}
                    <a href="{%=file.url%}" title="{%=file.originalName%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.originalName%}</a>
                {% } else { %}
                    <span>{%=file.originalName%}</span>
                {% } %}
            </p>
            {% if (file.error) { %}
                <div><span class="label label-danger">Error</span> {%=file.error%}</div>
            {% } %}
        </td>
        <td>
            <span class="size">{%=o.formatFileSize(file.size)%}</span>
        </td>
        <td>
            {% if (file.deleteUrl) { %}
                <button class="btn btn-danger delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
                    <i class="glyphicon glyphicon-trash"></i>
                    <span>Delete</span>
                </button>
            {% } else { %}
                <button id='_cancel' class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Cancel</span>
                </button>
            {% }  %}
        </td>
    </tr>
{% } %}
	</script>
								</div>
							
							</div>
					</div>
			</div>
		</div>
		<div id="restaurantEvent-trans-modal" class="modal fade" tabindex="-1"  data-width="760">
		</div>
		<div id="restaurantEvent-trans-edit-modal" class="modal fade" tabindex="-1"  data-width="760">
		</div>
	</body>
</html>
