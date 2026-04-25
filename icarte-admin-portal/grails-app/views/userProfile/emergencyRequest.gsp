<!DOCTYPE html>
<html>
    <head>
        <title>ICE :: Emergency Request Queue</title>
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
		              <span class="caption-subject font-red-sunglo bold uppercase">Emergency Request Alerts</span>
		        </div>
		        <div class="tools">
		              <a title="" class="fullscreen" href="javascript:;" data-original-title=""> </a>
		              <a title="" id="btnReloadTableReq" class="reload" href="" data-original-title=""> </a>
		     	</div>
			</div>
		    <div id="emergencyRequestsContainer" class="portlet-body" style="height: auto;">
				<div id="throbber1" style="display:none;">
				    <asset:image src="spinner2.gif" alt="Loading"/>
				</div>
	        </div>
	    </div>    
	    <div id="map-modal" class="modal container fade" tabindex="-1" data-height="500px" data-width="80%"></div>
	         
    </body>
</html>