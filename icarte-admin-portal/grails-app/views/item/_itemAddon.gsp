<%@ page import="com.armedialab.entity.Item" %>

			<div id="item-addon-portlet-body" class="portlet-body form">
					<form id="itemAddonForm" method="post" class="form-horizontal form-row-seperated">
						<g:hiddenField name="itemId" value="${itemInstance?.id}" />							
						<div class="form-body">
							<div class="row">
							    <div class="col-md-9 pull-right">
							        <div class="form-group form-md-line-input ">
										<label for="addons" class="control-label"><g:message code="item.help.addon" default="Select Addons..." /></label>
										<g:select id="itemAddons" name="itemAddons" 
												from="${addons}"
												optionKey="id"
												value="${itemInstance?.getCurrentItemAddons()*.addon.id}"
												multiple="true" 
												class="multi-select"/>
							        </div>
							    </div>
							</div>
						</div>
						<div class="form-actions right">
							<button type="button" class="btn green-jungle" onclick="javascript: saveItemAddon();">
								<i class="fa fa-pencil"></i><g:message code="default.button.save.label" default="Save"/>
							</button>
							<button type="button" data-dismiss="modal" class="btn btn-outline dark" <g:if test="${params.mode=='standard'}">onclick="location.href='${request.contextPath}/${controllerName }/index'"</g:if>>
								<g:message code="default.button.cancel.label"/>
							</button>
						</div>
					</form>
			</div>
		
<script>
$('#itemAddons').multiSelect();
</script>