<!DOCTYPE html>
<html>
	<head>
		<meta name="layout">
		<g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<style>
			.select2-close-mask{
			    z-index: 10061;
			}
			.select2-dropdown{
			    z-index: 10060;
			}
		</style>
	</head>
	<body>
		<div id="order-details-portlet-body" class="portlet light portlet-fit portlet-form bordered">
             <div class="portlet-title">
                <div class="caption font-dark">
                     <i class="icon-list font-dark"></i>
		            	<g:message code="order.list.label" />: 
		            		<span id="orderRef" class="label label-primary">${orderRefNum}</span>
                </div>
                <div class="pull-right col-md-3">
                   	<a id="btnAdd-order-item" class="btn blue btn-circle btn-default" title="Add Order Item"
						onclick="javascript: showItemManagement(false, null, null, null, null, null)">
						Add Item
					</a>
                </div>
             </div>
             <div id="list-order-items" class="portlet-body" role="main">
			    <form id="orderDetailsFrm">
			    	<g:hiddenField name="_orderId" value="${orderId}"/>
			    </form>
			    
				<div id="list-orderItems" class="portlet-body" role="main">
					<table class="table table-striped table-bordered table-hover dt-responsive" style="width:100%" id="orderItemList">
						<thead>
							<tr>
								<th class="all"><g:message code="item.code.label" default="Item Code" /></th>
								<th class="all"><g:message code="item.mappingCode.label" default="Mapping Code" /></th>
								<th class="all"><g:message code="item.title.label" default="Title" /></th>
								<th class="all"><g:message code="item.price.label" default="Unit Price" /></th>
								<th class="all"><g:message code="item.quantity.label" default="Qty" /></th>
								<th class="all"><g:message code="item.discountAppliedPct.label" default="Discount%" /></th>
								<th class="all"><g:message code="item.price.label" default="Price" /></th>
								<th class="all"><g:message code="ordersItem.remarks.label" default="Remarks" /></th>
								<th class="all"></th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
				<div class="portlet-body form">
					<div class="form-actions right">
						<button type="button" data-dismiss="modal" class="btn btn-outline dark">
							<g:message code="default.button.cancel.label"/>
						</button>
						<span>&nbsp;&nbsp;&nbsp;</span>
					</div>
				</div>
			</div>
		</div>
		<!-- Order Item model -->
		<div id="order-item-management-modal" class="modal fade"  data-width="800" tabindex="-1">
		    <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
	            <div class="modal-title caption font-blue">
					<h4><i class="icon-note"></i> <span id="manageItemLabel">Edit</span> Item in order</h4>
				</div>
		    </div>
		    <div class="modal-body">
		          <div id="order-item_modal-body" class="row">
		              <div class="col-md-12">
						<div class="tabbable-custom">
							<ul class="nav nav-tabs">
								<li class="active">
									<a href="#tab_order_items" data-toggle="tab"> Item Details</a>
								</li>
								<li>
									<a href="#tab_order_addons" data-toggle="tab"> Addons </a>
								</li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="tab_order_items">
				              	<form id="orderItemManagementFrm" class="form">
					              	<div class="form-body">
					                	<g:hiddenField id="orderItemVariantId" name="orderItemVariantId"/>
					                	<g:hiddenField name="order_id"/>
										<div class="form-group form-md-line-input">
					                            <select id="itemVariantId" name="itemVariantId" class="form-control">
					                            </select>
												<label for="itemVariantId">
													<g:message code="item.title.label" default="Item Title" />
													<span class="required" aria-required="true">*</span>
												</label>
												<span class="help-block"><g:message code="item.help.title" default="Enter Item Code..." /></span>
										</div>
										<div class="form-group form-md-line-input">
										        <g:textField name="quantity" maxlength="5" value="${quantity}" class="form-control"/>
												<label for="quantity">
													<g:message code="item.quantity.label" default="Quantity" />
													<span class="required" aria-required="true">*</span>
												</label>
												<span class="help-block"><g:message code="item.help.quantity" default="Enter Item Quantity..." /></span>
										</div>
										<div class="form-group form-md-line-input">
										        <g:textArea name="remarks" maxlength="500" rows="3" cols="100" value="${remarks}" class="form-control"/>
												<label for="remarks">
													<g:message code="item.remarks.label" default="Special Remarks" />
												</label>
												<span class="help-block"><g:message code="item.help.remarks" default="Enter Special Remarks..." /></span>
										</div>
										<div class="form-actions right" style="background-color: #FFF">
											<button id="btn-add-order-item" type="button" class="btn blue-madison" onclick="javascript: addOrderItem();">
												<i class="fa fa-pencil"></i><g:message code="default.button.save.label" default="Save" />
											</button>
											<button id="btn-update-order-item" type="button" class="btn blue-madison" onclick="javascript: updateOrderItem();">
												<i class="fa fa-pencil"></i><g:message code="default.button.update.label" default="Update" />
											</button>
											<button id="btn-delete-order-item" type="button" class="delete btn red-sunglo" onclick="javascript: deleteOrderItem();">
												<i class="fa fa-trash"></i><g:message code="default.button.delete.label" default="Remove" />
											</button>
											<button type="button" data-dismiss="modal" class="btn btn-outline dark">
												<g:message code="default.button.cancel.label"/>
											</button>
										</div>
									</div>
								</form>
								
								</div>
								<div class="tab-pane" id="tab_order_addons">
													<a id="btn_add_itemaddon" class="pull-right btn btn blue btn-circle btn-icon-only btn-default" title="Add Order Item Addon"
														onclick="javascript: showAddonManagement(false, null, null, null, null, null)"><i class="icon-plus"></i>
													</a>
									<div id="list-orderAddons" class="portlet-body" role="main">
										<table class="table table-striped table-bordered table-hover dt-responsive" style="width:100%" id="orderAddonList">
											<thead>
												<tr>
													<th class="all"><g:message code="addon.title.label" default="Title" /></th>
													<th class="all"><g:message code="addon.quantity.label" default="Qty" /></th>
													<th class="all"><g:message code="addon.price.label" default="Price" /></th>
													<th class="all"><g:message code="addon.remarks.label" default="Remarks" /></th>
													<th class="all"></th>
												</tr>
											</thead>
											<tbody></tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		     </div>
		</div>
		<!-- Order Addon model -->
		
		<div id="order-addon-management-modal" class="modal fade"  data-width="800" tabindex="-1">
		    <div class="modal-header">
		            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		            <div class="modal-title caption font-blue">
						<h4><i class="icon-note"></i> <span id="manageAddonLabel"></span> Addon in order</h4>
					</div>
		    </div>
		    <div class="modal-body">
		          <div id="order-addon_modal-body" class="row">
		              <div class="col-md-12">
		              	<form id="orderAddonManagementFrm" class="form">
			              	<div class="form-body">
					            <g:hiddenField id="orderItemVarId" name="orderItemVarId"/>
					            <g:hiddenField id="orderItemAddonId" name="orderItemAddonId"/>
			                	<div class="form-group form-md-line-input">
			                            <select id="addonId" name="addonId" class="form-control">
			                            </select>
										<label for="addonId">
											<g:message code="addon.title.label" default="Addon Title" />
											<span class="required" aria-required="true">*</span>
										</label>
										<span class="help-block"><g:message code="addon.help.title" default="Enter Addon Title..." /></span>
								</div>
								<div class="form-group form-md-line-input">
								        <g:textField name="addonQuantity" maxlength="5" value="${quantity}" class="form-control"/>
										<label for="addonQuantity">
											<g:message code="addon.quantity.label" default="Quantity" />
											<span class="required" aria-required="true">*</span>
										</label>
										<span class="help-block"><g:message code="addon.help.quantity" default="Enter Addon Quantity..." /></span>
								</div>
								<div class="form-group form-md-line-input">
								        <g:textArea name="addonRemarks" maxlength="500" rows="3" cols="100" value="${remarks}" class="form-control"/>
										<label for="addonRemarks">
											<g:message code="addon.remarks.label" default="Special Remarks" />
										</label>
										<span class="help-block"><g:message code="addon.help.remarks" default="Enter Special Remarks..." /></span>
								</div>
								<div class="form-actions right" style="background-color: #FFF">
									<button id="btn-add-order-addon" type="button" class="btn blue-madison" onclick="javascript: addOrderAddon();">
										<i class="fa fa-pencil"></i><g:message code="default.button.save.label" default="Save" />
									</button>
									<button id="btn-update-order-addon" type="button" class="btn blue-madison" onclick="javascript: updateOrderAddon();">
										<i class="fa fa-pencil"></i><g:message code="default.button.update.label" default="Update" />
									</button>
									<button id="btn-delete-order-addon" type="button" class="delete btn red-sunglo" onclick="javascript: deleteOrderAddon();">
										<i class="fa fa-trash"></i><g:message code="default.button.delete.label" default="Remove" />
									</button>
									<button type="button" data-dismiss="modal" class="btn btn-outline dark">
										<g:message code="default.button.cancel.label"/>
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
		     </div>
		</div>
	</body>
</html>