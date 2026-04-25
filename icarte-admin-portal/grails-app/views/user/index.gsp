<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'users.label', default: 'Users')}" />
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
		<div id="users-portlet-body" class="portlet light portlet-fit portlet-form bordered">
             <div class="portlet-title">
                 <div class="caption font-dark">
                     <i class="icon-list font-dark"></i>
                     <span class="caption-subject bold">
                     	<g:message code="default.search.label" default="Search Users" />
                     </span>
                 </div>
                 <div class="tools"><a title="" class="collapse" href="javascript:;" data-original-title=""> </a></div>
             </div>
             <div id="search-users" class="portlet-body" role="main">
	             <form id="userSearchForm" method="POST" class="form-horizontal">
	             	<div class="form-body">
						<div class="row">
						    <div class="col-md-3">
						        <div class="form-group form-md-line-input">
							     <label class="col-md-4 control-label" for="username">
							     	<g:message code="username.label" default="Username" />
							     </label>
							     <div class="col-md-8">
							        <g:textField name="username" maxlength="50" value="${username}" class="form-control"/>
							        <div class="form-control-focus"> </div>
							     	<span class="help-block"><g:message code="help.username" default="Enter Username..." /></span>
							     </div>
						        </div>
						    </div>
							<!--/span-->
						    <div class="col-md-3">
						        <div class="form-group form-md-line-input">
							     <label class="col-md-4 control-label" for="email">
							     	<g:message code="email.label" default="Email" />
							     </label>
							     <div class="col-md-8">
							        <g:textField name="email" maxlength="50" value="${email}" class="form-control"/>
							        <div class="form-control-focus"> </div>
							     	<span class="help-block"><g:message code="help.email" default="Enter Email..." /></span>
							     </div>
						        </div>
						    </div>
							<!--/span-->
						    <div class="col-md-3">
						        <div class="form-group form-md-line-input">
							     <label class="col-md-4 control-label" for="staffCode">
							     	<g:message code="staffCode.label" default="Staff Code" />
							     </label>
							     <div class="col-md-8">
							        <g:textField name="staffCode" maxlength="50" value="${staffCode}" class="form-control"/>
							        <div class="form-control-focus"> </div>
							     	<span class="help-block"><g:message code="help.staffCode" default="Enter Staff Code..." /></span>
							     </div>
						        </div>
						    </div>
							<!--/span-->
						    <div class="col-md-3">
						        <div class="form-group form-md-line-input">
							     <label class="col-md-4 control-label" for="mobile">
							     	<g:message code="mobile.label" default="Mobile#" />
							     </label>
							     <div class="col-md-8">
							        <g:textField name="mobile" maxlength="20" value="${mobile}" class="form-control"/>
							        <div class="form-control-focus"> </div>
							     	<span class="help-block"><g:message code="help.mobile" default="Enter Mobile#..." /></span>
							     </div>
						        </div>
						    </div>
						</div>
						<!--/row-->
					</div>
					<div class="form-actions right">
						<button id="btnSearchUsers" type="button" class="btn green-jungle">
							<i class="fa fa-search"></i><g:message code="default.button.search.label" default="Search"/>
						</button>
						<button type="button" data-dismiss="modal" class="btn btn-outline dark" onclick="javascript: resetForm($('#userSearchForm'))">
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
             <div id="list-users" class="portlet-body" role="main">
				<table class="table table-striped table-bordered table-hover dt-responsive" style="width:100%" id="usersList">
					<thead>
						<tr>
							<th class="all"><g:message code="users.username.label" default="User Name" /></th>
							<th class="all"><g:message code="staff.staffCode.label" default="Code" /></th>
							<th class="all"><g:message code="users.firstName.label" default="First Name" /></th>
							<th class="all"><g:message code="users.lastName.label" default="Last Name" /></th>
							<th class="all"><g:message code="users.mobile.label" default="Mobile" /></th>
							<th class="none"><g:message code="users.email.label" default="Email" /></th>
							<th class="none"><g:message code="staff.restaurant.label" default="Restaurant" /></th>
							<th class="all"><g:message code="staff.branch.label" default="Branch" /></th>
							<th class="none"><g:message code="users.isActive.label" default="Active?" /></th>
							<th class="desktop"></th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</body>
</html>
