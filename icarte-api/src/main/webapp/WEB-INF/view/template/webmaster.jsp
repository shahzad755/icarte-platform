<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html lang="en" ng-app>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>LumLim</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="<c:url value='/resources/assets/ico/favicon.png'/>" />
<link rel="stylesheet" href="<c:url value='/resources/themes/lumlim_web_theme.min.css' />" />
<link rel="stylesheet" href="<c:url value='/resources/themes/jquery.mobile.icons.min.css' />" />
<link rel="stylesheet" href="<c:url value='/resources/css/jquery.mobile.structure-1.4.2.min.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/slider_style.css' />" />
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.js"></script>
<script src="<c:url value='/resources/js/angular.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/modernizr.custom.28468.js' />"></script>
<link href='http://fonts.googleapis.com/css?family=Economica:700,400italic' rel='stylesheet' type='text/css'>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.6/angular-resource.min.js"></script>

<script>
var temp;
$(document).ready(function(e) {
    $(".linkIdentifierClass").click(function() {
		$(".linkIdentifierClass").removeClass('ui-btn-active');
		$(this).addClass('ui-btn-active');
		temp = this;
	});
});
	
</script>
</head>
<body>
<div data-url="demo-page" data-role="page" data-theme="b" id="demo-page" class="my-page">

	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
		<!--[if !IE]><!-->
	<script src="<c:url value='/resources/assets/js/bootstrap.min.js' />"></script>
	<!--<![endif]-->
	
	<tiles:insertAttribute name="footer" />
</div>
</body>
</html>