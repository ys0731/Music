<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>register</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <link rel="stylesheet" href="css/reset.css">
    <script>
        // input number only
        function isNumberKey(event){
            var charCode = (event.which) ? event.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }

        $(document).ready(function(){
            // password_correspond
            $("#pwd_check, #pwd").keyup(function(){
                var pwd = $("#pwd").val();
                var pwdCheck = $("#pwd_check").val();
                if (pwdCheck == "") {
                    $(".register_wrapper form .pwd_check_wrapper span").css({'display': 'none'});
                } else if (pwd != pwdCheck) {
                    $(".register_wrapper form .pwd_check_wrapper span").css({'display': 'block'});
                } else {
                    $(".register_wrapper form .pwd_check_wrapper span").css({'display': 'none'});
                }
            });

            // country_code
            $("#country").change(function(){
                var countrySelect = $("#country").val();
                $("#countryCode").val("+" + countrySelect);
            });
            
            // check_all function
            $("input:checkbox[name='check_list']").change(function(){
                check_length = $("input:checkbox[name='check_list']:checked").length;

                if(check_length == 3) {
                    $("#check_all").prop("checked", true);
                } else {
                    $("#check_all").prop("checked", false);
                }

                if ($("#check_1").is(':checked') && $("#check_2").is(':checked') && $("#check_3").is(':checked')) {
                    $(".finish_btn").addClass("on");
                } else {
                    $(".finish_btn").removeClass("on");
                }
            });
            $("#check_all").change(function(){
                if ($("#check_all").is(':checked')) {
                    $("input[type='checkbox'][name='check_list']").prop("checked", true);
                    $(".finish_btn").addClass("on");
                } 
                else {
                    $("input[type='checkbox'][name='check_list']").prop("checked", false);
                    $(".finish_btn").removeClass("on");
                }
            });

            // '자세히 보기' scroll move
            var term = $(".terms").offset().top;

            $(".check_list_wrapper div a").click(function(event) {
                event.preventDefault();
                $("html,body").stop().animate({"scrollTop":term-180});
            });
        });
    	function goSave() {
    		var con = true;
    		
   			if ($('#id').val().trim()=='') {
   				alert('아이디를 입력해 주세요');
   				$('#id').focus();
   				return;
   			} else {
   				$.ajax({
   					url:'<%=request.getContextPath()%>/user/isDuplicateId.do',
   					data:{id:$('#id').val()},
   					async:false,
   					success : function(res) {
   						if (res.trim() == 'true') {
   							alert('중복된 아이디입니다. 다른 아이디를 입력해 주세요');
   							$('#id').val('');
   							$('#id').focus();
   							con = false;
   						}
   					}
   				});
   			}
   			if (con == false) return;
   			// 비밀번호 체크
   			// 이름
   			// 이메일
   			// 전화번호
    		if (confirm('가입하시겠습니까?')) {
    			//$('#frm').submit();
    			$.ajax({
    				url:'insertAjax.do',
    				data:$("#frm").serialize(),
    				method:'post',
    				success:function(res) {
    					if (res.trim() == 'true') {
    						alert('정상적으로 가입되었습니다.');
    						location.href='/music/sendmusic/index.do';
    					} else {
    						alert('등록 실패');
    					}
    				}
    			});
    		}
    	}
    	$(function() {
    		$("#duplBtn").click(function() {
    			if ($('#id').val().trim()=='') {
    				alert('아이디를 입력해 주세요');
    				$('#id').focus();
    			} else {
    				$.ajax({
    					url:'<%=request.getContextPath()%>/user/isDuplicateId.do',
    					data:{id:$('#id').val()},
    					success : function(res) {
    						if (res.trim() == 'true') {
    							alert('중복된 아이디입니다. 다른 아이디를 입력해 주세요');
    							$('#id').val('');
    							$('#id').focus();
    						} else {
    							alert('사용 가능한 아이디입니다.');
    						}
    					}
    				});
    			}
    		})
    	});
    </script>
    <style>
        /* logo */
        .logo {
            margin: 0 auto;
            margin-top: 75px;
            width: 300px;
            background-image: url("img/logo.png");
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

        /* register */
        .register_wrapper {width: 480px; background-color: #b0c4de; margin: 0 auto; padding: 50px; border-top-left-radius: 20px; border-top-right-radius: 20px;}

        .input_wrapper > div {margin-bottom: 20px;}
        .input_wrapper > div:nth-child(2) {margin-bottom: 0}
        .input_wrapper label, .input_wrapper form div span {font-size: 20px; margin-right: 10px; color: #000;}
        .gender_wrapper label {margin-right: 0;}
        .check_all_wrapper {padding-top: 15px; padding-bottom: 10px; border-top: 5px double #fff; border-bottom: 2px solid #fff; margin-bottom: 10px;}
        .check_list_wrapper > div {margin-bottom: 10px;}
        .check_all_wrapper label, .check_list_wrapper label {font-size: 18px; margin-left: 10px; margin-right: 10px; }
        .check_all_wrapper a, .check_list_wrapper a {text-decoration: underline;}
        .check_all_wrapper a:hover, .check_list_wrapper a:hover {color: #666;}
        .input_wrapper div input[type="text"], .input_wrapper div input[type="password"] {width: 300px; height: 30px; text-indent: 10px;}

        /* register labels */
        .input_wrapper > div:nth-child(1) label {margin-right: 50px;}
        .input_wrapper > div:nth-child(2) label {margin-right: 32px;}
        .input_wrapper > div:nth-child(3) input {margin-left: 104px;}
        .input_wrapper > div:nth-child(4) label {margin-right: 50px;}
        .input_wrapper > div:nth-child(5) label {margin-right: 68px;}
        .input_wrapper > div:nth-child(6) label {margin-right: 32px;}
        .input_wrapper > div:nth-child(7) span {margin-right: 68px;}
        .input_wrapper > div:nth-child(7) label {margin-right: 5px;}
        .input_wrapper > div:nth-child(7) input[type="radio"] {margin-right: 10px;}
        .input_wrapper > div:nth-child(8) label {margin-right: 45px;}
        .input_wrapper > div:nth-child(8) > div:nth-child(2) {margin-left: 104px;}

        /* pwd */
        .pwd_wrapper p {width: 296.36px; margin: 20px 0 20px 104px; font-size: 15px; line-height: 20px; color: #666;}

        /* .pwd check */
        .pwd_check_wrapper {height: 50px;}
        .pwd_check_wrapper input {display: block;}
        .pwd_check_wrapper span {display: none; margin-top: 10px; margin-left: 104px; font-size: 15px; color: red;}

        /* gender */
        .gender_wrapper span {font-size: 20px;}

        /* tel */
        .tel_top_wrapper {margin-bottom: 10px;}
        #country {height: 30px;}
        #countryCode {width: 60px; height: 30px; text-indent: 10px;}
        #phone_number {display: block; float: left;}
        .tel_bottom_wrapper button {display: block; float: left; width: 51px; height: 30px; margin-left: 5px; border-radius: 3px; background-color: #11264f; color: #fff; border: none; cursor: pointer;}
        .tel_bottom_wrapper button:hover {background-color: #183670;}
        .tel_bottom_wrapper button:active {border: 1px solid #111; box-sizing: border-box;}

        /* finish_btn */
        .finish_btn {width: 100%; height: 50px; margin-top: 30px; border: none; border-radius: 5px; background-color: #333; color: #fff; font-size: 20px; font-weight: bold; cursor: pointer;}
        .finish_btn.on {background-color: #11264f;}

        /* terms */
        .terms {width: 480px; background-color: #b0c4de; margin: 0 auto; padding: 50px; border-top: 2px solid #fff; margin-bottom: 100px; border-bottom-left-radius: 20px; border-bottom-right-radius: 20px;}
        .terms h3 {font-size: 20px; margin: 10px 0;}
        .terms h3:nth-child(1) {margin-top: 0;}
        .terms textarea {width: 100%; resize: none; padding: 10px;}
    </style>
</head>

<body>
    <h1 class="logo"><a href="index.html"></a></h1>
    <div class="register_wrapper">
        <form action="insert.do" method="POST">
            <div class="input_wrapper">
                <div class="id_wrapper">
                    <label for="id">아이디</label><input name="id" id="id" class="no_outline hide_input_outline" type="text" placeholder="아이디 입력">
                </div>
                <div class="pwd_wrapper">
                    <label for="pwd">비밀번호</label><input name="pwd" id="pwd" class="no_outline hide_input_outline" type="password" placeholder="비밀번호 입력">
                    <p>비밀번호는 8자리 이상이어야 하며 영문, 숫자를 반드시 모두 포함하여 사용하여야 합니다.</p>
                </div>
                <div class="pwd_check_wrapper">
                    <input name="pwd_check" id="pwd_check" class="no_outline hide_input_outline" type="password" placeholder="비밀번호 재입력">
                    <span>비밀번호가 일치하지 않습니다.</span>
                </div>
                <div class="email_wrapper">
                    <label for="email">이메일</label><input name="email" id="email" class="no_outline hide_input_outline" type="text" placeholder="ex) goldrocket@naver.com">
                </div>
                <div class="nickname_wrapper">
                    <label for="nickname">별명</label><input name="nickname" id="nickname" class="no_outline hide_input_outline" type="text">
                </div>
                <div class="birth_date_wrapper">
                    <label for="birth_date">생년월일</label><input name="birth_date" id="birth_date" class="no_outline hide_input_outline" type="text" placeholder="ex) 19970112" maxlength="8">
                </div>
                <div class="gender_wrapper">
                    <span class="gender">성별</span><label for="male">남</label><input type="radio" name="gender" id="male" value="0"><label for="female">여</label><input type="radio" name="gender" id="female" value="0">
                </div>
                <div class="tel_wrapper">
                    <div class="tel_top_wrapper">
                        <label for="phone_number">휴대폰</label>
                    </div>
                    <div class="tel_bottom_wrapper clear">
                        <input name="phone_number" id="phone_number" class="no_outline hide_input_outline" type="text" style="width: 125px;" onkeypress="return isNumberKey(event)" maxlength="11">
                    </div>
                </div>
            </div>
            <div class="check_all_wrapper">
                <input name="check_all" id="check_all" class="no_outline hide_input_outline" type="checkbox"><label for="check_all">아래 내용에 모두 동의합니다.</label>
            </div>
            <div class="check_list_wrapper">
                <div class="check_1_wrapper">
                    <input name="check_list" id="check_1" class="no_outline hide_input_outline" type="checkbox"><label for="check_1">이용약관에 동의합니다.</label><a href="#">자세히 보기</a>
                </div>
                <div class="check_2_wrapper">
                    <input name="check_list" id="check_2" class="no_outline hide_input_outline" type="checkbox"><label for="check_2">개인정보 수집 및 이용에 대한 안내에 동의합니다.</label><a href="#">자세히 보기</a>
                </div>
                <div class="check_3_wrapper">
                    <input name="check_list" id="check_3" class="no_outline hide_input_outline" type="checkbox"><label for="check_3">개인정보 처리업무의 위탁에 동의합니다.</label><a href="#">자세히 보기</a>
                </div>
            </div>
            <button class="finish_btn">가입완료</button>
        </form>
    </div>
    <div class="terms">
        <h3>이용약관</h3>
        <textarea name="" id="" class="hide_input_outline no_outline" cols="" rows="4" readonly>
Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi fugit unde dignissimos, debitis enim quae dolor voluptate iure ex nihil aliquid quibusdam, quis inventore veniam earum optio fuga suscipit! Facere?
        </textarea>
        <h3>개인정보 수집 및 이용에 대한 안내</h3>
        <textarea name="" id="" class="hide_input_outline no_outline" cols="" rows="4" readonly>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad fugit ipsa omnis. Natus asperiores illum qui minus, rerum inventore laudantium sed ipsum voluptatibus laborum aliquam minima porro ea consectetur magnam!
        </textarea>
        <textarea name="" id="" class="hide_input_outline no_outline" cols="" rows="4" readonly>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad fugit ipsa omnis. Natus asperiores illum qui minus, rerum inventore laudantium sed ipsum voluptatibus laborum aliquam minima porro ea consectetur magnam!
        </textarea>
        <textarea name="" id="" class="hide_input_outline no_outline" cols="" rows="4" readonly>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad fugit ipsa omnis. Natus asperiores illum qui minus, rerum inventore laudantium sed ipsum voluptatibus laborum aliquam minima porro ea consectetur magnam!
        </textarea>
        <textarea name="" id="" class="hide_input_outline no_outline" cols="" rows="4" readonly>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad fugit ipsa omnis. Natus asperiores illum qui minus, rerum inventore laudantium sed ipsum voluptatibus laborum aliquam minima porro ea consectetur magnam!
        </textarea>
    </div>
</body>

</html>