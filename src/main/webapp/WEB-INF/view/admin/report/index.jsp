<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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
					<h2>신고관리 - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 ${adminReportVo.totCount }개</strong>  |  ${adminReportVo.reqPage }/${adminReportVo.totPage} 페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col width="50px" />
									<col width="65px" />
									<col width="*" />
									<col width="100px" />																		
								</colgroup>
								<thead>
									<tr>										
										<th scope="col">번호</th> 
										<th scope="col">신고유저</th> 
										<th scope="col">내용</th>
										<th scope="col">신고일</th> 										
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty vo }">
										<td colspan="6"> 등록된 글이 없습니다. </td>
									</c:if>
									<c:forEach var="vo" items="${vo}">
										<tr>												
											<td>${vo.no }</td>
											<td class="title">${vo.id }</td>
											<td>
												<a href="view.do?no=${vo.no}&reqPage=${adminReportVo.reqPage}">
													<c:choose>
														<c:when test="${!empty vo.al_words }">
															${vo.al_words }
														</c:when>
														<c:when test="${!empty vo.ar_words }">
															${vo.ar_words }
														</c:when>
													</c:choose>
												</a>
											</td>
											<td>${vo.repdate }</td>											
										</tr>
									</c:forEach>									
								</tbody>
							</table>
							</form>
							<!-- =<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="javascript:isDel();" data-Num="${adminReportVo.no }"><strong>삭제</strong> </a>
								</div>
								<div class="btnRight">
									<a class="wbtn" href="write.do"><strong>등록</strong> </a>
								</div>
							</div> -->
							<!--//btn-->
							<!-- 페이징 처리 -->
							<div class='page'>
							<c:if test="${adminReportVo.startPage > adminReportVo.pageRange }">
								<a href="index.do?reqPage=1"> << </a>
							</c:if>							
							<c:if test="${adminReportVo.startPage > adminReportVo.pageRange }">
								<a href="index.do?reqPage=${adminReportVo.startPage-1}"> < </a>
							</c:if>
							<c:forEach var="req" begin="${adminReportVo.startPage }" end="${adminReportVo.endPage }">
									<a href='index.do?reqPage=${req}' <c:if test="${req==adminReportVo.reqPage }">style="color: red"</c:if>> ${req} </a>
							</c:forEach>
                            <c:if test="${adminReportVo.totPage > adminReportVo.endPage}"> 
                        		<a href="index.do?reqPage=${adminReportVo.endPage+1}">></a>
                        	</c:if>
                        	<c:if test="${adminReportVo.totPage > adminReportVo.endPage}"> 
                        		<a href="index.do?reqPage=${adminReportVo.totPage}">>></a>
                        	</c:if>

							</div>
							<!-- //페이징 처리 -->
							
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