<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>ProTitan - Home</title>
<link href="${pageContext.request.contextPath}static/fonts/fonts.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/bootstrap.min.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/font-awesome.min.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/se7en-font.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/isotope.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/jquery.fancybox.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/fullcalendar.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/wizard.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/select2.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/morris.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/datatables.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/datepicker.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/timepicker.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/colorpicker.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/bootstrap-switch.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/bootstrap-editable.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/daterange-picker.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/typeahead.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/summernote.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/ladda-themeless.min.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/social-buttons.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/pygments.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/style.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/color/green.css"
	media="all" rel="alternate stylesheet" title="green-theme"
	type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/color/orange.css"
	media="all" rel="alternate stylesheet" title="orange-theme"
	type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/color/magenta.css"
	media="all" rel="alternate stylesheet" title="magenta-theme"
	type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/color/gray.css"
	media="all" rel="alternate stylesheet" title="gray-theme"
	type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/jquery.fileupload-ui.css"
	media="screen" rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}static/stylesheets/dropzone.css"
	media="screen" rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}static/javascripts/jquery-3.1.1.slim.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/jquery-ui.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/bootstrap.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/raphael.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/selectivizr-min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/jquery.mousewheel.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/jquery.vmap.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/jquery.vmap.sampledata.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/jquery.vmap.world.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/jquery.bootstrap.wizard.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/fullcalendar.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/gcal.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/jquery.dataTables.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/datatable-editable.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/jquery.easy-pie-chart.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/excanvas.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/jquery.isotope.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/isotope_extras.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/modernizr.custom.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/jquery.fancybox.pack.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/select2.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/styleswitcher.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/wysiwyg.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/typeahead.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/summernote.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/jquery.inputmask.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/jquery.validate.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/bootstrap-fileupload.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/bootstrap-datepicker.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/bootstrap-timepicker.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/bootstrap-colorpicker.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/bootstrap-switch.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/typeahead.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/spin.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/ladda.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/moment.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/mockjax.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/bootstrap-editable.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/xeditable-demo-mock.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/xeditable-demo.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/address.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/daterange-picker.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/date.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/morris.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/skycons.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/fitvids.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/jquery.sparkline.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/dropzone.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/main.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}static/javascripts/respond.js"
	type="text/javascript"></script>
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
	name="viewport">

<script type="text/javascript">
	function onLoad() {
		//updateComponentDetail();
		//window.setInterval(updateComponentDetail, 3000);
	}

	function updateComponentDetail() {
		var url = "updateTidDetail?tidStatus=";
		var urlPar = '${tidStatus}';
		var fullUrl = url + urlPar;
		console.log(fullUrl);

		$.getJSON(fullUrl, function(data) {

			var dataSize = Object.keys(data).length;
			var write;

			for (i = 0; i < dataSize; i++) {

				/*	write += '<tr><td>' + data[i].deviceid + '</td><td>'
							+ data[i].messagetext + '</td><td>' + data[i].location
							+ '</td><td>' + data[i].vendor + '</td><td>'
							+ data[i].totaltime + '</td></tr>';*/

				if (i == 0) {
					write = "[";
				}
				write += '["' + data[i].deviceid + '","' + data[i].lokasi
						+ '","' + data[i].wilayah + '","' + data[i].cabang
						+ '","' + data[i].vendor + '","' + data[i].jarkom 
						+ '","' + data[i].flm + '"]';

				if (i != dataSize - 1) {
					write += ",";
				}

				if (i == dataSize - 1) {
					write += "]";
				}
			}
			//console.log(write);
			//$("#FillThis").html(write);
		});
	}

	$(document).ready(onLoad);
</script>
</head>
<body class="page-header-fixed bg-3">
	<div class="modal-shiftfix">
		<!-- Navigation -->
		<div class="navbar navbar-fixed-top scroll-hide closed">
			<div class="container-fluid top-bar">
				<div class="pull-right">
					<ul class="nav navbar-nav pull-right">
						<li class="dropdown notifications hidden-xs"><a
							class="dropdown-toggle" data-toggle="dropdown" href="#"><span
								aria-hidden="true" class="se7en-flag"></span>
								<div class="sr-only">Notifications</div>
								<p class="counter">4</p> </a>
							<ul class="dropdown-menu">
								<li><a href="#">
										<div class="notifications label label-info">New</div>
										<p>New user added: Jane Smith</p>
								</a></li>
								<li><a href="#">
										<div class="notifications label label-info">New</div>
										<p>Sales targets available</p>
								</a></li>
								<li><a href="#">
										<div class="notifications label label-info">New</div>
										<p>New performance metric added</p>
								</a></li>
								<li><a href="#">
										<div class="notifications label label-info">New</div>
										<p>New growth data available</p>
								</a></li>
							</ul></li>
						<li class="dropdown messages hidden-xs"><a
							class="dropdown-toggle" data-toggle="dropdown" href="#"><span
								aria-hidden="true" class="se7en-envelope"></span>
								<div class="sr-only">Messages</div>
								<p class="counter">3</p> </a>
							<ul class="dropdown-menu messages">
								<li><a href="#"> <img width="34" height="34"
										src="images/avatar-male2.png" />Could we meet today? I
										wanted...
								</a></li>
								<li><a href="#"> <img width="34" height="34"
										src="images/avatar-female.png" />Important data needs your
										analysis...
								</a></li>
								<li><a href="#"> <img width="34" height="34"
										src="images/avatar-male2.png" />Buy Se7en today, it's a great
										theme...
								</a></li>
							</ul></li>
						<li class="dropdown user hidden-xs"><a data-toggle="dropdown"
							class="dropdown-toggle" href="#"> <img width="34" height="34"
								src="images/avatar-male.jpg" />John Smith<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#"> <i class="fa fa-user"></i>My Account
								</a></li>
								<li><a href="#"> <i class="fa fa-gear"></i>Account
										Settings
								</a></li>
								<li><a href="login1.html"> <i class="fa fa-sign-out"></i>Logout
								</a></li>
							</ul></li>
					</ul>
				</div>
				<button class="navbar-toggle">
					<span class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
				<a class="logo" href="index.html">se7en</a>
				<form class="navbar-form form-inline col-lg-2 hidden-xs">
					<input class="form-control" placeholder="Search" type="text">
				</form>
			</div>
			<div class="container-fluid main-nav clearfix">
				<div class="nav-collapse">
					<ul class="nav">
						<li><a class="current"
							href="${pageContext.request.contextPath}"><span
								aria-hidden="true" class="se7en-home"></span>Dashboard</a></li>
						<!-- 	<li><a href="social.html"> <span aria-hidden="true"
								class="se7en-feed"></span>Social Feed
						</a></li>
						<li class="dropdown"><a data-toggle="dropdown" href="#">
								<span aria-hidden="true" class="se7en-star"></span>UI Features<b
								class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a href="buttons.html"> <span
										class="notifications label label-warning">New</span>
										<p>Buttons</p></a></li>
								<li><a href="fontawesome.html"> <span
										class="notifications label label-warning">New</span>
										<p>Font Awesome Icons</p></a></li>
								<li><a href="glyphicons.html"> <span
										class="notifications label label-warning">New</span>
										<p>Glyphicons</p></a></li>
								<li><a href="components.html">Components</a></li>
								<li><a href="widgets.html">Widgets</a></li>
								<li><a href="typo.html">Typography</a></li>
								<li><a href="grid.html">Grid Layout</a></li>
							</ul></li>
						<li class="dropdown"><a data-toggle="dropdown" href="#">
								<span aria-hidden="true" class="se7en-forms"></span>Forms<b
								class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a href="form-components.html">Form Components</a></li>
								<li><a href="form-advanced.html">Advanced Forms</a></li>
								<li><a href="xeditable.html"> <span
										class="notifications label label-warning">New</span>
										<p>X-Editable</p></a></li>
								<li><a href="file-upload.html">
										<div class="notifications label label-warning">New</div>
										<p>Multiple File Upload</p>
								</a></li>
								<li><a href="dropzone-file-upload.html">
										<div class="notifications label label-warning">New</div>
										<p>Dropzone File Upload</p>
								</a></li>
							</ul></li>
						<li class="dropdown"><a data-toggle="dropdown" href="#">
								<span aria-hidden="true" class="se7en-tables"></span>Tables<b
								class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a href="tables.html">Basic tables</a></li>
								<li><a href="datatables.html">DataTables</a></li>
								<li><a href="datatables-editable.html">
										<div class="notifications label label-warning">New</div>
										<p>Editable DataTables</p>
								</a></li>
							</ul></li>
						<li><a href="charts.html"> <span aria-hidden="true"
								class="se7en-charts"></span>Charts
						</a></li>
						<li class="dropdown"><a data-toggle="dropdown" href="#">
								<span aria-hidden="true" class="se7en-pages"></span>Pages<b
								class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a href="chat.html"> <span
										class="notifications label label-warning">New</span>
										<p>Chat</p></a></li>
								<li><a href="calendar.html">Calendar</a></li>
								<li><a href="timeline.html"> <span
										class="notifications label label-warning">New</span>
										<p>Timeline</p></a></li>
								<li><a href="login1.html"> <span
										class="notifications label label-warning">New</span>
										<p>Login 1</p></a></li>
								<li><a href="login2.html">Login 2</a></li>
								<li><a href="signup1.html"> <span
										class="notifications label label-warning">New</span>
										<p>Sign Up 1</p></a></li>
								<li><a href="messages.html"> <span
										class="notifications label label-warning">New</span>
										<p>Messages/Inbox</p></a></li>
								<li><a href="pricing.html"> <span
										class="notifications label label-warning">New</span>
										<p>Pricing Tables</p></a></li>
								<li><a href="signup2.html">Sign Up 2</a></li>
								<li><a href="invoice.html"> <span
										class="notifications label label-warning">New</span>
										<p>Invoice</p></a></li>
								<li><a href="faq.html"> <span
										class="notifications label label-warning">New</span>
										<p>FAQ</p></a></li>
								<li><a href="filters.html">Filter Results</a></li>
								<li><a href="404-page.html">404 Page</a></li>
								<li><a href="500-page.html"> <span
										class="notifications label label-warning">New</span>
										<p>500 Error</p></a></li>
							</ul></li>
						<li><a href="gallery.html"> <span aria-hidden="true"
								class="se7en-gallery"></span>Gallery
						</a></li> -->
					</ul>
				</div>
			</div>
		</div>
		<!-- End Navigation -->
		<div class="container-fluid main-content">

			<div class="row">
				<div class="col-lg-12">
					<div class="widget-container fluid-height clearfix">
						<div class="heading">
							<i class="fa fa-table"></i> ATM Status : 
							<c:if test="${terminalStatus=='inservice'}">In-Service</c:if>
							<c:if test="${terminalStatus=='normal'}">Normal</c:if>
							<c:if test="${terminalStatus=='sleep'}">Sleep</c:if>
							<c:if test="${terminalStatus=='outofservice'}">Out of Service</c:if>
							<c:if test="${terminalStatus=='inprogress'}">In Progress</c:if>
							<c:if test="${terminalStatus=='maintenance'}">Maintenance</c:if>
							<c:if test="${terminalStatus=='restock'}">Re Stock</c:if>
							<c:if test="${terminalStatus=='outofcash'}">Out of Cash</c:if>
							<c:if test="${terminalStatus=='hardware'}">Hardware Error</c:if>
							<c:if test="${terminalStatus=='flm'}">FLM</c:if>
							<c:if test="${terminalStatus=='comm'}">Communication Error</c:if>
							<c:if test="${terminalStatus=='infrastructure'}">Infrastructure</c:if>
							<c:if test="${terminalStatus=='electricty'}">Electricity</c:if>
							<c:if test="${terminalStatus=='zerobalance'}">Zero Balance</c:if>
							<c:if test="${terminalStatus=='inactive'}">Inactive</c:if>
							<c:if test="${terminalStatus=='switchedoff'}">Switched Off</c:if>
							<c:if test="${terminalStatus=='blg'}">BLG</c:if>
							<c:if test="${terminalStatus=='cadangan'}">Cadangan</c:if>
							<c:if test="${terminalStatus=='forcemajeure'}">Force Majeure</c:if> &nbsp;
							<i class="fa fa-table"></i> Wilayah : <c:out value="${hier}"></c:out>
						</div>
						<div class="widget-content padded clearfix">

							<table class="table table-bordered table-striped" id="dataTable1">

								<thead>
									<tr>
									<c:if test="${terminalStatus=='hardware'}">
										<th>Terminal ID</th>
										<th>Hardware</th>
										<th>Location</th>
										<th class="hidden-xs">Wilayah</th>
										<th>Cabang</th>
										<th>Vendor</th>
										<th class="hidden-xs">flm</th>
									</c:if>
									<c:if test="${terminalStatus!='hardware'}">
										<th>Terminal ID</th>
										<th>Location</th>
										<th class="hidden-xs">Wilayah</th>
										<th>Cabang</th>
										<th>Vendor</th>
										<th class="hidden-xs">flm</th>
									</c:if>
										
									</tr>
								</thead>
								<tbody>
									<c:forEach var="tidDetail" items="${tidDetail}">
										<tr>
											<td><c:out value="${tidDetail.deviceid}"></c:out></td>
											<c:if test="${terminalStatus=='hardware'}">
											<td><c:out value="${tidDetail.hardware}"></c:out></td>
											</c:if>
											<c:if test="${terminalStatus!='hardware'}">
											</c:if>
											<td><c:out value="${tidDetail.lokasi}"></c:out></td>
											<td class="hidden-xs"><c:out value="${tidDetail.wilayah}"></c:out></td>
											<td><c:out value="${tidDetail.cabang}"></c:out></td>
											<td><c:out value="${tidDetail.vendor}"></c:out></td>
											<td class="hidden-xs"><c:out value="${tidDetail.flm}"></c:out></td>
										</tr>
									</c:forEach>

								</tbody>

							</table>
						</div>
					</div>
				</div>
			</div>

		</div>
	<script type = "text/javascript">
	 function reloadPage(){
		 var url = window.location.href;
		 
	 }

</script>
</body>

</html>

