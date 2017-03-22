<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script
	src="${pageContext.request.contextPath}/static/javascripts/jquery.js"
	type="text/javascript"></script>

<script type="text/javascript">
	function onLoad() {
		updatePage();
		updateTopTenFail();
		updateTpsCount();
		window.setInterval(updatePage, 5000);
		window.setInterval(updateTopTenFail, 5000);
		window.setInterval(updateTpsCount, 10000);
	}

	function updatePage() {
		$.getJSON("updateData", function(data) {

			$("#result2").text(data[0].receiptprinter + 'receript');
			$("#result3").text(data[0].cashdispenser + 'dispenser');
			console.log(data[0].receiptprinter);
			console.log(data[0].cashdispenser);
		});

	}

	function updateTpsCount() {
		$.getJSON("updateTpsCount", function(data) {
			
			var tpsCount=[];
			var time=[];
			
			for (i = 0; i < Object.keys(data).length; i++) {
				data[i].forEach(function(el) {
					tpsCount[i]=el.tpsCount;
				    time[i]=el.time;
				});
			}
			
			console.log(tpsCount);
				
		});
	}

	function updateTopTenFail() {
		$.getJSON("updateTopTenFail?topN=10", function(data) {

			var dataSize = Object.keys(data).length;
			var write;

			for (i = 0; i < dataSize; i++) {

				write += '<tr><td>' + data[i].deviceid + '</td><td>'
						+ data[i].messagetext + '</td><td>' + data[i].location
						+ '</td><td>' + data[i].vendor + '</td><td>'
						+ data[i].totaltime + '</td></tr>';

			}

		});
	}

	$(document).ready(onLoad);
</script>

</head>
<body>

	<c:forEach var="offer" items="${dashboardDefaultV}">
		<td>${offer.cardreader}</td>
		<td>${offer.receiptprinter}</td>
		<td>${offer.cashdispenser}</td>
		<td>${offer.epp}</td>
	</c:forEach>



	<h1>asd</h1>

	<div id="result"></div>
	<div id="result2"></div>
	<div id="result3"></div>
	<div id="result4">
		<a
			href="${pageContext.request.contextPath}ComponentDetail?componentName=cashdispenser">card
			reader</a>
	</div>
	<div id="result5"></div>

	<div>
		<table style="width: 100%">
			<thead>
				<tr>
					<th>Firstname</th>
					<th>Lastname</th>
					<th>Age</th>
					<th>Lastname</th>
					<th>Age</th>
				</tr>
			</thead>
			<tbody id="FillThis">


			</tbody>
		</table>
	</div>

</body>
</html>
