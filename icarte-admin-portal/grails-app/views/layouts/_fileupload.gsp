<g:set var="maxAllowedFiles" value="${maxFiles?:1}" />
<g:set var="mulitple" value="${maxAllowedFiles==1?:multiple}" />

<div class="container">
	<div class="panel panel-danger col-md-11">
        <div class="panel-heading">
            <h3 class="panel-title">Instructions!</h3>
        </div>
        <div class="panel-body">
            <ul>
               	<li> Only <strong>${maxAllowedFiles}</strong> file(s) allowed to be uploaded</li>
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
    	method="POST" enctype="multipart/form-data" ${multiple}>
    	<g:hiddenField name="id" value="${model?.id}" />
        <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
        <div class="row fileupload-buttonbar">
            <div class="col-lg-7">
                <!-- The fileinput-button span is used to style the file input field as button -->
                                <span class="btn green fileinput-button">
                                    <i class="fa fa-plus"></i>
                    <span>Add file(s)...</span>
                    <input type="file" name="image">
                </span>
        	</div>
        </div>
        <!-- The table listing the files available for upload/download -->
        <table role="presentation" class="table table-striped"><tbody id="sortable_item_content" class="files"></tbody></table>
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
    <tr {% if (file.id) { %}id="displayorder_{%=file.id%}" {% } %} class="template-download fade">
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
