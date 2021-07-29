<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
	
		var data = google.visualization.arrayToDataTable([
			['Total', 'Accumulated'],
           	<c:forEach var="songs" items="${song }">
       		['${songs.title }', ${songs.total }],
       		</c:forEach>
		]);
		
		var options = {
			title: '전체 곡 개별 총계'
		};
		
		var chart = new google.visualization.PieChart(document.getElementById('piechart'));
		
		chart.draw(data, options);
	}

	google.charts.setOnLoadCallback(drawChart2);
	function drawChart2() {
	
		var data2 = google.visualization.arrayToDataTable([
			['Total', 'Accumulated'],
           	<c:forEach var="genres" items="${genre }">
       			[
               	<c:if test="${genres.genre == 1}">
           			'가요'
           		</c:if>
               	<c:if test="${genres.genre == 2}">
           			'팝'
           		</c:if>
               	<c:if test="${genres.genre == 3}">
           			'재즈'
           		</c:if>
               	<c:if test="${genres.genre == 4}">
           			'클래식'
           		</c:if>
       			, ${genres.total }],
       		</c:forEach>
		]);
		
		var options2 = {
			title: '전체 곡 장르별 총계'
		};
		
		var chart2 = new google.visualization.PieChart(document.getElementById('piechart2'));
		
		chart2.draw(data2, options2);
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
					<h2>통계 - [누적 재생횟수]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con" style="clear: both;">
					<!-- 내용 : s -->
					<div id="piechart" style="float: left; width: 900px; height: 750px;"></div>
					<div id="piechart2" style="float: left; width: 900px; height: 750px;"></div>
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