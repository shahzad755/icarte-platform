
<%@page import="com.armedialab.util.Utils"%>
<%@ page import="com.armedialab.entity.FeedbackConfig" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'feedbackConfig.label', default: 'Feedback Configuration')}" />
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
		<div class="portlet light bordered">
             <div class="portlet-title">
                 <div class="caption font-dark">
                     <i class="icon-list font-dark"></i>
                     <span class="caption-subject bold uppercase">
                     	<g:message code="default.list.label" args="[entityName]" />
                     </span>
                 </div>
                 <div class="tools"> </div>
             </div>
             <div id="list-feedbackConfig" class="portlet-body" role="main">
				<table class="table table-striped table-bordered table-hover dt-responsive" style="width:100%" id="feedbackConfigList">
					<thead>
						<tr>
							<th class="all"><g:message code="feedbackConfig.title.label" default="Title" /></th>
							<th class="all"><g:message code="feedbackConfig.feedbackType.label" default="FeedbackType" /></th>
							<th class="desktop"><g:message code="feedbackConfig.description.label" default="Description" /></th>
							<th class="all"><g:message code="feedbackConfig.isRequired.label" default="Required" /></th>
							<th class="all"><g:message code="feedbackConfig.isActive.label" default="Active" /></th>
							<th> <g:message code="default.button.edit.label" default="Edit" /> </th>
							
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</body>
</html>
