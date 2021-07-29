<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import ="java.util.*" %>
<%@ page import ="music.admin.sales.*" %>
<%
List list = (List)request.getAttribute("list");
%>
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
			<%
			for (int i=0; i<list.size(); i++) {
				Object[] objArr = (Object[])list.get(i);
				out.print("[");
				for (int j=0; j<objArr.length; j++) {
					if (i==0) {
						out.print("'"+objArr[j]+"'");
					} else {
						if (j==0) {
							out.print("'"+objArr[j]+"'");
						} else {
							out.print(objArr[j]);
						}
					}
					if (j < objArr.length-1) out.print(",");
				}
				out.print("]");
				if (i < list.size()-1) out.print(",");
			}
			%>
			
		]);
		
		var options = {
			title : 'Amount per Day by Sales',
			vAxis: {title: 'play'},
			hAxis: {title: 'Amount'},
			seriesType: 'bars',
			series: {4: {type: 'line'}}
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
					<h2>매출 통계 - [내달 일별]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="chart_div" style="width: 100%; height: 750px;"></div>
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