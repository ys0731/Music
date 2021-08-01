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
	
	    <script>
	  //팝업
	    function popup(no) {
	        window.open("/music/chart/lyrics.do?no="+no, "popup", "width=400, height=600");
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
			
            //가사
            $(".lyrics").click(function() {
            	var no = $(this).data('no');
            	popup(no);
            });
            
          //좋아요
            $(".like").click(function() {
            	var sno = $(this).data('no');
            	$.ajax({
            		url: '/music/like/like.do?sno='+sno,
            		method: 'post',
            		data: {
            			no: sno           			
            		},
            		success: function(data) {
            			console.log("success");
            		}
            		
            	});
            });//함수 끝
            
            $(".album").click(function() {
            	var sno = $(this).data('no');
            	$.ajax({
            		url: '<%=request.getContextPath()%>/detail/albumDetail.do?album_no='+sno,
            		method: 'post',
            		data: {
            			no: sno           			
            		},
            		success: function(data) {
            			console.log("success");
            			location.href='<%=request.getContextPath()%>/detail/albumDetail.do?album_no='+sno;
            		}
            		
            	});
            });//함수 끝
            
            $(".artist").click(function() {
            	var sno = $(this).data('no');
            	$.ajax({
            		url: '<%=request.getContextPath()%>/detail/artistDetail.do?artist_no='+sno,
            		method: 'post',
            		data: {
            			no: sno           			
            		},
            		success: function(data) {
            			console.log("success");
            			location.href='<%=request.getContextPath()%>/detail/artistDetail.do?artist_no='+sno;
            		}
            		
            	});
            });//함수 끝
            
            // preventDefault
            $(".chart_box ul li a, .lyrics_popup, .like_btn, .play_music, .add_list ").click(function(e){
                e.preventDefault();
            })

            //like img toggle
            $(".like_btn").click(function(){
                $(this).toggleClass("on");
            });

          	// btn change color
           	$(".chart_btn li").click(function(){               
                $(".chart_btn li").removeClass("on");
                $(this).addClass("on");
            });              
        });
    </script>
    
    <%@ include file="/WEB-INF/view/player/playnlog.jsp" %>
	
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
        .list_title {float: left; margin-top: 15px; margin-left: 10px; width: 385px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;}
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

      	h4 {font-size: 20px; margin: 20px 0;}
    </style>
</head>


<body>
    <%@ include file="/WEB-INF/view/include/top.jsp" %>
    <div id="container">
        <div class="center">
			<h2 style="padding: 50px 0; margin-bottom: 0; text-align: center; ">찾으시는 <strong style="color: #11246b;">'${param.searchword}'</strong> 검색 결과입니다.</h2>					
        	      		        		
				<h4>곡</h4>
				<form class="chart_box" action="" method="post">
	                <ul class="clear">
	                    <li><input id="check_all" type="checkbox"></li>
	                    <li><a href="#" onclick="javascript:checkplayer();">듣기</a></li>
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
	                    <c:if test="${!empty svo}">  
	                    <c:forEach var="vo" items="${svo }" varStatus="status">
	                    <tr>
	                  		<td><input name="check_list" type="checkbox" data-Num="${vo.no }"></td>
	                  		<td>
	                      		<p>${status.count }</p>
	                   		</td>
	                   		<td class="clear">
			                      <a href="/music/detail/albumDetail.do?album_no=${vo.album_no}"> <img class="album_mini" src="<%=path %>/upload/${vo.img_real}" alt="album_img"></a>
			                       <a class="lyrics_popup button_icons lyrics" href="#" data-no="${vo.no }"></a>
			                       <p class="list_title">${vo.title }</p>
	                   		</td>
	                   		<td>
	                      		<p class="list_artist" id="artist">
	                      		<a class="artist" href="/music/detail/artistDetail.do?artist_no=${vo.artist_no}" data-no="${vo.ar_no }" >${vo.artist }</a></p>
	                   		</td>
	                  		<td>
	                     		<p class="list_album" id="album"><a class="album" href="/music/detail/albumDetail.do?album_no=${vo.album_no}" data-no="${vo.al_no }">${vo.album }</a></p>
	                   		</td>
		                    <td>
		                       <a class="like_btn like <c:if test="${vo.mlike_cnt==1 }">on</c:if>" href="#" data-no="${vo.no }"></a>
		                    </td>
		                    <td>
		                         <a class="play_music button_icons play" href="#" onclick="javascript:player(no=${vo.no });" data-no="${vo.no }"></a>
		                    </td>
	                  		<td>
	                       		<a class="add_list button_icons" href="#" onclick="javascript:plusplayer(no=${vo.no });"></a>
	                  		</td>
	                	</tr>
	                    </c:forEach>
	                    </c:if>
	                    <c:if test="${empty svo}"> 
	                    	 <td colspan="8" style="text-align: center;">등록된 곡이 없습니다.</td>
	                    </c:if>
	                </table>
	            </form>	
			
			<c:if test="${!empty avo }">
			<div class="clear">
	            <h4>앨범</h4>
	            <c:forEach var="vo" items="${avo}" varStatus="status">    
		            <div class="artist_box clear" style="margin: 10px 0; width: 49%; float: left; <c:if test="${status.count % 2 == 1}">margin-right: 2%;</c:if>">
		            <a href="/music/detail/albumDetail.do?album_no=${vo.album_no}">
		            <input type="hidden" id="album_no" name="album_no" value="${vo.album_no}">
		                <img src="<%=path %>/upload/${vo.img_real }" alt="album1">
		                <table style="width: 55%;">
		                    <tr>
		                        <td colspan="2">${vo.album }</td>
		                    </tr>
		                    <tr>
		                        <td>아티스트</td>
		                        <td>
		                            <p><a href="/music/detail/artistDetail.do?artist_no=${vo.artist_no}">${vo.artist }</a></p>
		                        </td>
		                    </tr>
		                    <tr>
		                        <td>발매일</td>
		                        <td>
		                            <p>${vo.reldate }</p>
		                        </td>
		                    </tr>
		                </table>
		                </a>
		            </div>
	            </c:forEach>
			</div>
            </c:if>
        	<c:if test="${!empty vo }">	            
	            <h4>아티스트</h4>
	            <c:forEach var="vo" items="${vo}" varStatus="status">    
		            <div class="artist_box clear" style="margin: 10px 0;">
		            <a href="/music/detail/artistDetail.do?artist_no=${vo.artist_no}">
		            <input type="hidden" id="artist_no" name="artist_no" value="${vo.artist_no}">
		                <img src="<%=path %>/upload/${vo.img_real }" alt="album">
		                <table>
		                    <tr>
		                        <td colspan="2">${vo.artist }</td>
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
		                </a>
		            </div>
	            </c:forEach>
            </c:if>           
            <c:if test="${empty vo && empty svo && empty avo}">
            	<img src="/music/img/search_no.jpeg" style="margin: 200px 253px;"/>
			</c:if>
			
			
		</div>
	</div>
    <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
</body>

</html>