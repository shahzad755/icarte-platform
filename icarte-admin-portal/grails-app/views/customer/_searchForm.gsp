<%@ page import="com.armedialab.entity.Customer" %>
           <form id="customerSearchForm" method="POST">
           	<div class="form-body">
				<div class="row">
				    <div class="col-md-6">
				        <div class="form-group form-md-line-input">
					     <label class="col-md-4 control-label" for="searchMobile">
					     	<g:message code="mobile.label" default="Mobile#" />
					     </label>
					     <div class="col-md-8">
					        <g:textField name="searchMobile" maxlength="50" value="${searchMobile}" class="form-control"/>
					        <div class="form-control-focus"> </div>
					     	<span class="help-block"><g:message code="help.searchMobile" default="Enter Mobile#..." /></span>
					     </div>
				        </div>
				    </div>
					<!--/span-->
				    <div class="col-md-6">
				        <div class="form-group form-md-line-input">
					     <label class="col-md-3 control-label" for="searchCode">
					     	<g:message code="code.label" default="Code" />
					     </label>
					     <div class="col-md-9">
					        <g:textField name="searchCode" maxlength="50" value="${searchCode}" class="form-control"/>
					        <div class="form-control-focus"> </div>
					     	<span class="help-block"><g:message code="help.searchCustomerCode" default="Enter Customer Code..." /></span>
					     </div>
				        </div>
				    </div>
				</div>
				<!--/row-->
				<div class="row">
				    <div class="col-md-6">
				        <div class="form-group form-md-line-input">
					     <label class="col-md-4 control-label" for="searchFname">
					     	<g:message code="firstName.label" default="First Name" />
					     </label>
					     <div class="col-md-8">
					        <g:textField name="searchFname" maxlength="50" value="${searchFname}" class="form-control"/>
					        <div class="form-control-focus"> </div>
					     	<span class="help-block"><g:message code="help.searchFname" default="Enter First Name..." /></span>
					     </div>
				        </div>
				    </div>
					<!--/span-->
				    <div class="col-md-6">
				        <div class="form-group form-md-line-input">
					     <label class="col-md-4 control-label" for="searchLname">
					     	<g:message code="lastName.label" default="Last Name" />
					     </label>
					     <div class="col-md-8">
					        <g:textField name="searchLname" maxlength="50" value="${searchLname}" class="form-control"/>
					        <div class="form-control-focus"> </div>
					     	<span class="help-block"><g:message code="help.searchLname" default="Enter Last Name..." /></span>
					     </div>
				        </div>
				    </div>
					<!--/span-->
				</div>
				<!--/row-->
				<div class="row">
				    <div class="col-md-6">
				        <div class="form-group form-md-line-input">
					     <label class="col-md-4 control-label" for="searchIsActive">
					     	<g:message code="isActive.label" default="Active" />
					     </label>
					     <div class="col-md-8">
					        <select id="searchIsActive" name="searchIsActive" class="many-to-one form-control">
														<option value="">-Select Active-</option>
														<option value="true">Yes</option>
														<option value="false">No</option>
													</select>
					        <div class="form-control-focus"> </div>
					     	<span class="help-block"><g:message code="searchIsActive.help.isActive" default="Select Is Active?..." /></span>
					     </div>
				        </div>
				    </div>
				</div>
				<!--/row-->
			</div>
			<div class="form-actions right">
				<button id="btnSearchCustomers" type="button" class="btn green-jungle">
					<i class="fa fa-search"></i><g:message code="default.button.search.label" default="Search"/>
				</button>
				<button type="button" data-dismiss="modal" class="btn btn-outline dark" onclick="javascript: resetForm($('#customerSearchForm'))">
					<g:message code="default.button.clear.label" default="Clear"/>
				</button>
			</div>
		</form>
