<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
	$(function(){
		var marginTop = $(".title").length;
		if (marginTop == 0) {
			$(".btn").css({"margin-top": "491px"});
		} else if (marginTop < 10) {
			$(".btn").css({"margin-top": 451-52*(marginTop-1)});
		}
	});

	function toggle(source) {
		checkboxes = document.getElementsByName('num');
		for(var i=0, n=checkboxes.length;i<n;i++) {
			checkboxes[i].checked = source.checked;
		}
	}
	
	function isDel() {
		if (confirm("삭제하시겠습니까?")) {
			var chkArr = new Array();
			
			$('input:checkbox[name="num"]:checked').each(function(){
				chkArr.push($(this).attr("data-Num"));
			});
			
			$.ajax({
				url: 'deletearr.do',
				method: 'post',
				data: {
					chkbox : chkArr
				},
				success: function(res) {
					if(res.trim()=='true') {
						alert('정상적으로 삭제되었습니다.');
						location.href='index.do';
					} else {
						alert('삭제에 실패하였습니다.')
					}
				}
			});
		}
	}
</script>
</head>
<body> 
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>MV - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 ${adminMvVo.totCount }개</strong>  |  ${adminMvVo.reqPage }/${adminMvVo.totPage }페이지</span></p>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="w4" />
									<col class="" />
									<col class="w15" />
									<col class="w15" />
									<col class="w15" />
									<col class="w6" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onclick="javascript:toggle(this);"/></th>
										<th scope="col">번호</th>
										<th scope="col">노래제목</th> 
										<th scope="col">앨범명</th> 
										<th scope="col">아티스트명</th> 
										<th scope="col">등록일</th> 
										<th scope="col" class="last">작성자</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty list}">
			                            <tr>
			                                <td class="first" colspan="7">등록된 글이 없습니다.</td>
			                            </tr>						
									</c:if>
									<c:forEach var="vo" items="${list }" varStatus="status">
										<tr>
											<td class="first"><input type="checkbox" name="num" id="num" data-Num="${vo.no }"/></td>
											<td>${status.count }</td>
											<td class="title"><a href="view.do?no=${vo.no }&reqPage=${adminMvVo.reqPage}&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}">${vo.title }</a></td>
											<td>${vo.album }</td>
											<td>${vo.artist }</td>
											<td><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd hh:mm"/></td>
											<td class="last">admin</td>
										</tr>					
									</c:forEach>
								</tbody>
							</table>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="javascript:isDel();" data-Num="${adminMvVo.no }"><strong>삭제</strong> </a>
								</div>
								<div class="btnRight">
									<a class="wbtn" href="write.do"><strong>등록</strong> </a>
								</div>
							</div>
							<!--//btn-->
							<!-- 페이징 처리 -->
							<ul class='page'>
							<c:if test="${adminMvVo.startPage > adminMvVo.pageRange }">
		                       	<li style="display: inline-block"><a href='index.do?reqPage=${adminMvVo.startPage - 1 }&stype=${param.stype}&sval=${param.sval }&orderby=${param.orderby }&direct=${param.direct }'><<</a></li>
		                    </c:if>
		                    <c:forEach var="rp" begin="${adminMvVo.startPage }" step="1" end="${adminMvVo.endPage }">
		                        <li style="display: inline-block"><a href='index.do?reqPage=${rp }&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby }&direct=${param.direct }' <c:if test="${rp == adminMvVo.reqPage }">style='color: red;'</c:if>>${rp }</a></li>                        
		                    </c:forEach>
		                    <c:if test="${adminMvVo.endPage < adminMvVo.totPage }">
		                      	<li style="display: inline-block"><a href='index.do?reqPage=${adminMvVo.endPage + 1 }&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby }&direct=${param.direct }'>>></a></li>
		                    </c:if>
							</ul>
							<!-- //페이징 처리 -->
							<form name="searchForm" id="searchForm" action="index.do"  method="post">
								<div class="search">
									<select id="orderby" name="orderby" class="dSelect" title="검색분류 선택" onchange="$('#searchForm').submit();">
	                                    <option value="regdate"<c:if test="${param.orderby == 'regdate'}">selected</c:if>>등록일</option>
	                                </select>
	                                <select id="direct" name="direct" class="dSelect" title="검색분류 선택" onchange="$('#searchForm').submit();">
	                                    <option value="DESC"<c:if test="${param.direct == 'DESC'}">selected</c:if>>내림차순</option>
	                                    <option value="ASC"<c:if test="${param.direct == 'ASC'}">selected</c:if>>오름차순</option>
	                                </select>
	                                <select id="stype" name="stype" class="dSelect" title="검색분류 선택">
	                                    <option value="all">전체</option>
	                                    <option value="no"<c:if test="${param.stype == 'no'}">selected</c:if>>번호</option>
	                                    <option value="title"<c:if test="${param.stype == 'title'}">selected</c:if>>노래제목</option>
	                                </select>
	                                <input type="text" id="sval" name="sval" value="${param.sval }"  title="검색어 입력">
									<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" onclick="$('#searchForm').submit();"/>
								</div>
							</form>
							<!-- //search --> 
						</div>
						<!-- //blist -->
					</div>
					<!-- //bbs --> 
					<!-- 내용 : e -->
				</div>
				<!--//con -->
			</div>
			<!--//content -->
		</div>
		<!--//container --> 
		<!-- E N D :: containerArea-->
	</div>
	<!--//canvas -->
</div>
<!--//wrap -->
</body>
</html>