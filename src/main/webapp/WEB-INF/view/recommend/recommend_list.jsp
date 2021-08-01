<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>추천음악</title>
    <%@ include file="/WEB-INF/view/include/headHtml.jsp" %>

    <script>
        $(document).ready(function(){
            // sysdate
            var today = new Date();
            var dd = String(today.getDate());
            var mm = String(today.getMonth() + 1); //January is 0!
            var yyyy = today.getFullYear();
            // today = yyyy + '.' + mm + '.' + dd;
            today = mm + '월 ' + dd + '일'
            
            document.getElementById('sysdate').innerHTML = today;
        });
    </script>

    <style>
        /* pick title */
        .today_pick h2, .theme_pick h2 {font-size: 26px;}
        .today_pick h2 span:last-child, .theme_pick h2 span:last-child {margin-left: 8px; color: rgb(255, 102, 0);}
        
        /* date, tags */
        .today_pick > p {margin: 20px 0; font-size: 15px;}
        .hash_tag li {float: left; width: 22%; margin: 20px 4% 10px 0;}
        .hash_tag li:last-child {margin-right: 0;}
        .hash_tag li:nth-child(1) span:last-child {color: lawngreen;}
        .hash_tag li:nth-child(2) span:last-child {color: blue;}
        .hash_tag li:nth-child(3) span:last-child {color: orangered;}
        .hash_tag li:nth-child(4) span:last-child {color: silver;}

        /* list box */
        .recommend_list li {float: left; width: 22%; margin-right: 4%; border: 1px solid #ccc; box-sizing: border-box;}
        .recommend_list li:last-child {margin-right: 0;}
        .recommend_list li a {display: block; height: 350px;}
        .recommend_list img {display: block; width: 100%; height: 223.5px;}
        .recommend_list li a div {padding: 20px;}
        .recommend_list li a div p:nth-child(1) {font-size: 18px; margin-bottom: 10px;}
        .recommend_list li a div p:nth-child(2) {font-size: 15px; color: #666;}
        .theme_pick .recommend_list {margin-bottom: 20px;}

        /* banner */
        .banner {display: block; margin: 100px 0; height: 100px; background-image: url(../img/banner.png); background-position: center; background-repeat: no-repeat; background-size: cover;}
    </style>

</head>

<body>
    <%@ include file="/WEB-INF/view/include/top.jsp" %>
    <div id="container">
        <div class="center clear">
            <div class="today_pick">
                <h2>
                    <span>오늘의 DJ</span><span>PICK</span>
                </h2>
                <p id="sysdate"></p>
                <ul class="recommend_list clear">
                	<c:forEach var="vo" items="${list1 }" varStatus="status">
	                    <li>
	                        <a href="recommend_info.do?no=${vo.no }"><%-- javascript:goToList(${vo.no }); --%>
	                            <img src="<%=request.getContextPath() %>/upload/${vo.img }" alt="album${status.count }">
	                            <div>
	                                <p>${vo.sub_title }</p>
	                                <p>
	                                    <span>${vo.songcount }</span><span>곡</span>
	                                </p>
	                            </div>
	                        </a>
	                    </li>
                	</c:forEach>
                </ul>
            </div>
            <a class="banner" href="#"></a>
            <div class="theme_pick">
                <h2>
                    <span>주제별 DJ</span><span>PICK</span>
                </h2>
                <ul class="hash_tag clear" style="height: 46px;">
               		<c:forEach var="vo" items="${list2 }" varStatus="status">
                    	<li><span>#</span><span>${vo.title }</span></li>
                	</c:forEach>
                </ul>
                <ul class="recommend_list clear">
                    <c:forEach var="vo" items="${list2 }" varStatus="status">
	                    <li>
	                        <a href="recommend_info.do?no=${vo.no }">
	                            <img src="<%=request.getContextPath() %>/upload/${vo.img }" alt="album${status.count+4 }">
	                            <div>
	                                <p>${vo.sub_title }</p>
	                                <p>
	                                    <span>${vo.songcount }</span><span>곡</span>
	                                </p>
	                            </div>
	                        </a>
	                    </li>
                	</c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
</body>

</html>