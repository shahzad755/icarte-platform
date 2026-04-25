		<div class="portlet light bordered">
		    <div class="portlet-title">
		        <div class="caption">
		              <i class="icon-share font-red-sunglo"></i>
		              <span class="caption-subject font-red-sunglo bold uppercase">Orders Outlook</span>
		        </div>
		        <div class="tools">
		              <a title="" class="collapse" href="" data-original-title=""> </a>
		              <a title="" class="fullscreen" href="javascript:;" data-original-title=""> </a>
		              <a title="" id="btnReoloadGeneralStats" class="reload" href="" data-original-title=""> </a>
		              <%--<a title="" class="remove" href="" data-original-title=""> </a>--%>
		     	</div>
			</div>
		    <div class="portlet-body" style="height: auto;">
		         <!-- BEGIN DASHBOARD STATS 1-->
		   		<div class="row">
		           <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		               <div id="dailyOrdersCountByBranch" class="dashboard-stat purple">
		                   <div class="visual">
		                       <i class="fa fa-shopping-cart"></i>
		                   </div>
		                   <div class="details">
		                       <div class="number">
		                            <span id="dailyOrdersCountByBranchVal" data-counter="counterup" data-value="">0</span> Order(s)
		                       </div>
		                       <div class="desc" id="dailyOrdersCountByBranchDesc"></div>
		                   </div>
		                   <div class="more">Total Order's today</div>
		                   <%--<a class="more" href="javascript:;"> View more
		                       <i class="m-icon-swapright m-icon-white"></i>
		                   </a>--%>
		               </div>
		           </div>
		           <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		               <div id="dailyOrdersCountByRest" class="dashboard-stat red">
		                   <div class="visual">
		                       <i class="fa fa-shopping-cart"></i>
		                   </div>
		                   <div class="details">
		                       <div class="number">
		                            <span id="dailyOrdersCountByRestVal" data-counter="counterup" data-value="">0</span> Order(s)
		                       </div>
		                       <div class="desc" id="dailyOrdersCountByRestDesc"></div>
		                   </div>
		                   <div class="more">Total Order's today (All Branches)</div>
		               </div>
		           </div>
		           <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		               <div id="totalItemCountByRest" class="dashboard-stat green-seagreen">
		                   <div class="visual">
		                       <i class="fa fa-shopping-cart"></i>
		                   </div>
		                   <div class="details">
		                       <div class="number">
		                            <span id="totalItemCountByRestVal" data-counter="counterup" data-value="">0</span> Item(s)
		                       </div>
		                       <div class="desc" id="totalItemCountByRestDesc"></div>
		                   </div>
		                   <div class="more">All items<%--<a style="color: #FFF" href="${request.contextPath}/item/index"> View more
		                       <span class="pull-right"><i class="m-icon-swapright m-icon-white"></i></span>
		                   </a>--%></div>
		               </div>
		           </div>
		        </div>
				<div id="throbber4" style="display:none;">
				    <asset:image src="spinner3.gif" alt="Laoding"/>
				</div>
				<div id="throbber5" style="display:none;">
				    <asset:image src="spinner3.gif" alt="Laoding"/>
				</div>
				<div id="throbber6" style="display:none;">
				    <asset:image src="spinner3.gif" alt="Laoding"/>
				</div>
	        </div>
	    </div>         
