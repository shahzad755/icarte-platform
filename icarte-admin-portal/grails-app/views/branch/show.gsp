
<%@page import="com.armedialab.util.Utils"%>
<%@ page import="com.armedialab.entity.Branch" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'branch.label', default: 'Branch')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		<div class="portlet light bordered" id="show-branch" role="main">
			<div class="portlet-title">
				<div class="caption font-blue">
					<i class="icon-info"></i><g:message code="default.show.label" args="[entityName]" />
				</div>
			</div>
			<div class="portlet-body form">
					<g:if test="${flash.message}">
						<div class="message alert alert-info alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Info!</strong> ${flash.message}
			             </div>
					</g:if>
					<g:hasErrors bean="${branchInstance}">
					<div class="alert alert-danger alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Error!</strong>
							<ul class="errors" role="alert">
								<g:eachError bean="${branchInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
					</div>
					</g:hasErrors>
					<g:form class="form-horizontal" role="form" url="[resource:branchInstance, action:'delete']" method="DELETE">
					
					<div class="form-body">
						<h3 class="margin-bottom-20"> Branch: <g:fieldValue bean="${branchInstance}" field="name"/> </h3>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-md-3"><g:message code="branch.branchCode.label" default="Branch Code" />:</label>
									<div class="col-md-9">
										<p class="form-control-static"><g:fieldValue bean="${branchInstance}" field="branchCode"/></p>
									</div>
								</div>
							</div>
							<!--/span-->
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-md-3"><g:message code="branch.isActive.label" default="Is Active" />:</label>
									<div class="col-md-9">
										<p class="form-control-static"><g:fieldValue bean="${branchInstance}" field="isActive"/></p>
									</div>
								</div>
							</div>
							<!--/span-->
						</div>
						<!--/row-->
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-md-3"><g:message code="branch.createdBy.label" default="Created By" />:</label>
									<div class="col-md-9">
										<p class="form-control-static"><g:fieldValue bean="${branchInstance}" field="createdBy"/></p>
									</div>
								</div>
							</div>
							<!--/span-->
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-md-3"><g:message code="branch.dateCreated.label" default="Created On" />:</label>
									<div class="col-md-9">
										<p class="form-control-static"><g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${branchInstance?.dateCreated}" /></p>
									</div>
								</div>
							</div>
							<!--/span-->
						</div>
						<!--/row-->
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-md-3"><g:message code="branch.updatedBy.label" default="Updated By" />:</label>
									<div class="col-md-9">
										<p class="form-control-static"><g:fieldValue bean="${branchInstance}" field="updatedBy"/></p>
									</div>
								</div>
							</div>
							<!--/span-->
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-md-3"><g:message code="branch.lastUpdated.label" default="Last Updated" />:</label>
									<div class="col-md-9">
										<p class="form-control-static"><g:formatDate format="${Utils.DATE_FORMAT_MEDIUM}" date="${branchInstance?.lastUpdated}" /></p>
									</div>
								</div>
							</div>
							<!--/span-->
						</div>
						<!--/row-->
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-md-3"><g:message code="branch.managerId.label" default="Manager Id" />:</label>
									<div class="col-md-9">
										<p class="form-control-static"><g:fieldValue bean="${branchInstance}" field="managerId"/></p>
									</div>
								</div>
							</div>
							<!--/span-->
						</div>
						<!--/row-->
						<div class="portlet-title form-subsection-header">
                                <div class="caption font-blue">
                                    <i class="icon-note"></i>
                                    <span class="caption-subject bold uppercase"> Branch Address</span>
                                </div>
                        </div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-md-3"><g:message code="address.email.label" default="Email" />:</label>
									<div class="col-md-9">
										<p class="form-control-static"><g:fieldValue bean="${branchInstance.address}" field="email"/></p>
									</div>
								</div>
							</div>
							<!--/span-->
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-md-3"><g:message code="address.street.label" default="Street" />:</label>
									<div class="col-md-9">
										<p class="form-control-static"><g:fieldValue bean="${branchInstance.address}" field="street"/></p>
									</div>
								</div>
							</div>
							<!--/span-->
						</div>
						<!--/row-->
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-md-3"><g:message code="address.area.label" default="Area" />:</label>
									<div class="col-md-9">
										<p class="form-control-static"><g:fieldValue bean="${branchInstance.address}" field="area"/></p>
									</div>
								</div>
							</div>
							<!--/span-->
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-md-3"><g:message code="address.poBox.label" default="P.O Box" />:</label>
									<div class="col-md-9">
										<p class="form-control-static"><g:fieldValue bean="${branchInstance.address}" field="poBox"/></p>
									</div>
								</div>
							</div>
							<!--/span-->
						</div>
						<!--/row-->
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-md-3"><g:message code="address.country.label" default="Country" />:</label>
									<div class="col-md-9">
										<p class="form-control-static"><g:fieldValue bean="${branchInstance.address}" field="country"/></p>
									</div>
								</div>
							</div>
							<!--/span-->
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-md-3"><g:message code="address.city.label" default="City" />:</label>
									<div class="col-md-9">
										<p class="form-control-static"><g:fieldValue bean="${branchInstance.address}" field="city"/></p>
									</div>
								</div>
							</div>
							<!--/span-->
						</div>
						<!--/row-->
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-md-3"><g:message code="address.country.label" default="Country" />:</label>
									<div class="col-md-9">
										<p class="form-control-static"><g:fieldValue bean="${branchInstance.address}" field="country"/></p>
									</div>
								</div>
							</div>
							<!--/span-->
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-md-3"><g:message code="address.city.label" default="City" />:</label>
									<div class="col-md-9">
										<p class="form-control-static"><g:fieldValue bean="${branchInstance.address}" field="city"/></p>
									</div>
								</div>
							</div>
							<!--/span-->
						</div>
						<!--/row-->
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-md-3"><g:message code="address.phone1.label" default="Phone 1" />:</label>
									<div class="col-md-9">
										<p class="form-control-static"><g:fieldValue bean="${branchInstance.address}" field="phone1"/></p>
									</div>
								</div>
							</div>
							<!--/span-->
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-md-3"><g:message code="address.phone2.label" default="Phone 2" />:</label>
									<div class="col-md-9">
										<p class="form-control-static"><g:fieldValue bean="${branchInstance.address}" field="phone2"/></p>
									</div>
								</div>
							</div>
							<!--/span-->
						</div>
						<!--/row-->
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-md-3"><g:message code="address.phone3.label" default="Phone 3" />:</label>
									<div class="col-md-9">
										<p class="form-control-static"><g:fieldValue bean="${branchInstance.address}" field="phone3"/></p>
									</div>
								</div>
							</div>
							<!--/span-->
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-md-3"><g:message code="address.phone4.label" default="Phone 4" />:</label>
									<div class="col-md-9">
										<p class="form-control-static"><g:fieldValue bean="${branchInstance.address}" field="phone4"/></p>
									</div>
								</div>
							</div>
							<!--/span-->
						</div>
						<!--/row--><%--
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label class="control-label col-md-3"><g:message code="address.mapsUrl.label" default="Location Map" />:</label>
									<div class="col-md-1">
										<p class="form-control-static"><g:fieldValue bean="${branchInstance.address}" field="mapsUrl"/></p>
									</div>
								</div>
							</div>
							<!--/span-->
						</div>
						<!--/row-->
					--%></div>
					<button type="button" class="btn blue-madison" onclick="location.href='${request.contextPath}/${controllerName }/edit/${branchInstance?.id}'">
						<i class="fa fa-pencil"></i><g:message code="default.button.edit.label" default="Edit" />
					</button>
					<g:actionSubmit class="delete btn red-sunglo" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</g:form>
			</div>
		</div>
	</body>
</html>
