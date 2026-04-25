<%@ page import="com.armedialab.entity.Branch" %>
	<sec:ifAnyGranted roles="ROLE_SUPERADMIN">							
		<div class="form-group form-md-line-input ${hasErrors(bean: branchInstance, field: 'restaurant', 'has-error')} required">
			<g:select id="restaurant" name="restaurant.id" from="${com.armedialab.entity.Restaurant.list()}" optionKey="id" required="" 
					value="${branchInstance?.restaurant?.id}" 
					optionValue="name" 
					class="many-to-one form-control"/>
			<label for="restaurant">
				<g:message code="menu.restaurant.label" default="Restaurant" />
				<span class="required" aria-required="true">*</span>
			</label>
			<span class="help-block"><g:message code="menu.help.restaurant" default="Select Restaurant..." /></span>
		</div>
	</sec:ifAnyGranted>
	<div class="form-group form-md-line-input ${hasErrors(bean: branchInstance, field: 'branchCode', 'has-error')} ">
		<g:textField name="branchCode" maxlength="50" value="${branchInstance?.branchCode}" class="form-control"/>
		<label for="branchCode">
			<g:message code="branch.branchCode.label" default="Branch Code" />
		</label>
		<span class="help-block"><g:message code="branch.help.branchCode" default="Enter Branch Code..." /></span>
	</div>
	<div class="form-group form-md-line-input ${hasErrors(bean: branchInstance, field: 'name', 'has-error')} ">
		<g:textField name="name" maxlength="45" value="${branchInstance?.name}" class="form-control"/>
		<label for="name">
			<g:message code="branch.name.label" default="Name" />
		</label>
		<span class="help-block"><g:message code="branch.help.name" default="Enter Name..." /></span>
	</div>
	<%--
	<div class="form-group form-md-line-input ${hasErrors(bean: branchInstance, field: 'managerId', 'has-error')} ">
		<g:field name="managerId" type="number" value="${branchInstance.managerId}" class="form-control"/>

		<label for="managerId">
			<g:message code="branch.managerId.label" default="Manager Id" />
			
		</label>
		<span class="help-block"><g:message code="branch.help.managerId" default="Enter Manager Id..." /></span>
	</div>
	--%>
	<div class="form-group md-checkbox">
		<g:checkBox name="isActive"class="md-check" value="${branchInstance?.isActive}" />
		<label for="isActive">
			<span class="inc"></span>
			<span class="check"></span>
			<span class="box"></span>
		 	<g:message code="branch.isActive.label" default="Is Active" />
		</label>
	</div>