<%@page import="com.armedialab.entity.City"%>
<%@page import="com.armedialab.entity.Country"%>
<%@ page import="com.armedialab.entity.Address" %>

<div class="row">
    <div class="col-md-12">
        <div class="form-group form-md-line-input ${hasErrors(bean: addressInstance, field: 'email', 'has-error')}">
			<label for="address.email" class="control-label"><g:message code="address.email.label" default="Email" /></label>
			<g:textField name="address.email" type="email" maxlength="50" value="${addressInstance?.email}" class="form-control"/>
            <span class="help-block"><g:message code="address.help.email" default="Enter Email..." /></span>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="form-group form-md-line-input ${hasErrors(bean: addressInstance, field: 'street', 'has-error')}">
		<label for="address.street" class="control-label"><g:message code="address.street.label" default="Street" /></label>
		<g:textField name="address.street" maxlength="100" value="${addressInstance?.street}" class="form-control"/>
        <span class="help-block"><g:message code="address.help.street" default="Enter Street..." /></span>
        </div>
    </div>
    <!--/span-->
</div>
<!--/row-->

<div class="row">
    <div class="col-md-6">
        <div class="form-group form-md-line-input ${hasErrors(bean: addressInstance, field: 'area', 'has-error')}">
			<label for="address.area" class="control-label"><g:message code="address.area.label" default="Area Name" /></label>
			<g:textField name="address.area" maxlength="100" value="${addressInstance?.email}" class="form-control"/>
            <span class="help-block"><g:message code="address.help.email" default="Enter Area Name..." /></span>
        </div>
    </div>
    <!--/span-->
    <div class="col-md-6">
        <div class="form-group form-md-line-input ${hasErrors(bean: addressInstance, field: 'poBox', 'has-error')}">
		<label for="address.poBox" class="control-label"><g:message code="address.poBox.label" default="P.O Box" /></label>
		<g:textField name="address.poBox" maxlength="15" value="${addressInstance?.poBox}" class="form-control"/>
        <span class="help-block"><g:message code="address.help.poBox" default="Enter P.O Box..." /></span>
        </div>
    </div>
    <!--/span-->
</div>
<!--/row-->

<div class="row">
    <div class="col-md-6">
        <div class="form-group form-md-line-input ${hasErrors(bean: addressInstance, field: 'country', 'has-error')}">
			<label for="address.country" class="control-label"><g:message code="address.country.label" default="Country" /></label>
			<g:select id="address.country" name="address.country.id" from="${Country.list()}" optionKey="id" required="" 
					value="${addressInstance?.country?.id}" 
					optionValue="name" 
					class="many-to-one form-control"/>
            <span class="help-block"><g:message code="address.help.country" default="Select Country..." /></span>
        </div>
    </div>
    <!--/span-->
    <div class="col-md-6">
        <div class="form-group form-md-line-input ${hasErrors(bean: addressInstance, field: 'city', 'has-error')}">
		<label for="address.city" class="control-label"><g:message code="address.city.label" default="City" /></label>
		<g:select id="address.city" name="address.city.id" from="${City.list()}" optionKey="id" required="" 
				value="${addressInstance?.city?.id}" 
				optionValue="name" 
				class="many-to-one form-control"/>
        <span class="help-block"><g:message code="address.help.city" default="Select City..." /></span>
        </div>
    </div>
    <!--/span-->
</div>
<!--/row-->

<div class="row">
    <div class="col-md-3">
        <div class="form-group form-md-line-input ${hasErrors(bean: addressInstance, field: 'phone1', 'has-error')}">
		<label for="address.phone1" class="control-label"><g:message code="address.phone1.label" default="Phone 1" /></label>
		<g:textField name="address.phone1" maxlength="20" value="${addressInstance?.phone1}" class="form-control"/>
        <span class="help-block"><g:message code="address.help.phone1" default="Enter Phone 1..." /></span>
        </div>
    </div>
    <!--/span-->
    <div class="col-md-3">
        <div class="form-group form-md-line-input ${hasErrors(bean: addressInstance, field: 'phone2', 'has-error')}">
		<label for="address.phone2" class="control-label"><g:message code="address.phone2.label" default="Phone 2" /></label>
		<g:textField name="address.phone2" maxlength="20" value="${addressInstance?.phone2}" class="form-control"/>
        <span class="help-block"><g:message code="address.help.phone2" default="Enter Phone 2..." /></span>
        </div>
    </div>
    <!--/span-->
    <div class="col-md-3">
        <div class="form-group form-md-line-input ${hasErrors(bean: addressInstance, field: 'phone3', 'has-error')}">
		<label for="address.phone3" class="control-label"><g:message code="address.phone3.label" default="Phone 3" /></label>
		<g:textField name="address.phone3" maxlength="20" value="${addressInstance?.phone3}" class="form-control"/>
        <span class="help-block"><g:message code="address.help.phone3" default="Enter Phone 3..." /></span>
        </div>
    </div>
    <!--/span-->
    <div class="col-md-3">
        <div class="form-group form-md-line-input ${hasErrors(bean: addressInstance, field: 'phone4', 'has-error')}">
		<label for="address.phone4" class="control-label"><g:message code="address.phone4.label" default="Phone 4" /></label>
		<g:textField name="address.phone4" maxlength="20" value="${addressInstance?.phone4}" class="form-control"/>
        <span class="help-block"><g:message code="address.help.phone4" default="Enter Phone 4..." /></span>
        </div>
    </div>
    <!--/span-->
</div>
<!--/row-->

<div class="row">
    <div class="col-md-6">
        <div class="form-group form-md-line-input ${hasErrors(bean: addressInstance, field: 'lat', 'has-error')}">
		<label for="address.lat" class="control-label"><g:message code="address.lat.label" default="Latitude" /></label>
		<g:textField name="address.lat" maxlength="25" value="${addressInstance?.lat}" class="form-control"/>
        <span class="help-block"><g:message code="address.help.lat" default="Enter Latitude..." /></span>
        </div>
    </div>
    <!--/span-->
    <div class="col-md-6">
        <div class="form-group form-md-line-input ${hasErrors(bean: addressInstance, field: 'lon', 'has-error')}">
			<label for="address.lon" class="control-label"><g:message code="address.lon.label" default="Longitude" /></label>
			<g:textField name="address.lon" maxlength="25" value="${addressInstance?.lon}" class="form-control"/>
            <span class="help-block"><g:message code="address.help.lon" default="Enter Longitude..." /></span>
        </div>
    </div>
    <!--/span-->
</div>
<!--/row-->

<%--<div class="row">
    <div class="col-md-12">
        <div class="form-group form-md-line-input ${hasErrors(bean: addressInstance, field: 'mapsUrl', 'has-error')}">
		<label for="address.mapsUrl" class="control-label"><g:message code="address.mapsUrl.label" default="Google maps code" /></label>
		<g:textArea rows="4" name="address.mapsUrl" maxlength="255" value="${addressInstance?.mapsUrl}" class="form-control"/>
        <span class="help-block"><g:message code="address.help.mapsUrl" default="Enter Google maps embedded code..." /></span>
        </div>
    </div>
    <!--/span-->
</div>
<!--/row-->

--%><div class="row">
    <div class="col-md-12">
        <div class="form-group form-md-line-input ${hasErrors(bean: addressInstance, field: 'description', 'has-error')}">
			<label for="address.description" class="control-label"><g:message code="address.description.label" default="Other Details" /></label>
			<g:textArea name="address.description" rows="2" value="${addressInstance?.description}" class="form-control"/>
	        <span class="help-block"><g:message code="address.help.description" default="Enter Other Details..." /></span>
        </div>
    </div>
    <!--/span-->
</div>
<!--/row-->
