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
    <title>검색 목록</title>
    <%@ include file="/WEB-INF/view/include/headHtml.jsp" %>

    <style>
        /* song count */
        .song_count {font-size: 18px; margin: 20px 0;}

        /* chart medium btn */
        .chart_box > ul:first-child li {float: left; margin-right: 20px; height: 26px; line-height: 26px; background-color: #11347a; color: #fff; font-size: 13px; border-radius: 13px; overflow: hidden;}
        .chart_box > ul:first-child li:hover {background-color: #16439c;}
        .chart_box > ul:first-child li a {display: block; padding: 0 15px;}
        .chart_box > ul:first-child li:first-child {background-color: transparent; margin-top: 5px;}
        
        /* chart row */
        .chart_box table {margin-bottom: 20px;}

        .chart_box table tr td:nth-child(1) {width: 26px;}
        .chart_box table tr td:nth-child(2) {width: 50px;}
        .chart_box table tr td:nth-child(3) {width: 485px;}
        .chart_box table tr td:nth-child(4) {width: 130px;}
        .chart_box table tr td:nth-child(5) {width: 190px;}
        .chart_box table tr td:nth-child(6) {width: 45px; text-align: center;}
        .chart_box table tr td:nth-child(7) {width: 45px; text-align: center;}
        .chart_box table tr td:nth-child(8) {width: 45px; text-align: center;}

        .chart_box table tr {border-bottom: 2px solid #ccc;}
        .chart_box table tr:nth-child(1) {color: #333; border-top: 2px solid #ccc; height: 40px; font-size: 12px;}
        .chart_box table tr {height: 80px;}

        /* chart txt */
        .album_mini {float: left; width: 45px; height: 45px;}
        .list_title {float: left; margin-top: 4px; margin-left: 10px; width: 385px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;}
        .list_artist {width: 125px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;}
        .list_album {width: 185px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;}

        /* like btn */
        .like_btn {display: block; margin-left: 10.5px; width: 24px; height: 24px; background-image: url("<%=path %>/img/like_empty.png"); background-size: cover; background-position: center; background-repeat: no-repeat;}
        .like_btn.on {background-image: url("<%=path %>/img/like_full.png");}

        /* button icons */
        .button_icons {display: block; width: 24px; height: 24px; background-image: url("<%=path %>/img/button_icons.png"); border-radius: 50%; overflow: hidden;}
        
        /* lyrics btn */
        .lyrics_popup {float: left; display: block; margin-top: 11px; margin-left: 10px; width: 22px; height: 22px; background-position: -236px -215px;}
        
        /* .play_music btn */
        .play_music {background-position: 0px -167px; margin-left: 10.5px; }
        .play_music:hover {background-position: 221px -167px;}
        .play_music:active {background-position: 249px -167px;}
        .play_music.on {background-position: 249px -167px;}
        
        /* add_list btn */
        .add_list {background-position: -165px 0px; margin-left: 10.5px; }
        .add_list:hover {background-position: -165px 192px;}
        .add_list:active {background-position: -165px 220px;}
        .add_list.on {background-position: -165px 220px;}

        h2 {font-size: 26px; margin-bottom: 50px;}

        /* artist box */
        .artist_box {height: 200px; border: 2px solid #ccc; padding: 10px; box-sizing: border-box;}
        .artist_box img {float: left; display: block; width: 176px; height: 176px;}
        .artist_box table {float: left; margin-left: 20px; width: 80%; box-sizing: border-box;}
        .artist_box table tr td {text-align: left;}
        .artist_box table tr:nth-child(2) {height: 50px;}
        .artist_box table tr:nth-child(3) {height: 85px;}
        .artist_box table tr:nth-child(1) td {height: 40px; font-size: 25px;}
        .artist_box table tr:nth-child(3) td {vertical-align: top;}
        .artist_box table tr:nth-child(2) td:first-child, .artist_box table tr:nth-child(3) td:first-child {width: 80px; color: #666;}

        /* comment input box */
        .comment_box {position: relative; margin: 20px 0; padding: 20px; box-sizing: border-box;}
        .comment_box h3 {font-size: 18px; margin-bottom: 20px;}
        .comment_box div form textarea {float: left; width: 80%; height: 150px; padding: 10px; border: 2px solid #ccc; box-sizing: border-box; font-size: 15px; resize: none;}
        .comment_box div form textarea:focus {outline: none;}
        .comment_box div form button {float: right; display: block; width: 150px; height: 150px; border: none; background-color: #11264b; color: #fff; font-size: 15px; font-weight: bold; border-radius: 5px; cursor: pointer;}
        .comment_box div form button:active {background-color: #183568;}

        .max_type {display: inline-block; position: absolute; right: 215px; padding-top: 10px; color: #666;}

        /* comment list */
        .comment_list_wrapper {margin-bottom: 20px;}
        .comment_list {position: relative; height: 120px; padding: 20px 20px; border-bottom: 2px solid #ccc; box-sizing: border-box;}
        .comment_list:nth-child(1) {border-top: 2px solid #ccc;}
        .comment_list > p {margin-bottom: 10px;}
        .comment_list > div > div:nth-child(1) {float: left; width: 80%;}
        .comment_list > div > div:nth-child(1) > p {color: #666;}
        .comment_list > div > div:nth-child(1) > div {position: absolute; bottom: 20px;}
        .comment_list > div > div:nth-child(1) > div > a {color: #ccc;}
        .comment_list > div > div:nth-child(1) > div > a:hover {color: #aaa;}
        .comment_list > div > div:nth-child(2) {float: left; margin-left: 90px; margin-top: 5px; color: #ccc;}
        .comment_list > div > div:nth-child(2) a:hover {color: #aaa;}

        /* co_comment list */

        /* co_comment input box */
        .co_comment_box {height: 70px; margin-bottom: 20px; padding: 20px; box-sizing: border-box; background-color: #ddd;}
        .co_comment_box.on {display: none;}
        .co_comment_box form textarea {float: left; width: 80%; height: 30px; padding: 5px; border: 2px solid #ccc; box-sizing: border-box; font-size: 13px; resize: none;}
        .co_comment_box form textarea:focus {outline: none;}
        .co_comment_box form button {float: right; display: block; width: 150px; height: 30px; border: none; background-color: #11264b; color: #fff; font-size: 15px; font-weight: bold; border-radius: 5px; cursor: pointer;}
        .co_comment_box form button:active {background-color: #183568;}
    </style>
</head>


<body>
    <%@ include file="/WEB-INF/view/include/top.jsp" %>
    <div id="container">
        <div class="center">
        	<c:if test="${!empty vo }">
            <h2>찾으시는 <strong style="color:purple;">'${vo[0].artist}'</strong> 검색 결과입니다.</h2>
            <c:forEach var="vo" items="${vo}" varStatus="status">    
	            <div class="artist_box clear">
	            <input type="hidden" id="artist_no" name="artist_no" value="${vo.artist_no}">
	                <a href="/music/detail/albumDetail.do?album_no=${vo.album_no}"><img src="<%=path %>/upload/${vo.img_real }" alt="album1"></a>
	                <table>
	                    <tr>
	                        <td colspan="2"><a href="/music/detail/artistDetail.do?artist_no=${vo.artist_no}">${vo.artist }</a></td>
	                    </tr>
	                    <tr>
	                        <td>데뷔</td>
	                        <td>${vo.debdate }</td>
	                    </tr>
	                    <tr>
	                        <td>소개</td>
	                        <td>
	                            <p>${vo.info }</p>
	                        </td>
	                    </tr>
	                </table> 
	            </div>
            </c:forEach>
            </c:if>
            <c:if test="${empty vo }">
            <img src="/music/img/search_no.jpeg" style="margin: 200px 253px;"/>
			</c:if>
		</div>
	</div>
    <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
</body>

</html>