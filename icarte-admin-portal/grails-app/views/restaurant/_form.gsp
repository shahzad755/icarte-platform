<%@ page import="com.armedialab.entity.Restaurant" %>
	<div class="form-group form-md-line-input ${hasErrors(bean: restaurantInstance, field: 'restaurantCode', 'has-error')} required">
		<g:textField name="restaurantCode" maxlength="50" required="" value="${restaurantInstance?.restaurantCode}" class="form-control"/>
		<label for="restaurantCode">
			<g:message code="restaurant.restaurantCode.label" default="Restaurant Code" />
			<span class="required" aria-required="true">*</span>
		</label>
		<span class="help-block"><g:message code="restaurant.help.restaurantCode" default="Enter Restaurant Code..." /></span>
	</div>
	<div class="form-group form-md-line-input ${hasErrors(bean: restaurantInstance, field: 'name', 'has-error')} ">
		<g:textField name="name" maxlength="255" value="${restaurantInstance?.name}" class="form-control"/>
		<label for="name">
			<g:message code="restaurant.name.label" default="Name" />
		</label>
		<span class="help-block"><g:message code="restaurant.help.name" default="Enter Restaurant Name..." /></span>
	</div>
	<div class="form-group form-md-line-input ${hasErrors(bean: restaurantInstance?.restaurantTranslations?.getAt(0), field: 'title', 'has-error')} required">
		<g:textField name="title" maxlength="255" value="${fieldValue(bean: restaurantInstance?.restaurantTranslations?.getAt(0), field: 'title')}" required="" class="form-control"/>
		<label for="title">
			<g:message code="restaurant.title.label" default="Tagline" />
			<span class="required" aria-required="true">*</span>
			<asset:image class="pull-right" src="i18n/en.png"/>
		</label>
		<span class="help-block"><g:message code="restaurant.help.title" default="Enter Restaurant Tagline..." /></span>
	</div>

	<div class="form-group form-md-line-input ${hasErrors(bean: restaurantInstance?.restaurantTranslations?.getAt(0), field: 'description', 'has-error')}">
		<g:textArea rows="4" name="description" maxlength="4000" value="${fieldValue(bean: restaurantInstance?.restaurantTranslations?.getAt(0), field: 'description')}" class="form-control"/>
		<label for="description">
			<g:message code="itemCategory.description.label" default="Description" />
			<asset:image class="pull-right" src="i18n/en.png"/>
		</label>
		<span class="help-block"><g:message code="restaurant.help.description" default="Enter Description..." /></span>
	</div>
	
	<%--<div class="form-group form-md-line-input ${hasErrors(bean: restaurantInstance, field: 'theme', 'has-error')} ">
		<g:textField name="theme" maxlength="5" value="${restaurantInstance?.theme}" class="form-control"/>
		<label for="theme">
			<g:message code="restaurant.theme.label" default="Theme" />
		</label>
		<span class="help-block"><g:message code="restaurant.help.theme" default="Enter Theme..." /></span>
	</div>--%>
	<%--<div class="form-group form-md-line-input ${hasErrors(bean: restaurantInstance, field: 'backgroundImage', 'has-error')} ">
		<g:textField name="backgroundImage" value="${restaurantInstance?.backgroundImage}" class="form-control"/>
		<label for="backgroundImage">
			<g:message code="restaurant.backgroundImage.label" default="Background Image" />
		</label>
		<span class="help-block"><g:message code="restaurant.help.backgroundImage" default="Enter Background Image..." /></span>
	</div>--%>
	<g:if test="${actionName == 'edit'}">
		<sec:ifAnyGranted roles="ROLE_SUPERADMIN">
			<div class="form-group form-md-line-input ${hasErrors(bean: restaurantInstance, field: 'activationKey', 'has-error')} required">
				<g:textField name="activationKey" maxlength="25" required="" value="${restaurantInstance?.activationKey}" class="form-control"/>
				<label for="activationKey">
					<g:message code="restaurant.activationKey.label" default="Activation Key" />
					<span class="required" aria-required="true">*</span>
				</label>
				<span class="help-block"><g:message code="restaurant.help.activationKey" default="Enter Activation Key..." /></span>
			</div>
		</sec:ifAnyGranted>
	</g:if>
	<sec:ifAnyGranted roles="ROLE_SUPERADMIN">
		<div class="form-group form-md-line-input ${hasErrors(bean: restaurantInstance, field: 'accountType', 'has-error')} required">
			<g:select id="accountType" name="accountType.id" from="${com.armedialab.entity.AccountType.list()}" 
				optionKey="id" optionValue="name" required="" value="${restaurantInstance?.accountType?.id}" class="many-to-one form-control"/>
			<label for="accountType">
				<g:message code="restaurant.accountType.label" default="Account Type" />
				<span class="required" aria-required="true">*</span>
			</label>
			<span class="help-block"><g:message code="restaurant.help.accountType" default="Enter Account Type..." /></span>
		</div>
		<div class="form-group form-md-line-input ${hasErrors(bean: restaurantInstance, field: 'activationDate', 'has-error')} ">
			<g:datePicker name="activationDate" precision="day"  value="${restaurantInstance?.activationDate}" default="none" noSelection="['': '']" class="form-control"/>
			<label for="activationDate">
				<g:message code="restaurant.activationDate.label" default="Activation Date" />
			</label>
			<span class="help-block"><g:message code="restaurant.help.activationDate" default="Enter Activation Date..." /></span>
		</div>
		<div class="form-group form-md-line-input ${hasErrors(bean: restaurantInstance, field: 'billingPeriod', 'has-error')} ">
			<g:field name="billingPeriod" type="number" value="${restaurantInstance.billingPeriod}" class="form-control"/>
			<label for="billingPeriod">
				<g:message code="restaurant.billingPeriod.label" default="Billing Period" />
			</label>
			<span class="help-block"><g:message code="restaurant.help.billingPeriod" default="Enter Billing Period..." /></span>
		</div>
	    <div class="form-group md-checkbox">
			<g:checkBox name="accountBlocked"class="md-check" value="${restaurantInstance?.accountBlocked}" />
			<label for="accountBlocked">
				<span class="inc"></span>
				<span class="check"></span>
				<span class="box"></span>
			 	<g:message code="restaurant.accountBlocked.label" default="Account Blocked" />
			</label>
		</div>
	    <div class="form-group md-checkbox">
			<g:checkBox name="accountCancelled"class="md-check" value="${restaurantInstance?.accountCancelled}" />
			<label for="accountCancelled">
				<span class="inc"></span>
				<span class="check"></span>
				<span class="box"></span>
			 	<g:message code="restaurant.accountCancelled.label" default="Account Cancelled" />
			</label>
		</div>
	 
	    <div class="form-group md-checkbox">
			<g:checkBox name="accountDeleted"class="md-check" value="${restaurantInstance?.accountDeleted}" />
			<label for="accountDeleted">
				<span class="inc"></span>
				<span class="check"></span>
				<span class="box"></span>
			 	<g:message code="restaurant.accountDeleted.label" default="Account Deleted" />
			</label>
		</div>
		<%--
		<div class="form-group form-md-line-input ${hasErrors(bean: restaurantInstance, field: 'logoLarge', 'has-error')} required">
			<g:textField name="logoLarge" required="" value="${restaurantInstance?.logoLarge}" class="form-control"/>
	
			<label for="logoLarge">
				<g:message code="restaurant.logoLarge.label" default="Logo Large" />
				<span class="required" aria-required="true">*</span>
			</label>
			<span class="help-block"><g:message code="restaurant.help.logoLarge" default="Enter Logo Large..." /></span>
		</div>
		<div class="form-group form-md-line-input ${hasErrors(bean: restaurantInstance, field: 'logoSmall', 'has-error')} required">
			<g:textField name="logoSmall" required="" value="${restaurantInstance?.logoSmall}" class="form-control"/>
			<label for="logoSmall">
				<g:message code="restaurant.logoSmall.label" default="Logo Small" />
				<span class="required" aria-required="true">*</span>
			</label>
			<span class="help-block"><g:message code="restaurant.help.logoSmall" default="Enter Logo Small..." /></span>
		</div>
		--%>
	</sec:ifAnyGranted>