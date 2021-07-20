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
    <script src="js/main.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="css/main.css">
	<%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
</head>

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
                                	<a href=""><img src="<%=path %>/upload/${av.img_real}" alt="album1"></a>
                                </c:forEach>
                            </div>
                            <div class="clear">
                                <c:forEach var="av" items="${av }" begin="5" end="9">
                                	<a href=""><img src="<%=path %>/upload/${av.img_real}" alt="album1"></a>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="clear">
                                <c:forEach var="av" items="${av }" begin="10" end="14">
                                	<a href=""><img src="<%=path %>/upload/${av.img_real}" alt="album1"></a>
                                </c:forEach>
                            </div>
                            <div class="clear">
                                <c:forEach var="av" items="${av }" begin="15" end="19">
                                	<a href=""><img src="<%=path %>/upload/${av.img_real}" alt="album1"></a>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="clear">
                                <c:forEach var="av" items="${av }" begin="20" end="24">
                                	<a href=""><img src="<%=path %>/upload/${av.img_real}" alt="album1"></a>
                                </c:forEach>
                            </div>
                            <div class="clear">
                                <c:forEach var="av" items="${av }" begin="25" end="29">
                                	<a href=""><img src="<%=path %>/upload/${av.img_real}" alt="album1"></a>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="clear">
                                <c:forEach var="av" items="${av }" begin="30" end="34">
                                	<a href=""><img src="<%=path %>/upload/${av.img_real}" alt="album1"></a>
                                </c:forEach>
                            </div>
                            <div class="clear">
                                <c:forEach var="av" items="${av }" begin="35" end="39">
                                	<a href=""><img src="<%=path %>/upload/${av.img_real}" alt="album1"></a>
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
                    	<c:forEach var="cv" items="${cv }" begin="0" end="0">
                    		<tr class="on">                 
	                            <td>1</td>
	                            <td><a href="album_info.html"><img src="<%=path %>/upload/${cv.rel}" alt="album2"></a><span>${cv.title }</span></td>
	                            <td><a href="artist_info.html">${cv.artist }</a></td>
	                            <td><a class="play_music button_icons" href="#"></a></td>
	                            <td><a class="add_list button_icons" href="#"></a></td>
                        	</tr>
                        </c:forEach>
                        <c:forEach var="cv" items="${cv }" varStatus="status" begin="1" end="9">
                        	<tr>
	                            <td>${status.count }</td>
	                            <td><a href="album_info.html"><img src="<%=path %>/upload/${cv.rel}" alt="album2"></a><span>${cv.title }</span></td>
	                            <td><a href="artist_info.html">${cv.artist }</a></td>
	                            <td><a class="play_music button_icons" href="#"></a></td>
	                            <td><a class="add_list button_icons" href="#"></a></td>
                        	</tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="cont_1_right">
                    <h2>오늘의 추천</h2><a class="more" href="recommend_list.html">더 보기</a>
                    <ul class="recom">
                        <li>
                            <a class="clear" href="recommend_info.html">
                                <img src="img/album1.jpg" alt="album1">
                                <div>
                                    <p>올 롸잇!</p>
                                    <p><span>1</span><span>곡</span></p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a class="clear" href="#">
                                <img src="img/album2.jpg" alt="album2">
                                <div>
                                    <p>니 안에 내 있다</p>
                                    <p><span>2</span><span>곡</span></p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a class="clear" href="#">
                                <img src="img/album3.jpg" alt="album3">
                                <div>
                                    <p>내 미래처럼 깜깜한 밤에</p>
                                    <p><span>3</span><span>곡</span></p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a class="clear" href="#">
                                <img src="img/album4.jpg" alt="album4">
                                <div>
                                    <p>끝없는 코딩에 지친 당신</p>
                                    <p><span>4</span><span>곡</span></p>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="cont_2 clear">
                <div class="cont2_left">
                    <h2>최신 뮤직비디오</h2>
                    <ul class="rec_mv clear">
                        <li>
                            <iframe width="232.8" height="150" src="https://www.youtube.com/embed/quH6XxJTj-k"
                                title="YouTube video player" frameborder="0"
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                allowfullscreen></iframe>
                        </li>
                        <li>
                            <iframe width="232.8" height="150" src="https://www.youtube.com/embed/a9k7MF_-HPQ"
                                title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"\
                                allowfullscreen></iframe>
                        </li>
                        <li>
                            <iframe width="232.8" height="150" src="https://www.youtube.com/embed/Jp4-snWZuoI"
                                title="YouTube video player" frameborder="0"
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                allowfullscreen></iframe>
                        </li>
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
