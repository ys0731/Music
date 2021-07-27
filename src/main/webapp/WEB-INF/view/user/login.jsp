<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>register</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="<%=request.getContextPath()%>/css/reset.css" rel="stylesheet" type="text/css" />
    <script>
     function loginCheck() {
    	 if ($("#id").val().trim() == "") {
    		 alert("아이디를 입력해 주세요");
    		 $("#id").focus();
    		 return false;
    	 }
    	 if ($("#pwd").val().trim() == "") {
    		 alert("비밀번호를 입력해 주세요");
    		 $("#pwd").focus();
    		 return false;
    	 }
     }
     </script>
    <style>
        /* logo */
        .logo {
            margin: 0 auto;
            margin-top: 200px;
            width: 300px;
            background-image: url("../img/logo.png");
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
        .logo a {
            display: block;
            height: 90px;
        }
        
        /* remove outlines */
        .hide_input_outline {
            border-top-style: hidden;
            border-right-style: hidden;
            border-left-style: hidden;
            border-bottom-style: hidden;
        }
        .no_outline:focus {
            outline: none;
        }

        /* login */
        .login_wrapper {width: 500px; height: 450px; margin: 0 auto; padding: 20px 40px; box-sizing: border-box; color: #333;}

        /* input txt */
        .text_wrapper {border: 2px solid #ccc; margin-bottom: 15px;}
        #id, #pwd {display: block; margin: 0 auto; width: 100%; height: 40px; font-size: 20px; box-sizing: border-box; text-indent: 10px;}
        #id {border-bottom: 2px solid #ccc;}

        .login_bottom {margin-bottom: 50px;}

        .id_check_wrapper {float: left;}
        #id_check {margin-right: 5px;}

        /* register & find */
        .login_bottom ul {float: right;}
        .login_bottom ul li {float: left;}
        .login_bottom ul li::after {content: ""; display: inline-block; position: relative; width: 1px; height: 10px; background-color: #000; margin: 0 10px;}
        .login_bottom ul li:last-child::after {display: none;}

        /* login buttons */
        .login_btn, .kakao_login_btn {display: block; width: 100%; height: 50px; margin-bottom: 10px;}
        .login_btn {background-color: #11264f; border: none; border-radius: 5px; color: #fff; font-size: 15px;}
        .kakao_login_btn {background-color: rgb(255, 196, 0); border: none; border-radius: 25px; color: #000; font-size: 15px;}

        /* terms */
        .link_line {width: fit-content; margin: 0 auto; margin-top: 50px;}
        .link_line li {float: left;}
        .link_line li {float: left;}
        .link_line li::after {content: ""; display: inline-block; position: relative; width: 1px; height: 10px; background-color: #000; margin: 0 10px;}
        .link_line li:last-child::after {display: none;}

        /* contact */
        .contact {width: fit-content; margin: 0 auto; margin-top: 30px; color: #777;}
    </style>
</head>

<body>
    <h1 class="logo"><a href="/music/index.do"></a></h1>
    <div class="login_wrapper">
        <form action="login.do" method="post" id="board1" name="board1" onsubmit="return loginCheck();">
        <input type="hidden" name="url" value="${param.url}">
            <div class="text_wrapper">
                <input name="id" id="id" class="no_outline hide_input_outline" type="text" placeholder="아이디" value="${userVo.id }">
                <input name="pwd" id="pwd" class="no_outline hide_input_outline" type="password" placeholder="비밀번호">
            </div>
            <div class="login_bottom clear">
                <div class="id_check_wrapper">
                    <input type="checkbox" name="checkId" id="reg1" value="check" <c:if test="${!empty userVo.id}">checked</c:if>/> 아이디저장
                </div>
                <ul class="clear">
                    <li><a href="insert.do">회원가입</a></li>
                    <li><a href="searchId.do">아이디 찾기</a></li>
                    <li><a href="searchPwd.do">비밀번호 찾기</a></li>
                </ul>
            </div>
            
            <!-- <div class="login_btn"><input type="submit" value="로그인" alt="로그인" /></div> -->
            <button class="login_btn">로그인</button>
            <button class="kakao_login_btn">카카오 계정으로 로그인</button>
        </form>
        <ul class="link_line clear">
            <li><a href="#">이용약관</a></li>
            <li><a href="#">개인정보처리방침</a></li>
            <li><a href="#">고객센터</a></li>
        </ul>
        <p class="contact">문의전화 : 010) 7680-7508(평일 09:00-18:00, 유료)</p>
    </div>
</body>

</html>