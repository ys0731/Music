<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
	String path = request.getContextPath();
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내정보</title>
   <%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
    
    <script>           
          	$(function() {
          	//닉네임 중복확인
                $("#chk_nick").click(function(){
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
              	
              	$(".myinfo_btn").click(function() {
              		if($("#nickname").val()==''){
        				alert('닉네임을 입력해 주세요.');
        				$("#nickname").focus();
        			} else {
        				$.ajax({
        					url:'<%=request.getContextPath()%>/mymusic/mymusic_nick_edit.do',
        					data:{
        						nickname:$('#nickname').val()
        						},
        					success : function(res){
        						alert('닉네임이 변경되었습니다.')
        						location.href="/music/mymusic/mymusic.do"
        					}
        				})
        			}
              	});
          	})
        
    </script>    
</head>

<style>
    .top_title {margin-top: 40px;}
    .top_title h2 {font-size: 26px; margin-bottom: 15px;}
    .top_title2 {margin-bottom: 10px;}

    /* 프로필 이미지 영역 */
    .my_info_div {background-color: #B0C4DE; height: 200px; }
    .left {float: left; width: 25%;}
    #profile_image {height: 150px; width: 150px; margin-top: 25px; margin-left: 50px; border-radius: 10%;}
    .right {float: right; width: 75%; margin-top: 5%;}

    /* 중간 공백 */
    .center_div {height: 100px;}
    
    /* 프로필 설정 영역 */
    .bottom_title {margin-bottom: 10px;}
    #nickname{text-indent: 10px; height: 25px;}
    #nickname:focus {outline: none;}
    .my_info_div2 { height: 70px; border: solid 1px #ccc; margin-bottom: 50px;}
    .left2 {float: left; width: 20%; height:100%; background-color: #B0C4DE; text-align: center; }
    .right2 {float: right; width: 80%; height: 100%;}
    .right2 input {margin-top: 20px; margin-left: 8px; height: 30px; width: 185px;}
    #chk_nick {margin: auto 0;  width: 100px; border-radius: 5px; background-color: #11264f; color: white; 
                line-height: 30px; text-align: center; margin-right: 5px; font-family: 'twayair', sans-serif; border: 0;} 
    #chk_nick:hover {background-color: #4169E1;}

    /* button part */
    .btn_myinfo_div {height: 100px; display: inline-block; margin-left: 408px;}
    .btn_myinfo li {margin: auto 0; float: left; width: 100px; border-radius: 5px; background-color: #11264f; color: white; line-height: 30px; text-align: center; margin-right: 5px;}
    .btn_myinfo li:hover {background-color: #4169E1;}
    .btn_myinfo li a {display: block; width: 100%;}
</style>

<body>
   <%@ include file="/WEB-INF/view/include/top.jsp" %>
    <div id="container">
        <div class="center">
            <div id="visual">
                <div class="top_title">
                    <h2>내정보</h2>
                </div>                            
                <div class="bottom_title">
                    <h1>프로필 설정</h1>
                </div>
                <div class="my_info_div2">
                    <div class="left2">
                         <label for="nickname"><p style="margin-top: 27.5px;">별명</p></label>
                    </div>
                    <div class="right2">
                         <input type="text" name="nickname" id="nickname">
                         <button id="chk_nick">중복확인</button>
                    </div>
                 </div>
                 <div class="btn_myinfo_div">
                    <ul class="btn_myinfo">
                       <li><a href="#" class="myinfo_btn">확인</a></li>
                       <li><a onclick="history.back()">취소</a></li>
                   </ul>
               </div>
            </div>
            <div class="notice"></div>
        </div>
    </div>
    <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
</body>
</html>
