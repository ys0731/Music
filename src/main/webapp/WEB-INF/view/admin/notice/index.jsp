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
					<h2>공지사항 - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 ${noticeAdminVo.totCount }개</strong>  |  ${noticeAdminVo.reqPage }/${noticeAdminVo.totPage} 페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="w4" />
									<col class="w3" />
									<col class="" />
									<col class="w10" />
									<col class="w5" />
									<col class="w6" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onclick="isAllChk();"/></th>
										<th scope="col">번호</th>
										<th scope="col">분류</th>
										<th scope="col">제목</th> 
										<th scope="col">작성일</th> 
										<th scope="col">작성자</th> 
										<th scope="col" class="last">조회수</th>
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
											<c:if test="${vo.category == 'categoryInfo'}"><td>안내</td></c:if>	
											<c:if test="${vo.category == 'categoryCheck'}"><td>점검</td></c:if>	
											<td class="title"><a href="view.do?no=${vo.no}&reqPage=${noticeAdminVo.reqPage}&stype=${param.stype}&sval=${param.sval}&category=${param.category}">${vo.title }</a></td>
											<td>${vo.regdate }</td>
											<td>관리자</td>
											<td class="last">${vo.readcount }</td>
										</tr>
									</c:forEach>									
								</tbody>
							</table>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="javascript:isDel();" data-Num="${noticeAdminVo.no }"><strong>삭제</strong> </a>
								</div>
								<div class="btnRight">
									<a class="wbtn" href="write.do"><strong>등록</strong> </a>
								</div>
							</div>
							<!--//btn-->
							<!-- 페이징 처리 -->
							<div class='page'>
							<c:if test="${noticeAdminVo.startPage > noticeAdminVo.pageRange }">
								<a href="index.do?reqPage=1&stype=${noticeAdminVo.stype}&sval=${noticeAdminVo.sval}&category=${noticeAdminVo.category}"> << </a>
							</c:if>							
							<c:if test="${noticeAdminVo.startPage > noticeAdminVo.pageRange }">
								<a href="index.do?reqPage=${noticeAdminVo.startPage-1}&stype=${noticeAdminVo.stype}&sval=${noticeAdminVo.sval}&category=${noticeAdminVo.category}"> < </a>
							</c:if>
							<c:forEach var="req" begin="${noticeAdminVo.startPage }" end="${noticeAdminVo.endPage }">
									<a href='index.do?reqPage=${req}&stype=${noticeAdminVo.stype}&sval=${noticeAdminVo.sval}&category=${noticeAdminVo.category}' <c:if test="${req==noticeAdminVo.reqPage }">style="color: red"</c:if>> ${req} </a>
							</c:forEach>
                            <c:if test="${noticeAdminVo.totPage > noticeAdminVo.endPage}"> 
                        		<a href="index.do?reqPage=${noticeAdminVo.endPage+1}&stype=${noticeAdminVo.stype}&sval=${noticeAdminVo.sval}&category=${noticeAdminVo.category}">></a>
                        	</c:if>
                        	<c:if test="${noticeAdminVo.totPage > noticeAdminVo.endPage}"> 
                        		<a href="index.do?reqPage=${noticeAdminVo.totPage}&stype=${noticeAdminVo.stype}&sval=${noticeAdminVo.sval}&category=${noticeAdminVo.category}">>></a>
                        	</c:if>

							</div>
							<!-- //페이징 처리 -->
							<form name="searchForm" id="searchForm" action="index.do"  method="post">
								<div class="search">
									<select name="category" title="검색을 선택해주세요" onchange="$('#searchForm').submit();">
										<option value="categoryAll">분류</option>
										<option value="categoryInfo" <c:if test="${noticeAdminVo.category=='categoryInfo'}">selected</c:if>>안내</option>
										<option value="categoryCheck" <c:if test="${noticeAdminVo.category=='categoryCheck'}">selected</c:if>>점검</option>
									</select>
									<select name="stype" title="검색을 선택해주세요">
										<option value="all">전체</option>
										<option value="title" 	<c:if test="${noticeAdminVo.stype=='title' }">selected</c:if>>제목</option>
										<option value="content" <c:if test="${noticeAdminVo.stype=='content'}">selected</c:if>>내용</option>
									</select>
									<input type="text" name="sval" value="${noticeAdminVo.sval}" title="검색할 내용을 입력해주세요" />
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