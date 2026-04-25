<%@ page import="com.armedialab.entity.CuisineTranslation" %>

	<g:hiddenField id="cuisineType" name="cuisineType.id" value="${cuisineTranslationInstance?.cuisineType?.id}"/>
	
	<div class="form-group form-md-line-input ${hasErrors(bean: cuisineTranslationInstance, field: 'language', 'has-error')} required">
 		<g:if test="${actionName == 'create'}">
			<g:select id="language.id" name="language.id" from="${com.armedialab.entity.RefLanguage.findAll('from RefLanguage as l where l.id!=1L')}" optionKey="id" value="${cuisineTranslationInstance?.language?.id}" class="many-to-one form-control" />
			<label for="language.id">
				<g:message code="language.label" default="Language" />
				<span class="required" aria-required="true">*</span>
			</label>
			<span class="help-block"><g:message code="help.language" default="Enter Language..." /></span>
		</g:if>
 		<g:else>
 			<g:textField readonly="true" name="name" value="${cuisineTranslationInstance?.language?.name}"  class="form-control" />
			<label for="language">
				<g:message code="language.label" default="Language" />
				<span class="required" aria-required="true"></span>
			</label>
 		</g:else>
	</div>
	<div class="form-group form-md-line-input ${hasErrors(bean: cuisineTranslationInstance, field: 'title', 'has-error')} required">
		<g:textField name="title" value="${cuisineTranslationInstance?.title}" class="form-control" required=""/>

		<label for="title">
			<g:message code="title.label" default="Title" />
			<span class="required" aria-required="true">*</span>
		</label>
		<span class="help-block"><g:message code="help.title" default="Enter Title..." /></span>
	</div>

 
	<div class="form-group form-md-line-input ${hasErrors(bean: cuisineTranslationInstance, field: 'description', 'has-error')} ">
		<g:textField name="description" value="${cuisineTranslationInstance?.description}" class="form-control"/>

		<label for="description">
			<g:message code="description.label" default="Description" />
			
		</label>
		<span class="help-block"><g:message code="help.description" default="Enter Description..." /></span>
	</div>

	<div class="form-group">
		<g:checkBox name="showDescription" value="${cuisineTranslationInstance?.showDescription}" />
		<label for="showDescription">
		 	<g:message code="showDescription.label" default="Show Description" />
		</label>
	</div>