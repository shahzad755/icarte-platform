<%@ page import="com.armedialab.entity.Addon" %>

	<div class="form-group form-md-line-input ${hasErrors(bean: addonInstance?.addonTranslations?.getAt(0), field: 'title', 'has-error')} required">
		<g:textField name="addonTranslations[0].title" maxlength="255" value="${fieldValue(bean: addonInstance?.addonTranslations?.getAt(0), field: 'title')}" required="" class="form-control"/>
		<label for="addonTranslations[0].title">
			<g:message code="addon.title.label" default="Title" />
			<span class="required" aria-required="true">*</span>
			<asset:image class="pull-right" src="i18n/en.png"/>
		</label>
		<span class="help-block"><g:message code="addon.help.title" default="Enter Addon Title..." /></span>
	</div>

	<div class="form-group form-md-line-input ${hasErrors(bean: addonInstance?.addonTranslations?.getAt(0), field: 'description', 'has-error')} required">
		<g:textField name="addonTranslations[0].description" maxlength="255" value="${fieldValue(bean: addonInstance?.addonTranslations?.getAt(0), field: 'description')}" required="" class="form-control"/>
		<label for="description">
			<g:message code="addon.description.label" default="Description" />
			<asset:image class="pull-right" src="i18n/en.png"/>
		</label>
		<span class="help-block"><g:message code="addon.help.description" default="Enter Description..." /></span>
	</div>
	
	<div class="form-group form-md-line-input ${hasErrors(bean: addonInstance, field: 'defaultPrice', 'has-error')} required">
		<g:textField type="number" name="defaultPrice" value="${fieldValue(bean: addonInstance, field: 'defaultPrice')}" required="" class="form-control"/>
		<label for="defaultPrice">
			<g:message code="addon.defaultPrice.label" default="Default Price" />
			<span class="required" aria-required="true">*</span>
		</label>
		<span class="help-block"><g:message code="addon.help.defaultPrice" default="Enter Default Price..." /></span>
	</div>
	<%--
	<div class="form-group form-md-line-input ${hasErrors(bean: addonInstance, field: 'imageUrl', 'has-error')} ">
		<g:textField name="imageUrl" value="${addonInstance?.imageUrl}" class="form-control"/>

		<label for="imageUrl">
			<g:message code="addon.imageUrl.label" default="Image Url" />
			
		</label>
		<span class="help-block"><g:message code="addon.help.imageUrl" default="Enter Image Url..." /></span>
	</div>
	--%>
	   	<div class="form-group md-checkbox">
			<g:checkBox name="addonTranslations[0].showDescription" class="md-check" value="${addonInstance?.addonTranslations?.getAt(0)?.showDescription}" />
		
			<label for="addonTranslations[0].showDescription">
				<span class="inc"></span>
				<span class="check"></span>
				<span class="box"></span>
			 	<g:message code="addon.showDescription.label" default="Show Description on Client" />
				
			</label>
		</div>
	
      <div class="form-group md-checkbox">
		<g:checkBox name="isActive"class="md-check" value="${addonInstance?.isActive}" />
	
		<label for="isActive">
			<span class="inc"></span>
			<span class="check"></span>
			<span class="box"></span>
		 	<g:message code="addon.isActive.label" default="Is Active" />
			
		</label>
		<g:hiddenField name="addonTranslations[0].id" value="${fieldValue(bean: addonInstance?.addonTranslations?.getAt(0), field: 'id')}"/>
	</div>
 
