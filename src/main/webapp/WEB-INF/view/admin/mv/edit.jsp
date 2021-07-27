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
		if ($('#song_no').val().trim() == "") {
			alert("앨범번호를 입력해 주세요.");
			$("#song_no").focus();
			return false;
		}
		if ($('#img').val().trim() == "") {
			alert("썸네일을 입력해주세요.");
			$("#img").focus();
			return false;
		}
		if ($('#link').val().trim() == "") {
			alert("링크를 입력해주세요.");
			$("#link").focus();
			return false;
		}
		
		$.ajax({
			url: 'edit.do',
			data: {
				no: $("#song_no").val(),
			},
			method: 'post',
			success: function(res) {
				if (res.trim() == 'allFalse') {
					alert('없는 곡 번호입니다. 다시 입력해주세요.');
					$("#song_no").val('');
					$("#song_no").focus();
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
					<h2>MV - [수정]</h2>
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
										<th scope="row"><label for="">*노래</label></th>
										<td colspan="10">
											<input type="text" id="song_no" name="song_no" title="곡 선택" list="songlisted" value="${vo.song_no }"/>
												<datalist id="songlisted">
				                                    <c:forEach var="songs" items="${songList }">
														<option value="${songs.no }">${songs.title } / ${songs.artistName }</option>				
													</c:forEach>
												</datalist>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*썸네일</label></th>
										<td colspan="10">
											<div style="width: 160px; border: 5px double #ccc;">
												<img alt="앨범커버_이미지" src="${vo.img}" style="width: 160px; height: 90px;">
											</div>
											<p style="margin: 10px 0">기존 썸네일 : ${vo.img }</p>
											<p style="margin: 10px 0">변경할 썸네일</p>
											<input type="text" id="img" name="img" class="w100" title="변경할 썸네일을 입력해주세요" >썸네일은 https://img.youtube.com/vi/유튜브링크 고유번호/mqdefault.jpg 형식으로 저장해주세요</input>
										</td>
									</tr>
									<tr>
										<th scope="row" ><label for="">*유튜브 링크</label></th>
										<td colspan="10">
											<textarea id="link" name="link" title="링크를 입력해주세요" style="width:100%; resize:none;">${vo.link }</textarea>	
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