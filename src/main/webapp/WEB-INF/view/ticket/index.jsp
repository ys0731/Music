<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이용권 구매 </title>
     <%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script>
	function iamport(ticket_type,price,time){
        IMP.init('imp22227801'); 
        IMP.request_pay({
            pg : 'html5_inicis',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : ticket_type,
            amount : price,
            buyer_email : '${userInfo.email}',
            buyer_tel : '${userInfo.tel}'
        }, function(rsp) {
            	console.log(rsp);
            	//결제 검증
            	$.ajax({
            		type: "POST",
            		url : "/music/verifyIamport/" + rsp.imp_uid
            	}).done(function(data){
            		console.log(data);
            		//가격 비교한 후 로직 실행 (서버 검증)
            		if(rsp.paid_amount == data.response.amount){
            			alert("결제가 성공하였습니다.");
            			$("input[name=user_no]").val('${userInfo.no}');
            			location.href='/music/pay/payment.do?ticket_type='+ticket_type+'&time='+time;
            		}else{
            			alert('결제가 취소되었습니다.');
            		}
            	});
            	
        });
		
	};

	</script>
    <style>

        /*ticket page*/
        h2 {font-size: 26px; margin-bottom: 20px;}
        h3 {font-size: 20px; margin-bottom: 10px;}

        /* ticket box */
        .ticket_box {height: 60px; padding: 60px; border: 1px solid #ccc; margin-bottom: 20px; position: relative;}
        #strm {color: #6A5ACD; font-size: 20px; line-height: 30px;}

        /* pirce & pay button */
        .price_box1 {position: absolute; bottom: 70px; right: 70px;}
        .price_box1 span {float: left; font-size: 20px; line-height: 30px; margin-right: 10px;}
        .price_box1 a {display: block; float: left; width: 100px; line-height: 30px; background-color: #6A5ACD; color: #fff; border-radius: 15px; text-align: center;}
    </style>
</head>

<body>
    <%@ include file="/WEB-INF/view/include/top.jsp" %>
    <div id="container">
        <div class="center">
            <h2>이용권 구매</h2>
            <h3>무제한 듣기</h3>
            <c:forEach var="vo" items="${vo}">
            <div class="ticket_box">
                <p id="strm" name="ticket_type" value="${vo.ticket_type}">${vo.ticket_type}</p>
                <div class="price_box1">                    
                    <span name="price">${vo.price } 원</span>
                    <a href='javascript:iamport("${vo.ticket_type}",${vo.price}, ${vo.time});'>구매</a>
                </div>
                <input type="hidden" name="time" value="${vo.time}">
            </div>
            </c:forEach>
                 <input type="hidden" name="user_no" value="">
        </div>
    </div>
   <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
</body>
</html>