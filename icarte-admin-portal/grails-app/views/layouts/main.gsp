<%@page import="com.armedialab.util.Utils"%>
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
        <asset:stylesheet src="global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <asset:stylesheet src="global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <asset:stylesheet src="global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <asset:stylesheet src="global/plugins/uniform/css/uniform.default.min.css" rel="stylesheet" type="text/css" />
        <asset:stylesheet src="global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <asset:stylesheet src="global/plugins/jquery-multi-select/css/multi-select.css" rel="stylesheet" type="text/css" />
        <asset:stylesheet src="global/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" type="text/css" />

        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <asset:stylesheet src="global/css/components-md.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <asset:stylesheet src="global/css/plugins-md.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN PAGE LEVEL STYLES -->
		<asset:stylesheet src="global/plugins/datatables/datatables.css" rel="stylesheet" type="text/css" />
		<asset:stylesheet src="global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
		<asset:stylesheet src="global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
		<asset:stylesheet src="global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
        <asset:stylesheet src="global/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css" />
        <asset:stylesheet src="global/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css" />
        
        <g:if test="${(controllerName == 'itemCategory' && actionName == 'show')
        		|| (controllerName == 'restaurant' && actionName == 'show')
        		|| (controllerName == 'cuisineType' && actionName == 'show')
        		}">
			<asset:stylesheet src="global/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css" rel="stylesheet" type="text/css" />
		</g:if>
        
        <g:if test="${(controllerName == 'itemCategory' && actionName == 'edit') 
			|| (controllerName == 'itemCategoryTranslation' && actionName == 'create')
			|| (controllerName == 'itemCategoryTranslation' && actionName == 'edit')}">
			<asset:stylesheet src="global/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css" rel="stylesheet" type="text/css" />
			<asset:stylesheet src="global/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet" type="text/css" />
			<asset:stylesheet src="global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" type="text/css" />
		</g:if>
		
        <g:if test="${(controllerName == 'cuisineType' && actionName == 'edit') 
			|| (controllerName == 'cuisineTranslation' && actionName == 'create')
			|| (controllerName == 'cuisineTranslation' && actionName == 'edit')}">
			<asset:stylesheet src="global/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css" rel="stylesheet" type="text/css" />
			<asset:stylesheet src="global/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet" type="text/css" />
			<asset:stylesheet src="global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" type="text/css" />
		</g:if>
		
        <g:if test="${(controllerName == 'restaurant' && actionName == 'edit') 
			|| (controllerName == 'restaurantTranslation' && actionName == 'create')
			|| (controllerName == 'restaurantTranslation' && actionName == 'edit')}">
			<asset:stylesheet src="global/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css" rel="stylesheet" type="text/css" />
			<asset:stylesheet src="global/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet" type="text/css" />
			<asset:stylesheet src="global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" type="text/css" />
		</g:if>
		
        <g:if test="${(controllerName == 'restaurantEvent' && actionName == 'edit') 
			|| (controllerName == 'restaurantEventTranslation' && actionName == 'create')
			|| (controllerName == 'restaurantEventTranslation' && actionName == 'edit')}">
			<asset:stylesheet src="global/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css" rel="stylesheet" type="text/css" />
			<asset:stylesheet src="global/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet" type="text/css" />
			<asset:stylesheet src="global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" type="text/css" />
		</g:if>
		
        <g:if test="${(controllerName == 'item') }">
			<asset:stylesheet src="global/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css" rel="stylesheet" type="text/css" />
			<asset:stylesheet src="global/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet" type="text/css" />
			<asset:stylesheet src="global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" type="text/css" />
		</g:if>
		
        <g:if test="${(controllerName == 'orders') || (controllerName == 'itemCategory')}">
			<asset:stylesheet src="global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
			<asset:stylesheet src="global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
		</g:if>
        <!-- END PAGE LEVEL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <asset:stylesheet src="layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css" />
        <asset:stylesheet src="layouts/layout/css/themes/blue.min.css" rel="stylesheet" type="text/css" id="style_color" />
        <asset:stylesheet src="layouts/layout/css/custom.css" rel="stylesheet" type="text/css" />
        <!-- END THEME LAYOUT STYLES -->
        <script>
			var _contextPath = "${request.contextPath}";
			var _controller = "${controllerName}";
			var _action = "${actionName}";
		</script>
        <asset:link rel="shortcut icon" href="favicon.png" type="image/x-icon"/>
		<g:layoutHead />
	</head>
    <!-- END HEAD -->

    <body class="page-header-fixed page-sidebar-closed-hide-logo page-md" onload="${pageProperty(name:'body.onload')}">
		<!-- Secure Content Starts -->
		<sec:ifAnyGranted roles="ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER,ROLE_MANAGER,ROLE_STAFF">
			<g:render template="/layouts/topbar"/>
	        <!-- BEGIN HEADER & CONTENT DIVIDER -->
	        <div class="clearfix"> </div>
	        <!-- END HEADER & CONTENT DIVIDER -->
	        <!-- BEGIN CONTAINER -->
	        <div class="page-container">
				<g:render template="/layouts/sidebar-nav-menu"/>
	            <!-- BEGIN CONTENT -->
	            <div class="page-content-wrapper">
	                <!-- BEGIN CONTENT BODY -->
	                <div class="page-content">
						<g:layoutBody />
	                </div>
	                <!-- END CONTENT BODY -->
	            </div>
	            <!-- END CONTENT -->
	        </div>
	        <!-- END CONTAINER -->
	        <!-- Secure Content Ends -->
	     </sec:ifAnyGranted>
	     <!-- Remove this after demo -->
	     <sec:ifNotGranted roles="ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER,ROLE_MANAGER,ROLE_STAFF">
		                <!-- BEGIN CONTENT BODY -->
		                <div class="page-content">
							<g:layoutBody />
		                </div>
		                <!-- END CONTENT BODY -->
	     
	     </sec:ifNotGranted>
        <!-- BEGIN FOOTER -->
			<g:render template="/layouts/footer"/>
        <!-- END FOOTER -->
        <!--[if lt IE 9]>
<asset:javascript src="global/plugins/respond.min.js"/>
<asset:javascript src="global/plugins/excanvas.min.js"/> 
<![endif]-->
        <!-- BEGIN CORE PLUGINS -->
		<asset:javascript src="global/plugins/jquery.min.js"/>
		<asset:javascript src="global/plugins/jquery-ui/jquery-ui.min.js"/>
		
        <asset:javascript src="global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"/>
        <asset:javascript src="global/plugins/js.cookie.min.js" type="text/javascript"/>
        <asset:javascript src="global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"/>
        <asset:javascript src="global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"/>
        <asset:javascript src="global/plugins/jquery.blockui.min.js" type="text/javascript"/>
        <asset:javascript src="global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"/>
        <asset:javascript src="global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"/>
        <asset:javascript src="global/plugins/jquery-multi-select/js/jquery.multi-select.js" type="text/javascript"/>
        
        <!-- END CORE PLUGINS -->

        <!--  BEGIN PAGE SPECIFIC PLUGINS -->
		<asset:javascript src="global/plugins/datatables/datatables.min.js"/>
		<asset:javascript src="global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js"/>
        <asset:javascript src="global/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript"/>
        <asset:javascript src="global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js"/>
		<asset:javascript src="global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" />
        <asset:javascript src="global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"/>
        <sec:ifNotGranted roles="ROLE_SUPERADMIN">
			<g:if test="${controllerName == 'dashboard' && actionName == 'index'}"> <!-- Only include below for dashboard -->
		        <asset:javascript src="global/plugins/counterup/jquery.waypoints.min.js"/>
		        <asset:javascript src="global/plugins/counterup/jquery.counterup.min.js"/>
		        <asset:javascript src="global/plugins/chartjs/Chart.min.js"/>
		        <asset:javascript src="pages/scripts/dashboard.js"/>
		        
			</g:if>
		</sec:ifNotGranted>
        <!-- END PAGE SPECIFIC PLUGINS -->

        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <asset:javascript src="global/scripts/app.js"/>
        <asset:javascript src="global/scripts/jquery.loadJSON.js"/>	
        <asset:javascript src="global/scripts/fnFilterOnReturn.js"/>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!--  BEGIN PAGE SPECIFIC SCRIPTS -->
        <asset:javascript src="pages/scripts/utils.js" />
		<asset:javascript src="pages/scripts/ui-extended-modals.js" />
		<g:if test="${(controllerName == 'itemCategory' && actionName == 'show')
			|| (controllerName == 'restaurant' && actionName == 'show')
			|| (controllerName == 'cuisineType' && actionName == 'show')
			}">
        	<asset:javascript src="global/plugins/jquery-file-upload/blueimp-gallery/jquery.blueimp-gallery.min.js" type="text/javascript"/>
        	<asset:javascript src="pages/scripts/view-image-gallary.js" type="text/javascript"/>
		</g:if>
        <g:if test="${(controllerName == 'itemCategory' && actionName == 'edit') 
			|| (controllerName == 'itemCategoryTranslation' && actionName == 'create')
			|| (controllerName == 'itemCategoryTranslation' && actionName == 'edit')}">
			<asset:javascript src="pages/scripts/table-datatables-item-category-lang.js"/>
		</g:if>
        <g:if test="${(controllerName == 'cuisineType' && actionName == 'edit') 
			|| (controllerName == 'cuisineTranslation' && actionName == 'create')
			|| (controllerName == 'cuisineTranslation' && actionName == 'edit')}">
			<asset:javascript src="pages/scripts/table-datatables-cuisine-lang.js"/>
		</g:if>
		<g:if test="${(controllerName == 'addon' && actionName == 'edit') 
			|| (controllerName == 'addonTranslation' && actionName == 'create')
			|| (controllerName == 'addonTranslation' && actionName == 'edit')}">
			<asset:javascript src="pages/scripts/table-datatables-addon-lang.js"/>
		</g:if>
		<g:if test="${(controllerName == 'feedbackConfig' && actionName == 'edit') 
			|| (controllerName == 'feedbackConfigTranslation' && actionName == 'create')
			|| (controllerName == 'feedbackConfigTranslation' && actionName == 'edit')}">
			<asset:javascript src="pages/scripts/table-datatables-feedback-config-lang.js"/>
		</g:if>
        <g:if test="${(controllerName == 'restaurant' && actionName == 'edit') 
			|| (controllerName == 'restaurantTranslation' && actionName == 'create')
			|| (controllerName == 'restaurantTranslation' && actionName == 'edit')}">
			<asset:javascript src="pages/scripts/table-datatables-restaurant-lang.js"/>
		</g:if>
        <g:if test="${(controllerName == 'restaurantEvent' && actionName == 'edit') 
			|| (controllerName == 'restaurantEventTranslation' && actionName == 'create')
			|| (controllerName == 'restaurantEventTranslation' && actionName == 'edit')}">
			<asset:javascript src="pages/scripts/table-datatables-restaurantEvents-lang.js"/>
		</g:if>
		<g:if test="${(controllerName == 'itemCategory' && actionName == 'edit')
			|| (controllerName == 'restaurant' && actionName == 'edit')
			|| (controllerName == 'cuisineType' && actionName == 'edit')
			|| (controllerName == 'restaurantEvent' && actionName == 'edit')}">
			<asset:javascript src="global/plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js" type="text/javascript"/>
	        <asset:javascript src="global/plugins/jquery-file-upload/js/vendor/tmpl.min.js" type="text/javascript"/>
	        <asset:javascript src="global/plugins/jquery-file-upload/js/vendor/load-image.min.js" type="text/javascript"/>
	        <asset:javascript src="global/plugins/jquery-file-upload/js/vendor/canvas-to-blob.min.js" type="text/javascript"/>
	        <asset:javascript src="global/plugins/jquery-file-upload/blueimp-gallery/jquery.blueimp-gallery.min.js" type="text/javascript"/>
	        <asset:javascript src="global/plugins/jquery-file-upload/js/jquery.iframe-transport.js" type="text/javascript"/>
	        <asset:javascript src="global/plugins/jquery-file-upload/js/jquery.fileupload.js" type="text/javascript"/>
	        <asset:javascript src="global/plugins/jquery-file-upload/js/jquery.fileupload-process.js" type="text/javascript"/>
	        <asset:javascript src="global/plugins/jquery-file-upload/js/jquery.fileupload-image.js" type="text/javascript"/>
	        <asset:javascript src="global/plugins/jquery-file-upload/js/jquery.fileupload-audio.js" type="text/javascript"/>
	        <asset:javascript src="global/plugins/jquery-file-upload/js/jquery.fileupload-video.js" type="text/javascript"/>
	        <asset:javascript src="global/plugins/jquery-file-upload/js/jquery.fileupload-validate.js" type="text/javascript"/>
	        <asset:javascript src="global/plugins/jquery-file-upload/js/jquery.fileupload-ui.js" type="text/javascript"/>
	        <asset:javascript src="pages/scripts/form-fileupload.js" type="text/javascript"/>
		</g:if>
		
		<g:if test="${(controllerName == 'item')}">
			<asset:javascript src="global/plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js" type="text/javascript"/>
	        <asset:javascript src="global/plugins/jquery-file-upload/js/vendor/tmpl.min.js" type="text/javascript"/>
	        <asset:javascript src="global/plugins/jquery-file-upload/js/vendor/load-image.min.js" type="text/javascript"/>
	        <asset:javascript src="global/plugins/jquery-file-upload/js/vendor/canvas-to-blob.min.js" type="text/javascript"/>
	        <asset:javascript src="global/plugins/jquery-file-upload/blueimp-gallery/jquery.blueimp-gallery.min.js" type="text/javascript"/>
	        <asset:javascript src="global/plugins/jquery-file-upload/js/jquery.iframe-transport.js" type="text/javascript"/>
	        <asset:javascript src="global/plugins/jquery-file-upload/js/jquery.fileupload.js" type="text/javascript"/>
	        <asset:javascript src="global/plugins/jquery-file-upload/js/jquery.fileupload-process.js" type="text/javascript"/>
	        <asset:javascript src="global/plugins/jquery-file-upload/js/jquery.fileupload-image.js" type="text/javascript"/>
	        <asset:javascript src="global/plugins/jquery-file-upload/js/jquery.fileupload-audio.js" type="text/javascript"/>
	        <asset:javascript src="global/plugins/jquery-file-upload/js/jquery.fileupload-video.js" type="text/javascript"/>
	        <asset:javascript src="global/plugins/jquery-file-upload/js/jquery.fileupload-validate.js" type="text/javascript"/>
	        <asset:javascript src="global/plugins/jquery-file-upload/js/jquery.fileupload-ui.js" type="text/javascript"/>
        	<asset:javascript src="pages/scripts/itemList.js"/>
		</g:if>
		<g:if test="${(controllerName == 'itemCategory' && actionName == 'index')}">
        	<asset:javascript src="pages/scripts/table-datatables-item-category.js"/>
		</g:if>
		<g:if test="${(controllerName == 'cuisineType' && actionName == 'index')}">
        	<asset:javascript src="pages/scripts/table-datatables-cuisine.js"/>
		</g:if>
		<g:if test="${(controllerName == 'accountType' && actionName == 'index')}">
        	<asset:javascript src="pages/scripts/table-datatables-accountType.js"/>
		</g:if>
		<g:if test="${(controllerName == 'menu' && actionName == 'index')}">
        	<asset:javascript src="pages/scripts/table-datatables-menu.js"/>
		</g:if>
		<g:if test="${(controllerName == 'branch' && actionName == 'index')}">
        	<asset:javascript src="pages/scripts/table-datatables-branch.js"/>
		</g:if>
		<g:if test="${(controllerName == 'addon' && actionName == 'index')}">
        	<asset:javascript src="pages/scripts/table-datatables-addon.js"/>
		</g:if>
		<g:if test="${(controllerName == 'feedbackConfig' && actionName == 'index')}">
        	<asset:javascript src="pages/scripts/table-datatables-feedbackConfig.js"/>
		</g:if>
		<g:if test="${(controllerName == 'servingTable' && actionName == 'index')}">
        	<asset:javascript src="pages/scripts/table-datatables-servingTable.js"/>
		</g:if>
		<g:if test="${(controllerName == 'orders' && actionName == 'index')}">
			<asset:javascript src="global/plugins/select2/js/select2.full.min.js"/>
        	<asset:javascript src="pages/scripts/ordersList.js"/>
		</g:if>
		<g:if test="${(controllerName == 'itemCategory' && actionName != 'index') && 
		 		  (controllerName == 'itemCategory' && actionName != 'show')}">
			<asset:javascript src="global/plugins/select2/js/select2.full.min.js"/>
        	<asset:javascript src="pages/scripts/item-category.js"/>
		</g:if>
		<g:if test="${(controllerName == 'user')}">
        	<asset:javascript src="pages/scripts/usersManagement.js"/>
		</g:if>
		<g:if test="${(controllerName == 'restaurant' && actionName == 'index')}">
        	<asset:javascript src="pages/scripts/table-datatables-restaurant.js"/>
		</g:if>
		<g:if test="${(controllerName == 'servingTableRequestStatus' && actionName == 'index')}">
        	<asset:javascript src="pages/scripts/serving-table-requests.js"/>
		</g:if>
		<g:if test="${(controllerName == 'restaurantEvent')}">
        	<asset:javascript src="pages/scripts/table-datatables-restaurantEvents.js"/>
		</g:if>
		<g:if test="${(controllerName == 'restaurantDevice' && actionName == 'index')}">
        	<asset:javascript src="pages/scripts/restaurant-deviceList.js"/>
		</g:if>
		<g:if test="${(controllerName == 'restaurantDevice' && actionName != 'index') &&
			(controllerName == 'restaurantDevice' && actionName != 'show')}">
        	<asset:javascript src="pages/scripts/restaurant-device.js"/>
		</g:if>
		<g:if test="${(controllerName == 'customer' && actionName == 'index')}">
        	<asset:javascript src="pages/scripts/customerList.js"/>
		</g:if>


		<g:if test="${(controllerName == 'userProfile' && actionName == 'index')}">
        	<asset:javascript src="pages/scripts/userProfileList.js"/>
		</g:if>
		<g:if test="${(controllerName == 'userProfile') && actionName == 'emergencyRequest'}">
        	<asset:javascript src="pages/scripts/user-emergency-requests.js"/>
		</g:if>
        <!-- END PAGE SPECIFIC SCRIPTS -->
        
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <asset:javascript src="layouts/layout/scripts/layout.min.js" type="text/javascript"/>
        <asset:javascript src="layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"/>
        <!-- END THEME LAYOUT SCRIPTS -->
        <script type="text/javascript">
       // $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
        /*if (jQuery().datepicker) {
            $('.date').datepicker({
                rtl: App.isRTL(),
                orientation: "left",
                autoclose: true,
                format: "yyyy-mm-dd"
            });
            //$('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
        }*/
        </script>
    </body>
</html>