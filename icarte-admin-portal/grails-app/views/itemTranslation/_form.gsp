<%@ page import="com.armedialab.entity.ItemVariantTranslation" %>
	<div class="form-group form-md-line-input ${hasErrors(bean: itemVariantTranslationInstance, field: 'language', 'has-error')} required">
 		<g:if test="${actionName == 'create'}">
			<g:select id="language.id" name="language.id" from="${com.armedialab.entity.RefLanguage.findAll('from RefLanguage as l where l.id!=1L')}" optionKey="id" value="${itemVariantTranslationInstance?.language?.id}" class="many-to-one form-control" />
			<label for="language.id">
				<g:message code="itemTranslation.language.label" default="Language" />
				<span class="required" aria-required="true">*</span>
			</label>
			<span class="help-block"><g:message code="itemTranslation.help.language" default="Enter Language..." /></span>
		</g:if>
 		<g:else>
 			<g:textField readonly="true" name="name" value="${itemVariantTranslationInstance?.language?.name}"  class="form-control" />
			<label for="language">
				<g:message code="itemTranslation.language.label" default="Language" />
				<span class="required" aria-required="true"></span>
			</label>
 		</g:else>
	</div>
	<div class="form-group form-md-line-input ${hasErrors(bean: itemVariantTranslationInstance, field: 'title', 'has-error')} required">
		<g:textField id="title" name="title" value="${itemVariantTranslationInstance?.title}" class="form-control" required=""/>

		<label for="title">
			<g:message code="itemTranslation.title.label" default="Title" />
			<span class="required" aria-required="true">*</span>
		</label>
		<span class="help-block"><g:message code="itemTranslation.help.title" default="Enter Title..." /></span>
	</div>

 
	<div class="form-group form-md-line-input ${hasErrors(bean: itemVariantTranslationInstance, field: 'description', 'has-error')} ">
		<g:textArea id="description" name="description" rows="4" required="" maxlength="4000" value="${itemVariantTranslationInstance?.description}" class="form-control"/>

		<label for="description">
			<g:message code="itemTranslation.description.label" default="Description" />
			<span class="required" aria-required="true">*</span>
		</label>
		<span class="help-block"><g:message code="itemTranslation.help.description" default="Enter Description..." /></span>
	</div>

	<div class="form-group">
		<g:checkBox id="showDescription" name="showDescription" value="${itemVariantTranslationInstance?.showDescription}" />
		<label for="showDescription">
		 	<g:message code="itemTranslation.showDescription.label" default="Show Description" />
		</label>
	</div>
		
	<%--
       <div class="form-group md-checkbox">
		<g:checkBox name="showDescription" class="md-check" value="${itemVariantTranslationInstance?.showDescription}" />

		<label for="showDescription">
			<span class="inc"></span>
			<span class="check"></span>
			<span class="box"></span>
		 	<g:message code="itemTranslation.showDescription.label" default="Show Description" />
			
		</label>
		</div>
 
       <div class="form-group md-checkbox">
		<g:checkBox name="isDefault" class="md-check" value="${itemVariantTranslationInstance?.isDefault}" />

		<label for="isDefault">
			<span class="inc"></span>
			<span class="check"></span>
			<span class="box"></span>
		 	<g:message code="itemTranslation.isDefault.label" default="Is Default" />
			
		</label>
		</div>
 --%>