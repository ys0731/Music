<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<%
	String path = request.getContextPath();
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Send Music</title>
    
    
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="<%=path %>/css/main.css">
	<%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
</head>
<script>
	$(document).ready(function() {
		// charts
	    $(".charts tr").mouseenter(function () {
	        var btn_list = $(this).index();

	        $(this).siblings().removeClass("on");
	        $(this).addClass("on");
	    });
		
	})
</script>
<%@ include file="/WEB-INF/view/player/playnlog.jsp" %>
<body>
	<%@ include file="/WEB-INF/view/include/top.jsp" %>
    
    <div id="container">
        <div class="center">
            <div id="visual">
                <div class="swiper-container mySwiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <div class="clear">
                                <c:forEach var="av" items="${av }" begin="0" end="4">
                                	<a href="<%=request.getContextPath()%>/detail/albumDetail.do?album_no=${av.no}"><img src="<%=path %>/upload/${av.img_real}" alt="album"></a>
                                </c:forEach>
                            </div>
                            <div class="clear">
                                <c:forEach var="av" items="${av }" begin="5" end="9">
                                	<a href="<%=request.getContextPath()%>/detail/albumDetail.do?album_no=${av.no}"><img src="<%=path %>/upload/${av.img_real}" alt="album"></a>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="clear">
                                <c:forEach var="av" items="${av }" begin="10" end="14">
                                	<a href="<%=request.getContextPath()%>/detail/albumDetail.do?album_no=${av.no}"><img src="<%=path %>/upload/${av.img_real}" alt="album"></a>
                                </c:forEach>
                            </div>
                            <div class="clear">
                                <c:forEach var="av" items="${av }" begin="15" end="19">
                                	<a href="<%=request.getContextPath()%>/detail/albumDetail.do?album_no=${av.no}"><img src="<%=path %>/upload/${av.img_real}" alt="album"></a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-pagination"></div>
                </div>
            </div>
            <div class="banner"></div>
            <div class="cont_1 clear">
                <div class="cont_1_left">
                    <h2>곡 차트</h2><a class="more" href="/music/chart/chart_24hit.do">더 보기</a>
                    <table class="charts">
                    	<c:forEach var="cv" items="${cv }" varStatus="status" begin="0" end="9">
                    	<c:if test="${status.count == 1 }">
                     		<tr class="on">
                  		</c:if>
                  		<c:if test="${status.count != 1 }">
                     		<tr>
                  		</c:if>
	                            <td>${status.count}</td>
	                            <td><a class="album" href="<%=path%>/detail/albumDetail.do?album_no=${cv.al_no }"><img src="<%=path %>/upload/${cv.rel}" alt="album"></a><span style="width: 200px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;">${cv.title }</span></td>
	                            <td><a class="artist" href="<%=path%>/detail/artistDetail.do?artist_no=${cv.ar_no }">${cv.artist }</a></td>
	                            <td><a class="play_music button_icons play" style="cursor: pointer;" onclick="javascript:player(no=${cv.no });"></a></td>
	                            <td><a class="add_list button_icons" style="cursor: pointer;" onclick="javascript:plusplayer(no=${cv.no });"></a></td>
                        	</tr>
                    	</c:forEach>
                    </table>
                </div>
                <div class="cont_1_right">
                    <h2>오늘의 추천</h2><a class="more" href="/music/recommend/recommend_list.do">더 보기</a>
                    <ul class="recom">
                        <c:forEach var="rv" items="${rv }">
                        	<li>
	                            <a class="clear" href="<%=path%>/recommend/recommend_info.do?no=${rv.no}">
	                                <img src="<%=path %>/upload/${rv.img }" alt="album">
	                                <div>
	                                    <p>${rv.sub_title }</p>
	                                    <p><span>${rv.songcount}</span><span>곡</span></p>
	                                </div>
	                            </a>
	                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="cont_2 clear">
                <div class="cont2_left">
                    <h2>최신 뮤직비디오</h2>                   
                    <ul class="rec_mv clear">
	                    <c:forEach var="mv" items="${mv }" begin="0" end="2">
	                        <li>
	                            <iframe width="232.8" height="150" src="${mv.link}"
	                                title="YouTube video player" frameborder="0"
	                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
	                                allowfullscreen></iframe>
	                        </li>
	                    </c:forEach>
                    </ul>
                 
                </div>
                <div class="cont2_right">
                    <h2>매거진</h2>
                    <div class="magazine">
                        <a href="https://www.rollingstone.com/music/">
                            <img src="img/magazine.jpg" alt="magazine">
                        </a>
                    </div>
                </div>
            </div>
            <div class="notice clear">
                <span>공지사항</span>
                <p>
                <c:forEach var="nv" items="${nv}" varStatus="status" begin="0" end="0">
                    <a href="/music/notice/index.do">${nv.title}</a>
                </c:forEach>    
                </p>
            </div>
        </div>
    </div>
   <%@ include file="/WEB-INF/view/include/bottom.jsp" %>

    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
        var swiper = new Swiper(".mySwiper", {
            pagination: {
                el: ".swiper-pagination",
                clickable: true
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev"
            },
            loop: true,
            autoplay: {
                delay: 8000,
            }
        });
    </script>
</body>

</html>