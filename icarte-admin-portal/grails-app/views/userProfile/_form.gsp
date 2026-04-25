<%@ page import="com.armedialab.emergency.UserProfile" %>


 
	<div class="form-group form-md-line-input ${hasErrors(bean: userProfileInstance, field: 'firstName', 'has-error')} ">
		<g:textField name="firstName" value="${userProfileInstance?.firstName}" class="form-control"/>

		<label for="firstName">
			<g:message code="userProfile.firstName.label" default="First Name" />
			
		</label>
		<span class="help-block"><g:message code="userProfile.help.firstName" default="Enter First Name..." /></span>
	</div>
	
 
	<div class="form-group form-md-line-input ${hasErrors(bean: userProfileInstance, field: 'lastName', 'has-error')} ">
		<g:textField name="lastName" value="${userProfileInstance?.lastName}" class="form-control"/>

		<label for="lastName">
			<g:message code="userProfile.lastName.label" default="Last Name" />
			
		</label>
		<span class="help-block"><g:message code="userProfile.help.lastName" default="Enter Last Name..." /></span>
	</div>
	
 
	<div class="form-group form-md-line-input ${hasErrors(bean: userProfileInstance, field: 'mobile', 'has-error')} ">
		<g:textField name="mobile" value="${userProfileInstance?.mobile}" class="form-control"/>

		<label for="mobile">
			<g:message code="userProfile.mobile.label" default="Mobile" />
			
		</label>
		<span class="help-block"><g:message code="userProfile.help.mobile" default="Enter Mobile..." /></span>
	</div>
	
 
	<div class="form-group form-md-line-input ${hasErrors(bean: userProfileInstance, field: 'qatariId', 'has-error')} ">
		<g:textField name="qatariId" value="${userProfileInstance?.qatariId}" class="form-control"/>

		<label for="qatariId">
			<g:message code="userProfile.qatariId.label" default="Qatari Id" />
			
		</label>
		<span class="help-block"><g:message code="userProfile.help.qatariId" default="Enter Qatari Id..." /></span>
	</div>
	
 
	<div class="form-group form-md-line-input ${hasErrors(bean: userProfileInstance, field: 'bloodGroup', 'has-error')} ">
		<g:textField name="bloodGroup" value="${userProfileInstance?.bloodGroup}" class="form-control"/>

		<label for="bloodGroup">
			<g:message code="userProfile.bloodGroup.label" default="Blood Group" />
			
		</label>
		<span class="help-block"><g:message code="userProfile.help.bloodGroup" default="Enter Blood Group..." /></span>
	</div>
	
 
	<div class="form-group form-md-line-input ${hasErrors(bean: userProfileInstance, field: 'nationality', 'has-error')} ">
		<g:textField name="nationality" value="${userProfileInstance?.nationality}" class="form-control"/>

		<label for="nationality">
			<g:message code="userProfile.nationality.label" default="Nationality" />
			
		</label>
		<span class="help-block"><g:message code="userProfile.help.nationality" default="Enter Nationality..." /></span>
	</div>
	
 
	<div class="form-group form-md-line-input ${hasErrors(bean: userProfileInstance, field: 'lat', 'has-error')} ">
		<g:textField name="lat" value="${userProfileInstance?.lat}" class="form-control"/>

		<label for="lat">
			<g:message code="userProfile.lat.label" default="Lat" />
			
		</label>
		<span class="help-block"><g:message code="userProfile.help.lat" default="Enter Lat..." /></span>
	</div>
	
 
	<div class="form-group form-md-line-input ${hasErrors(bean: userProfileInstance, field: 'lon', 'has-error')} ">
		<g:textField name="lon" value="${userProfileInstance?.lon}" class="form-control"/>

		<label for="lon">
			<g:message code="userProfile.lon.label" default="Lon" />
			
		</label>
		<span class="help-block"><g:message code="userProfile.help.lon" default="Enter Lon..." /></span>
	</div>
	
 
	<div class="form-group form-md-line-input ${hasErrors(bean: userProfileInstance, field: 'requestType', 'has-error')} ">
		<g:textField name="requestType" value="${userProfileInstance?.requestType}" class="form-control"/>

		<label for="requestType">
			<g:message code="userProfile.requestType.label" default="Request Type" />
			
		</label>
		<span class="help-block"><g:message code="userProfile.help.requestType" default="Enter Request Type..." /></span>
	</div>
	

