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
    <title>mymusic_withdrawal_check</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <link rel="stylesheet" href="<%=path %>/css/reset.css">
    <script>
        $(document).ready(function(){
            $(".agreed").click(function(event){
                event.preventDefault();
                location.href = "/music/mymusic/mymusic_delete.do";
                alert("회원탈퇴가 완료되었습니다.");
                window.location.href = "/music/index.do";
            });
            $(".cancel").click(function(event){
                event.preventDefault();
                alert("회원탈퇴가 취소되었습니다.");
                window.location.href = "/music/index.do";
            });
        });
    </script>
    <style>
        /* logo */
        .logo {
            margin: 0 auto;
            margin-top: 180px;
            width: 300px;
            background-image: url("<%=path %>/img/logo.png");
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

        /* rusure */
        h2 {width: fit-content; margin: 20px auto; font-size: 30px; }
        .rusure {width: 500px; margin: 0 auto; padding: 50px 70px; box-sizing: border-box; background-color: #b0c4de;}
        .rusure p {font-size: 18px; line-height: 20px; color: #666;}
        .rusure p:first-child {margin-bottom: 10px;}
        .rusurek div label {font-size: 20px; margin-right: 20px;}

        input[type="text"] {height: 30px; text-indent: 10px;}

        /* btn */
        button {width: 45%; height: 50px; margin-top: 30px; border: none; border-radius: 5px; color: #fff; font-size: 20px; font-weight: bold; cursor: pointer;}
        button:first-child {float: left; background-color: #11264f;}
        button:last-child {float: right; background-color: #666;}
    </style>
</head>

<body>
    <h1 class="logo"><a href="#"></a></h1>
    <h2>회원 탈퇴</h2>
    <div class="rusure">
        <p>회원 탈퇴 후 회원정보 및 개인 이용기록은 모두 삭제되며 삭제된 데이터는 복구할 수 없습니다.</p>
        <p>회원 탈퇴를 계속 진행하시겠습니까?</p>
        <form class="clear" action="/mymusic/mymusic_delete.do" method="POST">
            <button class="agreed">회원탈퇴</button>
            <button class="cancel">취소</button>
        </form>
    </div>
</body>

</html>