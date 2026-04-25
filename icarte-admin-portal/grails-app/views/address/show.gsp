
<%@ page import="com.armedialab.entity.Address" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		<div class="portlet light bordered" id="show-address" role="main">
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
					<g:hasErrors bean="${addressInstance}">
					<div class="alert alert-danger alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Error!</strong>
							<ul class="errors" role="alert">
								<g:eachError bean="${addressInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
					</div>
					</g:hasErrors>
					<g:form class="form-horizontal" role="form" url="[resource:addressInstance, action:'delete']" method="DELETE">
					
					<div class="form-body">
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="address.email.label" default="Email" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${addressInstance}" field="email"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="address.street.label" default="Street" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${addressInstance}" field="street"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="address.area.label" default="Area" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${addressInstance}" field="area"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="address.city.label" default="City" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${addressInstance}" field="city"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="address.country.label" default="Country" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${addressInstance}" field="country"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="address.poBox.label" default="Po Box" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${addressInstance}" field="poBox"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="address.phone1.label" default="Phone1" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${addressInstance}" field="phone1"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="address.phone2.label" default="Phone2" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${addressInstance}" field="phone2"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="address.phone3.label" default="Phone3" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${addressInstance}" field="phone3"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="address.phone4.label" default="Phone4" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${addressInstance}" field="phone4"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="address.lat.label" default="Lat" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${addressInstance}" field="lat"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="address.lon.label" default="Lon" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${addressInstance}" field="lon"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="address.mapsUrl.label" default="Maps Url" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${addressInstance}" field="mapsUrl"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="address.isActive.label" default="Is Active" />:</label>
									
										<p class="form-control-static"><g:formatBoolean boolean="${addressInstance?.isActive}" /></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="address.description.label" default="Description" />:</label>
									
										<p class="form-control-static"><g:fieldValue bean="${addressInstance}" field="description"/></p>
									
									
								</div>
							</div>
					
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="address.staffs.label" default="Staffs" />:</label>
									
										<g:each in="${addressInstance.staffs}" var="s">
										<p class="form-control-static"><g:link controller="staff" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></p>
										</g:each>
									
									
								</div>
							</div>
					
					</div>
					<button type="button" class="btn blue-madison" onclick="location.href='${request.contextPath}/${controllerName }/edit/${addressInstance?.id}'">
						<i class="fa fa-pencil"></i><g:message code="default.button.edit.label" default="Edit" />
					</button>
					<g:actionSubmit class="delete btn red-sunglo" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</g:form>
			</div>
		</div>
	</body>
</html>
