<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>searchPwd</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link href="<%=request.getContextPath()%>/css/reset.css" rel="stylesheet" type="text/css" />
    <script>
    function searchPwd() {
    	$.ajax({
    		url:'searchPwd.do',
    		data:{
    			id:$("#id").val(),
    			email:$("#email").val(),
    			nickname:$("#nickname").val()
    		},
    		method:"post",
    		success:function(res) {
    			if (res.trim() == 'ok') {
    				alert('회원님의 이메일로 임시비밀번호가 발급되었습니다.');
    				alert('로그인 페이지로 이동합니다.');
    				location.href='/SendMusic/user/login.do';
    				
    				
    			} else {
    				alert('아이디/이메일이 올바르지 않습니다.');
    			}
    		}
    	});
    	return false;
    }
        $(document).ready(function(){
            // avoid function without verifying email
            $(".next_btn").click(function(event){
                event.preventDefault();
            });

            // BLACKOUT!
            var win_hei = $(window).height();
            $(window).resize(function () {
                win_hei = $(window).height();
            });
            $(".id_found_background").height(win_hei);
        });
    </script>
    <style>
        /* logo */
        .logo {
            margin: 0 auto;
            margin-top: 180px;
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

        /* pwd find */
        h2 {width: fit-content; margin: 20px auto; font-size: 30px; }

        .pwd_find_wrapper {width: 500px; margin: 0 auto; padding: 50px 70px; box-sizing: border-box; background-color: #b0c4de;}
        .pwd_find_wrapper div {margin-bottom: 20px;}
        .pwd_find_wrapper div label {font-size: 20px; margin-right: 32px;}
        .pwd_find_wrapper div:nth-child(2) label {margin-right: 50px;}

        input[type="text"] {height: 30px; text-indent: 10px;}

        /* email */
        .email_wrapper label, .email_wrapper input, .email_wrapper button {float: left;}
        .email_wrapper label {line-height: 30px;}
        .email_wrapper button {display: block; float: left; width: 51px; height: 30px; margin-left: 5px; border-radius: 3px; background-color: #11264f; color: #fff; border: none; cursor: pointer;}
        .email_wrapper button:hover {background-color: #183670;}

        #ver_code {margin-left: 86px;}

        /* 다음단계 btn */
        .next_btn {width: 100%; height: 50px; margin-top: 30px; border: none; border-radius: 5px; background-color: #11264f; color: #fff; font-size: 20px; font-weight: bold; cursor: pointer;}
    </style>
</head>

<body>
    <h1 class="logo"><a href="index.html"></a></h1>
    <h2>비밀번호 찾기</h2>
    <div class="pwd_find_wrapper">
        <form action="searchPwd.do" method="POST" id="board1" name="board1">
            <div class="id_wrapper">
                <label for="id">아이디</label><input name="id" id="id" class="no_outline hide_input_outline" type="text" placeholder="아이디 입력">
            </div>
            <div class="nickname_wrapper">
                <label for="nickname">별명</label><input name="nickname" id="nickname" class="no_outline hide_input_outline" type="text" placeholder="별명 입력">
            </div>
            <div class="email_wrapper clear">
                <label for="email">이메일</label><input name="email" id="email" class="no_outline hide_input_outline" type="text" placeholder="이메일 입력">
            </div>
            <button class="next_btn" onclick="return searchPwd();">임시 비밀번호 발급</button>
        </form>
    </div>
</body>

</html>