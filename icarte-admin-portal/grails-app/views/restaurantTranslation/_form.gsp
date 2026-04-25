<%@ page import="com.armedialab.entity.RestaurantTranslation" %>
	<g:hiddenField id="restaurant" name="restaurant.id" value="${translationInstance?.restaurant?.id}" class="form-control"/>
	
	<div class="form-group form-md-line-input ${hasErrors(bean: translationInstance, field: 'language', 'has-error')} required">
 		<g:if test="${actionName == 'create'}">
			<g:select id="language.id" name="language.id" from="${com.armedialab.entity.RefLanguage.findAll('from RefLanguage as l where l.id!=1L')}" optionKey="id" value="${translationInstance?.language?.id}" class="many-to-one form-control" />
			<label for="language.id">
				<g:message code="language.label" default="Language" />
				<span class="required" aria-required="true">*</span>
			</label>
			<span class="help-block"><g:message code="help.language" default="Enter Language..." /></span>
		</g:if>
 		<g:else>
 			<g:textField readonly="true" name="name" value="${translationInstance?.language?.name}"  class="form-control" />
			<label for="language">
				<g:message code="language.label" default="Language" />
				<span class="required" aria-required="true"></span>
			</label>
 		</g:else>
	</div>
	<div class="form-group form-md-line-input ${hasErrors(bean: translationInstance, field: 'title', 'has-error')} required">
		<g:textField name="title" value="${translationInstance?.title}" class="form-control" required=""/>
		<label for="title">
			<g:message code="title.label" default="Title" />
			<span class="required" aria-required="true">*</span>
		</label>
		<span class="help-block"><g:message code="help.title" default="Enter Title..." /></span>
	</div>
	<div class="form-group form-md-line-input ${hasErrors(bean: translationInstance, field: 'description', 'has-error')} ">
		<g:textArea name="description" cols="40" rows="5" maxlength="2000" value="${translationInstance?.description}" class="form-control"/>		
		<label for="description">
			<g:message code="description.label" default="Description" />
		</label>
		<span class="help-block"><g:message code="help.description" default="Enter Description..." /></span>
	</div>
	<div class="form-group">
		<g:checkBox name="showDescription" value="${translationInstance?.showDescription}" />
		<label for="showDescription">
		 	<g:message code="showDescription.label" default="Show Description" />
		</label>
	</div>
	<%--
       <div class="form-group md-checkbox">
		<g:checkBox name="showDescription" class="md-check" value="${translationInstance?.showDescription}" />
		<label for="showDescription">
			<span class="inc"></span>
			<span class="check"></span>
			<span class="box"></span>
		 	<g:message code="showDescription.label" default="Show Description" />
		</label>
		</div>
       <div class="form-group md-checkbox">
		<g:checkBox name="isDefault" class="md-check" value="${translationInstance?.isDefault}" />
		<label for="isDefault">
			<span class="inc"></span>
			<span class="check"></span>
			<span class="box"></span>
		 	<g:message code="isDefault.label" default="Is Default" />
		</label>
		</div>
 --%>