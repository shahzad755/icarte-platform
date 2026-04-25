<%@page import="com.armedialab.entity.SpiceType"%>
<%@page import="com.armedialab.entity.CuisineType"%>
<%@ page import="com.armedialab.entity.Item" %>
<div class="row">
    <div class="col-md-6">
        <div class="form-group form-md-line-input">
	     <label class="col-md-3 control-label" for="code">
	     	<g:message code="item.code.label" default="Code" />
	     	<span class="required" aria-required="true">*</span>
	     </label>
	     <div class="col-md-8">
	        <g:textField id="code" name="code" maxlength="20" required="" value="${itemInstance?.code}" placeholder="Item Code" class="form-control"/>
	        <div class="form-control-focus"> </div>
	     	<span class="help-block"><g:message code="item.help.code" default="Enter Code..." /></span>
	     </div>
        </div>
    </div>
	<!--/span-->
	<sec:ifAnyGranted roles="ROLE_SUPERADMIN">
	    <div class="col-md-6">
	        <div class="form-group form-md-line-input">
				<label for="restaurant" class="col-md-3 control-label"><g:message code="restaurant.label" default="Restaurant" /></label>
				<div class="col-md-8">
					<g:select id="restaurant" name="restaurant.id" from="${com.armedialab.entity.Restaurant.list()}" optionKey="id"
							value="${itemInstance?.restaurant?.id}"
							optionValue="name"
							class="many-to-one form-control"/>
					<div class="form-control-focus"> </div>
		            <span class="help-block"><g:message code="item.help.restaurant" default="Select Restaurant..." /></span>
		        </div>
	        </div>
	    </div>
	</sec:ifAnyGranted>
</div>
<!--/row-->
<div class="row">
    <div class="col-md-6">
        <div class="form-group form-md-line-input">
	     <label class="col-md-3 control-label" for="title">
	     	<g:message code="item.title.label" default="Title" />
	     	<span class="required" aria-required="true">*</span>
	     </label>
	     <div class="col-md-8">
	        <g:textField id="title" name="title" maxlength="150" required="" value="${itemInstance?.title}" placeholder="Item Title" class="form-control"/>
	        <div class="form-control-focus"> </div>
	     	<span class="help-block"><g:message code="item.help.title" default="Enter Title/Name..." /></span>
	     </div>
        </div>
    </div>
	<!--/span-->
    <div class="col-md-6">
        <div class="form-group form-md-line-input">
			<label for="itemCategory" class="col-md-3 control-label">
				<g:message code="itemCategory.label" default="Item Category" />
				<span class="required" aria-required="true">*</span>
			</label>
			<div class="col-md-8">
				<g:select id="itemCategory" name="itemCategory.id" from="${categories}" optionKey="id"
						value="${itemInstance.itemCategory?.id}" 
						optionValue="defaultTitle"
						class="many-to-one form-control"/>
				<div class="form-control-focus"> </div>
	            <span class="help-block"><g:message code="item.help.category" default="Select Item Category..." /></span>
	        </div>
        </div>
    </div>
</div>
<!--/row-->
<div class="row">
    <div class="col-md-6">
        <div class="form-group form-md-line-input">
	     <label class="col-md-3 control-label" for="cuisineType">
	     	<g:message code="cuisineType.label" default="Cuisine Type" />
	     </label>
	     <div class="col-md-8">
     		<g:select id="cuisineType" name="cuisineType.id" from="${cuisineTypeList}" optionKey="id"
				noSelection="['null':'-Select Cuisine Type-']"
				value="${itemInstance?.cuisineType?.id}" 
				optionValue="defaultTitle"
				class="many-to-one form-control"/>
	        <div class="form-control-focus"> </div>
	     	<span class="help-block"><g:message code="item.help.cuisineType" default="Select Cuisine Type..." /></span>
	     </div>
        </div>
    </div>
	<!--/span-->
    <div class="col-md-6">
        <div class="form-group form-md-line-input">
			<label for="spiceType" class="col-md-3 control-label"><g:message code="spiceType.label" default="Spice Type" /></label>
			<div class="col-md-8">
				<g:select id="spiceType" name="spiceType.id" from="${spiceTypeList}" optionKey="id"
						noSelection="['null':'-Select Spice Type-']"
						value="${itemInstance?.spiceType?.id}"
						optionValue="defaultTitle"
						class="many-to-one form-control"/>
				<div class="form-control-focus"> </div>
	            <span class="help-block"><g:message code="item.help.spiceType" default="Enter Spice Type..." /></span>
	        </div>
        </div>
    </div>
</div>
<!--/row-->
<div class="row">
    <div class="col-md-6">
        <div class="form-group form-md-line-input">
	     <label class="col-md-3 control-label" for="price">
	     	<g:message code="item.price.label" default="Price" />
	     	<span class="required" aria-required="true">*</span>
	     </label>
	     <div class="col-md-8">
	        <g:textField id="price" name="price" type="number" step="any" maxlength="10" required="" value="${itemInstance?.price}" class="form-control" placeholder="Item Price"/>
	        <div class="form-control-focus"> </div>
	     	<span class="help-block"><g:message code="item.help.price" default="Enter price..." /></span>
	     </div>
        </div>
    </div>
	<!--/span-->
    <div class="col-md-6">
        <div class="form-group form-md-line-input">
	     <label class="col-md-3 control-label" for="approxPreparationTime">
	     	<g:message code="prepTime.label" default="Cooking Time" />
	     </label>
	     <div class="col-md-8">
	        <g:textField id="approxPreperationTime" name="approxPreperationTime" type="number" step="any" maxlength="6" value="${itemInstance?.approxPreparationTime}" class="form-control" placeholder="Approximate Cooking Time"/>
	        <div class="form-control-focus"> </div>
	     	<span class="help-block"><g:message code="item.help.preparationTime" default="Enter cooking time in minutes..." /></span>
	     </div>
        </div>
    </div>
</div>
<!--/row-->
<div class="row">
    <div class="col-md-9">
        <div class="form-group form-md-line-input">
	     <label class="col-md-2 control-label" for="description">
	     	<g:message code="item.description.label" default="Description" />
	     	<span class="required" aria-required="true">*</span>
	     </label>
	     <div class="col-md-10">
	        <g:textArea rows="3" id="description" name="description" maxlength="4000" required="" value="${itemInstance?.description}" class="form-control" placeholder="Item Description"/>
	        <div class="form-control-focus"> </div>
	     	<span class="help-block"><g:message code="item.help.description" default="Enter Description..." /></span>
	     </div>
        </div>
    </div>
	<!--/span-->
</div>
<!--/row-->
<!--/row-->
<div class="row">
    <div class="col-md-6">
        <div class="form-group form-md-line-input">
	     <label class="col-md-3 control-label" for="mappingCode">
	     	<g:message code="item.mappingCode.label" default="Mapping Code" />
	     </label>
	     <div class="col-md-8">
	        <g:textField id="mappingCode" name="mappingCode" maxlength="75" value="${itemInstance?.mappingCode}" placeholder="Item Mapping Code" class="form-control"/>
	        <div class="form-control-focus"> </div>
	     	<span class="help-block"><g:message code="item.help.mappingCode" default="Enter Legacy System's Item Mapping Code..." /></span>
	     </div>
        </div>
    </div>
	<!--/span-->
    <div class="col-md-6">
        <div class="form-group form-md-line-input">
	     <label class="col-md-3 control-label" for="isActive">
	     	<g:message code="item.isActive.label" default="Is Active" />
	     </label>
	     <div class="col-md-6">
	        <g:checkBox id="isActive" name="isActive" class="control-label md-check" value="${itemInstance?.isActive}" />
	        <div class="form-control-focus"> </div>
	     </div>
        </div>
    </div>
	<!--/span-->
</div>
<!--/row-->