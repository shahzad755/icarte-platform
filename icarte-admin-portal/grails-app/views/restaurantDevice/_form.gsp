<%@ page import="com.armedialab.entity.RestaurantDevice" %>
	<script>
		var _servingTblRef = "${restaurantDeviceInstance?.servingTable?.id}";
	</script>

	<g:if test="${(actionName == 'edit')}">
		<div class="form-group form-md-line-input ${hasErrors(bean: restaurantDeviceInstance, field: 'registrationCode', 'has-error')} required">
			<g:textField name="registrationCode" readonly="true" required="" value="${restaurantDeviceInstance?.registrationCode}" class="form-control"/>
			<label for="registrationCode">
				<g:message code="restaurantDevice.registrationCode.label" default="Registration Code" />
				<span class="required" aria-required="true">*</span>
			</label>
			<span class="help-block"><g:message code="restaurantDevice.help.registrationCode" default="Enter Registration Code..." /></span>
		</div>
	</g:if>
	<div class="form-group form-md-line-input ${hasErrors(bean: restaurantDeviceInstance, field: 'deviceId', 'has-error')} required">
		<g:textField name="deviceId" required="" value="${restaurantDeviceInstance?.deviceId}" maxlength="50" class="form-control"/>
		<label for="deviceId">
			<g:message code="restaurantDevice.deviceId.label" default="Device IMEI" />
			<span class="required" aria-required="true">*</span>
		</label>
		<span class="help-block"><g:message code="restaurantDevice.help.deviceId" default="Enter Device Id..." /></span>
	</div>
	<div class="form-group form-md-line-input ${hasErrors(bean: restaurantDeviceInstance, field: 'deviceManufecturer', 'has-error')} required">
		<g:textField name="deviceManufecturer" value="${restaurantDeviceInstance?.deviceManufecturer}" maxlength="100" class="form-control"/>
		<label for="deviceManufecturer">
			<g:message code="restaurantDevice.deviceManufecturer.label" default="Device Manufacturer" />
		</label>
		<span class="help-block"><g:message code="restaurantDevice.help.deviceManufecturer" default="Enter Device Manufacturer..." /></span>
	</div>
	<div class="form-group form-md-line-input ${hasErrors(bean: restaurantDeviceInstance, field: 'branch', 'has-error')} required">
		<g:select id="branch" name="branch.id" from="${branchList}" 
			noSelection="${['':'-- Select Branch --']}"
			optionKey="id" 
			required="" 
			value="${restaurantDeviceInstance?.branch?.id}" 
			class="many-to-one form-control"/>
		<label for="branch">
			<g:message code="restaurantDevice.branch.label" default="Branch" />
			<span class="required" aria-required="true">*</span>
		</label>
		<span class="help-block"><g:message code="restaurantDevice.help.branch" default="Enter Branch..." /></span>
	</div>

	<div class="row">
	    <div class="col-md-6">
			<div class="form-group form-md-line-input ${hasErrors(bean: restaurantDeviceInstance, field: 'applicationMode', 'has-error')} required">
				<g:select name="applicationMode" from="${appModeList}"
						noSelection="${['':'-- Select Serving Table --']}" 
						required="" optionKey="key" optionValue="value" 
						value="${restaurantDeviceInstance?.applicationMode}" 
						class="many-to-one form-control"/>
				
				<label for="applicationMode">
					<g:message code="restaurantDevice.applicationMode.label" default="Application Mode" />
					<span class="required" aria-required="true">*</span>
				</label>
				<span class="help-block"><g:message code="restaurantDevice.help.applicationMode" default="Enter Application Mode..." /></span>
			</div>
		</div>
	    <div class="col-md-6">
			<div class="form-group form-md-line-input ${hasErrors(bean: restaurantDeviceInstance, field: 'servingTable', 'has-error')} ">
				<g:select id="servingTable" name="servingTable.id" from="${servingTableList}" optionKey="id" value="${restaurantDeviceInstance?.servingTable?.id}" class="many-to-one form-control"/>
				<label for="tableReference">
					<g:message code="restaurantDevice.servingTable.label" default="Serving Table" />
				</label>
				<span class="help-block"><g:message code="restaurantDevice.help.tableReference" default="Select Serving Table Reference (Only if applicable)..." /></span>
			</div>
	    </div>
	</div>
	<div class="row"><p>&nbsp;</p></div>

	<div class="row">
	    <div class="col-md-4">
	       <div class="form-group md-checkbox">
			<g:checkBox name="isCustContactMandatory"class="md-check" value="${restaurantDeviceInstance?.isCustContactMandatory}" />
			<label for="isCustContactMandatory">
				<span class="inc"></span>
				<span class="check"></span>
				<span class="box"></span>
			 	<g:message code="restaurantDevice.isCustContactMandatory.label" default="Cust Contact Mandatory" />
			</label>
			</div>
		</div>
	    <div class="col-md-4">
	       <div class="form-group md-checkbox">
			<g:checkBox name="isActive"class="md-check" value="${restaurantDeviceInstance?.isActive}" />
			<label for="isActive">
				<span class="inc"></span>
				<span class="check"></span>
				<span class="box"></span>
			 	<g:message code="restaurantDevice.isActive.label" default="Active" />
			</label>
			</div>
		</div>
	    <div class="col-md-4">
	       <div class="form-group md-checkbox">
			<g:checkBox name="isBlocked"class="md-check" value="${restaurantDeviceInstance?.isBlocked}" />
			<label for="isBlocked">
				<span class="inc"></span>
				<span class="check"></span>
				<span class="box"></span>
			 	<g:message code="restaurantDevice.isBlocked.label" default="Blocked" />
			</label>
			</div>
		</div>
	</div>