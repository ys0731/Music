<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이용권 내역</title>
    <%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
	<script>
	
	 /*  전체 선택을 체크하면 개별 체크박스들도 모두 체크  */
	 function isAllChk(){
	 	var chk = $("#allChk").prop("checked");
	 	if(chk){
	 		$('input:checkbox[name="checkno"]').prop("checked",true);
	 		$("input[name=checked_no]").val('y');
	 	}else{
	 		$('input:checkbox[name="checkno"]').prop("checked",false);
	 		$("input[name=checked_no]").val('');
	 	}
	 };

	 /* 개별 체크 박스를 선택, 취소하면 전체 선택 체크박스는 해제  */
 	 function isChk(){
		 if($("input[name=checked_no]").val()==''){
			 	$("#allChk").prop("checked",false);
			 	$("input[name=checked_no]").val('y');
		 }else{	
				$("input[name=checked_no]").val('');			 
		 }
	 }; 

		function isDel() {
        	if($('input[name="checked_no"]').val()==''){
        		alert('해지하실 이용권을 선택해주세요.');
        		return;
        	}
    		if (confirm('해지하시겠습니까? [해지 즉시 스트리밍 서비스를 제공받을 수 없습니다.]')) {
    			var chkArr = new Array();
    			
    			$('input:checkbox[name="checkno"]:checked').each(function(){
    				chkArr.push($(this).attr("data-Num"));
    			});
    			// 삭제처리
    			$.ajax({
    				url:'/music/pay/delete.do',
    				data:{
    					chbox : chkArr 
    				},
    				method:'post',
    				success:function(res) {
    					if (res.trim() == 'true') {
    						alert('정상적으로 해지되었습니다.');
    						location.href='view.do';
    					} else {
    						alert('삭제 실패');
    					}
    				},
    			});
    		}
    	}

	</script>
	
    <style>
        /* ticket detail page */
        h2 {font-size: 26px; margin-bottom: 20px;}
        h3 {font-size: 15px; margin-bottom: 30px;}

        /* none ticket notice */
        #ntc {font-size: 15px; text-align: center; width: 876px !important;}

        /* chart row */
        .chart_box table {margin-bottom: 20px;}
        .chart_box table tr td:nth-child(1) {width: 50px; text-align: center;}
        .chart_box table tr td:nth-child(2) {width: 140px; text-align: center;}
        .chart_box table tr td:nth-child(3) {width: 150px; text-align: center;}
        .chart_box table tr td:nth-child(4) {width: 501px; text-align: center;}
        .chart_box table tr td:nth-child(5) {width: 165px; text-align: center;}
        .chart_box table tr {border-bottom: 2px solid #ccc;}
        .chart_box table tr:nth-child(1) {color: #333; border-top: 2px solid #ccc; height: 40px; font-size: 12px;}
        .chart_box table tr {height: 80px;}
        #container {margin-bottom: 255px;}

        /* ticket button */
        .ticket_btn {display: block; width: 100px; height: 30px; margin: 20px auto; border-radius: 5px; background-color: #11264f; color: #fff; line-height: 30px; text-align: center;}
        .ticket_btn:hover {background-color: #4169E1;}

	</style>
</head>
<body>
    <%@ include file="/WEB-INF/view/include/top.jsp" %>
    <div id="container">
        <div class="center">
            <h2>이용권 내역</h2>
            <h3>${userInfo.nickname}님의 이용권 보유 현황</h3>
            <form class="chart_box" action="" method="post">
                <table>
                    <c:if test="${empty list}">
                    <tr>
                    <!-- 	<td></td>
                    	<td></td>
                    	<td></td> -->
                    	<td colspan="4">
		                    <div class="none_ticket_box"><p id="ntc">사용중인 이용권이 없습니다. 이용권을 구매해 주세요.</p></div>
		                </td>
		                
		                <td><a class="ticket_btn clear" href="/music/ticket/index.do">이용권 구매</a></td>
		            </tr>    
                    </c:if>
                    <c:if test="${!empty list}">
                    <tr>
                    	<td><input type="checkbox" name="allChk" id="allChk" onclick="isAllChk();"/></td>
                    	<td>NO</td>
                        <td>이용권</td>
                        <td>다음 결제 안내</td>
                        <td>해지 신청</td>
                    </tr>
                    	<input type="hidden" name="checked_no" value="">
                    <c:forEach var="vo" items="${list}" varStatus="status">
                    <tr>
                    	<td><input type="checkbox" name="checkno" id="no" onclick="isChk();" data-Num="${vo.no }"/></td>
                    	<td>${status.count}</td>
                    	<c:if test="${vo.ticket_type == 1}">
                    	<td>스트리밍 1시간 듣기 <span style="font-size: 12px;">(${vo.pay_start_date})</span></td>
                    	</c:if>
                    	<td style="color:red;">${vo.pay_end_date}</td>
                    	<td><p class="notice_click_cnt"><a class="ticket_btn clear" href="javascript:isDel();" data-Num="${payVo.no }">해지하기</a></p></td>
                    </tr>
                    </c:forEach>	
                    </c:if>	
                </table>
               
           </form>
        </div>
    </div>
       <%@ include file="/WEB-INF/view/include/bottom.jsp" %>

</body>
</html>