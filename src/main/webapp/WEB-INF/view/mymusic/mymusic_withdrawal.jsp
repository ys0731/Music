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
    <title>mymusic_withdrawal</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>

    <link rel="stylesheet" href="<%=path %>/css/reset.css">
    <script>
        $(document).ready(function(){

            // by click next_btn, go to page rusure.html
            $(".next_btn").click(function(event){
                event.preventDefault();
                var pwdCheck = $("#pwd_check").val();
                var hash = CryptoJS.MD5(pwdCheck);
                if (hash == "") {
                    alert("비밀번호를 입력해주세요.");
                } else if(hash == '${user.pwd}') {
                    window.location.href = "/music/user/mymusic_withdrawal_check.do";
                } else {
                    alert("비밀번호가 일치하지 않습니다.");
                }
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

        /* pwd check */
        h2 {width: fit-content; margin: 20px auto; font-size: 30px; }
        .pwd_check {width: 500px; margin: 0 auto; padding: 50px 70px; box-sizing: border-box; background-color: #b0c4de;}
        .pwd_check p {text-align: center; font-size: 18px; margin-bottom: 20px; color: #666;}
        .pwd_check div label {font-size: 20px; margin-right: 20px;}

        input[type="password"] {height: 30px; text-indent: 10px;}

        /* 다음 btn */
        .next_btn {width: 100%; height: 50px; margin-top: 30px; border: none; border-radius: 5px; background-color: #11264f; color: #fff; font-size: 20px; font-weight: bold; cursor: pointer;}
    </style>
</head>

<body>
    <h1 class="logo"><a href="index.html"></a></h1>
    <h2>회원 탈퇴</h2>
    <div class="pwd_check">
        <p>비밀번호를 입력해주세요.</p>
        <form action="" method="POST">
            <div class="name_wrapper">
                <label for="pwd_check">비밀번호 확인</label><input name="pwd_check" id="pwd_check" class="no_outline hide_input_outline" type="password" placeholder="비밀번호 입력">
            </div>
            <button class="next_btn">다음</button>
        </form>
    </div>
</body>

</html>