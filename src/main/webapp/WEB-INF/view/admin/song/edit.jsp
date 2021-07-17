<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
	function goIndex() {
		location.href = 'index.do';
	}
	
	function goSave() {
		if ($('#title').val().trim() == "") {
			alert("노래제목을 입력해 주세요.");
			$("#title").focus();
			return false;
		}
		if ($('#album_no').val().trim() == "") {
			alert("앨범번호를 입력해 주세요.");
			$("#album_no").focus();
			return false;
		}
		if ($('#artist_no').val().trim() == "") {
			alert("아티스트번호를 입력해 주세요.");
			$("#artist_no").focus();
			return false;
		}
		if ($('#lyrics').val().trim() == "") {
			alert("가사를 입력해 주세요.");
			$("#reldate").focus();
			return false;
		}
		
		$.ajax({
			url: 'edit.do',
			data: {
				album_no: $("#album_no").val(),
				artist_no: $("#artist_no").val()
			},
			method: 'post',
			success: function(res) {
				if (res.trim() == 'allFalse') {
					alert('없는 앨범번호와 아티스트번호입니다. 다시 입력해주세요.');
					$("#album_no").val('');
					$("#artist_no").val('');
					$("#album_no").focus();
					return false;
				} else if (res.trim() == 'albumFalse') {
					alert('없는 앨범번호 입니다. 다시 입력해주세요.');
					$("#album_no").val('');
					$("#album_no").focus();
					return false;
				} else if (res.trim() == 'artistFalse') {
					alert('없는 아티스트번호입니다. 다시 입력해주세요.');
					$("#artist_no").val('');
					$("#artist_no").focus();
					return false;
				}
				$("#frm").submit();		
			}
		});
	
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
					<h2>노래 - [수정]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="update.do" enctype="multipart/form-data">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="15%" />
									<col width="85%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">*노래제목</label></th>
										<td colspan="10">
											<input type="text" id="title" name="title" class="w100" title="노래제목을 입력해주세요" value="${vo.title }"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*앨범</label></th>
										<td colspan="10">
			                                <input type="text" id="album_no" name="album_no" title="앨범 선택" list="albumlisted" value="${vo.album_no }"/>
												<datalist id="albumlisted">
				                                    <c:forEach var="albums" items="${albumList }">
														<option value="${albums.no }">${albums.album }</option>				
													</c:forEach>
												</datalist>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*아티스트</label></th>
										<td colspan="10">
			                                <input type="text" id="artist_no" name="artist_no" title="아티스트 선택" list="artistlisted" value="${vo.artist_no }"/>
												<datalist id="artistlisted">
				                                    <c:forEach var="artists" items="${artistList }">
														<option value="${artists.no }">${artists.artist }</option>				
													</c:forEach>
												</datalist>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*장르</label></th>
										<td colspan="10">
											<select id="genre" name="genre" title="장르분류 선택">
			                                    <option value="1" <c:if test="${vo.genre == 1}">selected</c:if>>가요</option>
			                                    <option value="2" <c:if test="${vo.genre == 2}">selected</c:if>>팝</option>
			                                    <option value="3" <c:if test="${vo.genre == 3}">selected</c:if>>재즈</option>
			                                    <option value="4" <c:if test="${vo.genre == 4}">selected</c:if>>클래식</option>
			                                </select>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*가사</label></th>
										<td colspan="10">
											<textarea id="lyrics" name="lyrics" title="가사를 입력해주세요" style="width:100%; resize:none;">${vo.lyrics }</textarea>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*음원파일</label></th>
										<td colspan="10">
											<p style="margin-bottom: 10px;">기존 파일 : ${vo.src_org }</p>
											<input style="display: block;" type="file" id="file" name="file" class="w100" title="음원파일을 업로드 해주세요." accept="audio/*"/>	
										</td>
									</tr>
								</tbody>
							</table>
							<input type="hidden" name="no" value="${vo.no }">
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="javascript:goIndex();"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" href="javascript:goSave();" style="cursor:pointer;"><strong>수정</strong></a>
								</div>
							</div>
							<!--//btn-->
						</div>
						<!-- //bread -->
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