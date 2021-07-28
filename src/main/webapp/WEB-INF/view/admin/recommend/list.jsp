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
	        	alert("���õ� ���� �߰��Ǿ����ϴ�.");
	        	location.href='write.do';
	        },
	        error : function(res){
	        	alert("���õ� ���� �����ϴ�.");
	        }
        });
	}
</script>
<div id="blist">
	<p><span><strong>�� ${adminSongVo.totCount }��</strong>  |  ${adminSongVo.reqPage }/${adminSongVo.totPage }������</span></p>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="����Դϴ�.">
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
				<th scope="col">��ȣ</th>
				<th scope="col">�뷡����</th> 
				<th scope="col">�ٹ���</th> 
				<th scope="col">��Ƽ��Ʈ��</th> 
				<th scope="col">�����</th> 
				<th scope="col" class="last">�ۼ���</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list}">
	            <tr>
	                <td class="first" colspan="7">��ϵ� ���� �����ϴ�.</td>
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
			<a class="wbtn" onclick="javascript:checklist();" style="cursor: pointer;"><strong>�߰�</strong> </a>
		</div>
	</div>
	<!--//btn-->
	<!-- ����¡ ó�� -->
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
	<!-- //����¡ ó�� -->
	<form name="searchForm" id="searchForm" action="" onsubmit="return false;" method="post">
		<div class="search">
			<select id="orderby" name="orderby" class="dSelect" title="�˻��з� ����" onchange="getList(${adminSongVo.reqPage}, $('#stype').val(), $('#sval').val(), $('#orderby').val(), $('#direct').val());">
                               <option value="regdate"<c:if test="${param.orderby == 'regdate'}">selected</c:if>>�����</option>
                           </select>
                           <select id="direct" name="direct" class="dSelect" title="�˻��з� ����" onchange="getList(${adminSongVo.reqPage}, $('#stype').val(), $('#sval').val(), $('#orderby').val(), $('#direct').val());">
                               <option value="DESC"<c:if test="${param.direct == 'DESC'}">selected</c:if>>��������</option>
                               <option value="ASC"<c:if test="${param.direct == 'ASC'}">selected</c:if>>��������</option>
                           </select>
                           <select id="stype" name="stype" class="dSelect" title="�˻��з� ����">
                               <option value="all">��ü</option>
                               <option value="no"<c:if test="${param.stype == 'no'}">selected</c:if>>��ȣ</option>
                               <option value="title"<c:if test="${param.stype == 'title'}">selected</c:if>>�뷡����</option>
                           </select>
                           <input type="text" id="sval" name="sval" value="${param.sval }" title="�˻��� �Է�" autocomplete="off">
			<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="�˻�" onclick="getList(${adminSongVo.reqPage}, $('#stype').val(), $('#sval').val(), $('#orderby').val(), $('#direct').val());"/>
		</div>
	</form>
	<!-- //search --> 
</div>
<!-- //blist -->
