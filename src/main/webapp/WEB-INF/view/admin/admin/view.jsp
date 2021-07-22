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
					<h2>회원 상세</h2>
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
										<th scope="row"><label for="">아이디</label></th>
										<td colspan="10">
											${list.id }
										</td>
									</tr>
									
									<tr>
										<th scope="row"><label for="">닉네임</label></th>
										<td colspan="10">
											${list.nickname }
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">이메일</label></th>
										<td colspan="10">
											${list.email }
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">연락처</label></th>
										<td colspan="10">
											${list.tel }
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">성별</label></th>
										<td colspan="10">
											${list.gender }
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">가입일</label></th>
										<td colspan="10">
											${list.signdate }
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">이용권 보유</label></th>
										<td colspan="10">
											<c:forEach var="pv" items="${pv}" varStatus="status">
												${status.count} . ${pv.ticket_type } (${pv.pay_start_date} ~ ${pv.pay_end_date })<br>
											</c:forEach>
										</td>
									</tr>
								
								</tbody>
							</table>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="index.do?reqPage=${param.reqPage}&stype=${param.stype}&sval=${param.sval}&sdate=${param.sdate}&edate=${param.edate}"><strong>목록</strong></a>
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