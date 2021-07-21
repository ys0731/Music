<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 <script>
/*  전체 선택을 체크하면 개별 체크박스들도 모두 체크  */
function isAllChk(){
	var chk = $("#allChk").prop("checked");
	if(chk){
		$('input:checkbox[name="checkno"]').prop("checked",true);
	}else{
		$('input:checkbox[name="checkno"]').prop("checked",false);
	}
};

/* 개별 체크 박스를 선택, 취소하면 전체 선택 체크박스는 해제  */
function isChk(){
	$("#allChk").prop("checked",false);
};

function isDel(){
	if(confirm("삭제 하시겠습니까?")){
		var chkArr = new Array();
		
		$('input:checkbox[name="checkno"]:checked').each(function(){
			chkArr.push($(this).attr("data-Num"));
		});
		
		$.ajax({
			url : "delete.do",
			type : "post",
			data : { 
				chbox : chkArr 
				},
			success : function(res){
				if(res.trim() == 'true'){ 
					alert('정상적으로 삭제되었습니다.')
					location.href='index.do'; 
				}else{
					alert('삭제 실패.')				
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
					<h2>이용권등록 - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 ${ticketVo.totCount }개</strong>  |  ${ticketVo.reqPage }/${ticketVo.totPage} 페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w5" />
									<col class="w5" />
									<col class="" />
									<col class="w15" />
									<col class="w15" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onclick="isAllChk();"/></th>
										<th scope="col">번호</th>
										<th scope="col">이용권 종류</th>
										<th scope="col">이용권 가격</th> 
										<th scope="col">이용권 등록일</th> 
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty vo }">
										<td colspan="5"> 등록된 이용권이 없습니다. </td>
									</c:if>
									<c:forEach var="vo" items="${vo}">
										<tr>
											<td class="first"><input type="checkbox" name="checkno" id="no" onclick="isChk();" data-Num="${vo.no }"/></td>	
											<td>${vo.no }</td>
											<td class="title">${vo.ticket_type }</td>
											<td>${vo.price }</td>
											<td>${vo.regdate }</td>
										</tr>
									</c:forEach>									
								</tbody>
							</table>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="javascript:isDel();" data-Num="${ticketVo.no }"><strong>삭제</strong> </a>
								</div>
								<div class="btnRight">
									<a class="wbtn" href="write.do"><strong>등록</strong> </a>
								</div>
							</div>
							<!--//btn-->
							<!-- 페이징 처리 -->
							<div class='page'>
							<c:if test="${ticketVo.startPage > ticketVo.pageRange }">
								<a href="index.do?reqPage=1&stype=${ticketVo.stype}&sval=${ticketVo.sval}"> << </a>
							</c:if>							
							<c:if test="${ticketVo.startPage > ticketVo.pageRange }">
								<a href="index.do?reqPage=${ticketVo.startPage-1}&stype=${ticketVo.stype}&sval=${ticketVo.sval}"> < </a>
							</c:if>
							<c:forEach var="req" begin="${ticketVo.startPage }" end="${ticketVo.endPage }">
									<a href='index.do?reqPage=${req}&stype=${ticketVo.stype}&sval=${ticketVo.sval}' <c:if test="${req==ticketVo.reqPage }">style="color: red"</c:if>> ${req} </a>
							</c:forEach>
                            <c:if test="${ticketVo.totPage > ticketVo.endPage}"> 
                        		<a href="index.do?reqPage=${ticketVo.endPage+1}&stype=${ticketVo.stype}&sval=${ticketVo.sval}">></a>
                        	</c:if>
                        	<c:if test="${ticketVo.totPage > ticketVo.endPage}"> 
                        		<a href="index.do?reqPage=${ticketVo.totPage}&stype=${ticketVo.stype}&sval=${ticketVo.sval}">>></a>
                        	</c:if>

							</div>
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