<%@page import="com.armedialab.util.Utils"%>
<%@ page import="com.armedialab.entity.CuisineType"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'cuisineType.label', default: 'CuisineType')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<g:render template="/layouts/pageheader" />
	<div class="portlet light bordered" id="show-cuisineType" role="main">
		<div class="portlet-title">
			<div class="caption font-blue">
				<i class="icon-info"></i>
				<g:message code="default.show.label" args="[entityName]" />
			</div>
		</div>
		<div class="portlet-body form">
			<g:if test="${flash.message}">
				<div class="message alert alert-info alert-dismissable"
					role="status">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true"></button>
					<strong>Info!</strong>
					${flash.message}
				</div>
			</g:if>
			<g:hasErrors bean="${cuisineTypeInstance}">
				<div class="alert alert-danger alert-dismissable" role="status">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true"></button>
					<strong>Error!</strong>
					<ul class="errors" role="alert">
						<g:eachError bean="${cuisineTypeInstance}" var="error">
							<li
								<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
									error="${error}" /></li>
						</g:eachError>
					</ul>
				</div>
			</g:hasErrors>
			<g:form class="form-horizontal" role="form"
				url="[resource:cuisineTypeInstance, action:'delete']"
				method="DELETE">
				<div class="form-body">

					<div class="row" style="padding-left: 20px">
						<div class="form-group">
							<label class="control-label lead"><g:message code="cuisine.title.label" default="Cuisine Title" />:</label>
								<p class="form-control-static"><g:fieldValue bean="${cuisineTypeInstance?.cuisineTranslations[0]}" field="title"/></p>
						</div>
					</div>
					<div class="row" style="padding-left: 20px">
						<div class="form-group">
							<label class="control-label lead"><g:message code="cuisine.description.label" default="Description" />:</label>
								<p class="form-control-static"><g:fieldValue bean="${cuisineTypeInstance?.cuisineTranslations[0]}" field="description"/></p>
						</div>
					</div>
					<div class="row" style="padding-left: 20px">
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
							<div class="form-group">
								<label class="control-label lead"><g:message code="cuisine.imageUrl.label" default="Image" />:</label>
								<g:if test="${cuisineTypeInstance?.imageUrl}">
									<g:set var="imagePath" value="${grailsApplication.config.imageRemoteURL}/${grailsApplication.config.cuisineTypeImageFolder}/${cuisineTypeInstance?.restaurant.id}/${cuisineTypeInstance?.id}"/>
									<p class="form-control-static"><g:fieldValue bean="${cuisineTypeInstance}" field="originalImageName"/></p>
										<div id="links">
										    <a href="${imagePath}/${cuisineTypeInstance?.imageUrl}" 
										    	title="${cuisineTypeInstance?.originalImageName}">
										        <img src="${imagePath}/${cuisineTypeInstance?.smallIconUrl}" alt="${imagePath}/${cuisineTypeInstance?.originalImageName}">
										    </a>
										</div>
								</g:if>
								<g:else>
									<p class="form-control-static">No image available</p>
								</g:else>
							</div>
					</div>
					<div class="row" style="padding-left: 20px">
						<div class="form-group">
							<label class="control-label lead"><g:message
									code="cuisineType.createdBy.label" default="Created By" />:</label>
							<p class="form-control-static">
								<g:fieldValue bean="${cuisineTypeInstance}" field="createdBy" />
							</p>
						</div>
					</div>
					<div class="row" style="padding-left: 20px">
						<div class="form-group">
							<label class="control-label lead"><g:message
									code="cuisineType.updatedBy.label" default="Updated By" />:</label>
							<p class="form-control-static">
								<g:fieldValue bean="${cuisineTypeInstance}" field="updatedBy" />
							</p>
						</div>
					</div>
					<div class="row" style="padding-left: 20px">
						<div class="form-group">
							<label class="control-label lead"><g:message
									code="cuisineType.lastUpdated.label" default="Last Updated" />:</label>
							<p class="form-control-static">
								<g:formatDate date="${cuisineTypeInstance?.lastUpdated}" />
							</p>
						</div>
					</div>
					<div class="row" style="padding-left: 20px">
						<div class="form-group">
							<label class="control-label lead"><g:message
									code="cuisineType.isActive.label" default="Is Active" />:</label>
							<p class="form-control-static">
								<g:fieldValue bean="${cuisineTypeInstance}" field="isActive" />
							</p>
						</div>
					</div>
					<div class="row" style="padding-left: 20px">
						<div class="form-group">
							<label class="control-label lead"><g:message
									code="cuisineType.dateCreated.label" default="Date Created" />:</label>
							<p class="form-control-static">
								<g:formatDate date="${cuisineTypeInstance?.dateCreated}" />
							</p>
						</div>
					</div>
				</div>
				<button type="button" class="btn blue-madison"
					onclick="location.href='${request.contextPath}/${controllerName }/edit/${cuisineTypeInstance?.id}'">
					<i class="fa fa-pencil"></i>
					<g:message code="default.button.edit.label" default="Edit" />
				</button>
			</g:form>
		</div>
	</div>
</body>
</html>
