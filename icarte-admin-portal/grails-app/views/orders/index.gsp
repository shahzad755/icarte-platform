<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'orders.label', default: 'Orders')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		<g:if test="${flash.message}">
			<div class="message alert alert-info alert-dismissable" role="status">
               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
               <strong>Info!</strong> ${flash.message}
             </div>
		</g:if>
		<div id="orders-portlet-body" class="portlet light portlet-fit portlet-form bordered">
             <div class="portlet-title">
                 <div class="caption font-dark">
                     <i class="icon-list font-dark"></i>
                     <span class="caption-subject bold">
                     	<g:message code="default.search.label" default="Search Orders" />
                     </span>
                 </div>
                 <div class="tools"><a title="" class="collapse" href="javascript:;" data-original-title=""> </a></div>
             </div>
             <div id="search-orders" class="portlet-body" role="main">
	             <form id="ordersSearchForm" method="POST">
	             	<div class="form-body">
						<div class="row">
						    <div class="col-md-4">
						        <div class="form-group form-md-line-input">
							     <label class="col-md-4 control-label" for="referenceNum">
							     	<g:message code="referenceNum.label" default="Order Ref#" />
							     </label>
							     <div class="col-md-8">
							        <g:textField name="referenceNum" maxlength="50" value="${referenceNum}" class="form-control"/>
							        <div class="form-control-focus"> </div>
							     	<span class="help-block"><g:message code="help.referenceNum" default="Enter Order Reference Number..." /></span>
							     </div>
						        </div>
						    </div>
							<!--/span-->
						    <div class="col-md-4">
						        <div class="form-group form-md-line-input">
							     <label class="col-md-4 control-label" for="tableRefNumber">
							     	<g:message code="tableRefNumber.label" default="Table#" />
							     </label>
							     <div class="col-md-8">
							        <g:textField name="tableRefNumber" maxlength="50" value="${tableRefNumber}" class="form-control"/>
							        <div class="form-control-focus"> </div>
							     	<span class="help-block"><g:message code="help.tableRefNumber" default="Enter Table Number..." /></span>
							     </div>
						        </div>
						    </div>
							<!--/span-->
						    <div class="col-md-4">
						        <div class="form-group form-md-line-input">
							     <label class="col-md-4 control-label" for="branchCode">
							     	<g:message code="title.label" default="Branch" />
							     </label>
							     <div class="col-md-8">
									<g:select id="branchId" name="branch.id" from="${branches}" optionKey="id"
											noSelection="['':'-Select Branch-']"
											value="${branchId}" 
											optionValue="nameWithRestuarant"
											class="many-to-one form-control"/>
							        <div class="form-control-focus"> </div>
							     	<span class="help-block"><g:message code="help.branchId" default="Select Branch..." /></span>
							     </div>
						        </div>
						    </div>
						</div>
						<!--/row-->
						<div class="row">
						    <div class="col-md-4">
						        <div class="form-group form-md-line-input">
							     <label class="col-md-4 control-label" for="orderDateFrom">
							     	<g:message code="orderDateFrom.label" default="Date (From)" />
							     </label>
							     <div class="col-md-8">
							     	<g:textField type="date" name="orderDateFrom" value="${orderDateFrom}" class="form-control date"/>
							        <div class="form-control-focus"> </div>
							     	<span class="help-block"><g:message code="orderDateFrom.help" default="Select Order Date (From)..." /></span>
							     </div>
						        </div>
						    </div>
							<!--/span-->
						    <div class="col-md-4">
						        <div class="form-group form-md-line-input">
							     <label class="col-md-4 control-label" for="orderDateTo">
							     	<g:message code="orderDateTo.label" default="Date (To)" />
							     </label>
							     <div class="col-md-8">
							     	<g:textField type="date" name="orderDateTo" value="${orderDateTo}" class="form-control date"/>
							        <div class="form-control-focus"> </div>
							     	<span class="help-block"><g:message code="orderDateTo.help" default="Select Order Date (To)..." /></span>
							     </div>
						        </div>
						    </div>
							<!--/span-->
						    <div class="col-md-4">
						        <div class="form-group form-md-line-input">
							     <label class="col-md-4 control-label" for="statusTypeId">
							     	<g:message code="statusTypeId.label" default="Status" />
							     </label>
							     <div class="col-md-8">
									<g:select id="statusTypeId" name="statusType.id" from="${orderStatusFilterList}" optionKey="id"
											noSelection="['':'-Select Status-']"
											value="${statusTypeId}" 
											optionValue="name"
											class="many-to-one form-control"/>
							        <div class="form-control-focus"> </div>
							     	<span class="help-block"><g:message code="statusTypeId.help" default="Select Order Status..." /></span>
							     </div>
						        </div>
						    </div>
						</div>
						<!--/row-->
						<div class="row">
						    <div class="col-md-4">
						        <div class="form-group form-md-line-input">
							     <label class="col-md-4 control-label" for="mobile">
							     	<g:message code="mobile.label" default="Mobile#" />
							     </label>
							     <div class="col-md-8">
							     	<g:textField name="mobile" value="${mobile}" class="form-control"/>
							        <div class="form-control-focus"> </div>
							     	<span class="help-block"><g:message code="mobile.help" default="Enter Customer Mobile..." /></span>
							     </div>
						        </div>
						    </div>
							<!--/span-->
						    <div class="col-md-4">
						        <div class="form-group form-md-line-input">
							     <label class="col-md-4 control-label" for="staffCode">
							     	<g:message code="staffCode.label" default="Staff Code" />
							     </label>
							     <div class="col-md-8">
							     	<g:textField name="staffCode" value="${staffCode}" class="form-control"/>
							        <div class="form-control-focus"> </div>
							     	<span class="help-block"><g:message code="staffCode.help" default="Enter Staff Code..." /></span>
							     </div>
						        </div>
						    </div>
							<!--/span-->
						    <div class="col-md-4">
						        <div class="form-group form-md-line-input">
							     <label class="col-md-4 control-label" for="searchIsActive">
							     	<g:message code="isActive.label" default="Active" />
							     </label>
							     <div class="col-md-8">
							        <select id="isActive" name="isActive" class="many-to-one form-control">
										<option value="">-Select Active Status-</option>
										<option value="true">True</option>
										<option value="false">False</option>
									</select>
							        <div class="form-control-focus"> </div>
							     	<span class="help-block"><g:message code="isActive.help.isActive" default="Select Active Status..." /></span>
							     </div>
						        </div>
						    </div>
						</div>
						<!--/row-->
					</div>
					<div class="form-actions right">
						<button id="btnSearchOrders" type="button" class="btn green-jungle">
							<i class="fa fa-search"></i><g:message code="default.button.search.label" default="Search"/>
						</button>
						<button type="button" data-dismiss="modal" class="btn btn-outline dark" onclick="javascript: resetForm($('#ordersSearchForm'))">
							<g:message code="default.button.clear.label" default="Clear"/>
						</button>
					</div>
				</form>
			</div>
		</div>
		
		<div class="portlet light bordered">
             <div class="portlet-title">
                 <div class="caption font-dark">
                     <i class="icon-list font-dark"></i>
                     <span class="caption-subject bold uppercase">
                     	<g:message code="default.list.label" args="[entityName]" />
                     </span>
                 </div>
             </div>
             <div id="list-orders" class="portlet-body" role="main">
				<table class="table table-striped table-bordered table-hover dt-responsive" style="width:100%" id="orderList">
					<thead>
						<tr>
							<th class="all"><g:message code="orders.referenceNum.label" default="Reference#" /></th>
							<th class="all"><g:message code="orders.totalPrice.label" default="Total" /></th>
							<th class="desktop"><g:message code="orders.branch.label" default="Branch" /></th>
							<th class="all"><g:message code="orders.mobile.label" default="Customer Mobile" /></th>
							<th class="all"><g:message code="tableRefNumber.label" default="Table#" /></th>
							<th class="none"><g:message code="specialRemarks.label" default="Remarks" /></th>
							<th class="desktop"><g:message code="orderDate.label" default="Order Date" /></th>
							<th class="none"><g:message code="staffCode.label" default="Staff" /></th>
							<th class="all"><g:message code="statusType.label" default="Status" /></th>
							<th class="none"><g:message code="isActive.label" default="Active?" /></th>
							<th class="desktop"></th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
		<div id="order-status-modal" class="modal container fade" tabindex="-1" data-width="400">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
               	<div class="modal-title caption font-blue">
					<h4><i class="icon-note"></i> Change Status of Order: <span id="orderRef" class="label label-primary"></span></h4>
				</div>
            </div>
            <div class="modal-body">
                <div id="order-status_modal-body" class="row">
                    <div class="col-md-12">
                    	<form id="orderStatusChangeFrm">
                    		<div class="form-body">
	                    		<g:hiddenField id="orderId" name="orderId"/>
	                    		
								<div class="form-group form-md-line-input">
									<g:select id="modalStatus" name="modalStatus" from="${orderStatusList}" optionKey="id"
										value="${statusTypeId}" 
										optionValue="name"
										class="form-control font-blue-madison"
										/>
									<label for="modalStatus">
										<g:message code="orders.status.label" default="Status" />
										<span class="required" aria-required="true">*</span>
									</label>
									<span class="help-block"><g:message code="orders.help.status" default="Select Status..." /></span>
								</div>
	                    		
								<div class="form-group form-md-line-input">
									<g:textArea id="statusChangeReason" name="statusChangeReason" rows="4" maxlength="4000" value="${orderInstance?.statusChangeReason}" class="form-control"/>
									<label for="statusChangeReason">
										<g:message code="orders.statusChangeReason.label" default="Reason" />
									</label>
									<span class="help-block"><g:message code="orders.help.statusChangeReason" default="Enter Reason for Status Change..." /></span>
								</div>
							</div>
							<div class="row">&nbsp;</div>
							
							<div class="form-actions right">
								<div class="row">
									<div class="col-md-offset-1">
										<button type="button" class="btn green-jungle" onclick="javascript: updateOrderStatus();">
											<i class="fa fa-pencil"></i><g:message code="default.button.update.label"/>
										</button>
										<button type="button" data-dismiss="modal" class="btn btn-outline dark">
											<g:message code="default.button.cancel.label"/>
										</button>
									</div>
								</div>
							</div>
						</form>
                    </div>
               	</div>
           </div>
		</div>
		<div id="order-detail-modal" class="modal container fade" tabindex="-1"></div>
	</body>
</html>
