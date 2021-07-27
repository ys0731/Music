<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
</head>
<body> 
<script>
    	function isDel() {
    		if (confirm('삭제하시겠습니까?')) {
    			
    			<c:choose>
    				<c:when test="${!empty vo.al_words }">//앨범페이지에 달린 댓글이면
	    				// 신고 로그 삭제처리
	        			$.ajax({
	        				url:'delete.do',
	        				data:{
	        					'no':${vo.no},
	        					'al_co_no':${vo.al_no},
	        					'user_no': ${vo.user_no},
	        					'ar_co_no':0
	        				},
	        				method:'post',
	        				success:function(res) {
	        					console.log(res);
	        					if (res.trim() == 'true') {
	        						alert('정상적으로 삭제되었습니다.');    						
	        					} else {
	        						alert('삭제 실패');
	        					}
	        				},
	        				error : function(res) {
	        					console.log(res);
	        				}
	        			});
	    				//--댓글 삭제 처리--
    					var no=${vo.al_no};
	    				$.ajax({
	        				url:'<%=request.getContextPath()%>/albumDetailComment/delete.do?no=' + no,
	        				data:{
	        					'no':no
	        				},
	        				method:'post',
	        				success:function(res) {
	        					console.log(res);
	        					if (res.trim() == 'true') {	        						
	        						location.href='index.do';
	        					} else {
	        						alert('삭제 실패');
	        					}
	        				},
	        				error : function(res) {
	        					console.log(res);
	        				}
	        			});
    				</c:when>
    				<c:when test="${!empty vo.ar_words }"> //가수페이지에 달린 댓글이면
	    				// 신고 로그 삭제처리
	        			$.ajax({
	        				url:'delete.do',
	        				data:{
	        					'no':${vo.no},
	        					'user_no': ${vo.user_no},
	        					'al_co_no':0,
	        					'ar_co_no':${vo.ar_no}
	        				},
	        				method:'post',
	        				success:function(res) {
	        					console.log(res);
	        					if (res.trim() == 'true') {
	        						alert('정상적으로 삭제되었습니다.');    						
	        					} else {
	        						alert('삭제 실패');
	        					}
	        				},
	        				error : function(res) {
	        					console.log(res);
	        				}
	        			});
    				   //---해당 댓글 삭제 처리---
    					var no=${vo.ar_no};
	    				$.ajax({
	        				url:'<%=request.getContextPath()%>/artistDetailComment/delete.do?no=' + no,
	        				data:{
	        					'no':no
	        				},
	        				method:'post',
	        				success:function(res) {
	        					console.log(res);
	        					if (res.trim() == 'true') {	        						
	        						location.href='index.do';
	        					} else {
	        						alert('삭제 실패');
	        					}
	        				},
	        				error : function(res) {
	        					console.log(res);
	        				}
	        			});
    				</c:when>
    			</c:choose>
    		}
    	}
    </script>
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
					<h2>신고관리 - [상세]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="10%" />
									<col width="15%" />
									<col width="25%" />
									<col width="25%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">유저</label></th>
										<td colspan="10">
											${vo.id}
										</td>
									</tr>
									
									<tr style="height: 250px;">
										<th scope="row"><label for="">내용</label></th>
										<td colspan="10">
											<c:choose>
													<c:when test="${!empty vo.al_words }">
														${vo.al_words }														
													</c:when>
													<c:when test="${!empty vo.ar_words }">
														${vo.ar_words }
													</c:when>
											</c:choose>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="index.do?reqPage=${param.reqPage}"><strong>목록</strong></a>
									<a class="btns" href="javascript:isDel();">									
									<strong>삭제</strong></a>
								</div>								
							</div>
							<!--//btn-->
						</div>
						<!-- //bread -->
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