<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
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
		updatePage();
		lastUpdateTime();
		serverTime();
		href();
		window.setInterval(updatePage, 5000);
		window.setInterval(lastUpdateTime, 5000);
		window.setInterval(serverTime, 1000);
	}


	$(document).ready(onLoad);
</script>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
						<li><a class=""
							href="${pageContext.request.contextPath}"><span
								aria-hidden="true" class="se7en-home"></span>ATM Availability</a></li>
						<li><a class="current"
							href="${pageContext.request.contextPath}AtmStatus"><span
								aria-hidden="true" class="se7en-charts"></span>ATM Status</a></li>
						<li><a href="${pageContext.request.contextPath}TxnSummary"> <span aria-hidden="true"
								class="se7en-feed"></span>Transaction Summary
							</a></li>
						<li class="dropdown"><a data-toggle="dropdown" href="#">
                		<span aria-hidden="true" class="se7en-tables"></span>Preventive Maintenance<b class="caret"></b></a>
                			  <ul class="dropdown-menu">
                			      <li>
                   					 <a href="${pageContext.request.contextPath}PmPage">Upload Schedule</a>
                  				  </li>
                  				  <li>
                   					 <a href="${pageContext.request.contextPath}PmPageOpen">Open Status</a>
                  				  </li>
                  				  <li>
                   					 <a href="${pageContext.request.contextPath}PmPageClosed">Closed Status</a>
                  				  </li>
                  				</ul>
                  		</li>
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
			<!-- First Row -->
		<div class="row">
          <div class="col-lg-6">
            <div class="widget-container stats-container fluid-height clearfix">
              <div class="col-md-6 padded" >
                <div class="text" style="padding-top:0.7em; color:#007aff">
                  <b><i>STATUS UPDATE</i></b>
                </div>
                <div class="text" style="color:#007aff">
                 <b> <i class="fa fa-calendar"></i> <span id="lastupdatetime"></span></b>
                </div>
                <div class="text" style="padding-top:0.5em; color:#007aff">
                 <b><i> DATE TIME SERVER</i></b>
                </div>
                <div class="text" style="padding-bottom:15px; color:#007aff">
                  <b><i class="fa fa-calendar"></i> 
                  <span id="servertime"></span>
                  </b>
                </div>
              </div>
              <div class="col-md-6">
                <div class="number">
                  <div class="fa fa-globe"></div>
                  <span id="devicetotal"> 0</span>
                </div>
                <div class="text" style="padding-bottom:15px">
                  Total ATM
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-md-12 col-sm-12">
            <div class="widget-container stats-container fluid-height clearfix">
              <div class="col-md-12 col-lg-4 col-sm-12">
              
              <a id="inserviceurl" href = "${pageContext.request.contextPath}TidDetail?terminalStatus=inservice" target="_blank">
                <div class="number" style="color:#60c560">
                  <span id="inservice"> 0</span>
                </div>
                <div class="text" style="padding-bottom:15px">
                  <b><font style="color:#60c560;"> IN SERVICE</font></b> 
                </div>
                </a>
              </div>
              <div class="col-md-12 col-lg-4 col-sm-12">
              <a id="normalurl" href = "${pageContext.request.contextPath}TidDetail?terminalStatus=normal" target="_blank">
                <div class="number" style="color:#60c560">
                  <span id="normal">0</span>
                </div>
                <div class="text" style="padding-bottom:15px">
                  <b><font style="color:#60c560">NORMAL <i class="fa fa-caret-up"></i></font></b> 
                </div>
                </a>
              </div>
              <div class="col-md-12 col-lg-4 col-sm-12">
              <a id = "sleepurl" href = "${pageContext.request.contextPath}TidDetail?terminalStatus=sleep" target="_blank">
                <div class="number" style="color:#60c560">
                  <span id="sleep">0</span>
                </div>
                <div class="text" style="padding-bottom:15px">
                 <b><font style="color:#60c560"> SLEEP <i class="fa fa-moon-o"></i></font></b> 
                </div>
                </a>
              </div>
            </div>
          </div>
        </div>
	<!-- Second row -->
	<div class="row">
          <!-- Pie Graph 1 -->
          <div class="col-lg-6 col-md-12 col-sm-12">
           <div class="widget-container stats-container fluid-height clearfix" >
              <div class="col-lg-4 col-md-4 col-sm-12" style="height :200px;">
              <a id="outofserviceurl" href = "${pageContext.request.contextPath}TidDetail?terminalStatus=outofservice" target="_blank">
                <div style="color:red">
    				          <p style="padding-top:40px;">
                          OUT OF SERVICE
                     </p>
                     <i class="fa fa-caret-down" style="font-size: 2em;"></i>
                     <div class="number" style="font-size: 2em; color:red">
                          <b><span id="outofservice">0</span></b>
                     </div>
  				      </div>
  				 </a>
              </div>
           <div class="col-md-2" style="height :200px; background-color:#e54c42;">
              <a id="inprogressurl" href = "${pageContext.request.contextPath}TidDetail?terminalStatus=inprogress" target="_blank" style="background-color:#e54c42">
                <div style="color:white; background-color:#e54c42">
				          <p style="padding-top:40px; font-size: 0.9em;">
                     IN PROGRESS
                 </p>
                 <i class="fa fa-spinner" style="font-size: 2em;"></i>
                 <div class="number" style="font-size: 2em; color:white">
                      <b><span id="inprogress">0</span></b>
                 </div>
				</div>
				</a>
              </div>
              <div class="col-md-2" style="height :200px; background-color:#e54c42;">
              <a id="maintenanceurl" href = "${pageContext.request.contextPath}TidDetail?terminalStatus=maintenance" target="_blank" style="background-color:#e54c42">
                <div style="color:white; background-color:#e54c42;">
				<p style="padding-top:40px; font-size: 0.9em; center">
                     MAINTENANCE
                 </p>
                 <i class="fa fa-wrench" style="font-size: 2em;"></i>
                 <div class="number" style="font-size: 2em; color:white">
                     <b><span id="maintenance">0</span></b>
                 </div>
				        </div>
				 </a>
              </div>
			    <div class="col-md-2" style="height :200px; background-color:#e54c42;">
			    <a id="restockurl" href = "${pageContext.request.contextPath}TidDetail?terminalStatus=restock" target="_blank" style="background-color:#e54c42">
                <div style="color:white; background-color:#e54c42;">
				          <p style="padding-top:40px; font-size: 0.9em;">
                     RE STOCK
                  </p>
                 <i class="fa fa-stack-overflow" style="font-size: 2em;"></i>
                 <div class="number" style="font-size: 2em; color:white">
                      <b><span id="restock">0</span></b>
                 </div>
				        </div>
				 </a>
              </div>
			  <div class="col-md-2">
			  <a id="outofcashurl" href = "${pageContext.request.contextPath}TidDetail?terminalStatus=outofcash" target="_blank">
               <div style="color:red">
				          <p style="padding-top:40px; font-size: 0.9em;" style="height :200px;">
                     OUT OF CASH
                 </p>
                 <i class="fa fa-money" style="font-size: 2em;"></i>
                 <div class="number" style="font-size: 2em; color:red">
                      <b><span id="outofcash">0</span></b>
                 </div>
				</div>
				</a>
              </div>
            </div>
          </div>
		        <div class="col-lg-6">
            <div class="widget-container stats-container fluid-height clearfix">
              <div class="col-md-2" style="height :200px;">
              <a id="hardwareurl" href = "${pageContext.request.contextPath}TidDetail?terminalStatus=hardware" target="_blank">
                <div style="color:red">
				          <p style="padding-top:40px; font-size: 0.9em;">
                     HARDWARE
                 </p>
                 <i class="fa fa-hdd-o" style="font-size: 2em;"></i>
                 <div class="number" style="font-size: 2em; color:red">
                      <b><span id="hardware">0</span></b>
                 </div>
				      </div>
				      </a>
              </div>
              <div class="col-md-2" style="height :200px;">
              <a id="flmurl" href = "${pageContext.request.contextPath}TidDetail?terminalStatus=flm" target="_blank">
                 <div style="color:red">
				          <p style="padding-top:40px; font-size: 0.9em;">
                     FLM
                 </p>
                 <i class="fa fa-group" style="font-size: 2em;"></i>
                 <div class="number" style="font-size: 2em; color:red">
                      <b><span id="flm">0</span></b>
                 </div>
				        </div>
				</a>
              </div>
			   <div class="col-md-2" style="height :200px;">
			   <a id="commurl" href = "${pageContext.request.contextPath}TidDetail?terminalStatus=comm" target="_blank">        
                <div style="color:red">
				          <p style="padding-top:40px; font-size: 0.9em;">
                     COMM.
                 </p>
                 <i class="fa fa-signal" style="font-size: 2em;"></i>
                 <div class="number" style="font-size: 2em; color:red">
                 <b><span id="comm">0</span></b> 
                 </div>
				</div>
				</a>
              </div>
              <div class="col-md-2" style="height :200px;">
              <a id="infrastructureurl" href = "${pageContext.request.contextPath}TidDetail?terminalStatus=infrastructure" target="_blank">
                 <div style="color:red">
				          <p style="padding-top:40px; font-size: 0.9em;">
                     INFRA.
                 </p>
                 <i class="fa fa-building-o" style="font-size: 2em;"></i>
                 <div class="number" style="font-size: 2em; color:red">
               
                      <b><span id="infrastructure">0</span></b>
                 </div>
				</div>
				</a>
              </div>
			  <div class="col-md-2" style="height :200px;">
               <a id="electricityurl" href = "${pageContext.request.contextPath}TidDetail?terminalStatus=electricity" target="_blank">
                <div style="color:red">
				        <p style="padding-top:40px; font-size: 0.9em;">
                     ELECTRICITY
                 </p>
                 <i class="fa fa-bolt" style="font-size: 2em;"></i>
                 <div class="number" style="font-size: 2em; color:red">
                      <b><span id="electricity">0</span></b>
                 </div>
				 </div>
				 </a>
              </div>
			         <div class="col-md-2" style="height :200px;">
			     <a id="zerobalanceurl" href = "${pageContext.request.contextPath}TidDetail?terminalStatus=zerobalance" target="_blank">
                <div style="color:red">
				          <p style="padding-top:40px; font-size: 0.9em;">
                     ZEROBALANCE
                 </p>
                 <i class="fa fa-minus-circle" style="font-size: 2em;"></i>
                 <div class="number" style="font-size: 2em; color:red">
                      <b><span id="zerobalance">0</span></b>
                 </div>
				        </div>
				        </a>
              </div>
            </div>
          </div>
          <!-- End Pie Graph 1 -->
        </div>

	   <div class="row">
          <!-- Weather -->
          
		  <div class="col-md-12">
            <div class="widget-container  weather fluid-height clearfix">
              <div class="widget-content fluid-height clearfix" style="background:#999999">
                <div class="row text-center">
                
                  <div class="col-sm-6 col-md-4 col-lg-4" style="border-right:1px solid #dddddd; height :130px; min-height:130px">
                    <a id="inactiveurl" href = "${pageContext.request.contextPath}TidDetail?terminalStatus=inactive&&hier=" target="_blank">
                    <p style="padding-top:15px; color:white">
                      INACTIVE
                    </p>
                    <div class="fa fa-minus-circle" style="font-size:30px; center; color:white"></div><br>
                    
                    <div class="number" style="font-size: 2em; color:white">
                      <b><span id="inactive">0</span></b>
                    </div>
                    </a>
                  </div>
                  
                  <div class="col-md-2" style="border-right:1px solid #dddddd;height :130px; min-height:130px">
                  <a id="switchedoffurl" href = "${pageContext.request.contextPath}TidDetail?terminalStatus=switchedoff" target="_blank">
                    <p style="padding-top:15px; color:white">
                      SWITCHED OFF
                    </p>
                    <div class="fa fa-power-off" style="font-size:30px; center; color:white"></div><br>
                    <div class="number" style="font-size: 2em; color:white">
                      <b><span id="switchedoff">0</span></b>
                    </div>
                    </p>
                    </a>
                  </div>
                  <div class="col-md-2" style="border-right:1px solid #dddddd; height :130px; min-height:130px">
                   <a id="blgurl" href = "${pageContext.request.contextPath}TidDetail?terminalStatus=blg" target="_blank">
                   <p style="padding-top:15px; color:white">
                      BLG
                    </p>
                    <div class="fa fa-truck" style="font-size:30px; center; color:white"></div><br>
                    <div class="number" style="font-size: 2em; color:white">
                      <b><span id="blg">0</span></b>
                    </div>
                    </a>
                  </div>
                  <div class="col-md-2" style="border-right:1px solid #dddddd; height :130px; min-height:130px">
                  <a id="cadanganurl" href = "${pageContext.request.contextPath}TidDetail?terminalStatus=cadangan" target="_blank">
                     <p style="padding-top:15px; color:white">
                      CADANGAN
                    </p>
                    <div class="fa fa-briefcase" style="font-size:30px; center; color:white"></div><br>
                   <div class="number" style="font-size: 2em; color:white">
                      <b><span id="cadangan">0</span></b>
                    </div>
                    </a>
                  </div>
                  <div class="col-md-2">
                  <a id="forcemajeureurl" href = "${pageContext.request.contextPath}TidDetail?terminalStatus=forcemajeure" target="_blank">
                    <p style="padding-top:15px; color:white">
                      FORCE MAJEURE
                    </p>
                    <div class="fa fa-exclamation-triangle" style="font-size:30px; center; color:white"></div><br>
                    <div class="number" style="font-size: 2em; color:white">
                      <b><span id="forcemajeure">0</span></b>
                    </div>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- end Weather --><!-- Bar Graph -->
          
          <!-- End Bar Graph -->
        </div>


	</div>
	</div>
	<div class="style-selector">
		<div class="style-selector-container">
			<h2>Pilih Cabang</h2>
			<select onchange="updatePage(); href();" name="branch" id = "hier">
				<option value="ALL">ALL</option>
				<option value="WJK">WJK</option>
				<option value="WJB">WJB</option>
				<option value="WJY">WJY</option>
			</select>
			<div class="style-toggle closed">
				<span aria-hidden="true" class="se7en-gear"></span>
			</div>
		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}static/javascripts/chartli.min.js"></script>

	<script type="text/javascript">	
	
	function href(){
		$("#inserviceurl").attr("href", "${pageContext.request.contextPath}TidDetail?terminalStatus=inservice&&hier="+$('#hier option:selected').text());
		$("#normalurl").attr("href", "${pageContext.request.contextPath}TidDetail?terminalStatus=normal&&hier="+$('#hier option:selected').text());
		$("#sleepurl").attr("href", "${pageContext.request.contextPath}TidDetail?terminalStatus=sleep&&hier="+$('#hier option:selected').text());
		$("#outofserviceurl").attr("href", "${pageContext.request.contextPath}TidDetail?terminalStatus=outofservice&&hier="+$('#hier option:selected').text());
		$("#inprogressurl").attr("href", "${pageContext.request.contextPath}TidDetail?terminalStatus=inprogress&&hier="+$('#hier option:selected').text());
		$("#maintenanceurl").attr("href", "${pageContext.request.contextPath}TidDetail?terminalStatus=maintenance&&hier="+$('#hier option:selected').text());
		$("#restockurl").attr("href", "${pageContext.request.contextPath}TidDetail?terminalStatus=restock&&hier="+$('#hier option:selected').text());
		$("#outofcashurl").attr("href", "${pageContext.request.contextPath}TidDetail?terminalStatus=outofcash&&hier="+$('#hier option:selected').text());
		$("#hardwareurl").attr("href", "${pageContext.request.contextPath}TidDetail?terminalStatus=hardware&&hier="+$('#hier option:selected').text());
		$("#flmurl").attr("href", "${pageContext.request.contextPath}TidDetail?terminalStatus=flm&&hier="+$('#hier option:selected').text());
		$("#commurl").attr("href", "${pageContext.request.contextPath}TidDetail?terminalStatus=comm&&hier="+$('#hier option:selected').text());
		$("#infrastructureurl").attr("href", "${pageContext.request.contextPath}TidDetail?terminalStatus=infrastructure&&hier="+$('#hier option:selected').text());
		$("#electricityurl").attr("href", "${pageContext.request.contextPath}TidDetail?terminalStatus=electricity&&hier="+$('#hier option:selected').text());
		$("#zerobalanceurl").attr("href", "${pageContext.request.contextPath}TidDetail?terminalStatus=zerobalance&&hier="+$('#hier option:selected').text());
		$("#inactiveurl").attr("href", "${pageContext.request.contextPath}TidDetail?terminalStatus=inactive&&hier="+$('#hier option:selected').text());
		$("#switchedoffurl").attr("href", "${pageContext.request.contextPath}TidDetail?terminalStatus=switchedoff&&hier="+$('#hier option:selected').text());
		$("#blgurl").attr("href", "${pageContext.request.contextPath}TidDetail?terminalStatus=blg&&hier="+$('#hier option:selected').text());
		$("#cadanganurl").attr("href", "${pageContext.request.contextPath}TidDetail?terminalStatus=cadangan&&hier="+$('#hier option:selected').text());
		$("#forcemajeureurl").attr("href", "${pageContext.request.contextPath}TidDetail?terminalStatus=forcemajeure&&hier="+$('#hier option:selected').text());
	}
	
	
	function updatePage() {
		var x = $('#hier option:selected').text();
		$.getJSON("updateDataBox?hierarchy="+x, function(data) {
			$("#devicetotal").text(data[0].devicetotal);
			$("#inservice").text(data[0].inservice);
			$("#normal").text(data[0].normal);
			$("#sleep").text(data[0].sleep);
			$("#outofservice").text(data[0].outofservice);
			$("#inprogress").text(data[0].inprogress);
			$("#maintenance").text(data[0].maintenance);
			$("#restock").text(data[0].restock);
			$("#outofcash").text(data[0].outofcash);
			$("#hardware").text(data[0].hardware);
			$("#flm").text(data[0].flm);
			$("#comm").text(data[0].comm);
			$("#infrastructure").text(data[0].infrastructure);
			$("#electricity").text(data[0].electricity);
			$("#zerobalance").text(data[0].zerobalance);
			$("#inactive").text(data[0].inactive);
			$("#switchedoff").text(data[0].switchedoff);
			$("#blg").text(data[0].blg);
			$("#cadangan").text(data[0].cadangan);
			$("#forcemajeure").text(data[0].forcemajeure);
						
		});
	}
	
	function serverTime() {
		$.getJSON("serverTime", function(data) {
			$("#servertime").text(data);		
		});
	}
	
	function lastUpdateTime(){
		$.getJSON("serverTime", function(data) {
			$("#lastupdatetime").text(data);		
		});
	}
        
		//global var
		//TODO change global var to local
	
		
	    $(".style-selector select[name='branch']").change(function() {
	      	if ($(".style-selector select[name='branch'] option:selected").val() === "boxed") {
	            $(function() {console.log("enggaklah")});
	 	    }
	     });
	     $(".style-selector select[name='number']").change(function() {
	    	 urlPar=$('#number').val();
	      });
	        
	</script>

	<style type="text/css">

		#chartli1 {
			padding-top: -30px;
		}
	</style>


</body>
</html>