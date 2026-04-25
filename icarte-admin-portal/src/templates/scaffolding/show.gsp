<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/pageheader"/>
		<div class="portlet light bordered" id="show-${domainClass.propertyName}" role="main">
			<div class="portlet-title">
				<div class="caption font-blue">
					<i class="icon-info"></i><g:message code="default.show.label" args="[entityName]" />
				</div>
			</div>
			<div class="portlet-body form">
					<g:if test="\${flash.message}">
						<div class="message alert alert-info alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Info!</strong> \${flash.message}
			             </div>
					</g:if>
					<g:hasErrors bean="\${${propertyName}}">
					<div class="alert alert-danger alert-dismissable" role="status">
			               <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
			               <strong>Error!</strong>
							<ul class="errors" role="alert">
								<g:eachError bean="\${${propertyName}}" var="error">
								<li <g:if test="\${error in org.springframework.validation.FieldError}">data-field-id="\${error.field}"</g:if>><g:message error="\${error}"/></li>
								</g:eachError>
							</ul>
					</div>
					</g:hasErrors>
					<g:form class="form-horizontal" role="form" url="[resource:${propertyName}, action:'delete']" method="DELETE">
					
					<div class="form-body">
					<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
						allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
						props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
						Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
						props.each { p -> %>
							<div class="row" style="padding-left: 20px">
								<div class="form-group">
									<label class="control-label lead"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" />:</label>
									<%  if (p.isEnum()) { %>
										<p class="form-control-static"><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></p>
									<%  } else if (p.oneToMany || p.manyToMany) { %>
										<g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
										<p class="form-control-static"><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link></p>
										</g:each>
									<%  } else if (p.manyToOne || p.oneToOne) { %>
										<p class="form-control-static"><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link></p>
									<%  } else if (p.type == Boolean || p.type == boolean) { %>
										<p class="form-control-static"><g:formatBoolean boolean="\${${propertyName}?.${p.name}}" /></p>
									<%  } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
										<p class="form-control-static"><g:formatDate date="\${${propertyName}?.${p.name}}" /></p>
									<%  } else if (!p.type.isArray()) { %>
										<p class="form-control-static"><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></p>
									<%  } %>
									
								</div>
							</div>
					<%  } %>
					</div>
					<button type="button" class="btn blue-madison" onclick="location.href='\${request.contextPath}/\${controllerName }/edit/\${${propertyName}?.id}'">
						<i class="fa fa-pencil"></i><g:message code="default.button.edit.label" default="Edit" />
					</button>
					<g:actionSubmit class="delete btn red-sunglo" action="delete" value="\${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</g:form>
			</div>
		</div>
	</body>
</html>
