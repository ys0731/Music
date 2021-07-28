<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script type="text/javascript">
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
        var data = google.visualization.arrayToDataTable([
        	
            ['Song',
           	<c:forEach var="songlists" items="${songlist }">
           		'${songlists.title}',
           	</c:forEach>
			{ role: 'annotation' } ],
            ['Monday',
            <c:forEach var="songlists" items="${songlist }">
       		${songlists.monday},
       		</c:forEach>
			''],
            ['Tuesday',
            <c:forEach var="songlists" items="${songlist }">
       		${songlists.tuesday},
       		</c:forEach>
			''],
            ['Wednesday',
            <c:forEach var="songlists" items="${songlist }">
       		${songlists.wednesday},
       		</c:forEach>
			''],
            ['Thursday',
            <c:forEach var="songlists" items="${songlist }">
       		${songlists.thursday},
       		</c:forEach>
			''],
            ['Friday',
            <c:forEach var="songlists" items="${songlist }">
       		${songlists.friday},
       		</c:forEach>
			''],
            ['Saturday',
            <c:forEach var="songlists" items="${songlist }">
       		${songlists.saturday},
       		</c:forEach>
			''],
            ['Sunday',
            <c:forEach var="songlists" items="${songlist }">
       		${songlists.sunday},
       		</c:forEach>
			'']
          ]);

      var view = new google.visualization.DataView(data);
      view.setColumns([ 0,
			<c:forEach var="songlists" items="${songlist }" varStatus="status">
				${status.count},
			</c:forEach>
    	  ]);
      
      var options = {
    		  title : '지난주의 재생횟수',
              width: 1840,
              height: 700,
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
					<h2>통계 - [주간 재생횟수]</h2>
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