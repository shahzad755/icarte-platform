<%@page import="com.luckyitsol.model.Role"%>
<%@page import="com.luckyitsol.model.User"%>
<%@page import="com.luckyitsol.model.PlatformSettings"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<style>

.ui-select {
  margin-top: 0;
  margin-bottom: 0;
  position: relative;
}
#report-button {
    border-radius: 0px;
	height: 3.1em;
}
#report-button > span{
   padding-top: 1em

}

#img_header{
	display: table;
	width: 100%;
}

.img_logo{
    display: table-cell;
}

.img_main{
  vertical-align: middle;
}

#tutorial_video{

    left: 50%;
    transform: translateX(-50%) translateY(-50%);
    
	
/* 
	text-align: center;
above was woring

	position: absolute;
    left: 50%;
    transform: translateX(-50%) translateY(-50%);
this above one also working, but button get on top of logo
*/
}

</style>
<div data-role="header" data-position="fixed" style="background:#FFF;"> 

	<div id="img_header">
	<span class="img_logo">
		<img class="img_main" src="<c:url value='/resources/images/logo.png' />" /> 
	</span>
    <%
		if(session.getAttribute("user") != null) {
			if(((User)session.getAttribute("user")).getRole() == Role.ROLE_USER
					&& ((PlatformSettings)session.getAttribute("platformSettings")).getAdUrl() != null
					)
			{
	%> 
		<span id="tutorial_video">
		  	<a data-ajax="false" href="<c:url value='/protected/videoView/view' />"
		  		target="_blank" style ="text-decoration: none !important;">
		  		<span
		  			class="ui-btn ui-shadow ui-corner-all"
		  			style=" background: #FF0000; color: #FFFFFF; font-weight: bold; padding: 13px; 
		  			text-shadow: 0 1px 0 #444444;">
					
		  			<spring:message code="platform.video.tutorial.label"/>
		  		</span>
		  	</a>
		</span>
		
	<%
			}
		}
	%>

	</div>

    <div data-role="navbar" data-iconpos="top">
      <ul>
        <li><a data-ajax="false" class="linkIdentifierClass" id="homeLink" href="<c:url value='/protected/webdashboard' />" data-icon="home" >HOME</a></li>
        <li><a data-ajax="false" class="linkIdentifierClass" href="<c:url value='/index.html#advertise'/>" data-icon="eye"  >ADVERTISE</a></li>
        <li><a data-ajax="false" class="linkIdentifierClass" href="<c:url value='/index.html#viewads'/>" data-icon="grid">VIEW ADS</a></li>
        <%
				if(session.getAttribute("user") != null) {
					if(((User)session.getAttribute("user")).getRole() == Role.ROLE_ADMIN)
					{
			%> 
				<li><a data-ajax="false" data-icon="user" class="linkIdentifierClass" href="<c:url value='/protected/dashboard' />">Member Area</a></li>
			<%
					}
					else if(((User)session.getAttribute("user")).getRole() == Role.ROLE_USER)
					{
			%>

        <li>
        <!-- <a data-ajax="false" class="linkIdentifierClass" href="#"> -->
        <div id="reportsnav">
        <select name="report" id="report"  style="height: 3.1em;">
				<option style="padding-top: 1.0em;" value="#" selected disabled><spring:message code="subscriberHistoryReport.nav.reports"/></option>
				<option value="<c:url value='/protected/report/subscriberEarningsReport'/>"><spring:message code="subscriberHistoryReport.nav.earning"/></option>
				<option value="<c:url value='/protected/report/subscriberAdHistoryReport'/>"><spring:message code="subscriberHistoryReport.nav.history"/></option>
				<option value="<c:url value='/protected/report/subscriberReferralsEarningReport'/>"><spring:message code="subscriberHistoryReport.nav.referralEarning"/></option>
				
		   </select>
		   <!-- </a> -->
		   </div>
		   </li>
			
			
<%-- 			        <li><a data-ajax="false" class="linkIdentifierClass" href="<c:url value='/protected/report/subscriberEarningsReport'/>" data-icon="grid"><spring:message code="subscriberHistoryReport.nav.earning"/></a></li>
			        <li><a data-ajax="false" class="linkIdentifierClass" href="<c:url value='/protected/report/subscriberAdHistoryReport'/>" data-icon="grid"><spring:message code="subscriberHistoryReport.nav.history"/></a></li>
 --%>			
<%-- 				<li><a data-ajax="false" data-icon="user" class="linkIdentifierClass" href="<c:url value='/protected/webdashboard' />">Member Area</a></li>
 --%>			<%
					}
			%>
			
				<li><a data-ajax="false" data-icon="user" class="linkIdentifierClass" href="<c:url value='/logout' />">Logout</a></li>
			<% 
				} else {
				
			%>	
				<li><a data-ajax="false" data-icon="user" class="linkIdentifierClass" href="<c:url value='/login' />">Login</a></li>
			<%
				}
			%>
        
         
      </ul>
    </div>
    <!-- /navbar --> 
  </div>
  <script type="text/javascript">
			 var urlmenu = document.getElementById( 'report' );
			 urlmenu.onchange = function() {
			  location.href = this.options[ this.selectedIndex ].value; 
			 };
			</script>
  <!-- /header --> 
