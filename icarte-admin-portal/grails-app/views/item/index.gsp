<%@page import="com.armedialab.entity.CuisineType"%>
<%@page import="com.armedialab.entity.SpiceType"%>
<%@page import="com.armedialab.entity.ItemCategory"%>
<%@ page import="com.armedialab.entity.Item" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
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
		<div class="portlet light portlet-fit portlet-form bordered">
             <div class="portlet-title">
                 <div class="caption font-dark">
                     <i class="icon-list font-dark"></i>
                     <span class="caption-subject bold">
                     	<g:message code="default.search.label" default="Search/List Menu Items" />
                     </span>
                 </div>
                 <div class="tools"><a title="" class="collapse" href="javascript:;" data-original-title=""> </a></div>
             </div>
             <div id="search-item" class="portlet-body" role="main">
	             <form id="itemSearchForm" method="POST">
	             	<div class="form-body">
						<div class="row">
						    <div class="col-md-6">
						        <div class="form-group form-md-line-input">
							     <label class="col-md-3 control-label" for="searchCode">
							     	<g:message code="code.label" default="Code" />
							     </label>
							     <div class="col-md-9">
							        <g:textField name="searchCode" maxlength="50" value="${searchCode}" class="form-control"/>
							        <div class="form-control-focus"> </div>
							     	<span class="help-block"><g:message code="help.searchCode" default="Enter Item Code..." /></span>
							     </div>
						        </div>
						    </div>
							<!--/span-->
						    <div class="col-md-6">
						        <div class="form-group form-md-line-input">
							     <label class="col-md-4 control-label" for="searchTitle">
							     	<g:message code="title.label" default="Item Name/Title" />
							     </label>
							     <div class="col-md-8">
							        <g:textField name="searchTitle" maxlength="50" value="${searchTitle}" class="form-control"/>
							        <div class="form-control-focus"> </div>
							     	<span class="help-block"><g:message code="help.searchTitle" default="Enter Item Name/Title..." /></span>
							     </div>
						        </div>
						    </div>
						</div>
						<!--/row-->
						<div class="row">
						    <div class="col-md-6">
						        <div class="form-group form-md-line-input">
							     <label class="col-md-3 control-label" for="searchCategory">
							     	<g:message code="itemCategory.label" default="Item Category" />
							     </label>
							     <div class="col-md-9">
							        <g:select id="searchCategory" name="searchCategory" from="${categories}" optionKey="id"
																	noSelection="['':'-Select Category-']"
																	value="${searchCategory}" 
																	optionValue="defaultTitle"
																	class="many-to-one form-control"/>
							        <div class="form-control-focus"> </div>
							     	<span class="help-block"><g:message code="searchCategory.help.category" default="Select Item Category..." /></span>
							     </div>
						        </div>
						    </div>
							<!--/span-->
						    <div class="col-md-6">
						        <div class="form-group form-md-line-input">
							     <label class="col-md-4 control-label" for="searchMappingCode">
							     	<g:message code="mappingCode.label" default="Mapping Code" />
							     </label>
							     <div class="col-md-8">
							        <g:textField name="searchMappingCode" maxlength="50" value="${searchMappingCode}" class="form-control"/>
							        <div class="form-control-focus"> </div>
							     	<span class="help-block"><g:message code="help.searchMappingCode" default="Enter Item Mapping Code..." /></span>
							     </div>
						        </div>
						    </div>
							<!--/span-->
						</div>
						<!--/row-->
						<div class="row">
						    <div class="col-md-6">
						        <div class="form-group form-md-line-input">
							     <label class="col-md-3 control-label" for="searchIsActive">
							     	<g:message code="isActive.label" default="Active" />
							     </label>
							     <div class="col-md-9">
							        <select id="searchIsActive" name="searchIsActive" class="many-to-one form-control">
																<option value="">-Select Active-</option>
																<option value="true">True</option>
																<option value="false">False</option>
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
						<button id="btnSearchItems" type="button" class="btn green-jungle">
							<i class="fa fa-search"></i><g:message code="default.button.search.label" default="Search"/>
						</button>
						<button type="button" data-dismiss="modal" class="btn btn-outline dark" onclick="javascript: resetForm($('#itemSearchForm'))">
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
                 <div class="tools"><a title="" class="collapse" href="javascript:;" data-original-title=""> </a></div>
             </div>
             <div id="list-items" class="portlet-body" role="main">
				<table class="table table-striped table-bordered table-hover dt-responsive" style="width:100%" id="itemList">
					<thead>
						<tr>
							<th class="all"><g:message code="item.code.label" default="Code" /></th>
							<th class="all"><g:message code="item.title.label" default="Title" /></th>
							<th class="all"><g:message code="item.price.label" default="Price" /></th>
							<th class="desktop"><g:message code="item.restaurant.label" default="Restaurant" /></th>
							<th class="all"><g:message code="item.itemCategory.label" default="Item Category" /></th>
							<th class="desktop"><g:message code="isActive.label" default="Active" /></th>
							<th class="none"><g:message code="dateCreated.label" default="Created On" /></th>
							<th class="none"><g:message code="lastUpdated.label" default="Last Updated On" /></th>
							<th class="none"><g:message code="item.mappingCode.label" default="Mapping Code" /></th>
							<th class="desktop"></th>
							<th class="desktop"></th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
		<div id="item-modal" class="modal container fade" tabindex="-1" ></div>
		<div id="item-edit-modal" class="modal container fade" tabindex="-1"></div>
	</body>
</html>
