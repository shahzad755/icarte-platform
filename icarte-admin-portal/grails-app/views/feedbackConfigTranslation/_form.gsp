<%@ page import="com.armedialab.entity.FeedbackConfigTranslation" %>

	<g:hiddenField id="feedbackConfig" name="feedbackConfig.id" value="${feedbackConfigTranslationInstance?.feedbackConfig?.id}"/>
	<div class="form-group form-md-line-input ${hasErrors(bean: feedbackConfigTranslationInstance, field: 'language', 'has-error')} required">
 		<g:if test="${actionName == 'create'}">
			<g:select id="language.id" name="language.id" from="${com.armedialab.entity.RefLanguage.findAll('from RefLanguage as l where l.id!=1L')}" optionKey="id" value="${feedbackConfigTranslationInstance?.language?.id}" class="many-to-one form-control" />
			<label for="language.id">
				<g:message code="feedbackConfigTranslation.language.label" default="Language" />
				<span class="required" aria-required="true">*</span>
			</label>
			<span class="help-block"><g:message code="feedbackConfigTranslation.help.language" default="Enter Language..." /></span>
		</g:if>
 		<g:else>
 			<g:textField readonly="true" name="name" value="${feedbackConfigTranslationInstance?.language?.name}"  class="form-control" />
			<label for="language">
				<g:message code="feedbackConfigTranslation.language.label" default="Language" />
				<span class="required" aria-required="true"></span>
			</label>
 		</g:else>
	</div>
	<div class="form-group form-md-line-input ${hasErrors(bean: feedbackConfigTranslationInstance, field: 'title', 'has-error')} required">
		<g:textField name="title" value="${feedbackConfigTranslationInstance?.title}" class="form-control" required=""/>

		<label for="title">
			<g:message code="feedbackConfigTranslation.title.label" default="Title" />
			<span class="required" aria-required="true">*</span>
		</label>
		<span class="help-block"><g:message code="feedbackConfigTranslation.help.title" default="Enter Title..." /></span>
	</div>

 
	<div class="form-group form-md-line-input ${hasErrors(bean: feedbackConfigTranslationInstance, field: 'description', 'has-error')} ">
		<g:textField name="description" value="${feedbackConfigTranslationInstance?.description}" class="form-control"/>

		<label for="description">
			<g:message code="feedbackConfigTranslation.description.label" default="Description" />
			
		</label>
		<span class="help-block"><g:message code="feedbackConfigTranslation.help.description" default="Enter Description..." /></span>
	</div>

	<div class="form-group">
		<g:checkBox name="showDescription" value="${feedbackConfigTranslationInstance?.showDescription}" />
		<label for="showDescription">
		 	<g:message code="feedbackConfigTranslation.showDescription.label" default="Show Description" />
		</label>
	</div>