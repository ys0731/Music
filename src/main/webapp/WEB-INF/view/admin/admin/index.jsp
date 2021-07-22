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
					<h2>회원관리 - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>전체 가입 회원 ${userVo.totCount }명</strong>  |  ${userVo.reqPage }/${userVo.totPage}페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="w4" />
									<col class="w15" />
									<col class="w15" />
									<col class="w15" />
									<col class="w15" />
									<col class="w15" />
									<col class="w15" />
									<col class="" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onclick="isAllChk();"/></th>
										<th scope="col">번호</th>
										<th scope="col">아이디</th>
										<th scope="col">닉네임</th>
										<th scope="col">이메일</th>
										<th scope="col">연락처</th>
										<th scope="col">누적 구매금액</th>
										<th scope="col" class="last">가입일</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty list }">
										<td colspan="8"> 등록된 회원이 없습니다. </td>
									</c:if>
 									<c:forEach var="vo" items="${list}">
										<tr>
											<td class="first"><input type="checkbox" name="checkno" id="no" onclick="isChk();" data-Num="${vo.no}"/></td>	
											<td>${vo.no }</td>
											<td><a href="view.do?no=${vo.no}&reqPage=${userVo.reqPage}&stype=${userVo.stype}&sval=${userVo.sval}&sdate=${userVo.sdate}&edate=${userVo.edate}">${vo.id }</a></td>
											<td>${vo.nickname }</td>
											<td>${vo.email }</td>
											<td>${vo.tel }</td>
											<td>${vo.totalPrice }원</td>
											<td>${vo.signdate }</td>
										</tr>
									</c:forEach> 									
								</tbody>
							</table>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="javascript:isDel();" data-Num="${userVo.no }"><strong>삭제</strong> </a>
								</div>
							
							</div>
							<!--//btn-->
							<!-- 페이징 처리 -->
 							<div class='page'>
							<c:if test="${userVo.startPage > userVo.pageRange }">
								<a href="index.do?reqPage=1&stype=${userVo.stype}&sval=${userVo.sval}&sdate=${userVo.sdate}&edate=${userVo.edate}"> << </a>
							</c:if>							
							<c:if test="${userVo.startPage > userVo.pageRange }">
								<a href="index.do?reqPage=${userVo.startPage-1}&stype=${userVo.stype}&sval=${userVo.sval}&sdate=${userVo.sdate}&edate=${userVo.edate}"> < </a>
							</c:if>
							<c:forEach var="req" begin="${userVo.startPage }" end="${userVo.endPage }">
									<a href='index.do?reqPage=${req}&stype=${userVo.stype}&sval=${userVo.sval}&sdate=${userVo.sdate}&edate=${userVo.edate}' <c:if test="${req==userVo.reqPage }">style="color: red"</c:if>> ${req} </a>
							</c:forEach>
                            <c:if test="${userVo.totPage > userVo.endPage}"> 
                        		<a href="index.do?reqPage=${userVo.endPage+1}&stype=${userVo.stype}&sval=${userVo.sval}&sdate=${userVo.sdate}&edate=${userVo.edate}">></a>
                        	</c:if>
                        	<c:if test="${userVo.totPage > userVo.endPage}"> 
                        		<a href="index.do?reqPage=${userVo.totPage}&stype=${userVo.stype}&sval=${userVo.sval}&sdate=${userVo.sdate}&edate=${userVo.edate}">>></a>
                        	</c:if>

							</div>
							<!-- //페이징 처리 -->
 							<form name="searchForm" id="searchForm" action="index.do"  method="post">
								<div class="search">
									<input type="text" name="sdate" value="${userVo.sdate}" title="시작날짜를 입력해주세요" style="width:100px;" placeholder="시작 날짜 입력"/> ~
									<input type="text" name="edate" value="${userVo.edate}" title="종료날짜를 입력해주세요" style="width:100px;" placeholder="종료 날짜 입력"/> 
									<select name="stype" title="검색을 선택해주세요">
										<option value="id" 	<c:if test="${userVo.stype=='id' }">selected</c:if>>아이디</option>
										<option value="nickname" <c:if test="${userVo.stype=='nickname' }">selected</c:if>>닉네임</option>
									</select>
									<input type="text" name="sval" value="${userVo.sval}" title="검색할 내용을 입력해주세요" />
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