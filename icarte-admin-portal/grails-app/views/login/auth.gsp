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
        <title>iCarte:: Login</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
        <asset:stylesheet src="global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <asset:stylesheet src="global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <asset:stylesheet src="global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <asset:stylesheet src="global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
        <asset:stylesheet src="global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <asset:stylesheet src="global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
        <asset:stylesheet src="global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <asset:stylesheet src="global/css/components-md.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <asset:stylesheet src="global/css/plugins-md.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN PAGE LEVEL STYLES -->
        <asset:stylesheet src="pages/css/login-4.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <!-- END THEME LAYOUT STYLES -->
        <asset:link rel="shortcut icon" href="favicon.png" type="image/x-icon"/>
    <!-- END HEAD -->
	</head>
    <!-- END HEAD -->

<body class="login">
        <!-- BEGIN LOGO -->
        <div class="logo">
            <a href="index.html">
                <img src="../assets/pages/img/logo-big.png" alt="AR Media Labs" /> </a>
        </div>
        <!-- END LOGO -->
        <!-- BEGIN LOGIN -->
        <div class="content">
            <!-- BEGIN LOGIN FORM -->
			<g:if test='${flash.message}'>
                <div class="alert alert-danger">
                    <button class="close" data-close="alert"></button>
                    <span> ${flash.message}</span>
                </div>
			</g:if>
	
			<form action='${postUrl}' method='POST' id='loginForm' class="login-form" autocomplete='off'>
                <h3 class="form-title">Login to your account</h3>
                <div class="alert alert-danger display-hide">
                    <button class="close" data-close="alert"></button>
                    <span> Enter your username and password. </span>
                </div>
                <div class="form-group">
                    <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                    <label class="control-label visible-ie8 visible-ie9"><g:message code="springSecurity.login.username.label"/>:</label>
                    <div class="input-icon">
                        <i class="fa fa-user"></i>
                        <input name='j_username' id='username' class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Username" /> </div>
                </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9"><g:message code="springSecurity.login.password.label"/>:</label>
                    <div class="input-icon">
                        <i class="fa fa-lock"></i>
                        <input name='j_password' id='password' class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="Password" /> </div>
                </div>
                <div class="form-actions">
                    <label class="checkbox">
                        <input type="checkbox" name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if> /> Remember me </label>
                    <button type="submit" class="btn green pull-right"> Login </button>
                </div>
                <!-- 
                <div class="forget-password">
                    <h4>Forgot your password ?</h4>
                    <p> no worries, click
                        <a href="javascript:;" id="forget-password"> here </a> to reset your password. </p>
                </div>
                 -->
            </form>
            <!-- END LOGIN FORM -->
            <!-- BEGIN FORGOT PASSWORD FORM -->
            <form class="forget-form" action="index.html" method="post">
                <h3>Forget Password ?</h3>
                <p> Enter your e-mail address below to reset your password. </p>
                <div class="form-group">
                    <div class="input-icon">
                        <i class="fa fa-envelope"></i>
                        <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Email" name="email" /> </div>
                </div>
                <div class="form-actions">
                    <button type="button" id="back-btn" class="btn red btn-outline">Back </button>
                    <button id="submit" type="submit" class="btn green pull-right"> Submit </button>
                </div>
            </form>
            <!-- END FORGOT PASSWORD FORM -->

        </div>

        <!-- BEGIN FOOTER -->
        <div class="copyright"> ${Calendar.getInstance().get(Calendar.YEAR)} &copy; AR Media Labs
                <a href="http://www.armedialab.com" title="AR Media Labs, LLC, Dubai, UAE" target="_blank">AR Media Labs, LLC, Dubai, UAE</a>
        </div>

        <!-- END FOOTER -->
        <!--[if lt IE 9]>
<asset:javascript src="global/plugins/respond.min.js"/>
<asset:javascript src="global/plugins/excanvas.min.js"/> 
<![endif]-->
        <!-- BEGIN CORE PLUGINS -->
        <asset:javascript src="global/plugins/jquery.min.js" />
        <asset:javascript src="global/plugins/bootstrap/js/bootstrap.min.js" />
        <asset:javascript src="global/plugins/js.cookie.min.js" />
        <asset:javascript src="global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" />
        <asset:javascript src="global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" />
        <asset:javascript src="global/plugins/jquery.blockui.min.js" />
        <asset:javascript src="global/plugins/uniform/jquery.uniform.min.js" />
        <asset:javascript src="global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" />
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <asset:javascript src="global/plugins/jquery-validation/js/jquery.validate.min.js" />
        <asset:javascript src="global/plugins/jquery-validation/js/additional-methods.min.js" />
        <asset:javascript src="global/plugins/select2/js/select2.full.min.js" />
        <asset:javascript src="global/plugins/backstretch/jquery.backstretch.min.js" />
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <asset:javascript src="global/scripts/app.js" />
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <asset:javascript src="pages/scripts/login-4.js" />
        <!-- END PAGE LEVEL SCRIPTS -->
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <!-- END THEME LAYOUT SCRIPTS -->
        
                <script type='text/javascript'>
		(function() {
			document.forms['loginForm'].elements['j_username'].focus();
		})();
		</script>
        
    </body>
</html>
