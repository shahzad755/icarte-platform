<%@ page import="com.armedialab.entity.ServingTable" %>
	<div class="form-group form-md-line-input ${hasErrors(bean: servingTableInstance, field: 'tableRefNumber', 'has-error')} required">
		<g:if test="${actionName == 'edit'}">
			<g:field name="tableRefNumber" readonly="true" type="number" value="${servingTableInstance.tableRefNumber}" required="" class="form-control"/>
		</g:if>
		<g:else>
			<g:field name="tableRefNumber" type="number" value="${servingTableInstance.tableRefNumber}" required="" class="form-control"/>
		</g:else>
		<label for="tableRefNumber">
			<g:message code="servingTable.tableRefNumber.label" default="Table Ref Number" />
			<span class="required" aria-required="true">*</span>
		</label>
		<span class="help-block"><g:message code="servingTable.help.tableRefNumber" default="Enter Table Ref Number..." /></span>
	</div>
	<div class="form-group form-md-line-input ${hasErrors(bean: servingTableInstance, field: 'floor', 'has-error')} required">
		<g:field name="floor" type="number" value="${servingTableInstance.floor}" required="" class="form-control"/>

		<label for="floor">
			<g:message code="servingTable.floor.label" default="Floor" />
			<span class="required" aria-required="true">*</span>
		</label>
		<span class="help-block"><g:message code="servingTable.help.floor" default="Enter Floor..." /></span>
	</div>
	<div class="form-group form-md-line-input ${hasErrors(bean: servingTableInstance, field: 'branch', 'has-error')} required">
		<g:select id="branch" name="branch.id" from="${branchList}" 
			optionKey="id" required=""
			optionValue="name" 
			value="${servingTableInstance?.branch?.id}" class="many-to-one form-control"/>

		<label for="branch">
			<g:message code="servingTable.branch.label" default="Branch" />
			<span class="required" aria-required="true">*</span>
		</label>
		<span class="help-block"><g:message code="servingTable.help.branch" default="Enter Branch..." /></span>
	</div>
	<div class="form-group form-md-line-input ${hasErrors(bean: servingTableInstance, field: 'description', 'has-error')} ">
		<g:textField name="description" value="${servingTableInstance?.description}" class="form-control"/>
		<label for="description">
			<g:message code="servingTable.description.label" default="Description" />
		</label>
		<span class="help-block"><g:message code="servingTable.help.description" default="Enter Description..." /></span>
	</div>
    <div class="form-group md-checkbox">
		<g:checkBox name="isActive"class="md-check" value="${servingTableInstance?.isActive}" />
		<label for="isActive">
			<span class="inc"></span>
			<span class="check"></span>
			<span class="box"></span>
		 	<g:message code="servingTable.isActive.label" default="Is Active" />
			
		</label>
	</div><%--
 
	<div class="form-group form-md-line-input ${hasErrors(bean: servingTableInstance, field: 'restaurant', 'has-error')} required">
		<g:select id="restaurant" name="restaurant.id" from="${com.armedialab.entity.Restaurant.list()}" optionKey="id" required="" value="${servingTableInstance?.restaurant?.id}" class="many-to-one form-control"/>

		<label for="restaurant">
			<g:message code="servingTable.restaurant.label" default="Restaurant" />
			<span class="required" aria-required="true">*</span>
		</label>
		<span class="help-block"><g:message code="servingTable.help.restaurant" default="Enter Restaurant..." /></span>
	</div>
	--%>
