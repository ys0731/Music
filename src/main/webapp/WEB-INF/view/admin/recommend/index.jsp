<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
	$(function(){
		getTodayTagList();
		
		// sortable
	    $(".sortable").sortable();
	    $(".sortable").disableSelection();
	    
	    // reorder, mouseup does not work --> mouseout
	    $(".sortable").mousedown(function(){
		    for (var i = 1; i < 5; i++) {
		    	$(this).children("div").eq(i-1).children("span:nth-child(2)").text(i);
			}
	    }).mouseout(function(){
	    	for (var i = 1; i < 5; i++) {
		    	$(this).children("div").eq(i-1).children("span:nth-child(2)").text(i);
			}
	    });
	    
	    // checked when clicked
	    $(".sortable > div").click(function(){
	    	if (!$(this).children("input[type='checkbox']").is(':checked')){
		    	$(this).children("input[type='checkbox']").prop("checked", true);
	    	} else {
		    	$(this).children("input[type='checkbox']").prop("checked", false);
	    	}
	    });
	});
	
	function getTodayTagList() {
		$.ajax({
			url: '<%=request.getContextPath()%>/admin/recommend/todayntaglist.do',
			success: function(res) {
				$("#todayNtag").html(res);
			}
		});
	}
	
	function updateList() {
		if ($("input[name='selectedList']").length != 8) {
			alert('선택된 리스트가 없습니다.');
			return;
		}
		
		if (confirm('등록된 리스트를 포스트하시겠습니까?')) {
			var chkArr = new Array();
			
			$('input:hidden[name="selectedList"]').each(function(){
				chkArr.push($(this).val());
			});
			
			$.ajax({
				url: 'update.do',
				method: 'post',
				traditional: true,
				data: {
					chkArr : chkArr
				},
				success: function(res) {
       				if (res.trim() == 'true') {
       					alert('성공적으로 포스트되었습니다.');
       				} else {
       					alert('등록을 실패하였습니다.')
       				}
				}
			});
		}
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
					<h2>추천음악 - [선택]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<ul style="content: ''; display: block; clear: both;">
								<li id="todayNtag">
								
								</li>
								<li style="float: left; width: 32.333333%; margin: 0 0.5%;">
									<form method="post" name="frm" id="frm" action="update.do">
										<div class="sortable" style="height: 290px; margin-bottom: 20px; border: 1px solid #333; box-sizing: border-box;">
											<dt style="line-height: 56px; background-color: #ccced0; text-align: center; color: #fff;">
												<strong style="font-weight: bold;">오늘 리스트 포스트</strong>
											</dt>
											<c:forEach var="vo" items="${todayListShow }" varStatus="status">
												<div style="line-height: 56px; padding: 0px 10px; border: 1px solid #eee; background-color: #fff; cursor: pointer;">
													<input type="checkbox">
												    <span>${status.count }</span>
												    <span>(${vo.title }/${vo.sub_title })</span>
												    <input type="hidden" name="selectedList" value="${vo.no }">
												</div>
											</c:forEach>
										</div>
										<div class="sortable" style="height: 290px; border: 1px solid #333; box-sizing: border-box;">
											<dt style="line-height: 56px; background-color: #ccced0; text-align: center; color: #fff;">
												<strong style="font-weight: bold;">태그 리스트 포스트</strong>
											</dt>
											<c:forEach var="vo" items="${tagListShow }" varStatus="status">
												<div style="line-height: 56px; padding: 0px 10px; border: 1px solid #eee; background-color: #fff; cursor: pointer;">
													<input type="checkbox">
												    <span>${status.count }</span>
												    <span>(${vo.title }/${vo.sub_title })</span>
												    <input type="hidden" name="selectedList" value="${vo.no }">
												</div>
											</c:forEach>
										</div>
										<div style="margin-top: 20px;">
											<a class="btns" style="float: right;" href="removetwolist.do"><strong>초기화</strong></a>
											<a class="btns" style="float: right; cursor: pointer;" onclick="updateList();"><strong>등록</strong></a>
										</div>
									</form>
								</li>
							</ul>
							<!--//btn-->
						</div>
						<!-- //blist -->
					</div>
					<!-- //bbs --> 
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