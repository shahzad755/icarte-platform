<%@ page import="com.armedialab.entity.StatusType" %>


 
	<div class="form-group form-md-line-input ${hasErrors(bean: statusTypeInstance, field: 'name', 'has-error')} required">
		<g:textField name="name" maxlength="100" required="" value="${statusTypeInstance?.name}" class="form-control"/>

		<label for="name">
			<g:message code="statusType.name.label" default="Name" />
			<span class="required" aria-required="true">*</span>
		</label>
		<span class="help-block"><g:message code="statusType.help.name" default="Enter Name..." /></span>
	</div>
	
 
       <div class="form-group md-checkbox">
		<g:checkBox name="isActive"class="md-check" value="${statusTypeInstance?.isActive}" />

		<label for="isActive">
			<span class="inc"></span>
			<span class="check"></span>
			<span class="box"></span>
		 	<g:message code="statusType.isActive.label" default="Is Active" />
			
		</label>
		</div>
 
	<div class="form-group form-md-line-input ${hasErrors(bean: statusTypeInstance, field: 'description', 'has-error')} ">
		<g:textField name="description" value="${statusTypeInstance?.description}" class="form-control"/>

		<label for="description">
			<g:message code="statusType.description.label" default="Description" />
			
		</label>
		<span class="help-block"><g:message code="statusType.help.description" default="Enter Description..." /></span>
	</div>