<!DOCTYPE html>
<html>
	<head>
		<title><g:if env="development">Oops!! Something went wrong</g:if><g:else>Error</g:else></title>
		<meta name="layout" content="main">
		<g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
	</head>
	<body>
		<g:if env="development">
		<div class="alert alert-danger alert-dismissable">
			<button class="close" type="button" data-dismiss="alert" aria-hidden="true"></button>
			<h3>Error!</h3> Your Incident ID is <strong>"${incidentId}"</strong>
		</div>
			<g:renderException exception="${exception}" />
		</g:if>
		<g:else>
			<div class="alert alert-danger">
				<h3>Error!</h3> An error has occurred. Please report this to the administrator. The Incident ID is <strong>"${incidentId}"</strong>
			</div>
		</g:else>
	</body>
</html>
