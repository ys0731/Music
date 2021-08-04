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
    <title>아티스트상세</title>
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
            $(".chart_box ul li a, .lyrics_popup, .like_btn, .play_music, .add_list").click(function(e){
                e.preventDefault();
            });
            
            //좋아요
            $(".like").click(function() {
            	var sno = $(this).data('no');
            	$.ajax({
            		url: '/music/like/like.do?sno='+sno,
            		method: 'post',
            		success: function(data) {
            			console.log("success");
            		}
            		
            	});
            });//함수 끝
            
            //like img toggle
            $(".like_btn").click(function(){
                $(this).toggleClass("on");
            });
            
            // string count 100
            $(".comment_box div form textarea").keyup(function(){
                var text_count = $(this).val().length;
                document.getElementById("text_count").innerHTML = text_count;
                if (text_count >= 100) {
                    $(".max_type").css({"color": "red"});
                } else {
                    $(".max_type").css({"color": "#666"});
                }
            });
        });
        window.onload = function () {
        	console.log("onload")		
        }
        function addReplyComment (obj, event) {
        	event.preventDefault();
        	let replyIndex = $(obj).attr('value')
        	$("#co_comment_box_"+replyIndex).toggleClass("on");
        }
       	function goSave(event) {
       		console.log("goSave")
       		event.preventDefault();
       		<c:if test="${!empty userInfo}">
			if ($("#comment").val().trim()=="") {
        			alert('내용을 입력해 주세요');
        	} else {
       			if (confirm('댓글을 등록하시겠습니까?')) {
       				console.log("comment", $("#comment").val())
       				console.log("artist_no",$("#artist_no").val())
       				var payload = {
       	        		content : $("#comment").val(),
       	         		artist_no : $("#artist_no").val(),
       	         		user_no :  ${userInfo.no }
       	         	}
       				console.log("payload =>", payload)
       			  	$.ajax({
	       				url:'/music/artistDetailComment/insert.do',
	       				method: 'post',
	       				data:payload,
	       				success:function(res) {
	       					console.log("success")
	       					if (res.trim()=='true') {
                					alert('댓글이 등록되었습니다.');
                					commentList();
	       					}
	       				},
	       			    error : function(request, status, error) { // 결과 에러 콜백함수
	       			        console.log("error")
	       			    }
	       			});
       			}		
       		}
			</c:if>
    		<c:if test="${empty userInfo}">
    			alert('댓글은 로그인 후 등록가능합니다.');
    		</c:if>
       	}
       	$(function(){
    		commentList();
    	});
       	function commentList() {
       		$.ajax({
       			url:'/music/artistDetailComment/list.do',
       			data: { 
       				artist_no:$("#artist_no").val()
       			},
       			success:function(res) {
    				$("#commentArea").html(res);
    			}
       		});
       	}
       	function commentDel(no) {
    		if (confirm('댓글을 삭제하시겠습니까?')) {
    			$.ajax({
        			url:'/music/artistDetailComment/beforedelete.do',
        			data:{
        				no: no
        			},
        			success:function(res) {
        				if (res.trim()=='true') {
            				alert('답글이 있는 댓글은 삭제할 수 없습니다.');
        				} else {
        					$.ajax({
			        			url:'/music/artistDetailComment/delete.do',
			        			data:{
			        				no:no
			        			},
			        			success:function(res) {
			        				if (res.trim()=='true') {
			            				alert('댓글이 삭제되었습니다.');
			            				commentList();
			        				} else {
			        					alert('댓글 삭제 오류');
			        				}
			        			}
			        		});
        				}
        			}
        		});
    		}
    	}
    	function goSaveReply(obj, event) {
       		console.log("goSaveReply")
       		event.preventDefault();
        	let replyIndex = $(obj).attr('value')
			<c:if test="${!empty userInfo}">
			if ($("#co_comment_"+replyIndex).val().trim()=="") {
        			alert('내용을 입력해 주세요');
        	} else {
       			if (confirm('답글을 등록하시겠습니까?')) {
       	        	var payload = {
       	         		artist_no : $("#artist_no").val(),
       	         		user_no : ${userInfo.no },
       	        		content : $("#co_comment_"+replyIndex).val(),
		   				gno: $("#gno_"+replyIndex).val(),
		   				ono: $("#ono_"+replyIndex).val(),
		   				nested:$("#nested_"+replyIndex).val()
       	         	}
       				console.log("payload =>", payload)
       			  	$.ajax({
	       				url:'/music/artistDetailComment/insertReply.do',
	       				method: 'post',
	       				data:payload,
	       				success:function(res) {
	       					console.log("success")
	       					if (res.trim()=='true') {
                					alert('답글이 등록되었습니다.');
                					commentList();
	       					}
	       				},
	       			    error : function(request, status, error) { // 결과 에러 콜백함수
	       			        console.log("error")
	       			    }
	       			});
       			}		
       		}
        	</c:if>
    		<c:if test="${empty userInfo}">
    			alert('댓글은 로그인 후 등록가능합니다.');
    		</c:if>
       	}
    	function report(user_no,artist_co_no) {
    		if (confirm('댓글을 신고하시겠습니까?')) {
	    		var params = {
	    				user_no : user_no,
	    				artist_co_no : artist_co_no,
	    				album_co_no : 0
	    		}
	    		$.ajax({
	    			url: '/music/user/report/insert.do',
	    			method: 'post',
	    			data: params,
	    			success:function(res) {
	    				console.log("success")
	    				if (res.trim()=='true') {
	                					alert('신고되었습니다');               					
		       					}
	    			}
	    			
	    		});
    		}
    	}
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

        h2 {font-size: 26px; margin-bottom: 10px;}

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
        .comment_list > div > div:nth-child(2) {float: left; margin-left: 135px; margin-top: 5px; color: #ccc;}
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
            <h2>${vo.artist }</h2>
            <div class="artist_box clear">
            <input type="hidden" id="artist_no" name="artist_no" value="${vo.artist_no}">
                <img src="<%=path %>/upload/${vo.img_real }" alt="album1">
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
            </div>
            <h3 class="song_count">
                <span>아티스트 최신곡</span>
            </h3>
            <form class="chart_box" action="" method="post">
                <ul class="clear">
                    <li><input id="check_all" type="checkbox"></li>
                    <li><a href="#">듣기</a></li>
                </ul>
                <table>
                    <tr>
                        <td></td>
                        <td>순위</td>
                        <td>곡</td>
                        <td>아티스트</td>
                        <td>앨범</td>
                        <td>좋아요</td>
                        <td>듣기</td>
                        <td>추가</td>
                    </tr>
                    <c:forEach var="vo" items="${list }"  varStatus="status" end="10">
                    <tr>
                  		<td><input name="check_list" type="checkbox"></td>
                  		<td>
                      		<p>${status.count }</p>
                   		</td>
                   		<td class="clear">
		                      <a href="<%=request.getContextPath()%>/detail/albumDetail.do?album_no=${vo.album_no }"> <img class="album_mini" src="<%=path %>/upload/${vo.album_img }" alt="album_img"></a>
		                       <a id="lyrics_'+i+'" class="lyrics_popup button_icons" href="#"></a>
		                       <p class="list_title">${vo.title }</p>
                   		</td>
                   		<td>
                      		<a href="#"><p class="list_artist">${vo.artist }</p></a>
                   		</td>
                  		<td>
                     		<a href="<%=request.getContextPath()%>/detail/albumDetail.do?album_no=${vo.album_no }"><p class="list_album">${vo.album }</p></a>
                   		</td>
	                    <td>
	                        <a class="like_btn like<c:if test="${vo.mlike_cnt > 0}"> on</c:if>" href="#" data-no="${vo.no }"></a>
	                    </td>
	                    <td>
	                        <a class="play_music button_icons" onclick="javascript:player(no=${vo.no });" href="#"></a>
	                    </td>
                  		<td>
                       		<a class="add_list button_icons" onclick="javascript:player(no=${vo.no });" href="#"></a>
                  		</td>
                	</tr>
                    </c:forEach>
                </table>
            </form>
            <div id="comment_box2" class="comment_box">
                <h3>댓글</h3>
                <div>
                    <form action="" method="POST" class="clear">
                        <textarea name="comment" id="comment" placeholder="내용을 입력해주세요." maxlength="100"></textarea>
                        <button class="insert_comment" onclick="goSave(event);">등록</button>
                    </form>
                </div>
                <p class="max_type">
                    <span>(</span><span id="text_count">0</span><span>/100)</span>
                </p>
            </div>
            <div class="comment_list_wrapper">
				<div id="commentArea"></div>
            </div>
		</div>
	</div>
    <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
</body>

</html>