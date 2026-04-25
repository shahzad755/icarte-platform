<!-- BEGIN PAGE HEADER -->
<div class="page-bar" style="padding:5px;">
	<div class="actions">
		<a class="btn btn blue-madison btn-circle btn-icon-only btn-default" href="${createLink(uri: '/')}">
			<i class="icon-home"></i>
	    </a>
		<sec:access controller="${controllerName }" action='index'>
			<g:link action='index' class="btn_header_list btn btn green-meadow btn-circle btn-icon-only btn-default"><i class="icon-list"></i></g:link>
		</sec:access>
		<sec:access controller="${controllerName }" action='create'>
			<g:link action='create' class="btn_header_create btn btn red-sunglo btn-circle btn-icon-only btn-default"><i class="icon-plus"></i></g:link>
		</sec:access>
	<%--
	    <g:link class="btn btn green-meadow btn-circle btn-icon-only btn-default" action="index">
	        <i class="icon-list"></i>
	    </g:link>
	    <g:link class="btn_header_create btn btn red-sunglo btn-circle btn-icon-only btn-default" action="create">
	        <i class="icon-plus"></i>
	    </g:link>
	--%>
	</div>
</div>
<!-- END PAGE HEADER-->