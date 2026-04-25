<!DOCTYPE html>
<html>
    <head>
        <title>Welcome :: iCarte Dashboard</title>
        <meta name="layout" content="main"/>
	</head>
    <body>
		<sec:ifNotGranted roles="ROLE_SUPERADMIN">
	         <!-- BEGIN PAGE TITLE-->
	         <h3 class="page-title"> Dashboard
	             <small> & Statistics</small>
	         </h3>
	         <!-- END PAGE TITLE-->
	         
	         <!-- BEGIN ORDER GRAPHS PORTLET -->
	         	<g:render template="salesGraphs"/>
	         <!-- END ORDER GRAPHS PORTLET -->
	         
	         <!-- BEGIN ORDER STATS PORTLET -->
	         	<g:render template="orderStats"/>
	         <!-- END ORDER STATS PORTLET -->
	         
	         <!-- BEGIN SALES STATS PORTLET -->
	         	<g:render template="salesStats"/>
	         <!-- END SALES STATS PORTLET -->
		</sec:ifNotGranted>
    </body>

</html>