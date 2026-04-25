<%@ page import="com.armedialab.entity.Menu" %>
		<div class="form-group form-md-line-input ${hasErrors(bean: menuInstance, field: 'title', 'has-error')} required">
			<g:textField name="title" required="" value="${menuInstance?.title}" class="form-control"/>
	
			<label for="title">
				<g:message code="menu.title.label" default="Title" />
				<span class="required" aria-required="true">*</span>
			</label>
			<span class="help-block"><g:message code="menu.help.title" default="Enter Title..." /></span>
		</div>
		<sec:ifAnyGranted roles="ROLE_SUPERADMIN">				
			<div class="form-group form-md-line-input ${hasErrors(bean: menuInstance, field: 'restaurant', 'has-error')} required">
				<g:select id="restaurant" name="restaurant.id" from="${com.armedialab.entity.Restaurant.list()}"
						optionKey="id" 
						required="" 
						value="${menuInstance?.restaurant?.id}" 
						optionValue="restuarantNameWithCode" 
						class="many-to-one form-control"/>
				<label for="restaurant">
					<g:message code="menu.restaurant.label" default="Restaurant" />
					<span class="required" aria-required="true">*</span>
				</label>
				<span class="help-block"><g:message code="menu.help.restaurant" default="Select Restaurant..." /></span>
			</div>
		</sec:ifAnyGranted>
		<div class="form-group form-md-line-input ${hasErrors(bean: menuInstance, field: 'branch', 'has-error')} required">
			<g:select id="branch" name="branch.id" from="${branchList}" 
				optionKey="id"
				required=""
				optionValue="name" 
				value="${menuInstance?.branch?.id}" class="many-to-one form-control"/>
			<label for="branch">
				<g:message code="menuInstance.branch.label" default="Branch" />
				<span class="required" aria-required="true">*</span>
			</label>
			<span class="help-block"><g:message code="menuInstance.help.branch" default="Enter Branch..." /></span>
		</div>
       <div class="form-group md-checkbox">
		<g:checkBox name="isActive"class="md-check" value="${menuInstance?.isActive}" />
		<label for="isActive">
			<span class="inc"></span>
			<span class="check"></span>
			<span class="box"></span>
		 	<g:message code="menu.isActive.label" default="Is Active" />
		</label>
		</div>