<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의게시판 목록</title>
     <%@ include file="/WEB-INF/view/include/headHtml.jsp" %>

    <style>
        /* chart top btn */
        .qna_btn li {float: left; width: 100px; height: 30px; border-radius: 5px; background-color: #bbb; color: #fff; line-height: 30px; text-align: center; margin-right: 5px;}
        .qna_btn li:hover {background-color: #ccc;}
        .qna_btn li:nth-child(2) {background-color: #11264f;}
        .qna_btn li.active {background-color: #11264f;}
        .qna_btn li a {display: block; width: 100%;}
        .qna_margin {margin-bottom: 20px;}

        h2 {font-size: 26px; margin-bottom: 10px;}

        /* chart row */
        .chart_box table {margin-bottom: 20px;}
        .chart_box table tr td:nth-child(1) {width: 30px;}
        .chart_box table tr td:nth-child(2) {width: 130px;}
        .chart_box table tr td:nth-child(3) {width: 501px;}
        .chart_box table tr td:nth-child(4) {width: 200px; text-align: center;}
        .chart_box table tr td:nth-child(5) {width: 153px;}
        .chart_box table tr td:nth-child(6) {width: 170px; text-align: center;}
        .chart_box table tr td:nth-child(3) p {width: 501px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;}
        .chart_box table tr {border-bottom: 2px solid #ccc;}
        .chart_box table tr:nth-child(1) { border-top: 2px solid #ccc; height: 40px; font-size: 12px;}
        .chart_box table tr {height: 80px;}

        /* 등록하기 버튼 */
        .qna_regbtn {display: block; width: 100px; height: 30px; margin-bottom: 10px; border-radius: 5px; background-color: #11264f; color: #fff; line-height: 30px; text-align: center; margin-right: 5px;}
        .qna_regbtn:hover {background-color: #4169E1}
        
        /*page*/
		.page{position:relative; width:100%; display:block; margin:0 0 0 0px; padding:20px 0 0 0; text-align:center; clear:both; color:#656668; font-size:12px;}
		.page a{position:relative; display:inline-block; padding:5px 6px;  text-decoration: none; color:#656668;}
		.page .next{position:relative; display:inline-block; padding:7px 3px; margin:0 10px; vertical-align:top; color:#797979; font-size:11px;}
		.page .next img{padding:3px 6px; *padding:4px 6px; margin:0; vertical-align: top;}
		.page a:hover{color:#2e2e2e; text-decoration:underline;}
		.page .page_prev{padding:0 0 0 2px; background:url(/project/img/admin/page_prev_bg.gif) no-repeat left 5px;}
		.page .page_next{padding:0 2px 0 0; background:url(/project/img/admin/page_next_bg.gif) no-repeat right 5px;}
		
		/*search*/
		.search{position:relative; width:100%; margin:0px; padding:9px 0; text-align:center; vertical-align:middle;}
		.search input{width:160px; height:20px; border:1px solid #cccccc; vertical-align:middle; display:inline;}
		.search select{width:115px; height:20px; border:1px solid #cccccc; font-size:12px; vertical-align:middle; color:#706a5f; margin:0 5px 0 0; display:inline;}
		.search .sbtn{position:relative; width:64px; height:23px; top:0px; *top:-2px; left:0px; border:none; vertical-align:bottom;}
		#color .search #clinicList{ display:inline;}
		#color .search select{width:115px; height:20px; border:1px solid #cccccc; font-size:12px; vertical-align:middle; color:#706a5f; margin:0; display:inline;}
		#color .search .sbtn{position:relative; width:53px; height:20px; top:0px; *top:-2px; left:-8px; border:none; vertical-align:bottom;}
		#color .search #clinicList{ display:inline;}

		.answerImg{margin:0 5px 0 15px;}
		.closedImg{margin:3px 0 0 5px;}
		span.re_ing{position:relative; color:#fff; font-family:'ëì',dotum; font-size:11px; background:#cacaca; padding:3px; vertical-align:middle;}
		span.re_ok{position:relative; color:#fff; font-family:'ëì',dotum; font-size:11px; background:#ff7439; padding:3px;  vertical-align:middle;}

		
    </style>
</head>
<body>   
    <%@ include file="/WEB-INF/view/include/top.jsp" %>

    <div id="container">
        <div class="center">
            <ul class="qna_btn clear">
                <li><a href="notice_list.html">공지사항</a></li>
                <li><a href="QNA_list.html">문의</a></li>
            </ul>
            <div class="qna_margin"></div>
            <h2>문의게시판</h2>
            <form class="chart_box" action="" method="post"> 
                <table>
                    <tr>
                        <td></td>
                        <td>NO</td>
                        <td>제목</td>
                        <td>작성자</td>
                        <td>등록일</td>                       
                    </tr>
					<c:if test="${empty vo }">
						<td colspan="7"> 등록된 글이 없습니다. </td>
					</c:if>
					<c:forEach var="vo" items="${vo}">
						<tr>
							<%-- <td class="first"><input type="checkbox" name="checkno" id="no" onclick="isChk();" data-Num="${vo.no }"/></td> --%>	
							<td></td>
							<td>${vo.no }</td>
							<td class="title"><a href="view.do?no=${vo.no}&reqPage=${qnaVo.reqPage}&stype=${param.stype}&sval=${param.sval}">${vo.title}
							</a>
								<c:if test="${vo.regdate >= nowday }">
									<strong style="color:red;"> [NEW] </strong>
								</c:if>
								<c:if test="${vo.secret == 1}">   <img src="/music/img/admin/lock.png"/></c:if>
								<c:if test="${!empty vo.answer}"><strong> <img src="/music/img/admin/ico_answer_done.png" style="width: 45px"/> </strong></c:if>
									
							</td>
							<td>${vo.regdate }</td>
							<td><a href="userpost.do">닉네임</a></td>
							
						</tr>
					</c:forEach>
                </table>
                
                <a class="qna_regbtn clear" href="write.do">등록하기</a>
            </form>  
        	<!-- 페이징 처리 -->
			<div class='page'>
			<c:if test="${qnaVo.startPage > qnaVo.pageRange }">
				<a href="index.do?reqPage=1&stype=${qnaVo.stype}&sval=${qnaVo.sval}"> << </a>
			</c:if>							
			<c:if test="${qnaVo.startPage > qnaVo.pageRange }">
				<a href="index.do?reqPage=${qnaVo.startPage-1}&stype=${qnaVo.stype}&sval=${qnaVo.sval}"> < </a>
			</c:if>
			<c:forEach var="req" begin="${qnaVo.startPage }" end="${qnaVo.endPage }">
					<a href='index.do?reqPage=${req}&stype=${qnaVo.stype}&sval=${qnaVo.sval}' <c:if test="${req==qnaVo.reqPage }">style="color: red"</c:if>> ${req} </a>
			</c:forEach>
             <c:if test="${qnaVo.totPage > qnaVo.endPage}"> 
         		<a href="index.do?reqPage=${qnaVo.endPage+1}&stype=${qnaVo.stype}&sval=${qnaVo.sval}">></a>
         	</c:if>
         	<c:if test="${qnaVo.totPage > qnaVo.endPage}"> 
         		<a href="index.do?reqPage=${qnaVo.totPage}&stype=${qnaVo.stype}&sval=${qnaVo.sval}">>></a>
         	</c:if>
			<!-- //페이징 처리 -->
			<form name="searchForm" id="searchForm" action="index.do"  method="post">
				<div class="search">
					<select name="stype" title="검색을 선택해주세요">
						<option value="all">전체</option>
						<option value="title" 	<c:if test="${qnaVo.stype=='title' }">selected</c:if>>제목</option>
						<option value="content" <c:if test="${qnaVo.stype=='content'}">selected</c:if>>내용</option>
					</select>
					<input type="text" name="sval" value="${qnaVo.sval}" title="검색할 내용을 입력해주세요" />
					<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" onclick="$('#searchForm').submit();"/>
				</div>
			</form>
			</div>
                     
       </div>
   </div>

  
	<%@ include file="/WEB-INF/view/include/bottom.jsp" %>
</body>
</html>