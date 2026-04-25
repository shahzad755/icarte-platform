<%@ page import="com.armedialab.entity.AccountType" %>


 
	<div class="form-group form-md-line-input ${hasErrors(bean: accountTypeInstance, field: 'name', 'has-error')} required">
		<g:textField name="name" required="" value="${accountTypeInstance?.name}" class="form-control"/>

		<label for="name">
			<g:message code="accountType.name.label" default="Name" />
			<span class="required" aria-required="true">*</span>
		</label>
		<span class="help-block"><g:message code="accountType.help.name" default="Enter Name..." /></span>
	</div>
	
 
	<div class="form-group form-md-line-input ${hasErrors(bean: accountTypeInstance, field: 'description', 'has-error')} ">
		<g:textArea name="description" cols="40" rows="5" maxlength="500" value="${accountTypeInstance?.description}" class="form-control"/>

		<label for="description">
			<g:message code="accountType.description.label" default="Description" />
			
		</label>
		<span class="help-block"><g:message code="accountType.help.description" default="Enter Description..." /></span>
	</div>
	
    <div class="form-group md-checkbox">
		<g:checkBox name="isActive"class="md-check" value="${accountTypeInstance?.isActive}" />
	
		<label for="isActive">
			<span class="inc"></span>
			<span class="check"></span>
			<span class="box"></span>
		 	<g:message code="accountType.isActive.label" default="Is Active" />
		</label>
	</div>
