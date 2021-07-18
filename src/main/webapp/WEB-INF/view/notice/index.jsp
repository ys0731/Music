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

    <style>
        /*notice list page*/
        h2 {font-size: 26px; margin-bottom: 10px;}

        /* notice top btn */
        .notice_btn li {float: left; width: 100px; height: 30px; border-radius: 5px; background-color: #bbb; color: #fff; line-height: 30px; text-align: center; margin-right: 5px;}
        .notice_btn li:hover {background-color: #ccc;}
        .notice_btn li:first-child {background-color: #11264f;}
        .notice_btn li.active {background-color: #11264f;}
        .notice_btn li a {display: block; width: 100%;}
        .notice_margin {margin-bottom: 20px;}

        /* chart row */
        .chart_box table {margin-bottom: 20px;}
        .chart_box table tr td:nth-child(1) {width: 30px;}
        .chart_box table tr td:nth-child(2) {width: 90px;}
        .chart_box table tr td:nth-child(3) {width: 90px;}
        .chart_box table tr td:nth-child(4) {width: 500px; }
        .chart_box table tr td:nth-child(5) {width: 116px;  text-align: center;}
        .chart_box table tr td:nth-child(6) {width: 95px; text-align: center;}
        .chart_box table tr td:nth-child(7) {width: 95px; text-align: center;}
        .chart_box table tr {border-bottom: 2px solid #ccc;}
        .chart_box table tr:nth-child(1) {color: #333; border-top: 2px solid #ccc; height: 40px; font-size: 12px;}
        .chart_box table tr {height: 80px;}

        /*insert page button*/
        .notice_regbtn {display: block; width: 100px; height: 30px; margin-bottom: 10px; border-radius: 5px; background-color: #11264f; color: #fff; line-height: 30px; text-align: center; margin-right: 5px;}
        .notice_regbtn:hover {background-color: #4169E1;}

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
            <ul class="notice_btn clear">
                <li><a href="/music/notice/index.do">공지사항</a></li>
                <li><a href="/music/qna/index.do">문의</a></li>
            </ul>
            <div class="notice_margin"></div>
            <h2>공지사항</h2>
            <form class="chart_box" action="" method="post"> 
                <table>
                    <tr>
                        <td></td>
                        <td>NO</td>
                        <td>분류</td>
                        <td>제목</td>
                        <td>작성일</td>
                        <td>작성자</td>
                        <td>조회수</td>
                    </tr>
					<c:if test="${empty vo }">
						<td colspan="7" style="text-align: center;"> 등록된 글이 없습니다. </td>
					</c:if>
					<c:forEach var="vo" items="${vo}">
						<tr>
							<td></td>
							<td>${vo.no }</td>
							<c:if test="${vo.category == 'categoryInfo'}"><td>안내</td></c:if>	
							<c:if test="${vo.category == 'categoryCheck'}"><td>점검</td></c:if>	
							<td class="title"><a href="view.do?no=${vo.no}&reqPage=${noticeVo.reqPage}&stype=${param.stype}&sval=${param.sval}&category=${param.category}">${vo.title }</a>
							<c:if test="${vo.regdate >= nowday }">
								<strong style="color:red;"> [NEW] </strong>
							</c:if>
							</td>
							<td>${vo.regdate }</td>
							<td>관리자</td>
							<td class="last">${vo.readcount }</td>
						</tr>
					</c:forEach>                    
                </table>
            </form>
            	<!-- 페이징 처리 -->
                <div class='page'>
					<c:if test="${noticeVo.startPage > noticeVo.pageRange }">
						<a href="index.do?reqPage=1&stype=${noticeVo.stype}&sval=${noticeVo.sval}&category=${noticeVo.category}"> << </a>
					</c:if>							
					<c:if test="${noticeVo.startPage > noticeVo.pageRange }">
						<a href="index.do?reqPage=${noticeVo.startPage-1}&stype=${noticeVo.stype}&sval=${noticeVo.sval}&category=${noticeVo.category}"> < </a>
					</c:if>
					<c:forEach var="req" begin="${noticeVo.startPage }" end="${noticeVo.endPage }">
						<a href='index.do?reqPage=${req}&stype=${noticeVo.stype}&sval=${noticeVo.sval}&category=${noticeVo.category}' <c:if test="${req==noticeVo.reqPage }">style="color: red"</c:if>> ${req} </a>
					</c:forEach>
                    <c:if test="${noticeVo.totPage > noticeVo.endPage}"> 
                		<a href="index.do?reqPage=${noticeVo.endPage+1}&stype=${noticeVo.stype}&sval=${noticeVo.sval}&category=${noticeVo.category}">></a>
                	</c:if>
                	<c:if test="${noticeVo.totPage > noticeVo.endPage}"> 
                		<a href="index.do?reqPage=${noticeVo.totPage}&stype=${noticeVo.stype}&sval=${noticeVo.sval}&category=${noticeVo.category}">>></a>
                	</c:if>

				</div>
				<!-- //페이징 처리 -->
				<form name="searchForm" id="searchForm" action="index.do"  method="post">
					<div class="search">
						<select name="category" title="검색을 선택해주세요" onchange="$('#searchForm').submit();">
							<option value="categoryAll">분류</option>
							<option value="categoryInfo" <c:if test="${noticeVo.category=='categoryInfo'}">selected</c:if>>안내</option>
							<option value="categoryCheck" <c:if test="${noticeVo.category=='categoryCheck'}">selected</c:if>>점검</option>
						</select>
						<select name="stype" title="검색을 선택해주세요">
							<option value="all">전체</option>
							<option value="title" 	<c:if test="${noticeVo.stype=='title' }">selected</c:if>>제목</option>
							<option value="content" <c:if test="${noticeVo.stype=='content'}">selected</c:if>>내용</option>
						</select>
						<input type="text" name="sval" value="${noticeVo.sval}" title="검색할 내용을 입력해주세요" />
						<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" onclick="$('#searchForm').submit();"/>
					</div>
				</form>
                
            </div>
        </div>
    </div>
  
	<%@ include file="/WEB-INF/view/include/bottom.jsp" %>
</body>
</html>