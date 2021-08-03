<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<%
	String path = request.getContextPath();
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mymusic_like</title>
    <%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
    <%@ include file="/WEB-INF/view/player/playnlog.jsp" %>

    <script>
    $(function(){
		var marginTop =  $("input[type='checkbox'][name='check_list']").length;
		if (marginTop == 0) {
			$("#container").css({"height": "638px"});
		} else if (marginTop <= 5) {
			$("#container").css({"height": "540px"});
		}
	});
    
    $(function(){            
            // preventDefault
            $(".chart_box ul li a, .play_music, .add_list").click(function(e){
                e.preventDefault();
            })              
            
        });


    </script>
    <style>
        /* right side */
        .right_side {float: right; width: 75%;}

        /* profile box */
        .my_box {position: fixed; z-index: 1; width: 240px; background-color: #b0c4de; border-radius: 5px;}
        .my_box_top, .my_box_bottom {width: 100%; padding: 20px; box-sizing: border-box;}
        .my_box_top {border-bottom: 1px solid #fff;}
        .my_box_bottom {position: relative; padding-bottom: 40px;}
        
        /* profile box top */
        .my_img {float: left; width: 100px; height: 100px; margin-right: 20px;  background-position: center; background-repeat: no-repeat; background-size: cover; border-radius: 50%;}
        .my_nick {float: left;}
        .my_nick p {margin-bottom: 10px;}
        .my_nick p span {font-size: 16px;}
        .my_nick p span:first-child {color: #ff6600;}
        .my_nick a {display: block; font-size: 11px;}
        .my_nick a:hover {color: #666;}

        /* profile box medium */
        .my_info {margin: 20px 0;}
        .my_info a {float: left; display: block; width: 40%; margin: 0 2%; line-height: 25px; font-size: 12px; color: #fff; text-align: center; background-color: #11264f; border-radius: 5px;}
        .my_info a:hover {background-color: #11347a;}
        .my_info a:first-child {margin-left: 0px;}

        /* profile box bottom */
        .my_box_top li, .my_box_bottom li {margin: 10px 0;}
        .my_box_top ul li a span:first-child, .my_box_bottom ul li a span:first-child {margin-right: 5px;}
        .my_box_top ul li a, .my_box_bottom ul li a {transition: all 0.3s;}
        .my_box_top ul li a:hover, .my_box_bottom ul li a:hover {padding-left: 10px;}
        .my_box_top ul li:first-child, .my_box_bottom ul li:first-child {font-size: 20px; margin-top: 0;}
        .sign_out {position: absolute; bottom: 20px; right: 20px; font-size: 11px;}
        .sign_out:hover {color: #666;}

        /* chart */
        h2 {font-size: 26px; margin-top: 10px; margin-bottom: 20px;}

        /* chart delete btn */
        .chart_box > ul:first-child li {float: left; margin-right: 20px; height: 26px; line-height: 26px; background-color: #11347a; color: #fff; font-size: 13px; border-radius: 13px; overflow: hidden;}
        .chart_box > ul:first-child li:hover {background-color: #16439c;}
        .chart_box > ul:first-child li a {display: block; padding: 0 15px;}
        .chart_box > ul:first-child li:first-child {background-color: transparent; margin-top: 5px;}
        
        /* chart row */
        .chart_box table {margin-bottom: 20px;}

        .chart_box table tr td:nth-child(1) {width: 42px;}
        .chart_box table tr td:nth-child(2) {width: 153px; }
        .chart_box table tr td:nth-child(3) {width: 150px;}
        .chart_box table tr td:nth-child(4) {width: 157px;}
        .chart_box table tr td:nth-child(5) {width: 100px;}
        .chart_box table tr td:nth-child(6) {width: 160px; }
        .chart_box table tr td:nth-child(6) span {display: block; float: left; margin-top: 5px;}
        /* .chart_box table tr td:nth-child(7) {width: 45px; text-align: center;} */

        .chart_box table tr {border-bottom: 2px solid #ccc;}
        .chart_box table tr:nth-child(1) {color: #333; border-top: 2px solid #ccc; height: 40px; font-size: 12px;}
        .chart_box table tr {height: 80px;}
        .first{text-align:center;}

        /* chart txt */
        .album_mini {float: left; width: 45px; height: 45px;}
        .list_title {width: 315px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;}
        .list_artist {width: 152px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;}
        .list_album {width: 95px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;}

        /* like btn */
        .like_btn {display: block; float: left; margin-left: 55px; width: 24px; height: 24px; background-image: url("<%=path %>/img/like_full.png"); background-size: cover; background-position: center; background-repeat: no-repeat;}
        .like_btn.on {background-image: url("<%=path %>/img/like_empty.png");}
        

        /* button icons */
        .button_icons {display: block; width: 24px; height: 24px; background-image: url("<%=path %>/img/button_icons.png"); border-radius: 50%; overflow: hidden;}
  
       
        /* 페이징처리 */
		.pagenate {width:100%; clear:both; margin-left:120px;}
		.pagenate {text-align:center; margin-top: 10px; margin-bottom: 10px;}
		.pagenate li {display:inline-block;}
		.pagenate li:first-child { margin-left:0px; }
		.pagenate li a{display:inline-block; text-decoration:none; padding:0; width:30px; height:30px; line-height:30px; border:1px solid #c7c8cc; box-sizing:border-box; margin-left:-1px; vertical-align:middle;}
		.pagenate li a:hover{background:#f6f6f6; font-weight:bold; text-decoration:none !important;}
		.pagenate li a.board { text-indent:-9999em; margin-left:4px; }
		.pagenate li a.board.first {background:#f3f3f3  no-repeat center center;}
		.pagenate li a.board.prev {margin-right:30px; background:#efefef  no-repeat center center;}
		.pagenate li a.board.next {margin-left:30px; background:#efefef  no-repeat center center;}
		.pagenate li a.board.last {background:#f3f3f3  no-repeat center center;}
		.pagenate li a.current {color:#fff; background-color:#221f1f; font-weight:bold;  border:1px solid #221f1f;}
		
		
    </style>

</head>

<body>
    <%@ include file="/WEB-INF/view/include/top.jsp" %>
    <div id="container">
        <div class="center clear">
            <div class="left_side">
                <div class="my_box clear">
                    <div class="my_box_top">
                        <div class="clear">
                            <div class="my_nick">
                                <p>
                                    <span>${userInfo.nickname }</span><span>님</span>
                                </p>
                                <a href="/music/mymusic/mymusic_update.do">회원정보 변경</a>
                            </div>
                        </div>
                        <div class="my_info clear">
                            <a href="/music/mymusic/myusic_myinfo.do">내 정보</a>
                            <a href="/music/pay/view.do">이용권 내역</a>
                        </div>
                        <ul class="my_music">
                            <li>마이뮤직</li>
                            <li><a href="/music/mymusic/mymusic.do"><span>-</span><span>최근감상곡</span></a></li>
                            <li><a href="/music/mymusic/mymusic_like.do"><span>-</span><span>좋아요</span></a></li>
                        </ul>
                    </div>
                    <div class="my_box_bottom">
                        <ul class="my_comment">
                            <li>댓글</li>
                            <li><a href="/music/mymusic/mymusic_comment2.do"><span>-</span><span>나의 댓글</span></a></li>
                        </ul>
                        <a class="sign_out" href="/music/mymusic/mymusic_withdrawal.do">회원탈퇴</a>
                    </div>
                </div>
            </div>
            <div class="right_side">
                <h2>좋아요</h2>
                <form class="chart_box" action="" method="post">
                    <table>
                        <tr>
                            <td></td>
                            <td>곡</td>
                            <td></td>
                            <td>아티스트</td>
                            <td>앨범</td>
                            <td style="text-align:center;">좋아요</td>
                        </tr>
                        <c:if test="${empty list }">
                            <tr>
                                <td class="first" colspan="7">등록된 곡이 없습니다.</td>
                            </tr>
                        </c:if>
                        <c:forEach var="vo" items="${list }" varStatus="status">
                        <tr>
		                  <td></td>
		                  <td>
		                  	   <a href="<%=request.getContextPath()%>/detail/albumDetail.do?album_no=${vo.al_no }"> <img class="album_mini" src="<%=path %>/upload/${vo.rel}" alt="album_img" ></a>
		                   </td>
		                  <td>
		                       <p class="list_title" style="width: 200px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;">${vo.title }</p>
		                   </td>
		                   <td>
		                       <p class="list_artist" id="artist"><a class="artist" style="width: 200px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;" href="<%=request.getContextPath()%>/detail/artistDetail.do?artist_no=${vo.ar_no}" data-no="${vo.ar_no }">${vo.artist }</a></p>
		                   </td>
		                   <td>
		                       <p class="list_album" id="album"><a class="album" style="width: 200px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;" href="<%=request.getContextPath()%>/detail/albumDetail.do?album_no=${vo.al_no }" data-no="${vo.al_no }">${vo.album }</a></p>
		                   </td>
		                   <td class="clear">
		                       <a class="like_btn" href="javascript:void(0);"></a><span>${vo.liked }</span>
		                   </td>		         
                		</tr>
                        </c:forEach>
                    </table>
                </form>                	
            </div>
            <div class="pagenate clear">
                <ul class='paging'>
                   <c:if test="${likeVo.startPage > likeVo.pageRange}">
                   	<li><a href="/music/mymusic/mymusic_like.do?reqPage=${likeVo.startPage-1 }"><</a></li>
                   </c:if>
                   <c:forEach var="rp" begin="${likeVo.startPage}" end="${likeVo.endPage }">
                       <li><a href='/music/mymusic/mymusic_like.do?reqPage=${rp}' <c:if test="${rp==likeVo.reqPage }">class='current'</c:if>>${rp }</a></li>
                   </c:forEach>
                   <c:if test="${likeVo.totPage > likeVo.endPage}">
                   	<li><a href="/music/mymusic/mymusic_like.do?reqPage=${likeVo.endPage+1 }">></a></li>
                   </c:if>
                </ul> 
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
</body>

</html>