<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
     <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>문의게시판 상세페이지</title>
    <%@ include file="/WEB-INF/view/include/headHtml.jsp" %>

</head>
<style>
    .notice_btn li {float: right; width: 100px; height: 30px; border-radius: 5px; background-color: #11264f; color: #fff; line-height: 30px; text-align: center; margin-right: 5px;}
    .notice_btn li:hover {background-color: #4169E1;}
    .notice_btn li a {display: block; width: 100%;}
    .notice_margin {margin-bottom: 10px;}
    .notice_title {margin-top: 20px; margin-bottom: 20px;}

    h2 {font-size: 26px; margin-bottom: 20px;}

    /* table part */
    .qna_title {text-align: center;}
    .qna_content {text-align: center;}
    .form_qna table {width: 100%; border: 2px solid #ccc;}
    .form_qna table tr {border-bottom: 2px solid #ccc;}
    .form_qna table tr:nth-child(1) { border-top: 2px solid #ccc;}
    .form_qna table tr:nth-child(2) {height: 203px;}
    .form_qna table tr td:last-child {width: 80%; border-right: 2px solid #ccc;}
    .form_qna table tr:first-child {height: 30px;}
    .form_qna table tr:first-child td:last-child input {width: 99%; border: none; height: 30px; font-size: 15px; text-indent: 10px;}
    .form_qna table tr:first-child td:last-child input:focus {outline: none;}
    .form_qna table tr:nth-child(2) td:last-child input {width: 99%; border: none;}
    .form_qna table tr td:first-child {background-color: #B0C4DE;}
    .form_qna table td:nth-child(1) {border-right: 2px solid #ccc;}
    .tbl_qna textarea:focus {outline: none;}
    .tbl_qna textarea {resize: none; width: 99.7%; border: none; font-size: 20px; padding-left: 10px; box-sizing: border-box;}
    
    /* form button part */
    .qna_form_btn {width: 100px; height: 30px; border-radius: 5px; background-color: #11264f; color: white; font-family: 'twayair', sans-serif; line-height: 30px; text-align: center; margin-top: 10px; border: #11264f;}
    .qna_form_btn:hover {background-color: #4169E1;}
    #classify {margin-left: 10px; font-size: 15px;}
    #classify:focus {outline: none;}

    /* form button wrapper */
    .notice_btn_box_wrapper {text-align: center;}
    .notice_btn_box {display: inline-block; margin-bottom: 10px;}
    .notice_regi_title {text-align: center;}
</style>
<body>
 
    <%@ include file="/WEB-INF/view/include/top.jsp" %>

    <div id="container">
        <div class="center">
            <div>
            </div>
            <div class="notice_title">
                <h2>문의게시판</h2>
            </div>
            <ul class="notice_btn clear">
                <li><a href="edit.do?no=${vo.no}">수정</a></li>
                <li><a href="javascript:isDel();">삭제</a></li>
            </ul>
            <div class="notice_margin"></div>
            <form class="form_qna" action="" method="POST" onsubmit="return chk_form()">
                <table class="tbl_qna" name="tbl">
                    <tr>
                        <td class="qna_title">제목</td>
                        <td><input type="text" name="title" id="title"readonly>${vo.title }</td>
                    </tr>
                    <tr>
                        <td class="qna_content">내용</td>
                        <td>${vo.content }</td>
                    </tr>
                    <tr>
                    <c:if test="${!empty vo.answer}">
                        <td class="notice_regi_title" style="width: 100;">답변</td>
                        <td><textarea name="content" id="content" cols="30" rows="10" readonly>${vo.answer}</textarea></td>
                    </c:if>
                    </tr>
                </table>
                <div class="notice_btn_box_wrapper">
                    <div class="notice_btn_box">
                        <input class="qna_form_btn" type="button" value="이전" onclick="location.href='index.do?reqPage=${param.reqPage}&stype=${param.stype}&sval=${param.sval}'"> 
                    </div>
                </div>
	          
            </form>
        </div>
    </div>

     <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
         <script>
    	function isDel() {
    		if (confirm('삭제하시겠습니까?')) {
    			// 삭제처리
    			$.ajax({
    				url:'delete.do',
    				data:{
    					'no':${vo.no}
    				},
    				method:'post',
    				success:function(res) {
    					console.log(res);
    					if (res.trim() == 'true') {
    						alert('정상적으로 삭제되었습니다.');
    						location.href='index.do';
    					} else {
    						alert('삭제 실패');
    					}
    				},
    				error : function(res) {
    					console.log(res);
    				}
    			});
    		}
    	}
    </script>
</body>
</html>