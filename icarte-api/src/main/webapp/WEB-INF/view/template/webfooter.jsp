<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.Marketing_Footer .footer {
	padding: 25px 0;
}

.Marketing_Footer {
	color: #94999c;
	text-align: center;
}

.Marketing_Footer .links {
	display: inline-block;
}

.Marketing_Footer .links li {
	display: inline;
	list-style-type: none;
	padding-right: 20px;
	float: left;
	font-size: 12px;
	font-weight: normal;
}

.Marketing_Footer .links li a {
	color: white;
	font-weight: normal;
	text-decoration: none;
	font-size: 13px;
}

.Marketing_Footer .bar {
	font-size: 14px;
	padding: 0 10px;
}

.Marketing_Footer .fine-print {
	color: #b8c3c9;
	font-size: 12px;
	margin: 20px 0 0;
}
</style>
<!-- footer -->
<!-- data-position="fixed" -->
<!-- 
  <div data-role="footer" data-position="fixed">
    <h4>Powered by Lumlim</h4>
  </div>
  -->
<div class="Marketing_Footer">
	<div class="footer" data-role="footer" data-position="fixed">
		<ul class="links">
			<li><a data-ajax="false" href="/">Home</a></li>
			<li><a data-ajax="false" href="<c:url value='/index/support' />">Support</a></li>
			<li><a data-ajax="false" href="<c:url value='/index/help' />">Help</a></li>
			<li><a data-ajax="false"
				href="<c:url value='/index/privacypolicy' />">Privacy Policy</a></li>
			<li><a data-ajax="false" href="<c:url value='/protected/support/termsCondition' />">Terms of Use</a></li>
			<li><a data-ajax="false" href="<c:url value='/protected/support/faqs' />">Frequently Asked Questions</a></li>

		</ul>

		<p class="fine-print">Powered by Lumlim. All rights reserved.</p>
	</div>
</div>
<!-- footer -->