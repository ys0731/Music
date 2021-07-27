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
					<h2>Q&A - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 ${qnaAdminVo.totCount }개</strong>  |  ${qnaAdminVo.reqPage }/${qnaAdminVo.totPage} 페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w3" />
								 	<col class="w4" /> 
									<col class="" />
									<col class="w10" />
									<col class="w5" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onclick="isAllChk();"/></th>
										<th scope="col">NO</th>
										<th scope="col">제목</th> 
										<th scope="col">등록일</th> 
										<th scope="col">작성자</th> 
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty vo }">
										<td colspan="7"> 등록된 글이 없습니다. </td>
									</c:if>
									<c:forEach var="vo" items="${vo}">
										<tr>
											<td class="first"><input type="checkbox" name="checkno" id="no" onclick="isChk();" data-Num="${vo.no }"/></td>	
											<td>${vo.no }</td>
											<td class="title"><a href="view.do?no=${vo.no}&reqPage=${qnaAdminVo.reqPage}&stype=${param.stype}&sval=${param.sval}">${vo.title }</a>
												<c:if test="${vo.regdate >= nowday }">
													<strong style="color:red;"> [NEW] </strong>
												</c:if>
												<c:if test="${vo.secret == 1}">   <img src="/music/img/admin/lock.png"/></c:if>
												<c:if test="${!empty vo.answer}"><strong> <img src="/music/img/admin/ico_answer_done.png" style="width: 40px"/> </strong></c:if>
											</td>
											<td>${vo.regdate }</td>
											<td>${vo.name }</td>
											
										</tr>
									</c:forEach>									
								</tbody>
							</table>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="javascript:isDel();" data-Num="${qnaAdminVo.no }"><strong>삭제</strong> </a>
								</div>
							</div>
							<!--//btn-->
							<!-- 페이징 처리 -->
							<div class='page'>
							<c:if test="${qnaAdminVo.startPage > qnaAdminVo.pageRange }">
								<a href="index.do?reqPage=1&stype=${qnaAdminVo.stype}&sval=${qnaAdminVo.sval}"> << </a>
							</c:if>							
							<c:if test="${qnaAdminVo.startPage > qnaAdminVo.pageRange }">
								<a href="index.do?reqPage=${qnaAdminVo.startPage-1}&stype=${qnaAdminVo.stype}&sval=${qnaAdminVo.sval}"> < </a>
							</c:if>
							<c:forEach var="req" begin="${qnaAdminVo.startPage }" end="${qnaAdminVo.endPage }">
									<a href='index.do?reqPage=${req}&stype=${qnaAdminVo.stype}&sval=${qnaAdminVo.sval}' <c:if test="${req==qnaAdminVo.reqPage }">style="color: red"</c:if>> ${req} </a>
							</c:forEach>
                            <c:if test="${qnaAdminVo.totPage > qnaAdminVo.endPage}"> 
                        		<a href="index.do?reqPage=${qnaAdminVo.endPage+1}&stype=${qnaAdminVo.stype}&sval=${qnaAdminVo.sval}">></a>
                        	</c:if>
                        	<c:if test="${qnaAdminVo.totPage > qnaAdminVo.endPage}"> 
                        		<a href="index.do?reqPage=${qnaAdminVo.totPage}&stype=${qnaAdminVo.stype}&sval=${qnaAdminVo.sval}">>></a>
                        	</c:if>

							</div>
							<!-- //페이징 처리 -->
							<form name="searchForm" id="searchForm" action="index.do"  method="post">
								<div class="search">
									<select name="stype" title="검색을 선택해주세요">
										<option value="all">전체</option>
										<option value="title" 	<c:if test="${qnaAdminVo.stype=='title' }">selected</c:if>>제목</option>
										<option value="content" <c:if test="${qnaAdminVo.stype=='content'}">selected</c:if>>내용</option>
									</select>
									<input type="text" name="sval" value="${qnaAdminVo.sval}" title="검색할 내용을 입력해주세요" />
									<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" onclick="$('#searchForm').submit();"/>
								</div>
							</form>
							<!-- //search --> 
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