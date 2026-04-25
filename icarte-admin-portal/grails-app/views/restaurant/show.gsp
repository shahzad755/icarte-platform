<%@page import="com.armedialab.util.Utils"%>
<%@ page import="com.armedialab.entity.Restaurant" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'restaurant.label', default: 'Restaurant')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		<div class="portlet light bordered" id="show-restaurant" role="main">
			<div class="portlet-title">
				<div class="caption font-blue">
					<i class="icon-info"></i><g:message code="default.show.label" args="[entityName]" />
				</div>
				<div class="pull-right">
					<button type="button" class="btn blue-madison" onclick="location.href='${request.contextPath}/branch/index?restaurantId=${restaurantInstance?.id}'">
						<span class="item"><span class="icon-directions" aria-hidden="true"></span> &nbsp;<g:message code="default.branches.edit.label" default="Manage Branches" /> </span>
					</button>
					<button type="button" class="btn blue-madison" onclick="location.href='${request.contextPath}/restaurantDevice/index/'">
						<span class="item"><span class="icon-screen-tablet" aria-hidden="true"></span> &nbsp;<g:message code="default.devices.edit.label" default="Devices" /> </span>
					</button>
				</div>
			</div>
			<div class="portlet-body form">
					<g:if test="${flash.message}">
						<div class="message alert alert-info alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Info!</strong> ${flash.message}
			             </div>
					</g:if>
					<g:hasErrors bean="${restaurantInstance}">
					<div class="alert alert-danger alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Error!</strong>
							<ul class="errors" role="alert">
								<g:eachError bean="${restaurantInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
					</div>
					</g:hasErrors>
					<g:form class="form-horizontal" role="form" url="[resource:restaurantInstance, action:'delete']" method="DELETE">
					<div class="form-body">
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurant.restaurantCode.label" default="Restaurant Code" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${restaurantInstance}" field="restaurantCode"/></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurant.name.label" default="Name" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${restaurantInstance}" field="name"/></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurant.title.label" default="Tagline" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${restaurantInstance?.restaurantTranslations?.getAt(0)}" field="title"/></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurant.description.label" default="Description" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${restaurantInstance?.restaurantTranslations?.getAt(0)}" field="description"/></p>
								</div>
							</div>
							<%--
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurant.theme.label" default="Theme" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${restaurantInstance}" field="theme"/></p>
								</div>
							</div>
							--%>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurant.activationKey.label" default="Activation Key" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${restaurantInstance}" field="activationKey"/></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurant.activationDate.label" default="Activation Date" />:</label>
										<p class="form-control-static"><g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${restaurantInstance?.activationDate}" /></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurant.billingPeriod.label" default="Billing Period" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${restaurantInstance}" field="billingPeriod"/></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurant.accountType.label" default="Account Type" />:</label>
										<p class="form-control-static">${restaurantInstance?.accountType?.name?.encodeAsHTML()}</p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<g:if test="${restaurantInstance?.bgImage}">
									<g:set var="imagePath" value="${grailsApplication.config.imageRemoteURL}/${grailsApplication.config.restaurantImageFolder}/${restaurantInstance.id}/${grailsApplication.config.restaurantBgImageFolder }"/>
									<div class="form-group">
										<label class="control-label lead"><g:message code="restaurantInstance.bgImage.label" default="Image" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${restaurantInstance}" field="originalBgImage"/></p>
											<div id="links">
											    <a href="${imagePath}/${restaurantInstance?.bgImage}" target="_blank" 
											    	title="${restaurantInstance?.originalBgImage}">
											        <img src="${imagePath}/${restaurantInstance?.bgImageThumbnail}" alt="${restaurantInstance?.originalBgImage}">
											    </a>
											</div>
									</div>
								</g:if>
							</div>
							<%--
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurant.logoLarge.label" default="Logo Large" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${restaurantInstance}" field="logoLarge"/></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="restaurant.logoSmall.label" default="Logo Small" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${restaurantInstance}" field="logoSmall"/></p>
								</div>
							</div>
							--%>
							<sec:ifAnyGranted roles="ROLE_SUPERADMIN">							
								<div class="row" style="padding-left: 20px">
									<div class="form-group">
										<label class="control-label lead"><g:message code="restaurant.accountBlocked.label" default="Account Blocked" />:</label>
											<p class="form-control-static"><g:formatBoolean boolean="${restaurantInstance?.accountBlocked}" /></p>
									</div>
								</div>
								<div class="row" style="padding-left: 20px">
									<div class="form-group">
										<label class="control-label lead"><g:message code="restaurant.accountCancelled.label" default="Account Cancelled" />:</label>
											<p class="form-control-static"><g:formatBoolean boolean="${restaurantInstance?.accountCancelled}" /></p>
									</div>
								</div>
								<div class="row" style="padding-left: 20px">
									<div class="form-group">
										<label class="control-label lead"><g:message code="restaurant.accountDeleted.label" default="Account Deleted" />:</label>
											<p class="form-control-static"><g:formatBoolean boolean="${restaurantInstance?.accountDeleted}" /></p>
									</div>
								</div>
								<div class="row" style="padding-left: 20px">
									<div class="form-group">
										<label class="control-label lead"><g:message code="restaurant.createdBy.label" default="Created By" />:</label>
											<p class="form-control-static"><g:fieldValue bean="${restaurantInstance}" field="createdBy"/></p>
									</div>
								</div>
								<div class="row" style="padding-left: 20px">
									<div class="form-group">
										<label class="control-label lead"><g:message code="restaurant.dateCreated.label" default="Date Created" />:</label>
											<p class="form-control-static"><g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${restaurantInstance?.dateCreated}" /></p>
									</div>
								</div>
								<div class="row" style="padding-left: 20px">
									<div class="form-group">
										<label class="control-label lead"><g:message code="restaurant.updatedBy.label" default="Updated By" />:</label>
											<p class="form-control-static"><g:fieldValue bean="${restaurantInstance}" field="updatedBy"/></p>
									</div>
								</div>
								<div class="row" style="padding-left: 20px">
									<div class="form-group">
										<label class="control-label lead"><g:message code="restaurant.lastUpdated.label" default="Updated On" />:</label>
											<p class="form-control-static"><g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${restaurantInstance?.lastUpdated}" /></p>
									</div>
								</div>
							</sec:ifAnyGranted>
					</div>
					<button type="button" class="btn blue-madison" onclick="location.href='${request.contextPath}/${controllerName }/edit/${restaurantInstance?.id}'">
						<i class="fa fa-pencil"></i><g:message code="default.button.edit.label" default="Edit" />
					</button>
					<sec:ifAnyGranted roles="ROLE_SUPERADMIN">							
						<g:actionSubmit class="delete btn red-sunglo" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</sec:ifAnyGranted>
				</g:form>
			</div>
		</div>
	</body>
</html>
