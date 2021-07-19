<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>searchId</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link href="<%=request.getContextPath()%>/css/reset.css" rel="stylesheet"/>

    <script>
    function searchId() {
    	$.ajax({
    		url:'searchId.do',
    		method:'post',
    		data:{
    			email:$("#email").val(),
    			nickname:$("#nickname").val()
    		},
    		success:function(res) {
    			console.log(res);
    			if (res.trim() == '') {
    				$("#msg").text('입력하신 정보와 일치하는 아이디가 존재하지 않습니다.');
    			}  else {
    				$("#msg").text('회원님의 아이디는 "'+res.trim()+'"입니다.');
    			}
    		}
    	})
    	return false;
    }
    $(document).ready(function(){
        // avoid function without verifying email
        $(".next_btn").click(function(event){
            event.preventDefault();
            var nickname = $("#nickname").val();
            var email = $("#email").val();
            if(nickname == "") {
                alert('별명을 입력해주세요');
                $("#nickname").focus();
                return false;
            } else if(email == "") {
                alert('이메일을 입력해 주세요');
                $("#email").focus();
                return false;
            } else {
                $(".id_found_background").fadeIn(500);
            }
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

        /* id find */
        h2 {width: fit-content; margin: 20px auto; font-size: 30px; }

        .id_find_wrapper {width: 500px; margin: 0 auto; padding: 50px 70px; box-sizing: border-box; background-color: #b0c4de;}
        .id_find_wrapper div label {font-size: 20px;}
        .id_find_wrapper div {margin-bottom: 20px;}
        .id_find_wrapper div:nth-child(1) label {margin-right: 50px;}
        .id_find_wrapper div:nth-child(2) label {margin-right: 32px;}
        input[type="text"] {height: 30px; text-indent: 10px;}

        /* email */
        .email_wrapper label, .email_wrapper input, .email_wrapper button {float: left;}
        .email_wrapper label {line-height: 30px;}
        .email_wrapper button {display: block; float: left; width: 51px; height: 30px; margin-left: 5px; border-radius: 3px; background-color: #11264f; color: #fff; border: none; cursor: pointer;}
        .email_wrapper button:hover {background-color: #183670;}

        #ver_code {margin-left: 86px;}

        /* 다음단계 btn */
        .next_btn {width: 100%; height: 50px; margin-top: 30px; border: none; border-radius: 5px; background-color: #11264f; color: #fff; font-size: 20px; font-weight: bold; cursor: pointer;}

        /* id list popup */
        .id_found_background {display: none; position: absolute; top: 0; left: 0; width: 100%; background-color: rgba(0, 0, 0, 0.5);}

        .id_found_wrapper {position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 350px; height: 200px; padding: 20px; background-color: #fff;}
        .id_found_wrapper p {font-size: 10px; margin-top: 10px; padding-bottom: 10px; border-bottom: 1px solid #ccc;}

        .id_found_wrapper > div {width: 350px; position: absolute; bottom: 20px;}
        .login_btn, .find_pwd_btn {display: block; position: absolute; bottom: 0; width: 150px; text-align: center; border-radius: 5px;}
        .login_btn {left: 0; background-color: #11264f; color: #fff; line-height: 35px;}
        .find_pwd_btn {right: 0; border: 1px solid #aaa; color: #aaa; line-height: 33px;}
        
        #msg {font-size: 15px; margin-top: 10px;}
    </style>
</head>

<body>
    <h1 class="logo"><a href="index.html"></a></h1>
    <h2>아이디 찾기</h2>
    <div class="id_find_wrapper">
        <form action="searchId.do" method="POST" id="board1" name="board1">
            <div class="name_wrapper">
                <label for="nickname">별명</label><input name="nickname" id="nickname" class="no_outline hide_input_outline" type="text" placeholder="별명 입력">
            </div>
            <div class="email_wrapper clear">
                <label for="email">이메일</label><input name="email" id="email" class="no_outline hide_input_outline" type="text" placeholder="이메일 입력">
            </div>
            <button class="next_btn" onclick="return searchId();">다음단계</button>
        </form>
    </div>
    <div class="id_found_background">
        <div class="id_found_wrapper">
            <h3>입력하신 정보와 일치하는 아이디 목록입니다.</h3>
            <p>아이디 확인 후, 로그인 또는 비밀번호 찾기 버튼을 눌러주세요.</p>
            <h5 id="msg"></h5>
            <div>
                <a class="login_btn" href="login.do">로그인</a>
                <a class="find_pwd_btn" href="searchPwd.do">비밀번호 찾기</a>
            </div>
        </div>
    </div>
</body>

</html>