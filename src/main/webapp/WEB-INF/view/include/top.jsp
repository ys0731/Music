<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	    <div id="header">
        <div id="header_top">
            <div class="header_top_up">
                <div class="center clear">
                    <ul class="clear">
                        <li><a href="ticket.html"><span>이용권구매</span></a></li>
                        <li><a href="/music/user/insert.do"><span>회원가입</span></a></li>
                    </ul>
                </div>
            </div>
            <div class="header_top_down center clear">
                <h1 class="logo"><a href="/music/index.do"></a></h1>
                <form class="header_search clear" action="/music/search.do" method="post">
                    <button class="search_btn" type="submit">
                        <img src="../img/search.png" alt="search">
                    </button>
                    <input class="search_text hide_input_outline no_outline" type="text" name="searchword" id="searchword">
                </form>
                <div class="rise"><p>급상승</p></div>
                <div class="rising">
                    <ul>
                       <c:forEach var="sv" items="${searchRank }" end="9" varStatus="status">
                        	<li class="rise_1"><span>${status.count }</span><span>${sv.searchword }</span></li>
                        </c:forEach>
                    </ul>
                </div>
                <c:if test="${empty userInfo }">  
                <a class="login_btn" href="/music/user/login.do">로그인</a>
                </c:if>
            </div>
        </div>
        <div id="header_bottom">
            <div class="center">
                <ul class="gnb clear">
                    <li><a href="/music/chart/chart_24hit.do">샌드차트</a></li>
                    <li><a href="/music/chart/chart_recent.do">최신음악</a></li>
                    <li><a href="/music/chart/chart_genre_kpop.do">장르음악</a></li>
                    <li><a href="recommend_list.html">샌드DJ</a></li>
                    <li><a href="mv_popular.html">MV</a></li>
                    <li id="gnb_li_last">
	                    <c:if test="${!empty userInfo }"> 
	                        <a href="mymusic.html">마이뮤직</a>
		                        <ul class="mymusic_sub">
		                            <li><a href="mymusic.html">최근감상곡</a></li>
		                            <li><a href="mymusic_like.html">좋아요</a></li>
		                            <li><a href="mymusic_comment.html">나의댓글</a></li>
		                            <li><a href="/music/user/logout.do">로그아웃</a></li>
		                        </ul>
	                    </c:if>
                    </li>
                    <li id="user_name">
                        <span>
                        <c:if test="${!empty userInfo }"> 
                        ${userInfo.nickname}
                        <span>님</span>
                        </c:if>
                        </span>
                    </li>
                    <div class="gnb_sub clear">
                        <ul class="chart_sub">
                       
                            <li><a href="/music/chart/chart_24hit.do">실시간</a></li>
                            <li><a href="/music/chart/chart_daily.do">일간</a></li>
                            <li><a href="/music/chart/chart_weekly.do">주간</a></li>
                        </ul>
                        <ul class="recent_sub">
                            <li><a href="/music/chart/chart_recent.do">최신곡</a></li>
                        </ul>
                        <ul class="genre_sub">
                            <li><a href="/music/chart/chart_genre_kpop.do">가요</a></li>
                            <li><a href="/music/chart/chart_genre_pop.do">Pop</a></li>
                            <li><a href="/music/chart/chart_genre_jazz.do">Jazz</a></li>
                            <li><a href="/music/chart/chart_genre_classic.do">Classic</a></li>
                        </ul>
                        <ul class="offer_sub">
                            <li><a href="recommend_list.html">추천음악</a></li>
                        </ul>
                        <ul class="mv_sub">
                            <li><a href="mv_recent.html">최신MV</a></li>
                            <li><a href="mv_popular.html">인기MV</a></li>
                        </ul>
                    </div>
                </ul>
            </div>
        </div>
    </div>