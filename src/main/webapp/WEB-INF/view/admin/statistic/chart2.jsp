<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
        var data = google.visualization.arrayToDataTable([
            ['Song', 'Song1', 'Song2', 'Song3', 'Song4', 'Song5', 'Song6', { role: 'annotation' } ],
            ['Monday', 10, 24, 20, 32, 18, 5, ''],
            ['Tuesday', 16, 22, 23, 30, 16, 9, ''],
            ['Wednesday', 28, 19, 29, 30, 12, 13, ''],
            ['Thursday', 28, 19, 29, 30, 12, 13, ''],
            ['Friday', 28, 19, 29, 30, 12, 13, ''],
            ['Saturday', 28, 19, 29, 30, 12, 13, ''],
            ['Sunday', 28, 19, 29, 30, 12, 13, '']
          ]);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1, 2, 3, 4, 5, 6]);

      var options = {
    		  title : 'Play Count per Week',
              width: 1840,
              height: 750,
              legend: { position: 'top', maxLines: 1 },
              bar: { groupWidth: '75%' },
              isStacked: true
            };
      
      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
      chart.draw(view, options);
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
					<h2>통계 - [차트2]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="columnchart_values"></div>
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