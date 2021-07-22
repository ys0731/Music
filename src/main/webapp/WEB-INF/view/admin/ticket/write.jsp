<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
function goSave() {
	if($("#type").val()==''){
		alert('이용권을 입력하세요.');
		$('#type').focus();	
	}else if($('#price').val()=='0'){
		alert('금액을 입력해주세요.');
		$('#price').focus();		
	}else{
		$("#frm").submit();
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
					<h2>이용권등록 - [등록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">																	
							<form method="post" name="frm" id="frm" action="insert.do" enctype="multipart/form-data">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">*이용권</label></th>
										<td colspan="10">
											<input type="text" id="ticket_type" name="ticket_type" class="w30" title="종류를 입력해주세요"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*시간</label></th>
										<td colspan="10">
											<select id="time" name="time" title="시간을 선택해주세요">
											<c:forEach var="i" begin="1" end="12">
												<option value="${i}">${i}시간</option>
											</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*금액</label></th>
										<td colspan="10">
											<input type="text" id="price" name="price" class="w30" title="금액을 입력해주세요"/>	원
										</td>
									</tr>
								</tbody>
							</table>
							<input type="hidden" name="cmd" value="write" />
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="index.do"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" href="javascript:goSave();"><strong>저장</strong></a>
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