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
		
		var go = true;
		
		$.ajax({
			url: 'write.do',
			data: {
				no: $("#song_no").val()
			},
			method: 'post',
			success: function(res) {
				if (res.trim() == 'songFalse') {
					alert('없는 곡 번호입니다. 다시 입력해주세요.');
					$("#song_no").val('');
					$("#song_no").focus();
					go = false;
				}
				if(go == false) {
					return;				
				}
				
 				$("tr").each(function(i) {
 					if(go == false) {
						return;				
					}
					if ($('#img').val().trim() == "") {
						alert("유튜브 썸네일을 입력해 주세요");
						$('#img').focus();
						go = false;
					}
					if(go == false) {
						return;				
					}
					if ($('#link').val().trim() == '') {
						alert("유튜브 링크를 입력해 주세요");
						$('#link').focus();
						go = false;
					}
					if(go == false) {
						return;				
					}
				});
 				
				if(go == false) {
					return;				
				}
				
				$("#frm").submit();					
			},
			error: function(){
				if ($("#song_no").val() == '') {
					alert('곡번호를 입력해주세요.');
					$("#song_no").focus();
				}else {
					alert('곡 번호는 숫자만 입력이 가능합니다.');
					$("#song_no").val('');
				}
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
					<h2>MV - [쓰기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="insert.do" enctype="multipart/form-data">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="5%" />
									<col width="10%" />
									<col width="5%" />
									<col width="80%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" colspan="2"><label for="">*노래</label></th>
										<td colspan="10">
											<input type="text" id="song_no" name="song_no" title="곡 선택" list="songlisted"/>
												<datalist id="songlisted">
				                                    <c:forEach var="songs" items="${songList }">
														<option value="${songs.no }">${songs.title } / ${songs.artistName }</option>				
													</c:forEach>
												</datalist>
										</td>
									</tr>
									<tr style="border-top: 48px solid #fff;">
										<th scope="row" colspan="2"><label for="">*썸네일</label></th>
										<td colspan="10">
											<input type="text" id="img" name="img" class="w100" title="썸네일을 입력해주세요" >썸네일은 https://img.youtube.com/vi/유튜브링크 고유번호/mqdefault.jpg 형식으로 저장해주세요</input>
										</td>
									</tr>
									<tr>
										<th scope="row" colspan="2"><label for="">*유튜브 링크</label></th>
										<td colspan="10">
											<textarea id="link" name="link" title="링크를 입력해주세요" style="width:100%; resize:none;"></textarea>	
										</td>
									</tr>
								</tbody>
							</table>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="javascript:goIndex();"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" href="javascript:goSave();" style="cursor:pointer;"><strong>저장</strong></a>
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