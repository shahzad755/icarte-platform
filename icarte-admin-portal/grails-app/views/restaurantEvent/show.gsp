
<%@page import="com.armedialab.util.Utils"%>
<%@ page import="com.armedialab.entity.RestaurantEvent"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'restaurantEvent.label', default: 'Restaurant Event')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<g:render template="/layouts/pageheader" />
	<div class="portlet light bordered" id="show-restaurantEvent"
		role="main">
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
			<g:hasErrors bean="${restaurantEventInstance}">
				<div class="alert alert-danger alert-dismissable" role="status">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true"></button>
					<strong>Error!</strong>
					<ul class="errors" role="alert">
						<g:eachError bean="${restaurantEventInstance}" var="error">
							<li
								<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
									error="${error}" /></li>
						</g:eachError>
					</ul>
				</div>
			</g:hasErrors>
			<g:form class="form-horizontal" role="form"
				url="[resource:restaurantEventInstance, action:'delete']"
				method="DELETE">

				<div class="form-body">
					<div class="row" style="padding-left: 20px">
						<div class="form-group">
							<label class="control-label lead"><g:message code="restaurantEvent.title.label" default="Title" />:</label>
							<p class="form-control-static">
								<g:fieldValue bean="${restaurantEventInstance?.restaurantEventTranslations[0]}" field="title" />
							</p>
						</div>
					</div>
					<div class="row" style="padding-left: 20px">
						<div class="form-group">
							<label class="control-label lead"><g:message code="restaurantEvent.description.label" default="Event Details" />:</label>
							<p class="form-control-static">
								<g:fieldValue bean="${restaurantEventInstance?.restaurantEventTranslations[0]}" field="description" />
							</p>
						</div>
					</div>
					<div class="row" style="padding-left: 20px">
						<div class="form-group">
							<label class="control-label lead"><g:message code="restaurantEvent.eventDate.label" default="Event Date" />:</label>
							<p class="form-control-static">
								<g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${restaurantEventInstance.eventDate}" />
							</p>
						</div>
					</div>
					<div class="row" style="padding-left: 20px">
						<div class="form-group">
							<label class="control-label lead"><g:message
									code="restaurantEvent.showEventEndDate.label"
									default="Show Event End Date" />:</label>

							<p class="form-control-static">
								<g:formatDate format="${Utils.DATE_FORMAT}" 
									date="${restaurantEventInstance?.showEventEndDate}" />
							</p>


						</div>
					</div>

					<div class="row" style="padding-left: 20px">
						<div class="form-group">
							<label class="control-label lead"><g:message
									code="restaurantEvent.showEventStartDate.label"
									default="Show Event Start Date" />:</label>

							<p class="form-control-static">
								<g:formatDate format="${Utils.DATE_FORMAT}" 
									date="${restaurantEventInstance?.showEventStartDate}" />
							</p>


						</div>
					</div>
					<div class="row" style="padding-left: 20px">
						<div class="form-group">
							<label class="control-label lead"><g:message code="restaurantEvent.imageUrl.label" default="Image Url" />:</label>
							<p class="form-control-static">
								<g:fieldValue bean="${restaurantEventInstance}" field="imageUrl" />
							</p>
						</div>
					</div>
					<div class="row" style="padding-left: 20px">
						<div class="form-group">
							<label class="control-label lead"><g:message code="restaurantEvent.smallIconUrl.label" default="Small Icon Url" />:</label>
							<p class="form-control-static">
								<g:fieldValue bean="${restaurantEventInstance}" field="smallIconUrl" />
							</p>
						</div>
					</div>

					<div class="row" style="padding-left: 20px">
						<div class="form-group">
							<label class="control-label lead"><g:message
									code="restaurantEvent.originalImageName.label"
									default="Original Image Name" />:</label>
							<p class="form-control-static">
								<g:fieldValue bean="${restaurantEventInstance}"
									field="originalImageName" />
							</p>
						</div>
					</div>

					<div class="row" style="padding-left: 20px">
						<div class="form-group">
							<label class="control-label lead"><g:message
									code="restaurantEvent.createdBy.label" default="Created By" />:</label>

							<p class="form-control-static">
								<g:fieldValue bean="${restaurantEventInstance}"
									field="createdBy" />
							</p>


						</div>
					</div>

					<div class="row" style="padding-left: 20px">
						<div class="form-group">
							<label class="control-label lead"><g:message
									code="restaurantEvent.dateCreated.label" default="Date Created" />:</label>

							<p class="form-control-static">
								<g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${restaurantEventInstance?.dateCreated}" />
							</p>


						</div>
					</div>

					<div class="row" style="padding-left: 20px">
						<div class="form-group">
							<label class="control-label lead"><g:message
									code="restaurantEvent.isActive.label" default="Is Active" />:</label>

							<p class="form-control-static">
								<g:formatBoolean boolean="${restaurantEventInstance?.isActive}" />
							</p>


						</div>
					</div>
					<div class="pull-right">
						<button type="button" class="btn blue-madison"
							onclick="location.href='${request.contextPath}/${controllerName }/edit/${restaurantEventInstance?.id}'">
							<i class="fa fa-pencil"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</button>
						<g:actionSubmit class="delete btn red-sunglo" action="delete"
							value="${message(code: 'default.button.delete.label', default: 'Delete')}"
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</div>
					<div>&nbsp;</div>
				</div>
			</g:form>
		</div>
	</div>
</body>
</html>
