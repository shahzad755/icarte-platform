<!DOCTYPE html>
<html>
    <head>
        <title>iCarte :: Customer Call Queue</title>
        <meta name="layout" content="main"/>
        <script type="text/javascript">
        	var _refreshInterval = ${refreshInterval };
        </script>
	</head>
    <body>
		<div class="portlet light bordered">
		    <div class="portlet-title">
		        <div class="caption">
		              <i class="icon-share font-red-sunglo"></i>
		              <span class="caption-subject font-red-sunglo bold uppercase">Table Request Alerts</span>
		        </div>
		        <div class="tools">
		              <a title="" class="fullscreen" href="javascript:;" data-original-title=""> </a>
		              <a title="" id="btnReloadTableReq" class="reload" href="" data-original-title=""> </a>
		     	</div>
			</div>
	         <!-- BEGIN Table Requests -->
               <sec:ifAnyGranted roles="ROLE_RESTAURANT_OWNER">
		        <div class="row form-horizontal">
				    <div class="col-md-6">
				        <div class="form-group form-md-line-input">
					     <label class="col-md-4 control-label" for="branchCode">
					     	<g:message code="title.label" default="Filter data for branch" />
					     </label>
					     <div class="col-md-8">
							<g:select id="branchId" name="branch.id" from="${branches}" optionKey="id"
									noSelection="['':'-Select Branch-']"
									value="${branchId}" 
									optionValue="nameWithRestuarant"
									class="many-to-one form-control"/>
					        <div class="form-control-focus"> </div>
					     </div>
				        </div>
				    </div>
		        </div>
		    </sec:ifAnyGranted>
		    <div id="tableRequestsContainer" class="portlet-body" style="height: auto;">
				<div id="throbber1" style="display:none;">
				    <asset:image src="spinner2.gif" alt="Loading"/>
				</div>
	        </div>
	    </div>         
    </body>
</html>