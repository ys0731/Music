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
    <title>인기MV</title>
    <%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
    <link href="<%=request.getContextPath()%>/flipster/jquery.flipster.min.css" rel="stylesheet" />
    <script src="<%=request.getContextPath()%>/flipster/jquery.flipster.min.js"></script>

    <script>
        $(document).ready(function(){
            $(".chart_box table").append(html);
            
            // preventDefault
            $(".chart_box ul li a").click(function(e){
                e.preventDefault();
            })

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

        /* chart row */
        .chart_box table {margin-bottom: 20px; margin-top: 50px;}
        .chart_box table tr td:nth-child(1) {width: 96px; text-indent:10px}
        .chart_box table tr td:nth-child(2) {width: 100px;}
        .chart_box table tr td:nth-child(3) {width: 410px;}
        .chart_box table tr td:nth-child(4) {width: 220px;}
        .chart_box table tr td:nth-child(5) {width: 190px;}

        .chart_box table tr {border-bottom: 2px solid #ccc;}
        .chart_box table tr:nth-child(1) {color: #333; border-top: 2px solid #ccc; height: 40px; font-size: 12px;}
        .chart_box table tr {height: 80px;}

        /* chart txt */
        .album_mini {float: left; width: 60px; height: 45px;}
        .list_title {float: left; margin-left: 10px; width: 385px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;}
        .list_artist {width: 125px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;}
        .list_album {width: 140px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;}


        /* mv */
        .banner{
            width: 100%;
            overflow: hidden;
        
        }
        .banner .carousel{
            width: 200px;
            margin: 0 auto 0;
            overflow: visible;
        
        }
        .carousel img{
            border-radius: 10%;  
        }

        /*mv play_btn */
        .video span {
            width: 100%;
            height: 100%;
            position: absolute;
            background: url("<%=request.getContextPath()%>flipster/img/ytb_play_btn.png") no-repeat;
            background-position: 50% 45%;
            background-size: 40%;
            opacity: 0.5;
        }

        .video span:hover{
            opacity: 1;
                
        }
        /*mv artist name - song */
        .videos_song{
            margin-top: 10px;
            text-align: center;
            font-size: 20px;
        }

    </style>
</head>


<body>
    <%@ include file="/WEB-INF/view/include/top.jsp" %>
    <div id="container">
        <div class="center">
            <ul class="chart_btn clear">
                <li><a href="recentMv.do">최신</a></li>
                <li class="on"><a href="popularMv.do">인기</a></li>              
            </ul>

  <!--default값으로 유투브 썸네일 가져오기-->
  <div class="banner">
    <div class="carousel">
        <ul>
        <c:forEach var="vo" items="${list }"  varStatus="status" end="10">
        	<li class="videos">
              <a href="#" value="${vo.no}" value2="${vo.link}" class="video" onclick="test(this);">
                  <span></span>
                  <img src="${vo.img}" alt="" width="360px" height="240px"/>
              </a>
              <div class="videos_song">${vo.artist } - ${vo.title }</div>
        </c:forEach>
        </ul>
    </div>
</div>
<script>
  $('.carousel').flipster({
      style:'carousel',
      spacing:-0.3,
  });
  function test(obj){
	  let mno = $(obj).attr('value');
	  let link = $(obj).attr('value2');
	  console.log(mno);
	  console.log(link);
	  $.ajax({
			url:'/musicproject/mvChart/clickMv.do',
			method: 'post',
			data:{
				no:mno
			},
			success:function(res) {
				console.log("success")
				window.open(link)
			},
		    error : function(request, status, error) { // 결과 에러 콜백함수
		        console.log("error")
		    }
		});
	}
</script>

            <form class="chart_box" action="" method="post">
                <table>
                    <tr>                     
                        <td>NO</td>
                        <td>MV</td>
                        <td>곡</td>
                        <td>아티스트</td>
                        <td>앨범</td>
                    </tr>
                    <c:forEach var="vo" items="${list}"  varStatus="status">
                    <tr>
                  		<td>
                      		<p>${status.count }</p>
                   		</td>
                   		<td class="clear"> <!--!${vo.link } -->
		                     <a href="#" value="${vo.no}" value2="${vo.link}" class="video" id="recent" onclick="test(this);"> <img class="album_mini" src="${vo.img}" alt="album_img"></a>
                   		</td>
                   		<td>
		                     <p class="list_title">${vo.title }</p>
                   		</td>
                   		<td>
                      		<a href="artist_info.html"><p class="list_artist">${vo.artist }</p></a>
                   		</td>
                  		<td>
                     		<a href="album_info.html"><p class="list_album">${vo.album }</p></a>
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