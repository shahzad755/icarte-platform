		<div class="portlet light bordered">
		    <div class="portlet-title">
		        <div class="caption">
		              <i class="icon-share font-red-sunglo"></i>
		              <span class="caption-subject font-red-sunglo bold uppercase">Sales Outlook</span>
		        </div>
		        <div class="tools">
		              <a title="" class="collapse" href="" data-original-title=""> </a>
		              <a title="" class="fullscreen" href="javascript:;" data-original-title=""> </a>
		              <a title="" id="btnReoloadSalesStats" class="reload" href="" data-original-title=""> </a>
		              <%--<a title="" class="remove" href="" data-original-title=""> </a>--%>
		     	</div>
			</div>
		    <div class="portlet-body" style="height: auto;">
		         <!-- BEGIN DASHBOARD STATS 1-->
		   		<div class="row">
		           <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		               <div id="dailySalesByBranch" class="dashboard-stat blue">
		                   <div class="visual">
		                       <i class="fa fa-bar-chart-o"></i>
		                   </div>
		                   <div class="details">
		                       <div class="number">
		                           <span id="dailySalesByBranchVal" data-counter="counterup" data-value="">0</span> AED
		                       </div>
		                       <div class="desc" id="dailySalesByBranchDesc"></div>
		                   </div>
		                   <div class="more">Today's Sale</div>
		                   <%--<a class="more" href="javascript:;"> View more
		                       <i class="m-icon-swapright m-icon-white"></i>
		                   </a>--%>
		               </div>
		           </div>
		           <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		               <div id="currentMonthSalesByBranch" class="dashboard-stat green-jungle">
		                   <div class="visual">
		                       <i class="fa fa-bar-chart-o"></i>
		                   </div>
		                   <div class="details">
		                       <div class="number">
		                           <span id="currentMonthSalesByBranchVal" data-counter="counterup" data-value="">0</span> AED
		                       </div>
		                       <div class="desc" id="currentMonthSalesByBranchDesc"></div>
		                   </div>
		                   <div class="more">This Month's Sale</div>
		               </div>
		           </div>
		           <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		               <div id="dailySalesByRest" class="dashboard-stat red">
		                   <div class="visual">
		                       <i class="fa fa-bar-chart-o"></i>
		                   </div>
		                   <div class="details">
		                       <div class="number">
		                           <span id="dailySalesByRestVal" data-counter="counterup" data-value="">0</span> AED
		                       </div>
		                       <div class="desc" id="dailySalesByRestDesc"></div>
		                   </div>
		                   <div class="more">Today's Sale (All Branches)</div>
		               </div>
		           </div>
		       	</div>
				<div id="throbber1" style="display:none;">
				    <asset:image src="spinner3.gif" alt="Laoding"/>
				</div>
				<div id="throbber2" style="display:none;">
				    <asset:image src="spinner3.gif" alt="Laoding"/>
				</div>
				<div id="throbber3" style="display:none;">
				    <asset:image src="spinner3.gif" alt="Laoding"/>
				</div>
	        </div>
	    </div>
