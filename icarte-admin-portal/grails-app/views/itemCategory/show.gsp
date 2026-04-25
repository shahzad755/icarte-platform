
<%@page import="com.armedialab.util.Utils"%>
<%@ page import="com.armedialab.entity.ItemCategory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'itemCategory.label', default: 'ItemCategory')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		<div class="portlet light bordered" id="show-itemCategory" role="main">
			<div class="portlet-title">
				<div class="caption font-blue">
					<i class="icon-info"></i><g:message code="default.show.label" args="[entityName]" />
				</div>
				<div class="pull-right">
					<button type="button" class="btn blue-madison" onclick="location.href='${request.contextPath}/${controllerName }/edit/${itemCategoryInstance?.id}'">
						<i class="fa fa-pencil"></i><g:message code="default.button.edit.label" default="Edit" />
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
					<g:hasErrors bean="${itemCategoryInstance}">
					<div class="alert alert-danger alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Error!</strong>
							<ul class="errors" role="alert">
								<g:eachError bean="${itemCategoryInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
					</div>
					</g:hasErrors>
					<g:form class="form-horizontal" role="form" url="[resource:itemCategoryInstance, action:'delete']" method="DELETE">
					<g:hiddenField name="id" value="${itemCategoryInstance?.id }"/>
					<div class="form-body">
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="itemCategory.menu.label" default="Menu Group(s)" />:</label>
										<p class="form-control-static">${menus*.menu.title}</p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="itemCategory.title.label" default="Category Title" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${itemCategoryInstance?.itemCategoryTranslations[0]}" field="title"/></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="itemCategory.description.label" default="Description" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${itemCategoryInstance?.itemCategoryTranslations[0]}" field="description"/></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="itemCategory.parentCategory.label" default="Parent Category" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${itemCategoryInstance}" field="parentCategory"/></p>
								</div>
							</div><%--
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="itemCategory.tags.label" default="Tags" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${itemCategoryInstance}" field="tags"/></p>
								</div>
							</div>
							--%><%--
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="itemCategory.availableDurationStart.label" default="Available Duration Start" />:</label>
										<p class="form-control-static"><g:formatDate format="${Utils.DATE_FORMAT}" date="${itemCategoryInstance?.availableDurationStart}" /></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="itemCategory.availableDurationEnd.label" default="Available Duration End" />:</label>
										<p class="form-control-static"><g:formatDate format="${Utils.DATE_FORMAT}" date="${itemCategoryInstance?.availableDurationEnd}" /></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="itemCategory.displayOrder.label" default="Display Order" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${itemCategoryInstance}" field="displayOrder"/></p>
								</div>
							</div>--%>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="itemCategory.mappingCode.label" default="Mapping Code" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${itemCategoryInstance}" field="mappingCode"/></p>
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
								<g:if test="${itemCategoryInstance?.imageUrl}">
									<g:set var="imagePath" value="${grailsApplication.config.imageRemoteURL}/${grailsApplication.config.categoriesImageFolder}/${itemCategoryInstance?.restaurant.id}/${+itemCategoryInstance?.id}"/>
									<div class="form-group">
										<label class="control-label lead"><g:message code="itemCategory.imageUrl.label" default="Image" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${itemCategoryInstance}" field="originalImageName"/></p>
											<div id="links">
											    <a href="${imagePath}/${itemCategoryInstance?.imageUrl}" 
											    	title="${itemCategoryInstance?.originalImageName}">
											        <img src="${imagePath}/${itemCategoryInstance?.smallIconUrl}" alt="${imagePath}/${itemCategoryInstance?.originalImageName}">
											    </a>
											</div>
									</div>
								</g:if>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="itemCategory.isActive.label" default="Is Active" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${itemCategoryInstance}" field="isActive"/></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="itemCategory.createdBy.label" default="Created By" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${itemCategoryInstance}" field="createdBy"/></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="itemCategory.dateCreated.label" default="Date Created" />:</label>
										<p class="form-control-static"><g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${itemCategoryInstance?.dateCreated}" /></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="itemCategory.updatedBy.label" default="Updated By" />:</label>
										<p class="form-control-static"><g:fieldValue bean="${itemCategoryInstance}" field="updatedBy"/></p>
								</div>
							</div>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="itemCategory.lastUpdated.label" default="Last Updated" />:</label>
										<p class="form-control-static"><g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${itemCategoryInstance?.lastUpdated}" /></p>
								</div>
							</div>
					</div>
					<button type="button" class="btn blue-madison" onclick="location.href='${request.contextPath}/${controllerName }/edit/${itemCategoryInstance?.id}'">
						<i class="fa fa-pencil"></i><g:message code="default.button.edit.label" default="Edit" />
					</button>
					<%--<g:actionSubmit class="delete btn red-sunglo" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				--%></g:form>
			</div>
		</div>
	</body>
</html>
