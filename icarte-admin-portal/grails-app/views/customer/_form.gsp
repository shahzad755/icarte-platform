<%@ page import="com.armedialab.entity.Customer" %>


<div class="row">
    <div class="col-md-6">
        <div class="form-group form-md-line-input">
	     <label class="col-md-4 control-label" for="code">
	     	<g:message code="customer.code.label" default="Code" />
	     </label>
	     <div class="col-md-8">
	        <g:textField id="code" readonly="true" name="code" value="${customerInstance?.code}" placeholder="XXXXXXXXX" class="form-control"/>
	        <div class="form-control-focus"> </div>
	     	<span class="help-block"></span>
	     </div>
        </div>
    </div>
<sec:ifAnyGranted roles="ROLE_SUPERADMIN">
    <div class="col-md-6">
        <div class="form-group form-md-line-input ${hasErrors(bean: customerInstance, field: 'restaurant', 'has-error')}">
			<label for="restaurant" class="col-md-4 control-label">
				<g:message code="menu.restaurant.label" default="Restaurant" />
				<span class="required" aria-required="true">*</span>
			</label>
			<div class="col-md-8">
					<g:select id="restaurant" name="restaurant.id" from="${com.armedialab.entity.Restaurant.list()}" optionKey="id" required="" 
							value="${customerInstance?.restaurant?.id}" 
							optionValue="name" 
							class="many-to-one form-control"/>
					<div class="form-control-focus"> </div>
		            <span class="help-block"><g:message code="customer.help.restaurant" default="Select Restaurant..." /></span>
	        </div>
        </div>
    </div>
</sec:ifAnyGranted>
</div>
<!--/row-->

<div class="row">
    <div class="col-md-6">
        <div class="form-group form-md-line-input ${hasErrors(bean: customerInstance, field: 'firstName', 'has-error')}">
	     <label class="col-md-4 control-label" for="code">
	     	<g:message code="customer.firstName.label" default="First Name" />
	     </label>
	     <div class="col-md-8">
	        <g:textField id="firstName" name="firstName" value="${customerInstance?.firstName}" class="form-control"/>
	        <div class="form-control-focus"> </div>
	     	<span class="help-block"><g:message code="customer.help.firstName" default="Enter First Name..." /></span>
	     </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group form-md-line-input ${hasErrors(bean: customerInstance, field: 'lastName', 'has-error')}">
	     <label class="col-md-4 control-label" for="lastName">
	     	<g:message code="customer.lastName.label" default="Last Name" />
	     </label>
	     <div class="col-md-8">
	        <g:textField id="lastName" name="lastName" maxlength="50" value="${customerInstance?.lastName}" class="form-control"/>
	        <div class="form-control-focus"> </div>
	     	<span class="help-block"><g:message code="customer.help.lastName" default="Enter Last Name..." /></span>
	     </div>
        </div>
    </div>
</div>
<!--/row-->

<div class="row">
    <div class="col-md-6">
        <div class="form-group form-md-line-input ${hasErrors(bean: customerInstance, field: 'mobile', 'has-error')}">
	     <label class="col-md-4 control-label" for="mobile">
	     	<g:message code="customer.mobile.label" default="Mobile" />
	     	<span class="required" aria-required="true">*</span>
	     </label>
	     <div class="col-md-8">
	        <g:textField id="mobile" required="" name="mobile"  maxlength="15" value="${customerInstance?.mobile}" class="form-control"/>
	     	<span class="help-block"><g:message code="customer.help.mobile" default="Enter Mobile..." /></span>
	     </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group form-md-line-input ${hasErrors(bean: customerInstance, field: 'email', 'has-error')}">
	     <label class="col-md-4 control-label" for="email">
	     	<g:message code="customer.email.label" default="Email" />
	     </label>
	     <div class="col-md-8">
	        <g:textField id="lastName" name="email" type="email" value="${customerInstance?.email}" class="form-control"/>
	        <div class="form-control-focus"> </div>
	     	<span class="help-block"><g:message code="customer.help.email" default="Enter Email..." /></span>
	     </div>
        </div>
    </div>
</div>
<!--/row-->

<div class="row">&nbsp;</div>
<div class="row">
	<div class="col-md-6">
		 <label class="col-md-4 control-label" for="mobile">&nbsp;</label>
	     <div class="col-md-8">
			<div class="form-group">
				<g:checkBox name="subscribeNewsLetter" value="${customerInstance?.subscribeNewsLetter}" />
				<label for="subscribeNewsLetter">
					<g:message code="customer.subscribeNewsLetter.label" default="Subscribe to News Letter" />
				</label>
			</div>
		</div>
	</div>
</div>
<!--/row-->

<div class="row">
	<div class="col-md-6">
		 <label class="col-md-4 control-label" for="mobile">&nbsp;</label>
	     <div class="col-md-8">
			<div class="form-group">
				<g:checkBox name="isActive" value="${customerInstance?.isActive}" />
				<label for="isActive">
				 	<g:message code="customer.isActive.label" default="Is Active" />
				</label>
			</div>
		</div>
	</div>
</div>
<!--/row-->