
<%@ page import="com.armedialab.entity.Customer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
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
		
		
		<div id="customerList-portlet-body" class="portlet light portlet-fit portlet-form bordered">
             <div class="portlet-title">
                 <div class="caption font-dark">
                     <i class="icon-list font-dark"></i>
                     <span class="caption-subject bold">
                     	<g:message code="default.search.label" default="Search/List Customer" />
                     </span>
                 </div>
                 <div class="tools"><a title="" class="collapse" href="javascript:;" data-original-title=""> </a></div>
             </div>
             <!-- Search Customer Panel -->
             <div id="search-customer" class="portlet-body" role="main">
             	<g:render template="searchForm"/>
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
             <div id="list-customer" class="portlet-body" role="main">
				<table class="table table-striped table-bordered table-hover dt-responsive" style="width:100%" id="customerList">
					<thead>
						<tr>
							<th class="all"><g:message code="customer.code.label" default="Code" /></th>
							<th class="all"><g:message code="customer.firstName.label" default="First Name" /></th>
							<th class="all"><g:message code="customer.lastName.label" default="Last Name" /></th>
							<th class="all"><g:message code="customer.mobile.label" default="Mobile" /></th>
							<th class="desktop"><g:message code="customer.email.label" default="Email" /></th>
							<th class="desktop"><g:message code="customer.isActive.label" default="Active?" /></th>
							<th class="none"><g:message code="restaurant.title.label" default="Restaurant" /></th>
							<th class="desktop"></th>
							<th class="desktop"></th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
		<div id="customer-modal" class="modal container fade" tabindex="-1" data-width="760px"></div>
		<div id="customer-edit-modal" class="modal container fade" tabindex="-1" data-width="760px"></div>
	</body>
</html>
