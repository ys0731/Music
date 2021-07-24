<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
// player--------------------------------------------------------------------------------
$(function(){
	var windowOpen;
	$(".play_music").click(function(){
    	if ($(this).hasClass("on")) {
    		$(this).removeClass("on");
    	} else {
    		$(this).addClass("on");
        	$(this).parent().parent().siblings().children().children(".play_music").removeClass("on");
        	<c:if test="${!empty expiryDate}">	
			$.ajax({
		    	url: '<%=request.getContextPath()%>/player/play.do',
				type: 'post',
				data: {
					no: no	
				}
			});
			
			$.ajax({
		        url: '<%=request.getContextPath()%>/player/playlog.do',
		        type: 'post',
		        data: {
		        	no: no	
		        }
	        });
			</c:if>	
			<c:if test="${empty expiryDate}">
				alert('보유중인 이용권이 없습니다.');
				$(this).removeClass("on");
			</c:if>
    	}
	});
	
	$(".add_list").click(function(){
		if ($(this).hasClass("on")) {
			$(this).removeClass("on");
		} else {
			$(this).addClass("on");
			<c:if test="${!empty expiryDate}">	
	       	$.ajax({
            	url: '<%=request.getContextPath()%>/player/plusplay.do',
        		type: 'post',
        		traditional: true,
        		data: {
        			no: no	
        		}
        	});
			
			$.ajax({
		        url: '<%=request.getContextPath()%>/player/playlog.do',
		        type: 'post',
		        data: {
		        	no: no	
		        }
	        });
			</c:if>	
			<c:if test="${empty expiryDate}">
				alert('보유중인 이용권이 없습니다.');
				$(this).removeClass("on");
			</c:if>
		}
	});
});
        
function player(no) {
    $(".play_music").click(function(){
    	if ($(this).hasClass("on")) {
    		<c:if test="${!empty expiryDate}">		
    		windowOpen = window.open('<%=request.getContextPath()%>/player/sendplaylist.do','pagename',
     		'resizable=0,scrollbars=no,toolbars=no, menubar=no,height=660,width=400');
			</c:if>
    	} else {
        	windowOpen.close();
        	return;
    	}
	});
}

function checkplayer() {
	var chkArr = new Array();
		
	$("input[type='checkbox'][name='check_list']:checked").each(function(){
			chkArr.push($(this).attr("data-Num"));
		});
	
		// alert(chkArr);
		
    $.ajax({
    	url: '<%=request.getContextPath()%>/player/checkplay.do',
        type: 'post',
        traditional: true,
        data: {
        	chkArr: chkArr	
        },
        success : function(res){
        	<c:if test="${!empty expiryDate}">	
		        windowOpen = window.open('<%=request.getContextPath()%>/player/sendplaylist.do','pagename',
	            'resizable=0,scrollbars=no,toolbars=no, menubar=no,height=660,width=400');
		    </c:if>
			<c:if test="${empty expiryDate}">
				alert('보유중인 이용권이 없습니다.');
			</c:if>
        },
        error : function(res){
        	alert("선택된 곡이 없습니다.");
        }
    });
    
	$.ajax({
        url: '<%=request.getContextPath()%>/player/playlogs.do',
        type: 'post',
        traditional: true,
        data: {
        	chkArr: chkArr	
        }
    });
}

function plusplayer(no) {
    $(".add_list").click(function(){
    	if ($(this).hasClass("on")) {
    		<c:if test="${!empty expiryDate}">		
    		windowOpen = window.open('<%=request.getContextPath()%>/player/sendplaylist.do','pagename',
     		'resizable=0,scrollbars=no,toolbars=no, menubar=no,height=660,width=400');
			</c:if>
		} else {
			return;
		}
        
    });

}
</script>
