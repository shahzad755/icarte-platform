<%@ page import="com.armedialab.entity.ItemVariant" %>
<%@page import="com.armedialab.entity.SpiceType"%>
<%@page import="com.armedialab.entity.CuisineType"%>
<%@ page import="com.armedialab.entity.Item" %>
<div class="row">
    <div class="col-md-6">
        <div class="form-group form-md-line-input">
	     <label class="col-md-3 control-label" for="title">
	     	<g:message code="item.title.label" default="Title" />
	     	<span class="required" aria-required="true">*</span>
	     </label>
	     <div class="col-md-8">
	        <g:textField id="title" name="title" maxlength="150" required="" value="${itemVariantInstance?.title}" placeholder="Item Title" class="form-control"/>
	        <div class="form-control-focus"> </div>
	     	<span class="help-block"><g:message code="item.help.title" default="Enter Title/Name..." /></span>
	     </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group form-md-line-input">
			<label for="variant" class="col-md-3 control-label">
				<g:message code="variant.label" default="Variant" />
				<span class="required" aria-required="true">*</span>
			</label>
			<div class="col-md-8">
				<sec:ifAnyGranted roles="ROLE_SUPERADMIN">
					<g:select id="variant" name="variant.id" required="" from="${variantList}" optionKey="id"
						value="${itemVariantInstance?.variant?.id}"
						optionValue="defaultTitleForAdmin"
						class="many-to-one form-control"/>
		        </sec:ifAnyGranted>
				<sec:ifNotGranted roles="ROLE_SUPERADMIN">
					<g:select id="variant" name="variant.id" required="" from="${variantList}" optionKey="id"
						value="${itemVariantInstance?.variant?.id}"
						class="many-to-one form-control"/>
				</sec:ifNotGranted>
				<div class="form-control-focus"> </div>
	            <span class="help-block"><g:message code="item.help.variant" default="Select Varaint..." /></span>
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
	        <g:textField id="price" name="price" type="number" step="any" maxlength="10" required="" value="${itemVariantInstance?.price}" class="form-control" placeholder="Item Price"/>
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
	        <g:textField id="approxPreperationTime" name="approxPreperationTime" type="number" step="any" maxlength="6" value="${itemVariantInstance?.approxPreperationTime}" class="form-control" placeholder="Approximate Cooking Time"/>
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
	        <g:textArea rows="2" id="description" name="description" maxlength="500" required="" value="${itemVariantInstance?.description}" class="form-control" placeholder="Item Description"/>
	        <div class="form-control-focus"> </div>
	     	<span class="help-block"><g:message code="item.help.description" default="Enter Description..." /></span>
	     </div>
        </div>
    </div>
	<!--/span-->
</div>
<!--/row-->
<div class="row">
    <div class="col-md-6">
        <div class="form-group form-md-line-input">
	     <label class="col-md-3 control-label" for="isActive">
	     	<g:message code="item.isActive.label" default="Is Active" />
	     </label>
	     <div class="col-md-6">
	        <g:checkBox id="isActive" name="isActive" class="control-label md-check" value="${itemVariantInstance?.isActive}" />
	        <div class="form-control-focus"> </div>
	     </div>
        </div>
    </div>
	<!--/span-->
</div>
<!--/row-->