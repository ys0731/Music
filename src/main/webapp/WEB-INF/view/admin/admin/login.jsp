<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>

</head>
<body>
<div id="login">
	<div class="title">
		<h1>SEND MUSIC <span>관리자모드</span></h1>
		<p>관리자 로그인 후 이용가능합니다.</p>
	</div>
	<div class="login"> 
	<form name="board" id="board" method="post" action="login.do" >
		<fieldset>
			<legend>관리자모드 로그인</legend>
			<div class="bgBox">
				<div class="infoBox">
					<dl>
						<dt>
							<label for="id"><strong>아이디</strong></label>
						</dt>
						<dd>
							<input type="text" id="id" name="id" value="${adminVo.id }" title="아이디를 입력해주세요." style="ime-mode:inactive"/>
						</dd>
					</dl>
					<dl>
						<dt>
							<label for="password"><strong>비밀번호</strong></label>
						</dt>
						<dd>
							<input type="password" id="pwd" name="pwd" value="" title="비밀번호를 입력해주세요." />
						</dd>
					</dl>
				</div>
				<!-- //infoBox -->
				<input type="image" src="<%=request.getContextPath()%>/img/admin/member_login_btn.gif" alt="로그인" class="loginBtn" title="" />
			</div>
			<!-- //bgBox -->
			<div class="joinList">
				<input type="checkbox" name="checkId" id="reg1" value="check" <c:if test="${!empty adminVo.id}">checked</c:if>/> 아이디저장
			</div>
			<!-- //joinList -->
			<input type="hidden" name="url" id="url" value="<%//=url%>"/>
			<input type="hidden" name="param" id="param" value="<%//=param%>"/>
			<input type="hidden" name="ip" id="ip" value="<%=request.getRemoteAddr()%>"/>
		</fieldset>
	</form>
	</div>
	<div class="footer">
		Copyrights (c) 2021 <a href="#" target="_blank">SEND MUSIC</a>. All Rights Reserved.  
	</div>
</div>
</body>
</html>