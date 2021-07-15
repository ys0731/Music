<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질문게시판 등록</title>
     <%@ include file="/WEB-INF/view/include/headHtml.jsp" %>

</head>

<style>
    .notice_title {margin-top: 20px; margin-bottom: 20px;}
    .notice_regi_title {text-align: center;}
    h2 {font-size: 25px; margin-bottom: 20px;}

    /* 테이블 영역 */
    .form_qna table {width: 100%; border: 2px solid #ccc;}
    .form_qna table tr {border-bottom: 2px solid #ccc;}
    .form_qna table tr:nth-child(1) { border-top: 2px solid #ccc;}
    .form_qna table tr:nth-child(2) {height: 30px;}
    .form_qna table tr:nth-child(3) {height: 30px;}
    .form_qna table tr td:last-child {width: 80%; border-right: 2px solid #ccc;}
    .form_qna table tr:first-child {height: 30px;}
    .form_qna table tr td:first-child {background-color: #B0C4DE;}
    .form_qna table tr:first-child td:last-child input {width: 99%; border: none; height: 30px; font-size: 15px; text-indent: 10px;}
    .form_qna table tr:nth-child(2) td:last-child input {width: 99%; border: none; height: 30px; font-size: 15px; text-indent: 10px;}
    .form_qna table tr:nth-child(2) td:last-child input:focus {outline: none;}
    .form_qna table tr:first-child td:last-child input:focus {outline: none;}
    .form_qna table tr:nth-child(3) td:last-child input {width: 5%; border: none;}
    .form_qna table td:nth-child(1) {border-right: 2px solid #ccc;}
    .tbl_qna textarea:focus {outline: none;}
    .tbl_qna textarea {resize: none; width: 99.7%; border: none; font-size: 20px; padding-left: 10px; box-sizing: border-box;}
    
    /* 등록 취소 버튼 */
    .qna_form_btn {width: 100px; height: 30px; border-radius: 5px; background-color: #11264f; color: white; font-family: 'twayair', sans-serif; line-height: 30px; text-align: center; margin-top: 10px; border: #11264f;}   
    .qna_form_btn:hover {background-color: #4169E1;}
    .qna_cancel_btn {width: 100px; height: 30px; border-radius: 5px; background-color: #11264f; color: white; font-family: 'twayair', sans-serif; line-height: 30px; text-align: center; margin-top: 10px; border: #11264f;}   
    .qna_cancel_btn:hover {background-color: #4169E1;}

    /* radio button */
    .chk_open {margin-right: 0; border: 1px solid #ccc;}

     /* form button wrapper */
    .notice_btn_box_wrapper {text-align: center;}
    .notice_btn_box {display: inline-block; margin-bottom: 10px;}

    #container {margin-bottom: 200px;}
</style>
<script>
	function goSave() {
		oEditors.getById['content'].exec("UPDATE_CONTENTS_FIELD",[]);
		$("#frm").submit();
	}
	var oEditors;
	$(function(){
		oEditors = setEditor("content"); // id
	});
/*     $(document).ready(function() {
        $(".qna_form_btn").click(function(){
            var id = $("#id").val();
            var title = $("#title").val();
            var content = $("#content").val();
            if(id == "") {
                alert('아이디');
                $("#id").focus();
                return false;
            } else if(title == "") {
                alert('제목을 입력해 주세요');
                $("#title").focus();
                return false;
            } else if(content == "") {
                alert('내용을 입력해 주세요');
                $("#content").focus();
                return false;
            }
        });
    }); */
</script>
<body>
     <%@ include file="/WEB-INF/view/include/top.jsp" %>
  
    <div id="container">
        <div class="center">
            <div>
            </div>
            <div class="notice_title">
                <h2>문의게시판</h2>
            </div>
            <form class="form_qna" name="frm" id="frm" action="insert.do" method="post" onsubmit="return goSave();">
                <table class="tbl_qna" name="tbl">
                    <tr>
                        <td class="notice_regi_title"><label for="id">닉네임</label></td>
                        <td><input type="text" name="nickname" id="nickname" readonly value="작성자닉네임"></td>
                    </tr>
                    <tr>
                        <td class="notice_regi_title"><label for="title">제목</label></td>
                        <td><input type="text" name="title" id="title"></td>
                    </tr>
                    <tr>
                        <td class="notice_regi_title"><rabel for="openChk">공개여부</rabel></td>
                        <td>
                           <input type="radio" class="chk_open" name="secret" id="open" value="0" checked ><label for="open">전체 공개</label>
                           <input type="radio" class="chk_open" name="secret" id="close" value="1"><label for="close">비공개</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="notice_regi_title" style="width: 100;"><label for="content">내용</label></td>
                        <td><textarea name="content" id="content" cols="30" rows="10"></textarea></td>
                    </tr>
                </table>
                <div class="notice_btn_box_wrapper">
                    <div class="notice_btn_box">
                        <input class="qna_form_btn" type="submit" value="등록">
                        <input class="qna_cancel_btn" type="button" value="취소" onclick="location.href='index.do';">
                    </div>
                </div>
            </form>
        </div>
    </div>
     <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
 
</body>
</html>