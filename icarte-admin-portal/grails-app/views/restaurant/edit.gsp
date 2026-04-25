<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'restaurant.label', default: 'Restaurant')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<script type="text/javascript">
			var _restaurantId = ${restaurantInstance?.id};
			var _maxAllowedFiles = 1;
		</script>
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		
		<div class="portlet light portlet-fit portlet-form bordered" id="edit-restaurant" role="main">
			<div class="portlet-title">
				<div class="caption font-blue">
					<i class="icon-info"></i><g:message code="default.edit.label" args="[entityName]" />
				</div>
				<div class="pull-right">
					<button type="button" class="btn blue-madison" onclick="location.href='${request.contextPath}/branch/index?restaurantId=${restaurantInstance?.id}'">
						<span class="item"><span class="icon-directions" aria-hidden="true"></span> &nbsp;<g:message code="default.branches.edit.label" default="Branches" /> </span>
					</button>
				</div>
			</div>
			<div id="trans-portlet-body" class="portlet-body">
					<g:if test="${flash.message}">
						<div class="message alert alert-info alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Info!</strong> ${flash.message}
			             </div>
					</g:if>
					<g:hasErrors bean="${restaurantInstance}">
					<div class="alert alert-danger alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Error!</strong>
							<ul class="errors" role="alert">
								<g:eachError bean="${restaurantInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
					</div>
					</g:hasErrors>
					<div class="tabbable-custom">
						<ul class="nav nav-tabs">
							<li class="active">
								<a href="#tab_restaurant" data-toggle="tab"> Restaurant </a>
							</li>
							<li>
								<a href="#tab_restaurant_translation" data-toggle="tab"> Translations </a>
							</li>
							<li>
								<a href="#tab_category_image" data-toggle="tab"> Media </a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tab_restaurant">
								<g:form url="[resource:restaurantInstance, action:'update']" method="PUT" >
									<g:hiddenField name="version" value="${restaurantInstance?.version}" />							
									<div class="form-body">
										<g:render template="form"/>
									</div>
									<div class="form-actions">
										<div class="row">
											<div class="col-md-offset-1">
												<button type="submit" class="btn green-jungle">
													<i class="fa fa-pencil"></i><g:message code="default.button.edit.label"/>
												</button>
												<button type="button" class="btn default" onclick="javascript: history.go(-1)">
													<g:message code="default.button.cancel.label"/>
												</button>
											</div>
										</div>
									</div>
								</g:form>
							</div>
							<div class="tab-pane" id="tab_restaurant_translation">
								<g:render template="/restaurantTranslation/grid"/>
								<div id="trans-create-modal" class="modal fade" tabindex="-1"  data-width="760"></div>
								<div id="trans-edit-modal" class="modal fade" tabindex="-1"  data-width="760"></div>
							</div>							
							<div class="tab-pane" id="tab_category_image">
								<!-- START Image uploading tab -->
								<g:render template="/layouts/fileupload" model="[model: restaurantInstance, maxAllowedFiles: 1]"/>
								<!-- END Image uploading tab -->
							</div>							
						</div>
				</div>
			</div>
		</div>
	</body>
</html>
