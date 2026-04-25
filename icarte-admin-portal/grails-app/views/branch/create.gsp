<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'branch.label', default: 'Branch')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		
		<div class="portlet light portlet-fit portlet-form bordered" id="create-branch" role="main">
			<div class="portlet-title">
				<div class="caption font-blue">
					<i class="icon-note"></i><g:message code="default.create.label" args="[entityName]" />
				</div>
			</div>
			<div class="portlet-body">
					<g:if test="${flash.message}">
						<div class="message alert alert-info alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Info!</strong> ${flash.message}
			             </div>
					</g:if>
					<g:hasErrors bean="${branchInstance}">
					<div class="alert alert-danger alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Error!</strong>
							<ul class="errors" role="alert">
								<g:eachError bean="${branchInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
					</div>
					</g:hasErrors>
					<g:form url="[resource:branchInstance, action:'save']" >
						<div class="form-body">
							<g:render template="form"/>
							<div class="portlet-title form-subsection-header">
                                 <div class="caption font-blue">
                                     <i class="icon-note"></i>
                                     <span class="caption-subject bold uppercase"> Branch Address</span>
                                 </div>
                            </div>
							<g:render template="/address/form" model="[addressInstance: branchInstance.address]"/>
						</div>
						<div class="form-actions right">
							<button type="submit" class="btn green-jungle">
								<i class="fa fa-pencil"></i><g:message code="default.button.create.label"/>
							</button>
							<button type="button" class="btn default" onclick="location.href='${request.contextPath}/${controllerName }/index'">
								<g:message code="default.button.cancel.label"/>
							</button>
						</div>
					</g:form>
         </div>
     </div>		
		
		<%--
		
		<div class="portlet light portlet-fit portlet-form bordered" id="create-branch" role="main">
			<div class="portlet-title">
				<div class="caption font-blue">
					<i class="icon-note"></i><g:message code="default.create.label" args="[entityName]" />
				</div>
			</div>
			<div class="portlet-body">
					<g:if test="${flash.message}">
						<div class="message alert alert-info alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Info!</strong> ${flash.message}
			             </div>
					</g:if>
					<g:hasErrors bean="${branchInstance}">
					<div class="alert alert-danger alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Error!</strong>
							<ul class="errors" role="alert">
								<g:eachError bean="${branchInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
					</div>
					</g:hasErrors>
					<g:form url="[resource:branchInstance, action:'save']" >					
						<div class="form-body">
							<g:render template="form"/>
							<div class="portlet light portlet-fit portlet-form" id="create-address" role="main">
								<div class="portlet-title">
									<div class="caption font-blue">
										<i class="icon-note"></i><g:message code="branch.label" default="Create Branch Address" />
									</div>
								</div>
							</div>
							<g:render template="/address/form" model="[addressInstance: branchInstance.address]"/>
						</div>
						<div class="form-actions">
							<div class="row">
								<div class="col-md-offset-1">
									<button type="submit" class="btn green-jungle">
										<i class="fa fa-pencil"></i><g:message code="default.button.create.label"/>
									</button>
									<button type="button" class="btn default" onclick="location.href='${request.contextPath}/${controllerName }/index'">
										<g:message code="default.button.cancel.label"/>
									</button>
								</div>
							</div>
						</div>
					</g:form>
			</div>
		</div>
	--%></body>
</html>
