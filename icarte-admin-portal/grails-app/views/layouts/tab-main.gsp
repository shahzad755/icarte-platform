<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8" />
        <title><g:layoutTitle default="ICarte Portal" /></title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <asset:stylesheet src="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
        <asset:stylesheet src="global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <asset:stylesheet src="global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <asset:stylesheet src="global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <asset:stylesheet src="global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
        <asset:stylesheet src="global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <asset:stylesheet src="global/css/components-md.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <asset:stylesheet src="global/css/plugins-md.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN PAGE LEVEL STYLES -->
		<asset:stylesheet src="global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
        <asset:stylesheet src="global/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css" />
        <asset:stylesheet src="global/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css" />
		
        <!-- END PAGE LEVEL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <asset:stylesheet src="layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css" />
        <asset:stylesheet src="layouts/layout/css/themes/darkblue.min.css" rel="stylesheet" type="text/css" id="style_color" />
        <asset:stylesheet src="layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME LAYOUT STYLES -->
        <script>
			var _contextPath = "${request.contextPath}";
		</script>
        <link rel="shortcut icon" href="favicon.png" /> 
	<g:layoutHead />
	</head>
    <!-- END HEAD -->

    <body class="page-md" onload="${pageProperty(name:'body.onload')}">
        <!-- BEGIN CONTAINER -->
        <div class="page-container">
            <!-- BEGIN CONTENT -->
            <div>
                <!-- BEGIN CONTENT BODY -->
                <div class="page-content">
					<g:layoutBody />
                </div>
                <!-- END CONTENT BODY -->
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END CONTAINER -->
        <!--[if lt IE 9]>
<asset:javascript src="global/plugins/respond.min.js"/>
<asset:javascript src="global/plugins/excanvas.min.js"/> 
<![endif]-->
        <!-- BEGIN CORE PLUGINS -->
		<asset:javascript src="global/plugins/jquery.min.js"/>
        <asset:javascript src="global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"/>
        <asset:javascript src="global/plugins/js.cookie.min.js" type="text/javascript"/>
        <asset:javascript src="global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"/>
        <asset:javascript src="global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"/>
        <asset:javascript src="global/plugins/jquery.blockui.min.js" type="text/javascript"/>
        <asset:javascript src="global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"/>
        <asset:javascript src="global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"/>
        <!-- END CORE PLUGINS -->

        <!--  BEGIN PAGE SPECIFIC PLUGINS -->
		<asset:javascript src="global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" />
        <asset:javascript src="global/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript"/>
        <asset:javascript src="global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js"/>
        <!-- END PAGE SPECIFIC PLUGINS -->

        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <asset:javascript src="global/scripts/app.js"/>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!--  BEGIN PAGE SPECIFIC SCRIPTS -->
		<asset:javascript src="pages/scripts/ui-extended-modals.js" />	
        <!-- END PAGE SPECIFIC SCRIPTS -->
        
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <asset:javascript src="layouts/layout/scripts/layout.min.js" type="text/javascript"/>
        <!-- END THEME LAYOUT SCRIPTS -->
    </body>

</html>