<%@ page import="com.armedialab.entity.ItemCategoryTranslation" %>

	 
	<g:hiddenField id="itemCategory" name="itemCategory.id" value="${itemCategoryTranslationInstance?.itemCategory?.id}" class="form-control"/>
	
	<div class="form-group form-md-line-input ${hasErrors(bean: itemCategoryTranslationInstance, field: 'language', 'has-error')} required">
 		<g:if test="${actionName == 'create'}">
			<g:select id="language.id" name="language.id" from="${com.armedialab.entity.RefLanguage.findAll('from RefLanguage as l where l.id!=1L')}" optionKey="id" value="${itemCategoryTranslationInstance?.language?.id}" class="many-to-one form-control" />
			<label for="language.id">
				<g:message code="itemCategoryTranslation.language.label" default="Language" />
				<span class="required" aria-required="true">*</span>
			</label>
			<span class="help-block"><g:message code="itemCategoryTranslation.help.language" default="Enter Language..." /></span>
		</g:if>
 		<g:else>
 			<g:textField readonly="true" name="name" value="${itemCategoryTranslationInstance?.language?.name}"  class="form-control" />
			<label for="language">
				<g:message code="itemCategoryTranslation.language.label" default="Language" />
				<span class="required" aria-required="true"></span>
			</label>
 		</g:else>
	</div>
	<div class="form-group form-md-line-input ${hasErrors(bean: itemCategoryTranslationInstance, field: 'title', 'has-error')} required">
		<g:textField name="title" value="${itemCategoryTranslationInstance?.title}" class="form-control" required=""/>

		<label for="title">
			<g:message code="itemCategoryTranslation.title.label" default="Title" />
			<span class="required" aria-required="true">*</span>
		</label>
		<span class="help-block"><g:message code="itemCategoryTranslation.help.title" default="Enter Title..." /></span>
	</div>

 
	<div class="form-group form-md-line-input ${hasErrors(bean: itemCategoryTranslationInstance, field: 'description', 'has-error')} ">
		<g:textField name="description" value="${itemCategoryTranslationInstance?.description}" class="form-control"/>

		<label for="description">
			<g:message code="itemCategoryTranslation.description.label" default="Description" />
			
		</label>
		<span class="help-block"><g:message code="itemCategoryTranslation.help.description" default="Enter Description..." /></span>
	</div>

	<div class="form-group">
		<g:checkBox name="showDescription" value="${itemCategoryTranslationInstance?.showDescription}" />
		<label for="showDescription">
		 	<g:message code="itemCategoryTranslation.showDescription.label" default="Show Description" />
		</label>
	</div>
		
	<%--
       <div class="form-group md-checkbox">
		<g:checkBox name="showDescription" class="md-check" value="${itemCategoryTranslationInstance?.showDescription}" />

		<label for="showDescription">
			<span class="inc"></span>
			<span class="check"></span>
			<span class="box"></span>
		 	<g:message code="itemCategoryTranslation.showDescription.label" default="Show Description" />
			
		</label>
		</div>
 
       <div class="form-group md-checkbox">
		<g:checkBox name="isDefault" class="md-check" value="${itemCategoryTranslationInstance?.isDefault}" />

		<label for="isDefault">
			<span class="inc"></span>
			<span class="check"></span>
			<span class="box"></span>
		 	<g:message code="itemCategoryTranslation.isDefault.label" default="Is Default" />
			
		</label>
		</div>
 --%>