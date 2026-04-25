<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName" value="${message(code: 'userProfile.label', default: 'Manage Profile')}" />
<title><g:message code="userProfile.label" default="Manage Profile" /></title>
</head>
<body>
	<g:render template="/layouts/pageheader" />
	<div class="portlet light portlet-fit portlet-form bordered" id="manage-userProfile" role="main">
		<div class="portlet-body">
			<g:if test="${flash.message}">
				<div class="message alert alert-info alert-dismissable"
					role="status">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true"></button>
					<strong>Info!</strong>
					${flash.message}
				</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
				<div class="alert alert-danger alert-dismissable" role="status">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true"></button>
					<strong>Error!</strong>
					<ul class="errors" role="alert">
						<g:eachError bean="${userInstance}" var="error">
							<li
								<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
									error="${error}" /></li>
						</g:eachError>
					</ul>
				</div>
			</g:hasErrors>
			<div class="profile-content">
				<div class="row">
					<div class="col-md-2">&nbsp;</div>			
					<div class="col-md-8">
						<div class="portlet light ">
							<div class="portlet-title tabbable-line">
								<div class="caption caption-md">
									<i class="icon-globe theme-font hide"></i>
									<span class="caption-subject font-blue-madison bold uppercase">Manage Your Profile </span>
								</div>
								<ul class="nav nav-tabs">
									<li class="${tab != 'tab_changePassword'? 'active': ''}">
										<a aria-expanded="true" href="#tab_profile" data-toggle="tab">Personal Info</a>
									</li>
									<li class="${tab == 'tab_changePassword'? 'active': ''}">
										<a aria-expanded="false" href="#tab_changePassword" data-toggle="tab">Change Password</a>
									</li>
								</ul>
							</div>
							<div class="portlet-body">
								<div class="tab-content">
									<!-- PERSONAL INFO TAB -->
									<div class="tab-pane ${tab != 'tab_changePassword'? 'active': ''}" id="tab_profile">
										<g:form url="[resource:userInstance, action:'updateProfile']" method="PUT" class="form-horizontal" >
											<g:hiddenField name="version" value="${userInstance?.version}" />							
											<div class="form-group">
												<label class="control-label"><g:message code="username.label" default="Username" /></label>
												<g:textField name="username" readonly="true" value="${userInstance?.username}" class="form-control"/>
											</div>
											<div class="form-group">
												<label class="control-label"><g:message code="staffCode.label" default="Staff Code" /></label>
												<g:textField name="staff.staffCode" readonly="true" value="${userInstance?.staff?.staffCode}" class="form-control"/>
											</div>
											<div class="form-group ${hasErrors(bean: userInstance, field: 'email', 'has-error')} required">
												<label class="control-label">Email</label> <span class="required" aria-required="true">*</span>
												<g:textField name="email" type="email" value="${userInstance?.email}" placeholder="Email" class="form-control"/>
											</div>
											<div class="form-group ${hasErrors(bean: userInstance, field: 'firstName', 'has-error')} required">
												<label class="control-label"><g:message code="firstName.label" default="First Name" /></label> <span class="required" aria-required="true">*</span>
												<g:textField name="firstName" required="" value="${userInstance?.firstName}" placeholder="First Name" class="form-control"/>
											</div>
											<div class="form-group ${hasErrors(bean: userInstance, field: 'lastName', 'has-error')} required">
												<label class="control-label"><g:message code="lastName.label" default="Last Name" /></label> <span class="required" aria-required="true">*</span>
												<g:textField name="lastName" required="" value="${userInstance?.lastName}" placeholder="Last Name" class="form-control"/>
											</div>
											<div class="form-group ${hasErrors(bean: userInstance, field: 'staff?.mobile', 'has-error')}">
												<label class="control-label"><g:message code="mobile.label" default="Mobile" /></label>
												<g:textField name="staff.mobile" value="${userInstance?.staff?.mobile}" placeholder="Mobile" class="form-control"/>
											</div>
											<div class="form-actions">
												<div class="row pull-right">
													<button type="submit" class="btn green-jungle">
														<i class="fa fa-pencil"></i><g:message code="default.button.update.label"/>
													</button>
													<button type="button" class="btn default" onclick="javascript: window.location.assign('${request.contextPath}')">
														<g:message code="default.button.cancel.label"/>
													</button>
												</div>
											</div>
										</g:form>
									</div>
									<!-- END PERSONAL INFO TAB -->
									<!-- CHANGE PASSWORD TAB -->
									<div class="tab-pane ${tab == 'tab_changePassword'? 'active': ''}" id="tab_changePassword">
										<g:form url="[resource:userInstance, action:'changePassword']" method="PUT" class="form-horizontal" >
											<div class="form-group  ${hasErrors(bean: userInstance, field: 'password', 'has-error')} required">
												<label class="control-label"><g:message code="oldPassword.label" default="Current Password" /><span class="required" aria-required="true">*</span></label>
												<input id="oldPassword" required="required" name="oldPassword" class="form-control" type="password">
											</div>
											<div class="form-group  ${hasErrors(bean: userInstance, field: 'password', 'has-error')} required">
												<label class="control-label"><g:message code="password.label" default="Password" /><span class="required" aria-required="true">*</span></label>
		        								<g:passwordField name="password" required="" class="form-control"/>
											</div>
											<div class="form-group ${hasErrors(bean: userInstance, field: 'confirmPassword', 'has-error')} required">
												<label class="control-label"><g:message code="confirmPassword.label" default="Confirm Password" /></label><span class="required" aria-required="true">*</span>
												<g:passwordField name="confirmPassword" required="" class="form-control"/>
											</div>
											<div class="form-actions">
												<div class="row pull-right">
													<button type="submit" class="btn green-jungle">
														<i class="fa fa-pencil"></i><g:message code="passwordChange.label" default="Change Password"/>
													</button>
													<button type="button" class="btn default" onclick="javascript: window.location.assign('${request.contextPath}')">
														<g:message code="default.button.cancel.label"/>
													</button>
												</div>
											</div>
										</g:form>
									</div>
									<!-- END CHANGE PASSWORD TAB -->
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-2">&nbsp;</div>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>
