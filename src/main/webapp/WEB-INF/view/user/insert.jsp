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
    <link href="<%=request.getContextPath()%>/css/reset.css" rel="stylesheet" type="text/css" />
    <script>
    	//가입
    	function goSave() {
	        	if($("input[name=checked_id]").val()==''){
	        		alert('아이디 중복확인을 체크해주세요.');
	        		$("#id").focus();
	        		return;
	        	}
	        	if($("input[name=checked_nickname]").val()==''){
	        		alert('닉네임 중복확인을 체크해주세요.');
	        		$("#nickname").focus();
	        		return;
	        	}	        	
	        	if($('input[name="checked_list"]').val()==''){
	        		alert('이용약관에 모두 동의해주세요.');
	        		return;
	        	}
	        	if($('input[name="checked_pwd"]').val()==''){
	        		alert('영문,숫자,특수문자를 포함하여 입력해주세요.');
	        		$("#pwd").focus();
	        		return;
	        	}	        	
	   			if (confirm('가입하시겠습니까?')) {
	   			$.ajax({
	   				url:'insertAjax.do', 
	   				data:$("#frm").serialize(),
	   				success:function(res){
	   					if(res.trim() =='true'){
	   						alert('정상적으로 가입되었습니다.');
	   						location.href='/music/index.do';
	   					}else{
	   						alert('등록 실패'); 
	   					}
	   				}
	   			});
	   		}
        	
    	}
        
        // 전체 선택을 체크하면 개별 체크박스들도 모두 체크
        function isAllChk(){
        	var chk = $("#check_all").prop("checked");
        	if(chk){
        		$('input:checkbox[name="check_list"]').prop("checked",true);
        		$('input[name="checked_list"]').val('y');
        	
        	}else{
        		$('input:checkbox[name="check_list"]').prop("checked",false);
        		$('input[name="checked_list"]').val('');
        	}
        };

        // 개별 체크 박스를 선택, 취소하면 전체 선택 체크박스는 해제 
        function isChk(){
        	$("#check_all").prop("checked",false);
        	$('input[name="checked_list"]').val('');
        };
        
        $(function(){
        	//비밀번호 유효성 검사
            $("#pwd").keyup(function(){
				$.ajax({
					url:'<%=request.getContextPath()%>/user/isVaildPwd.do',
					data:{
						pwd:$('#pwd').val()
					},
					success : function(res){
						if(res.trim() == 'true'){
							$("#isVaildPwd").attr("src","../img/check_done.png");
							$("input[name=checked_pwd]").val('y');
						}else{
							$("#isVaildPwd").attr("src","../img/check_x.png");
							$("input[name=checked_pwd]").val('');
						}
					}					
				});
            });
        	
            // 비밀번호 재입력 검사                     
            $("#pwd_check").keyup(function(){
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
          
            // '자세히 보기' scroll move
            var term = $(".terms").offset().top;

            $(".check_list_wrapper div a").click(function(event) {
                event.preventDefault();
                $("html,body").stop().animate({"scrollTop":term-180});
            });
            
            //아이디 중복확인
            $("#duplBtn").click(function(){
    			if($("#id").val()==''){
    				alert('아이디를 입력해 주세요.');
    				$("#id").focus();
    			}else{
    				$.ajax({
    					url:'<%=request.getContextPath()%>/user/isDuplicateId.do',
    					data:{
    						id:$('#id').val()
    						},
    					success : function(res){
    						if(res.trim() == 'true'){
    							alert('중복된 아이디입니다. 다른 아이디를 입력해주세요.')
    							$('#id').val('');
    							$('#id').focus(); 
    							$("input[name=checked_id]").val('');
    						}else{
    							alert('사용 가능한 아이디입니다.')
    							$("input[name=checked_id]").val('y');
    							$("#id").keyup(function(){
    								$("input[name=checked_id]").val('');
    							});
    						}
    					}	
    				});
    			}
    		});
         
            //닉네임 중복확인
            $("#duplNicknameBtn").click(function(){
    			if($("#nickname").val()==''){
    				alert('닉네임을 입력해 주세요.');
    				$("#nickname").focus();
    			}else{
    				$.ajax({
    					url:'<%=request.getContextPath()%>/user/isDuplicateNickname.do',
    					data:{
    						nickname:$('#nickname').val()
    						},
    					success : function(res){
    						if(res.trim() == 'true'){
    							alert('중복된 닉네임입니다. 다른 닉네임을 입력해주세요.')
    							$('#nickname').val('');
    							$('#nickname').focus(); 
    							$("input[name=checked_nickname]").val('');
    						}else{
    							alert('사용 가능한 닉네임입니다.')
    							$("input[name=checked_nickname]").val('y');
    							$("#nickname").keyup(function(){
    								$("input[name=checked_nickname]").val('');
    							});
    						}
    					}	
    				});
    			}
    		}); 
            
            
        });
    </script>
    <style>
        /* logo */
        .logo {
            margin: 0 auto;
            margin-top: 75px;
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
        .input_wrapper > div:nth-child(1) label {margin-right: 30px;}
        .input_wrapper > div:nth-child(2) label {margin-right: 17px;}
        .input_wrapper > div:nth-child(3) input {margin-left: 99px;}
        .input_wrapper > div:nth-child(4) label {margin-right: 45px;}
        
        .input_wrapper > div:nth-child(5) label {margin-right: 35px;}
        .input_wrapper > div:nth-child(6) span {margin-right: 68px;}
        .input_wrapper > div:nth-child(6) label {margin-right: 5px;}
        .input_wrapper > div:nth-child(6) input[type="radio"] {margin-right: 10px;}
        .input_wrapper > div:nth-child(7) label {margin-right: 45px;}
        /* .input_wrapper > div:nth-child(8) > div:nth-child(2) {margin-left: 104px;} */

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
        
        /* 중복확인 버튼 */
        .id_check {display:inline-block; background:#11264f; !important; color:#fff !important; text-decoration:none !important; height:23px ; line-height:23px; border: none; border-radius: 5px;padding:5px; }
    </style>
</head>

<body>
    <h1 class="logo"><a href="index.html"></a></h1>
    <div class="register_wrapper">
        <form action="" method="post" name="frm" id="frm">
            <div class="input_wrapper">
                <div class="id_wrapper">
                    <label for="id">*아이디</label>
                    <input name="id" id="id" class="no_outline hide_input_outline" type="text" placeholder="아이디 입력">
                     <span class="id_check"><a href="javascript:;" id="duplBtn">중복확인</a></span> 
                     <input type="hidden" name="checked_id" value="">
                </div>
                <div class="pwd_wrapper">
                    <label for="pwd">*비밀번호</label><input name="pwd" id="pwd" class="no_outline hide_input_outline" type="password" placeholder="비밀번호 입력">
                    <span><img src="../img/check_x.png" id="isVaildPwd" style="margin-left:20px; margin-top: 2px"></span>
                     <input type="hidden" name="checked_pwd" value="">
                    <p>비밀번호는 8자리 이상이어야 하며 영문, 숫자, 특수문자를 반드시 모두 포함하여 사용하여야 합니다.</p>
                </div>
                <div class="pwd_check_wrapper">
                    <input id="pwd_check" class="no_outline hide_input_outline" type="password" placeholder="비밀번호 재입력">
                    <span>비밀번호가 일치하지 않습니다.</span>
                </div>
                <div class="email_wrapper">
                    <label for="email">이메일</label><input name="email" id="email" class="no_outline hide_input_outline" type="text" placeholder="ex) goldrocket@naver.com">
                </div>
                <div class="nickname_wrapper">
                    <label for="nickname">*닉네임</label><input name="nickname" id="nickname" class="no_outline hide_input_outline" type="text">
                    <span class="id_check"><a href="javascript:;" id="duplNicknameBtn">중복확인</a></span> 
                     <input type="hidden" name="checked_nickname" value="">
                </div>
              
                <div class="gender_wrapper">
                    <span class="gender">성별</span>
                    <label for="male">남</label><input type="radio" name="gender" id="male" value="male" checked>
                    <label for="female">여</label><input type="radio" name="gender" id="female" value="female">
                </div>
                <div class="tel_wrapper">
                    <label for="phone_number">연락처</label><input name="tel" id="tel" class="no_outline hide_input_outline" type="text" placeholder="ex) 01012341234" maxlength="11">
                </div>                
            </div>
            <div class="check_all_wrapper">
                <input name="check_all" id="check_all" class="no_outline hide_input_outline" type="checkbox" onclick="isAllChk();"><label for="check_all">아래 내용에 모두 동의합니다.</label>
            </div>
            <div class="check_list_wrapper">
                <div class="check_1_wrapper">
                    <input name="check_list" id="check_1" class="no_outline hide_input_outline" type="checkbox" onclick="isChk();"><label for="check_1">이용약관에 동의합니다.</label><a href="#">자세히 보기</a>
                </div>
                <div class="check_2_wrapper">
                    <input name="check_list" id="check_2" class="no_outline hide_input_outline" type="checkbox" onclick="isChk();"><label for="check_2">개인정보 수집 및 이용에 대한 안내에 동의합니다.</label><a href="#">자세히 보기</a>
                </div>
                <div class="check_3_wrapper">
                    <input name="check_list" id="check_3" class="no_outline hide_input_outline" type="checkbox" onclick="isChk();"><label for="check_3">개인정보 처리업무의 위탁에 동의합니다.</label><a href="#">자세히 보기</a>
                </div>
                <input type="hidden" name="checked_list" value="">
            </div>
        </form>
            <button class="finish_btn" onclick="goSave();">가입완료</button>
    </div>
    <div class="terms">
        <h3>이용약관</h3>
        <textarea name="" id="" class="hide_input_outline no_outline" cols="" rows="4" readonly>이용약관입니다.
        </textarea>
        <h3>개인정보 수집 및 이용에 대한 안내</h3>
        <textarea name="" id="" class="hide_input_outline no_outline" cols="" rows="4" readonly>
1. 처리하는 개인정보 항목

회원제 서비스를 이용하기 위해 회원가입이 필요하며, 아래와 같이 필요한 최소한의 개인정보를 수집합니다.

- 수집하는 개인정보 : 이름, 연령대, 성별, 이메일주소
        </textarea>
        <textarea name="" id="" class="hide_input_outline no_outline" cols="" rows="4" readonly>
2. 개인정보의 처리목적

회사는 회원관리, 서비스 향상 및 개선, 부정 이용의 방지 및 제재, 맞춤 서비스 제공을 위한 목적만으로 개인정보를 처리합니다.
        </textarea>
        <textarea name="" id="" class="hide_input_outline no_outline" cols="" rows="4" readonly>
3. 개인정보의 제 3자 제공

회사는 개인정보를 “2. 개인정보의 처리목적”에서 고지한 범위내에서 이용하며, 정보주체의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 개인정보를 외부에 공개하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.
        </textarea>
        <textarea name="" id="" class="hide_input_outline no_outline" cols="" rows="4" readonly>
4. 개인정보 처리의 위탁

회사는 원활한 업무 처리를 위해서 아래와 같이 개인정보를 위탁하고 있으며, 관계 법령에 따른 위탁계약 시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다.
        </textarea>
    </div>
</body>

</html>