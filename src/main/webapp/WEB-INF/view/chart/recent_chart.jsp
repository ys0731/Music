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
    <title>최신 음악</title>
    <%@ include file="/WEB-INF/view/include/headHtml.jsp" %>

    <script>
        // lyrics popup (id는 같은 이름을 복수의 태그에 부여 불가능!)
        window.onload = function () {
            var btn = document.getElementById("lyrics_1");

            function popup() {
                window.open("lyrics.html", "popup", "width=400, height=600");
            }

            btn.onclick = popup;
        }

        $(document).ready(function(){

            // check all
            $("#check_all").change(function(){
                if ($("#check_all").is(':checked')) {
                    $("input[type='checkbox'][name='check_list']").prop("checked", true);                  
                } 
                else {
                    $("input[type='checkbox'][name='check_list']").prop("checked", false);
                }
            });

           
            
            // preventDefault
            $(".chart_box ul li a, .lyrics_popup, .like_btn, .play_music, .add_list ").click(function(e){
                e.preventDefault();
            })

            //like img toggle
            $(".like_btn").click(function(){
                $(this).toggleClass("on");
            });
            //add list img toggle
            $(".add_list").click(function(){
                $(this).toggleClass("on");
            });
            //play music img toggle
            $(".play_music").click(function(){
                $(this).toggleClass("on");
            });

           // btn change color
           $(".chart_btn li").click(function(){               
                $(".chart_btn li").removeClass("on");
                $(this).addClass("on");
            });               
        });
    </script>

    <style>
        /* chart top btn */
        .chart_btn li {float: left; width: 100px; height: 30px; border-radius: 5px; background-color: #bbb; color: #fff; line-height: 30px; text-align: center; margin-right: 5px;}
        .chart_btn li:hover {background-color: #ccc;}
        .chart_btn li.on { background-color: #11264f;}
        .chart_btn li a {display: block; width: 100%;}

        /* chart medium btn */
        .chart_box > ul:first-child {margin-top: 40px;}
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
        .list_title {float: left; margin-top: 15px; margin-left: 10px; width: 385px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;}
        .list_artist {width: 125px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;}
        .list_album {width: 140px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;}

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

    </style>

</head>

<body>
    <%@ include file="/WEB-INF/view/include/top.jsp" %>
    <div id="container">
        <div class="center">
            
            <form class="chart_box" action="" method="post">
                <ul class="clear">
                    <li><input id="check_all" type="checkbox"></li>
                    <li><a href="#">듣기</a></li>
                    <li><a href="#">재생목록에 추가</a></li>
                </ul>
                <table>
                    <tr>
                        <td></td>
                        <td>NO</td>
                        <td>곡</td>
                        <td>아티스트</td>
                        <td>앨범</td>
                        <td>좋아요</td>
                        <td>듣기</td>
                        <td>추가</td>
                    </tr>
                    <c:forEach var="vo" items="${list }"  varStatus="status">
                    <tr>
                  		<td><input name="check_list" type="checkbox"></td>
                  		<td>
                      		<p>${status.count }</p>
                   		</td>
                   		<td class="clear">
		                      <a href="album_info.html"> <img class="album_mini" src="<%=path %>/upload/${vo.rel}" alt="album_img"></a>
		                       <a id="lyrics_'+i+'" class="lyrics_popup button_icons" href="#"></a>
		                       <p class="list_title">${vo.title }</p>
                   		</td>
                   		<td>
                      		<a href="artist_info.html"><p class="list_artist">${vo.artist }</p></a>
                   		</td>
                  		<td>
                     		<a href="album_info.html"><p class="list_album">${vo.album }</p></a>
                   		</td>
	                    <td>
	                        <a class="like_btn" href="#"></a>
	                    </td>
	                    <td>
	                        <a class="play_music button_icons" href="#"></a>
	                    </td>
                  		<td>
                       		<a class="add_list button_icons" href="#"></a>
                  		</td>
                	</tr>
                    </c:forEach>
                </table>
            </form>
        </div>
    </div>
    <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
</body>

</html>