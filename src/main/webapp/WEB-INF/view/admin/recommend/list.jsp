<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	$(function(){
		var marginTop = $(".title").length;
		if (marginTop == 0) {
			$(".btn").css({"margin-top": "508px"});
		} else if (marginTop < 10) {
			$(".btn").css({"margin-top": 468-52*(marginTop-1)});
		}
	});

	function toggle(source) {
		checkboxes = document.getElementsByName('num');
		for(var i=0, n=checkboxes.length;i<n;i++) {
			checkboxes[i].checked = source.checked;
		}
	}
	
	function checklist() {
    	var chkArr = new Array();
			
    	$("input[type='checkbox'][name='num']:checked").each(function(){
			chkArr.push($(this).attr("data-Num"));
		});
			
        $.ajax({
	        url: 'write.do',
	        type: 'post',
	        traditional: true,
	        data: {
	        	chkArr: chkArr	
	        },
	        success : function(res){
	        	alert("선택된 곡이 추가되었습니다.");
	        	location.href='write.do';
	        },
	        error : function(res){
	        	alert("선택된 곡이 없습니다.");
	        }
        });
	}
</script>
<div id="blist">
	<p><span><strong>총 ${adminSongVo.totCount }개</strong>  |  ${adminSongVo.reqPage }/${adminSongVo.totPage }페이지</span></p>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="목록입니다.">
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
			<c:forEach var="vo" items="${list }">
				<tr>
					<td class="first"><input type="checkbox" name="num" id="num" data-Num="${vo.no }"/></td>
					<td>${vo.no }</td>
					<td class="title"><a href="<%=request.getContextPath()%>/admin/song/view.do?no=${vo.no }&reqPage=1">${vo.title }</a></td>
					<td><a href="<%=request.getContextPath()%>/admin/album/view.do?no=${vo.album_no }&reqPage=1">${vo.albumName }</a></td>
					<td><a href="<%=request.getContextPath()%>/admin/artist/view.do?no=${vo.artist_no }&reqPage=1">${vo.artistName }</a></td>
					<td><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd hh:mm"/></td>
					<td class="last">admin</td>
				</tr>					
			</c:forEach>
		</tbody>
	</table>
	<div class="btn">
		<div class="btnRight">
			<a class="wbtn" onclick="javascript:checklist();" style="cursor: pointer;"><strong>추가</strong> </a>
		</div>
	</div>
	<!--//btn-->
	<!-- 페이징 처리 -->
	<ul class='page'>
	<c:if test="${adminSongVo.startPage > adminSongVo.pageRange }">
                   	<li style="display: inline-block"><a href='javascript:getList(reqPage=${adminSongVo.startPage - 1 })'><<</a></li>
                </c:if>
                <c:forEach var="rp" begin="${adminSongVo.startPage }" step="1" end="${adminSongVo.endPage }">
                    <li style="display: inline-block"><a href='javascript:getList(reqPage=${rp })' <c:if test="${rp == adminSongVo.reqPage }">style='color: red;'</c:if>>${rp }</a></li>                        
                </c:forEach>
                <c:if test="${adminSongVo.endPage < adminSongVo.totPage }">
                  	<li style="display: inline-block"><a href='javascript:getList(reqPage=${adminSongVo.endPage - 1 })'>>></a></li>
                </c:if>
	</ul>
	<!-- //페이징 처리 -->
	<form name="searchForm" id="searchForm" action="" onsubmit="return false;" method="post">
		<div class="search">
			<select id="orderby" name="orderby" class="dSelect" title="검색분류 선택" onchange="getList(${adminSongVo.reqPage}, $('#stype').val(), $('#sval').val(), $('#orderby').val(), $('#direct').val());">
                               <option value="regdate"<c:if test="${param.orderby == 'regdate'}">selected</c:if>>등록일</option>
                           </select>
                           <select id="direct" name="direct" class="dSelect" title="검색분류 선택" onchange="getList(${adminSongVo.reqPage}, $('#stype').val(), $('#sval').val(), $('#orderby').val(), $('#direct').val());">
                               <option value="DESC"<c:if test="${param.direct == 'DESC'}">selected</c:if>>내림차순</option>
                               <option value="ASC"<c:if test="${param.direct == 'ASC'}">selected</c:if>>오름차순</option>
                           </select>
                           <select id="stype" name="stype" class="dSelect" title="검색분류 선택">
                               <option value="all">전체</option>
                               <option value="no"<c:if test="${param.stype == 'no'}">selected</c:if>>번호</option>
                               <option value="title"<c:if test="${param.stype == 'title'}">selected</c:if>>노래제목</option>
                           </select>
                           <input type="text" id="sval" name="sval" value="${param.sval }" title="검색어 입력" autocomplete="off">
			<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" onclick="getList(${adminSongVo.reqPage}, $('#stype').val(), $('#sval').val(), $('#orderby').val(), $('#direct').val());"/>
		</div>
	</form>
	<!-- //search --> 
</div>
<!-- //blist -->
