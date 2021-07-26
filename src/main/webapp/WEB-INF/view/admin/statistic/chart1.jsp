<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawVisualization);
	
	function drawVisualization() {
		// Some raw data (not necessarily accurate)
		var data = google.visualization.arrayToDataTable([
			['Hour', 'Song'],
			['0h', 165],
			['1h', 682],
			['2h', 623],
			['3h', 609],
			['4h', 569],
			['5h', 569],
			['6h', 1569],
			['7h', 369],
			['8h', 549],
			['9h', 569],
			['10h', 2569],
			['11h', 569],
			['12h', 1569],
			['13h', 5169],
			['14h', 569],
			['15h', 569],
			['16h', 1569],
			['17h', 2569],
			['18h', 569],
			['19h', 3569],
			['20h', 5639],
			['21h', 1569],
			['22h', 1569],
			['23h', 569]
		]);
		
		var options = {
			title : 'Play Count per Hour by Song',
			vAxis: {title: 'play'},
			hAxis: {title: '24hours'},
			seriesType: 'bars',
			series: {2: {type: 'line'}}
		};
		
		var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
		chart.draw(data, options);
	}
</script>
</head>
<body> 
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>통계 - [차트1]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="chart_div" style="width: 1840px; height: 750px;"></div>
					<!-- 내용 : e -->
				</div>
				<!--//con -->
			</div>
			<!--//content -->
		</div>
		<!--//container --> 
		<!-- E N D :: containerArea-->
	</div>
	<!--//canvas -->
</div>
<!--//wrap -->
</body>
</html>