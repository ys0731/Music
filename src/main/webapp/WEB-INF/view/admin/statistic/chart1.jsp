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
			['Hour', 
			<c:if test="${musicPlayerVo.song_no==0}">
			'전체'
			</c:if>
			<c:if test="${musicPlayerVo.song_no!=0}">
			'${result.title }'
			</c:if>
			],
			['0h', ${result.h0 }],
			['1h', ${result.h1 }],
			['2h', ${result.h2 }],
			['3h', ${result.h3 }],
			['4h', ${result.h4 }],
			['5h', ${result.h5 }],
			['6h', ${result.h6 }],
			['7h', ${result.h7 }],
			['8h', ${result.h8 }],
			['9h', ${result.h9 }],
			['10h', ${result.h10 }],
			['11h', ${result.h11 }],
			['12h', ${result.h12 }],
			['13h', ${result.h13 }],
			['14h', ${result.h14 }],
			['15h', ${result.h15 }],
			['16h', ${result.h16 }],
			['17h', ${result.h17 }],
			['18h', ${result.h18 }],
			['19h', ${result.h19 }],
			['20h', ${result.h20 }],
			['21h', ${result.h21 }],
			['22h', ${result.h22 }],
			['23h', ${result.h23 }]
		]);
		
		var options = {
			title : '하룻동안의 재생횟수',
			vAxis: {title: '재생횟수'},
			hAxis: {title: '24시간'},
			seriesType: 'bars',
			series: {2: {type: 'line'}}
		};
		
		var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
		chart.draw(data, options);
	}
	
	function selectSong() {
		if ($("#song_no").val() == '') {
			alert("곡 번호를 입력해주세요.");
		}
		
		$.ajax({
	        url: 'checksong.do',
	        type: 'post',
	        data: {
	        	no: $("#song_no").val()
	        },
	        success : function(res){
	        	if (res.trim() != 'true') {
		        	alert("존재하지 않는 번호입니다.");
				} else {
					$("#frm").submit();
				}
	        }
        });
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
					<h2>통계 - [일간 재생횟수]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div>
						<form method="post" name="frm" id="frm" action="chart1.do" enctype="multipart/form-data">
							<label for="song_no">곡 선택 : </label>
							<input type="text" id="song_no" name="song_no" title="곡 선택" list="songlisted" autocomplete="off"/>
							<datalist id="songlisted">
								<option value="0">전체</option>
	                            <c:forEach var="songs" items="${songList }">
									<option value="${songs.no }">${songs.title }</option>				
								</c:forEach>
							</datalist>
						</form>
						<a class="btns" href="#" onclick="selectSong();" style="margin-left: 51px;"><strong>선택</strong></a>
					</div>
					<div id="chart_div" style="width: 1840px; height: 680px;"></div>
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