<%@ page import="com.armedialab.entity.AddonTranslation" %>

	 
	<g:hiddenField id="addon" name="addon.id" value="${addonTranslationInstance?.addon?.id}" class="form-control"/>
	
	<div class="form-group form-md-line-input ${hasErrors(bean: addonTranslationInstance, field: 'language', 'has-error')} required">
 		<g:if test="${actionName == 'create'}">
			<g:select id="language.id" name="language.id" from="${com.armedialab.entity.RefLanguage.findAll('from RefLanguage as l where l.id!=1L')}" optionKey="id" value="${addonTranslationInstance?.language?.id}" class="many-to-one form-control" />
			<label for="language.id">
				<g:message code="addonTranslation.language.label" default="Language" />
				<span class="required" aria-required="true">*</span>
			</label>
			<span class="help-block"><g:message code="addonTranslation.help.language" default="Enter Language..." /></span>
		</g:if>
 		<g:else>
 			<g:textField readonly="true" name="name" value="${addonTranslationInstance?.language?.name}"  class="form-control" />
			<label for="language">
				<g:message code="addonTranslation.language.label" default="Language" />
				<span class="required" aria-required="true"></span>
			</label>
 		</g:else>
	</div>
	<div class="form-group form-md-line-input ${hasErrors(bean: addonTranslationInstance, field: 'title', 'has-error')} required">
		<g:textField name="title" value="${addonTranslationInstance?.title}" class="form-control" required=""/>

		<label for="title">
			<g:message code="addonTranslation.title.label" default="Title" />
			<span class="required" aria-required="true">*</span>
		</label>
		<span class="help-block"><g:message code="addonTranslation.help.title" default="Enter Title..." /></span>
	</div>

 
	<div class="form-group form-md-line-input ${hasErrors(bean: addonTranslationInstance, field: 'description', 'has-error')} ">
		<g:textField name="description" value="${addonTranslationInstance?.description}" class="form-control"/>

		<label for="description">
			<g:message code="addonTranslation.description.label" default="Description" />
			
		</label>
		<span class="help-block"><g:message code="addonTranslation.help.description" default="Enter Description..." /></span>
	</div>

	<div class="form-group">
		<g:checkBox name="showDescription" value="${addonTranslationInstance?.showDescription}" />
		<label for="showDescription">
		 	<g:message code="addonTranslation.showDescription.label" default="Show Description" />
		</label>
	</div>
		
	<%--
       <div class="form-group md-checkbox">
		<g:checkBox name="showDescription" class="md-check" value="${addonTranslationInstance?.showDescription}" />

		<label for="showDescription">
			<span class="inc"></span>
			<span class="check"></span>
			<span class="box"></span>
		 	<g:message code="addonTranslation.showDescription.label" default="Show Description" />
			
		</label>
		</div>
 
       <div class="form-group md-checkbox">
		<g:checkBox name="isDefault" class="md-check" value="${addonTranslationInstance?.isDefault}" />

		<label for="isDefault">
			<span class="inc"></span>
			<span class="check"></span>
			<span class="box"></span>
		 	<g:message code="addonTranslation.isDefault.label" default="Is Default" />
			
		</label>
		</div>
 --%>