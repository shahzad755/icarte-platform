 <div class="table-toolbar">
     <div class="row">
         <div class="pull-right col-md-1">
            <div class="btn-group">
              <a id="btnAdd-trans" class="btn btn blue btn-circle btn-icon-only btn-default" title="Create New Translation"
              data-url="${createLink(uri: '/restaurantTranslation/create', params: [restaurant: restaurantInstance?.id])}" 
				data-toggle="modal">
	   				<i class="icon-plus"></i>
					</a>
			</div>
         </div>
     </div>
 </div>	
<table class="table table-striped table-hover table-bordered" id="translation_tbl">
    <thead>
        <tr>
            <th> <g:message code="title.label" default="Title" /> </th>
            <th> <g:message code="language.label" default="Language" /> </th>
            <th class="desktop"> <g:message code="description.label" default="Description" /> </th>
            <th> <g:message code="showDescription.label" default="Show Description on Client" /> </th>
            <th> <g:message code="default.button.edit.label" default="Edit" /> </th>
            <th> <g:message code="default.button.delete.label" default="Delete" /> </th>
        </tr>
    </thead>
    <tbody>
    </tbody>
</table>