<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
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
					<h2>앨범 - [읽기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="15%" />
									<col width="85%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">앨범명</label></th>
										<td colspan="10">
											${vo.album }
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">장르</label></th>
										<td colspan="10">
											<c:choose>
												<c:when test="${vo.genre == 1}">가요</c:when>
												<c:when test="${vo.genre == 2}">팝</c:when>
												<c:when test="${vo.genre == 3}">재즈</c:when>
												<c:when test="${vo.genre == 4}">클래식</c:when>
											</c:choose>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">발매일</label></th>
										<td colspan="10">
											${reldateForm }
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">앨범정보</label></th>
										<td colspan="10">
											${vo.info }
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">앨범커버</label></th>
										<td colspan="10">
											<div class="weidtFile">
												<div style="width: 100px; border: 5px double #ccc;">
													<a href="<%=request.getContextPath()%>/common/download.jsp?path=/upload/&org=${vo.img_org }&real=${vo.img_real}" target="_blank">
														<img alt="앨범커버_이미지" src="<%=request.getContextPath()%>/upload/${vo.img_real}" style="width: 100px; height: 100px;">
													</a>
												</div>
												<p style="padding-top: 10px;"><span>파일명 : </span><a href="<%=request.getContextPath()%>/common/download.jsp?path=/upload/&org=${vo.img_org }&real=${vo.img_real}" target="_blank">${vo.img_org }</a><br />
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="index.do?reqPage=${param.reqPage}&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" href="edit.do?no=${vo.no }"><strong>수정</strong></a>
									<a class="btns" style="cursor:pointer;" href="javascript:isDel();"><strong>삭제</strong></a>
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
    <script>
    	function isDel() {
    		if(confirm('삭제하시겠습니까?')) {
    			$.ajax({
    				url: 'delete.do',
    				data: {
    					'no': ${vo.no}
    				},
    				method: 'post',
    				success: function(res) {
    					if(res.trim()=='true') {
    						alert('정상적으로 삭제되었습니다.');
    						location.href='index.do';
    					} else {
    						alert('삭제에 실패하였습니다.')
    					}
    				},
    				error: function(res) {
    					alert(res);
    				}
    			});
    		}
    	}
    </script>
</body>
</html>