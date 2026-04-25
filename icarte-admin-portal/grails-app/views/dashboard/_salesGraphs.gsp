		<div class="portlet light bordered">
		    <div class="portlet-title">
		        <div class="caption">
		              <i class="icon-share font-red-sunglo"></i>
		              <span class="caption-subject font-red-sunglo bold uppercase">Sales Graphs</span>
		        </div>
		        <div class="tools">
		              <a title="" class="collapse" href="" data-original-title=""> </a>
		              <a title="" class="fullscreen" href="javascript:;" data-original-title=""> </a>
		              <a title="" id="btnReoloadSalesGraphs" class="reload" href="" data-original-title=""> </a>
		              <%--<a title="" class="remove" href="" data-original-title=""> </a>--%>
		     	</div>
			</div>
		    <div class="portlet-body" style="height: auto;">
		         <!-- BEGIN DASHBOARD STATS 3-->
		   		<div class="row">
		           <div  id="branchSalesDiv" class="col-md-6">
			           	<span class="text-primary caption-subject bold">Sales for Branch:</span>
		           		<span id="branchSales" class="uppercase">&nbsp;</span> 
		           		<span class="text-primary caption-subject bold">for Year: </span>
		           		<span id="branchSalesForYear">&nbsp;</span>
			           	<div>
				           	<span class="text-primary caption-subject bold">Total Sales: </span>
				           	<span id="branchMonthlyGrandTotal" class="text-primary caption-subject bold">&nbsp;</span>
			           	</div>
			           	<div>
				           	<span class="caption-subject font-red-sunglo bold">All Currency values are in </span>
				           	<span id="defaultCurrency" class="caption-subject font-red-sunglo bold">&nbsp;</span>
			           	</div>
			           	<canvas id="branchMonthlySalesChart" width="400" height="400"></canvas>
			           	 <div id="legend"></div>
		           </div>
		           <div id="restSalesDiv" class="col-md-6">
			           	<span class="text-primary caption-subject bold">Sales for Restaurant:</span>
		           		<span id="restSales" class="uppercase">&nbsp;</span> 
		           		<span class="text-primary caption-subject bold">for Year: </span>
		           		<span id="restSalesForYear">&nbsp;</span>
			           	<div>
				           	<span class="text-primary caption-subject bold">Total Sales: </span>
				           	<span id="restMonthlyGrandTotal" class="text-primary caption-subject bold">&nbsp;</span>
			           	</div>
			           	<div>
				           	<span class="caption-subject font-red-sunglo bold">All Currency values are in </span>
				           	<span id="defaultCurrencyRest" class="caption-subject font-red-sunglo bold">&nbsp;</span>
			           	</div>
			           	<canvas id="restMonthlySalesChart" width="400" height="400"></canvas>
		           </div>
		        </div>
				<div id="throbber7" style="display:none;">
				    <asset:image src="spinner3.gif" alt="Laoding"/>
				</div>
				<div id="throbber8" style="display:none;">
				    <asset:image src="spinner3.gif" alt="Laoding"/>
				</div>
		         <!-- END DASHBOARD STATS 3-->
	        </div>
	    </div>
