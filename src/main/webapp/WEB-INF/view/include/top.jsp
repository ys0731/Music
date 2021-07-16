<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	    <div id="header">
        <div id="header_top">
            <div class="header_top_up">
                <div class="center clear">
                    <ul class="clear">
                        <li><a href="ticket.html"><span>이용권구매</span></a></li>
                    </ul>
                </div>
            </div>
            <div class="header_top_down center clear">
                <h1 class="logo"><a href="index.html"></a></h1>
                <form class="header_search clear" action="" method="post">
                    <button class="search_btn">
                        <img src="../img/search.png" alt="search" onclick="">
                    </button>
                    <input class="search_text hide_input_outline no_outline" type="text">
                </form>
                <div class="rise"><p>급상승</p></div>
                <div class="rising">
                    <ul>
                        <li class="rise_1"><span>1</span><span>학과명</span></li>
                        <li class="rise_2"><span>2</span><span>명선우</span></li>
                        <li class="rise_3"><span>3</span><span>우산발</span></li>
                        <li class="rise_4"><span>4</span><span>발자최</span></li>
                        <li class="rise_5"><span>5</span><span>최영서</span></li>
                        <li class="rise_6"><span>6</span><span>서릿김</span></li>
                        <li class="rise_7"><span>7</span><span>김찬구</span></li>
                        <li class="rise_8"><span>8</span><span>구덩이</span></li>
                        <li class="rise_9"><span>9</span><span>이승민</span></li>
                        <li class="rise_10"><span>10</span><span>민족학</span></li>
                    </ul>
                </div>
                <a class="login_btn" href="login.html">로그인</a>
            </div>
        </div>
        <div id="header_bottom">
            <div class="center">
                <ul class="gnb clear">
                    <li><a href="chart_chart_24hits.html">샌드차트</a></li>
                    <li><a href="recent_chart.html">최신음악</a></li>
                    <li><a href="chart_genre_kpop.html">장르음악</a></li>
                    <li><a href="recommend_list.html">샌드DJ</a></li>
                    <li><a href="mv_popular.html">MV</a></li>
                    <li id="gnb_li_last">
                        <a href="mymusic.html">마이뮤직</a>
                        <ul class="mymusic_sub">
                            <li><a href="mymusic.html">최근감상곡</a></li>
                            <li><a href="mymusic_like.html">좋아요</a></li>
                            <li><a href="mymusic_comment.html">나의댓글</a></li>
                            <li><a href="index.html">로그아웃</a></li>
                        </ul>
                    </li>
                    <li id="user_name">
                        <span>admin</span><span>님</span>
                    </li>
                    <div class="gnb_sub clear">
                        <ul class="chart_sub">
                            <li><a href="chart_chart_24hits.html">실시간</a></li>
                            <li><a href="chart_chart_daily.html">일간</a></li>
                            <li><a href="chart_chart_weekly.html">주간</a></li>
                        </ul>
                        <ul class="recent_sub">
                            <li><a href="recent_chart.html">최신곡</a></li>
                        </ul>
                        <ul class="genre_sub">
                            <li><a href="chart_genre_kpop.html">가요</a></li>
                            <li><a href="chart_genre_pop.html">Pop</a></li>
                            <li><a href="chart_genre_jazz.html">Jazz</a></li>
                            <li><a href="chart_genre_classic.html">Classic</a></li>
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