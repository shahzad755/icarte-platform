<%@ page import="com.armedialab.user.User" %>

	<div class="row">
	    <div class="col-md-4">
	        <div class="form-group form-md-line-input ${hasErrors(bean: userInstance, field: 'username', 'has-error')} required">
		     <label class="col-md-4 control-label" for="username">
		     	<g:message code="username.label" default="Username" />
		     	<span class="required" aria-required="true">*</span>
		     </label>
		     <div class="col-md-8">
		        <g:textField name="username" readonly="${(actionName == 'edit')}" required="" value="${userInstance?.username}" class="form-control"/>
		        <div class="form-control-focus"> </div>
		     	<span class="help-block"><g:message code="help.username" default="Enter Username..." /></span>
		     </div>
	        </div>
	    </div>
		<!--/span-->
	    <div class="col-md-4">
	        <div class="form-group form-md-line-input ${hasErrors(bean: userInstance, field: 'email', 'has-error')}">
		     <label class="col-md-4 control-label" for="email">
		     	<g:message code="email.label" default="Email" />
		     </label>
		     <div class="col-md-8">
		        <g:textField name="email" type="email" value="${userInstance?.email}" class="form-control"/>
		        <div class="form-control-focus"> </div>
		     	<span class="help-block"><g:message code="help.email" default="Enter Email..." /></span>
		     </div>
	        </div>
	    </div>
		<!--/span-->
	    <div class="col-md-4">
	        <div class="form-group form-md-line-input ${hasErrors(bean: userInstance, field: 'staff?.staffCode', 'has-error')} required">
		     <label class="col-md-4 control-label" for="staff.staffCode">
		     	<g:message code="staffCode.label" default="Staff Code" />
		     	<span class="required" aria-required="true">*</span>
		     </label>
		     <div class="col-md-8">
		        <g:textField name="staff.staffCode" required="" value="${userInstance?.staff?.staffCode}" class="form-control"/>
		        <div class="form-control-focus"> </div>
		     	<span class="help-block"><g:message code="help.staffCode" default="Enter Staff Code..." /></span>
		     </div>
	        </div>
	    </div>
		<!--/span-->
	<!--/row-->
	</div>
<!-- ------------------------------------------------------------------------------------------------- -->
	<div class="row">
	    <div class="col-md-4">
	        <div class="form-group form-md-line-input ${hasErrors(bean: userInstance, field: 'firstName', 'has-error')} required">
		     <label class="col-md-4 control-label" for="firstName">
		     	<g:message code="firstName.label" default="First Name" />
		     	<span class="required" aria-required="true">*</span>
		     </label>
		     <div class="col-md-8">
		        <g:textField name="firstName" required="" value="${userInstance?.firstName}" class="form-control"/>
		        <div class="form-control-focus"> </div>
		     	<span class="help-block"><g:message code="help.firstName" default="Enter Username..." /></span>
		     </div>
	        </div>
	    </div>
		<!--/span-->
	    <div class="col-md-4">
	        <div class="form-group form-md-line-input ${hasErrors(bean: userInstance, field: 'lastName', 'has-error')}">
		     <label class="col-md-4 control-label" for="lastName">
		     	<g:message code="lastName.label" default="Last Name" />
		     </label>
		     <div class="col-md-8">
		        <g:textField name="lastName" value="${userInstance?.lastName}" class="form-control"/>
		        <div class="form-control-focus"> </div>
		     	<span class="help-block"><g:message code="help.lastName" default="Enter Last Name..." /></span>
		     </div>
	        </div>
	    </div>
		<!--/span-->
	    <div class="col-md-4">
	        <div class="form-group form-md-line-input ${hasErrors(bean: userInstance, field: 'staff?.mobile', 'has-error')}">
		     <label class="col-md-4 control-label" for="staff.mobile">
		     	<g:message code="mobile.label" default="Mobile" />
		     </label>
		     <div class="col-md-8">
		        <g:textField name="staff.mobile" value="${userInstance?.staff?.mobile}" class="form-control"/>
		        <div class="form-control-focus"> </div>
		     	<span class="help-block"><g:message code="help.mobile" default="Enter Mobile..." /></span>
		     </div>
	        </div>
	    </div>
		<!--/span-->
	<!--/row-->
	</div>
<!--  ------------------------------------------------------------------------------------------------ -->
<g:if test="${(actionName != 'edit')}">
	<div><hr/> </div>
	<div class="row">
	    <div class="col-md-6">
	        <div class="form-group form-md-line-input ${hasErrors(bean: userInstance, field: 'password', 'has-error')} required">
		     <label class="col-md-4 control-label" for="password">
		     	<g:message code="password.label" default="Password" />
		     	<span class="required" aria-required="true">*</span>
		     </label>
		     <div class="col-md-8">
		        <g:passwordField name="password" required="" class="form-control"/>
		        <div class="form-control-focus"> </div>
		     	<span class="help-block"><g:message code="help.password" default="Enter Password..." /></span>
		     </div>
	        </div>
	    </div>
		<!--/span-->
	    <div class="col-md-6">
	        <div class="form-group form-md-line-input ${hasErrors(bean: userInstance, field: 'confirmPassword', 'has-error')} required">
		     <label class="col-md-4 control-label" for="confirmPassword">
		     	<g:message code="confirmPassword.label" default="Confirm Password" />
		     	<span class="required" aria-required="true">*</span>
		     </label>
		     <div class="col-md-8">
		        <g:passwordField name="confirmPassword" required="" class="form-control"/>
		        <div class="form-control-focus"> </div>
		     	<span class="help-block"><g:message code="help.confirmPassword" default="Re-Enter Password..." /></span>
		     </div>
	        </div>
	    </div>
		<!--/span-->
	<!--/row-->
	</div>
	<%--
	<div class="row">
	    <div class="col-md-12">
	        <div class="form-group form-md-line-input ${hasErrors(bean: userInstance, field: 'passwordRecoveryQst', 'has-error')}">
		     <label class="col-md-2 control-label" for="passwordRecoveryQst">
		     	<g:message code="passwordRecoveryQst.label" default="Password Recovery Question" />
		     </label>
		     <div class="col-md-8">
		        <g:textField name="passwordRecoveryQst" class="form-control"/>
		        <div class="form-control-focus"> </div>
		     	<span class="help-block"><g:message code="help.passwordRecoveryQst" default="Enter Password Recovery Question..." /></span>
		     </div>
	        </div>
	    </div>
		<!--/span-->
	</div>
	<div class="row">
	    <div class="col-md-12">
	        <div class="form-group form-md-line-input ${hasErrors(bean: userInstance, field: 'passwordRecoveryAns', 'has-error')}">
		     <label class="col-md-2 control-label" for="passwordRecoveryAns">
		     	<g:message code="passwordRecoveryAns.label" default="Password Recovery Answer" />
		     </label>
		     <div class="col-md-8">
		        <g:textField name="passwordRecoveryAns" class="form-control"/>
		        <div class="form-control-focus"> </div>
		     	<span class="help-block"><g:message code="help.passwordRecoveryAns" default="Enter Password Recovery Answer..." /></span>
		     </div>
	        </div>
	    </div>
		<!--/span-->
	<!--/row-->
	</div> --%>
</g:if>
		<div><hr/> </div>
		<div class="row">
		    <div class="col-md-4">
		        <div class="form-group form-md-line-input ${hasErrors(bean: userInstance, field: 'designation', 'has-error')} required">
			     <label class="col-md-4 control-label" for="designation">
			     	<g:message code="designation.label" default="Designation" />
			     </label>
			     <div class="col-md-8">
			        <g:textField name="designation" value="${userInstance?.staff?.designation}" class="form-control"/>
			        <div class="form-control-focus"> </div>
			     	<span class="help-block"><g:message code="help.designation" default="Enter Designation..." /></span>
			     </div>
		        </div>
		    </div>
			<!--/span-->
	<sec:ifAnyGranted roles="ROLE_SUPERADMIN">							
		    <div class="col-md-4">
		        <div class="form-group form-md-line-input ${hasErrors(bean: userInstance, field: 'staff?.restaurant', 'has-error')} required">
			     <label class="col-md-4 control-label" for="restaurant.id">
			     	<g:message code="restaurant.label" default="Restaurant" />
		     		<span class="required" aria-required="true">*</span>
			     </label>
			     <div class="col-md-8">
			        <g:select id="restaurant" name="staff.restaurant.id" from="${com.armedialab.entity.Restaurant.findAllByAccountDeletedOrAccountDeleted('false', 'false')}" optionKey="id" required="" 
					value="${userInstance?.staff?.restaurant?.id}" 
					optionValue="restuarantNameWithCode" 
					class="many-to-one form-control"/>
			        <div class="form-control-focus"> </div>
			     	<span class="help-block"><g:message code="help.restaurant" default="Select Restaurant..." /></span>
			     </div>
		        </div>
		    </div>
	</sec:ifAnyGranted>		    
			<!--/span-->
		    <div class="col-md-4">
		        <div class="form-group form-md-line-input ${hasErrors(bean: userInstance, field: 'staff?.branch', 'has-error')} required">
			     <label class="col-md-4 control-label" for="branch.id">
			     	<g:message code="branch.label" default="Branch" />
			     	<span class="required" aria-required="true">*</span>
			     </label>
			     <div class="col-md-8">
			        <g:select id="branch" name="staff.branch.id" from="${branchList}" optionKey="id" required="" 
					value="${userInstance?.staff?.branch?.id}" 
					optionValue="nameWithRestuarant" 
					class="many-to-one form-control"/>
			        <div class="form-control-focus"> </div>
			     	<span class="help-block"><g:message code="help.branch" default="Select Branch..." /></span>
			     </div>
		        </div>
		    </div>
			<!--/span-->
		<!--/row-->
		</div>
		<div><hr/> </div>
	<sec:ifAnyGranted roles="ROLE_SUPERADMIN">
		<div class="row">
		        <div class="form-group form-md-line-input ${hasErrors(bean: userInstance, field: 'accountExpired', 'has-error')} required">
			     <label class="col-md-2 control-label" for="accountExpired">
			     	<g:message code="accountExpired.label" default="Account Expired" />
			     </label>
			     <div class="col-md-8">
			        <g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />
			     </div>
		        </div>
		</div>
		<div class="row">
		        <div class="form-group form-md-line-input ${hasErrors(bean: userInstance, field: 'accountLocked', 'has-error')} required">
			     <label class="col-md-2 control-label" for="accountLocked">
			     	<g:message code="accountLocked.label" default="Account Locked" />
			     </label>
			     <div class="col-md-8">
			        <g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />
			     </div>
		        </div>
		</div>
		<div class="row">
		        <div class="form-group form-md-line-input ${hasErrors(bean: userInstance, field: 'passwordExpired', 'has-error')} required">
			     <label class="col-md-2 control-label" for="passwordExpired">
			     	<g:message code="passwordExpired.label" default="Password Expired" />
			     </label>
			     <div class="col-md-8">
			        <g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />
			     </div>
		        </div>
			<!--/span-->
		<!--/row-->
		</div>
	</sec:ifAnyGranted>		
<!--  ------------------------------------------------------------------------------------------------ -->
<!-- ------------------------------------------------------------------------------------------------- -->
		<div class="row">
		    <div class="col-md-8">
		        <div class="form-group form-md-line-input ${hasErrors(bean: userInstance, field: 'enabled', 'has-error')} required">
			     <label class="col-md-2 control-label" for="enabled">
			     	<g:message code="enabled.label" default="Enabled" />
			     </label>
			        <g:checkBox name="enabled" value="${userInstance?.enabled}" />
		        </div>
		    </div>
			<!--/span-->
		<!--/row-->
		</div>

