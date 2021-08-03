<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<%
	String path = request.getContextPath();
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보변경</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="<%=path %>/js/header_footer.js"></script>
    <link rel="stylesheet" href="<%=path %>/css/reset.css">
    <link rel="stylesheet" href="<%=path %>/css/header_footer.css">
    <script>
        $(document).ready(function() {      	
            $(".update_form_btn").click(function() {
                var oldPwd = $("#oldPwd").val();
                var newPwd = $("#newPwd").val();
                var newPwd2 = $("#newPwd2").val();
                var email = $("#email").val();
                var tel = $("#nat_no_input").val() + $("#tel").val();
                
                var check1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{10,20}$/.test(newPwd);   //영문,숫자

            	var check2 = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{10,20}$/.test(newPwd);  //영문,특수문자

            	var check3 = /^(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{10,20}$/.test(newPwd);  //특수문자, 숫자

            	if(!(check1||check2||check3)){
            		alert("사용할 수 없는 비밀번호 입니다.");
            		return false;
            	}
                	                              
                if(oldPwd =="") {
                    alert('현재 비밀번호를 올바르게 입력해주세요.');
                    $("#oldPwd").focus();
                    return false;
                } else if((newPwd =="") || (newPwd2 =="") || (newPwd != newPwd2) ) {
                    alert('새 비밀번호를 올바르게 입력해주세요.');
                    $("#newPwd").focus();
                    return false;
                } else if($("#tel").val() == "") {
                    alert('전화번호를 올바르게 입력해주세요.');
                    $("#tel").focus();
                    return false;
                } else if(($("#email").val()=="")) {
                    alert('이메일을 올바르게 입력해주세요.');
                    $("#email").focus();
                    return false;
                } else if(oldPwd == newPwd) {
                    alert('이전에 사용하던 비밀번호입니다. 새 비밀번호를 입력해 주세요.');
                    $("#newPwd").focus();
                    return false;
                }
            });
            $("#domain").change(function() {
                $("#domain_input").val($("#domain").val());
            });
            $("#nat_no").change(function() {
                $("#nat_no_input").val($("#nat_no").val());
            });
            
        });
    </script>   
</head>
<style>

    h2 {font-size: 27px;margin-bottom: 15px;}
    /* chart row */
    .chart_box table {margin-bottom: 20px; margin-top: 10px;}
    .chart_box table tr td:nth-child(1) {width: 116px; height: 80px;}
    .chart_box table tr td:nth-child(2) {width: 900px;}
    .chart_box table tr {border-bottom: 2px solid #ccc;}
    .chart_box table tr:nth-child(3) {border-style: none;}
    .chart_box table tr:nth-child(4) {border-style: none;}
    .chart_box table tr:nth-child(1) {color: #333; border-top: 2px solid #ccc; height: 40px;}
    .chart_box table tr {height: 80px;}

    /* input */
    input {text-indent: 10px; height: 26px; font-size: 13px;}
    select {height: 30px; font-size: 13px;}
    input:focus {outline: none;}   
    .dot {margin-left: 4px; margin-right: 4px;}
    
    /* 버튼 */
    .update_form_btn {width: 100px; height: 30px; border-radius: 5px; background-color: #11264f; color: white; font-family: 'twayair', sans-serif; line-height: 30px; text-align: center; margin-top: 10px; margin-left: 408px; margin-bottom: 70px; border: #11264f; text-indent: 0;}
    .cancel_form_btn {width: 100px; height: 30px; border-radius: 5px; background-color: #11264f; color: white; font-family: 'twayair', sans-serif; line-height: 30px; text-align: center; margin-top: 10px; margin-bottom: 70px; border: #11264f; text-indent: 0;}
    .tel_btn {width: 100px; height: 30px; border-radius: 5px; background-color: #11264f; color: white; font-family: 'twayair', sans-serif; line-height: 30px; text-align: center; margin-top: 10px; border: #11264f; text-indent: 0;}
    .update_form_btn:hover {background-color: #4169E1;}
    .cancel_form_btn:hover {background-color: #4169E1;}
    .tel_btn:hover {background-color: #4169E1;}
</style>

<body>
    <%@ include file="/WEB-INF/view/include/top.jsp" %>
    <div id="container">
        <div class="center">
            <h2>회원정보변경</h2>
            <form class="chart_box" action="/music/mymusic/mymusic_edit.do" method="post">
                <table>
                    <tr>
                        <td><label for="id">아이디</label></td>
                        <td><input type="text" id="id" name="id" value="${user.id }" readonly></td> 
                    </tr>
                    <tr>
                        <td><a>닉네임</a></td>
                        <td><input type="text" id="name" name="name" value="${user.nickname }" readonly></td> 
                    </tr>
                    <tr>
                        <td><label for="oldPwd">현재 비밀번호</label></td>
                        <td><input type="password" id="oldPwd"></td> 
                    </tr>
                    <tr>
                        <td><label for="newPwd">변경 비밀번호</label></td>
                        <td><input type="password" id="newPwd" name="newPwd"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="password" id="newPwd2" placeholder="비밀번호를 다시 입력"></td>
                    </tr>
                    <tr>
                        <td><label for="email">이메일</label></td>
                        <td>
                            <input type="text" id="email" name="email" placeholder="ex)email@naver.com" value="${user.email }">
                           
                        </td> 
                    </tr>
                    <tr>
                        <td><label for="tel">휴대폰번호</label></td>
                            <td>
							<input name="tel" id="tel" type="text" placeholder="ex) 01012341234" maxlength="11">                         
                        </td>
                    </tr>
                </table>
                <input type="submit" class="update_form_btn" value="완료">
                <input type="button" class="cancel_form_btn" value="취소" onclick="history.back()">
            </form>
        </div>
    </div>
   <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
</body>
</html>