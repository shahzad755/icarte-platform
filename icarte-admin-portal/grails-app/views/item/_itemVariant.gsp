<%@ page import="com.armedialab.entity.Item" %>

<div class="portlet light bordered">
    <div class="portlet-title">
        <div class="caption font-dark">
            <i class="icon-list font-dark"></i>
            <span class="caption-subject bold uppercase">
            	<g:message code="default.listVariant.label" default="Item Customizations" />
            </span>
        </div>
		<a id="btn-create-item-var" class="pull-right btn blue btn-circle btn-icon-only btn-default" title="Create New Customization">
			<i class="icon-plus"></i>
		</a>
    </div>
    <div id="list-item-variants" class="portlet-body" role="main">
		<table class="table table-striped table-bordered table-hover dt-responsive" style="width:100%" id="itemVariantList">
			<thead>
				<tr>
					<th class="all"><g:message code="title.label" default="Title" /></th>
					<th class="all"><g:message code="variant.label" default="Variant" /></th>
					<th class="all"><g:message code="price.label" default="Price" /></th>
					<th class="desktop"><g:message code="approxPrepTime.label" default="Approx. Prep Time" /></th>
					<th class="desktop"><g:message code="description.label" default="Description" /></th>
					<th class="desktop"><g:message code="isActive.label" default="Active" /></th>
					<th class="desktop"><g:message code="dateCreated.label" default="Created On" /></th>
					<th class="desktop"><g:message code="lastUpdated.label" default="Last Updated On" /></th>
					<th class="desktop"></th>
					<th class="desktop"></th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
</div>


<div id="item-variant-portlet-body" class="portlet-body form">
	<div class="form-actions right">
		<button type="button" data-dismiss="modal" class="btn btn-outline dark">
			<g:message code="default.button.cancel.label"/>
		</button>
	</div>
</div>
<div id="item-variant-modal" class="modal container fade" tabindex="-1" data-width="760"></div>
<div id="item-variant-edit-modal" class="modal container fade" tabindex="-1" data-width="760"></div>
