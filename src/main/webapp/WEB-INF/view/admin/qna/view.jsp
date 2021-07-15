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
					<h2>Q&A - [읽기]</h2>
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
										<th scope="row"><label for="">제목
											</label></th>
										<td colspan="10">
											${vo.title}
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">공개 여부</label></th>
										<td colspan="10">
											<input type="radio" name="secret" value="0" <c:if test="${vo.secret == 0 }">checked</c:if> disabled>전체 공개
											<input type="radio" name="secret" value="1" <c:if test="${vo.secret == 1 }">checked</c:if> disabled>비공개 
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">작성자
											</label></th>
										<td colspan="10">
											닉네임
										</td>
									</tr>
									<tr style="height: 250px;">
										<th scope="row"><label for="">내용</label></th>
										<td colspan="10">
											${vo.content}
										</td>
									</tr>
									<c:if test="${!empty vo.answer}">
									<tr style="height: 250px;">
										<th scope="row"><label for="">답변</label></th>
										<td colspan="10">
											${vo.answer }
										</td>
									</tr>
									</c:if>
								</tbody>
							</table>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="index.do?reqPage=${param.reqPage}&stype=${param.stype}&sval=${param.sval}"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" href="edit.do?no=${vo.no}">
									<c:if test="${empty vo.answer}"><strong>답변</strong>></c:if>
									<c:if test="${!empty vo.answer}"><strong>답변 수정</strong>></c:if>
									</a>
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