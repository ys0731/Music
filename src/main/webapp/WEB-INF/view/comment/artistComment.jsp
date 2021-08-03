<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
%>
<c:forEach var="vo" items="${list }"  varStatus="status">
	<div class="comment_list">
		<p>
			<c:if test="${vo.nested > 0 }">
					<img src="<%=path%>/img/turn_arrow.png" style="width: 35px; height: 20px;">
			</c:if>
			<span>${vo.name }</span>
		</p>
		<div class="clear">
			<div <c:if test="${vo.nested > 0 }">style="margin-left: 40px;"</c:if>>
				<p>${vo.content }</p>
				<div>
					<a class="report_btn" href="javascript:report(user_no=${vo.user_no },artist_co_no=${vo.no });">신고</a>
					<c:if test="${vo.nested < 1}">
						<a class="comment_btn" value=${status.count } href="#" onclick="addReplyComment(this, event);">답글</a>
					</c:if>
				</div>
			</div>
			<c:if test="${userInfo.no == vo.user_no}">
				<div <c:if test="${vo.nested > 0 }">style="margin-left: 95px;"</c:if>>
					<a class="delete_btn" href="javascript:commentDel(no=${vo.no });">삭제</a>
				</div>
			</c:if>
		</div>
	</div> 
	<div class="co_comment_box on" name="co_comment_box_${status.count }" id="co_comment_box_${status.count }">
	       <form action="" method="POST" class="clear">
	           <input type="hidden" id="gno_${status.count }" name="gno_${status.count }" value="${vo.gno }">
	           <input type="hidden" id="ono_${status.count }" name="ono_${status.count }" value="${vo.ono }">
	           <input type="hidden" id="nested_${status.count }" name="nested_${status.count }" value="${vo.nested }">
	           <textarea name="co_comment_${status.count }" id="co_comment_${status.count }" placeholder="답글을 입력해주세요.(100자 제한)" maxlength="100"></textarea>
	           <button class="insert_co_comment" value=${status.count } onclick="goSaveReply(this, event)">등록</button>
	       </form>
	</div>
</c:forEach>