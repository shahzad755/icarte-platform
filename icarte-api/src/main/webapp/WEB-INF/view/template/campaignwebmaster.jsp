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



<link rel="stylesheet" href="<c:url value='/resources/themes/lumlim_web_theme.min.css' />" />
<link rel="stylesheet" href="<c:url value='/resources/themes/jquery.mobile.icons.min.css' />" />
<link rel="stylesheet" href="<c:url value='/resources/css/jquery.mobile.structure-1.4.2.min.css' />" />
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.js"></script>
<script src="<c:url value='/resources/js/angular.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/modernizr.custom.28468.js' />"></script>
<link href='http://fonts.googleapis.com/css?family=Economica:700,400italic' rel='stylesheet' type='text/css'>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.6/angular-resource.min.js"></script>

<style>
body
{
	margin: 0;
}
</style>

<link rel="shortcut icon" href="<c:url value='/resources/assets/ico/favicon.png'/>" />
</head>
<body> 
	<tiles:insertAttribute name="body" />	
</body>
</html>