<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
     <%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
</head>
<style>
    /* notice detail page */
    h2 {font-size: 26px;}

    /* update & delete button */
    .notice_btn li {float: right; width: 100px; height: 30px; border-radius: 5px; background-color: #11264f; color: #fff; line-height: 30px; text-align: center; margin-right: 5px;}
    .notice_btn li:hover {background-color: #4169E1;}
    .notice_btn li a {display: block; width: 100%;}
    .notice_margin {margin-bottom: 10px;}

    /* detail form */
    .notice_regi_title {text-align: center;}
    .form_qna table {width: 100%; border: 2px solid #ccc;}
    .form_qna table tr {border-bottom: 2px solid #ccc;}
    .form_qna table tr:nth-child(1) {color: #333; border-top: 2px solid #ccc;}
    .form_qna table tr:nth-child(2) {height: 30px;}
    .form_qna table tr td:last-child {width: 80%;}
    .form_qna table tr:first-child {height: 30px;}
    .form_qna table tr:first-child td:last-child input {width: 99%; border: none; height: 30px; font-size: 15px; text-indent: 10px;}
    .form_qna table tr:first-child td:last-child input:focus {outline: none;}
    .form_qna table tr:nth-child(2) td:last-child input {width: 99%; border: none;}
    .form_qna table td:nth-child(1) {border-right: 2px solid #ccc;}
    #classify {margin-left: 10px; font-size: 15px;}
    #classify:focus {outline: none;}
    .form_qna table tr td:first-child {background-color: #B0C4DE;}
    .tbl_qna textarea:focus {outline: none;}
    .tbl_qna textarea {resize: none; width: 99.7%; border: none; font-size: 20px; padding-left: 10px; box-sizing: border-box;}
    #container {margin-bottom: 200px;}

    /*back button*/
    .notice_btn_box_wrapper {text-align: center;}
    .notice_btn_box {display: inline-block; margin-bottom: 10px;}
    .qna_form_btn {width: 100px; height: 30px; border-radius: 5px; background-color: #11264f; color: white; font-family: 'twayair', sans-serif; line-height: 30px; text-align: center; margin-top: 10px; border: #11264f;}   
    .qna_form_btn:hover {background-color: #4169E1;}
    
    /* 글자 */
    .qna_text{text-indent:10px;}

</style>

<body>
   <%@ include file="/WEB-INF/view/include/top.jsp" %>
    <div id="container">
        <div class="center">
            <div>
            </div>
            <div class="notice_title">
                <h2>공지사항</h2>
            </div>
  
            <div class="notice_margin"></div>
            <form class="form_qna" action="" method="POST" onsubmit="return chk_form()">
                <table class="tbl_qna" name="tbl">
                    <tr>
                        <td class="notice_regi_title" style="height: 50px;">제목</td>
                        <td class="qna_text">${vo.title }</td>
                    </tr>
                    <tr>
                        <td class="notice_regi_title" style="height: 50px;">분류</td>
                        <td class="qna_text">
							<c:if test="${vo.category == 'categoryInfo'}">안내</c:if>
							<c:if test="${vo.category == 'categoryCheck'}">점검</c:if>
                        </td>
                    </tr>
                    <tr>
                        <td class="notice_regi_title" style="width: 100;">내용</td>
                        <td style="height: 250px;" class="qna_text">${vo.content }</td>
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
</body>
</html>