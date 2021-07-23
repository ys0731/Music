<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
	$(function() {
		$("#addHtml").click(function(event){
			event.preventDefault();
			var html = '';
			html += '';
			html += '	<tr class="remove_row">';
			html += '		<td rowspan="5" style="text-align: center;">';
			html += '			<a class="x_btn" style="cursor: pointer;">[X]</a>';
			html += '		</td>';
			html += '	</tr>';
			html += '	<tr class="remove_row">';
			html += '		<th scope="row"><label for="">*노래제목</label></th>';
			html += '		<td colspan="10">';
			html += '			<input type="text" name="title" class="w100" title="노래제목을 입력해주세요" autocomplete="off"/>';	
			html += '		</td>';
			html += '	</tr>';
			html += '	<tr class="remove_row">';
			html += '		<th scope="row"><label for="">*장르</label></th>';
			html += '		<td colspan="10">';
			html += '			<select name="genre" title="장르분류 선택">';
			html += '                <option value="1">가요</option>';
			html += '                 <option value="2">팝</option>';
			html += '                <option value="3">재즈</option>';
			html += '                <option value="4" selected="selected">클래식</option>';
			html += '            </select>';
			html += '		</td>';
			html += '	</tr>';
			html += '	<tr class="remove_row">';
			html += '		<th scope="row"><label for="">*가사</label></th>';
			html += '		<td colspan="10">';
			html += '			<textarea name="lyrics" title="가사를 입력해주세요" style="width:100%; resize:none;"></textarea>';	
			html += '		</td>';
			html += '	</tr>';
			html += '	<tr class="remove_row">';
			html += '		<th scope="row"><label for="">*음원파일</label></th>';
			html += '		<td colspan="10">';
			html += '			<input style="display: block;" type="file" name="file" class="w100" title="음원파일을 업로드 해주세요." accept="audio/*"/>';	
			html += '		</td>';
			html += '	</tr>';
			
			$("#frm table tbody").append(html);

			$(".x_btn").off("click");
			$(".x_btn").click(function(){
				var idx = $(".x_btn").index(this);
				for (var i = 0; i < 5; i++) {
					$(".remove_row").eq(idx*5).remove();
				}
			});
		});
		
	});

	function goIndex() {
		location.href = 'index.do';
	}
	
	function goSave() {
		
		var go = true;
		
		$.ajax({
			url: 'write.do',
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
					go = false;
				} else if (res.trim() == 'albumFalse') {
					alert('없는 앨범번호 입니다. 다시 입력해주세요.');
					$("#album_no").val('');
					$("#album_no").focus();
					go = false;
				} else if (res.trim() == 'artistFalse') {
					alert('없는 아티스트번호입니다. 다시 입력해주세요.');
					$("#artist_no").val('');
					$("#artist_no").focus();
					go = false;
				}
				if(go == false) {
					return;				
				}
				
 				$("tr").each(function(i) {
 					if(go == false) {
						return;				
					}
					if ($("input[name='title']").eq(i).val() == '') {
						alert((i+1)+"행의 노래제목을 입력해 주세요");
						$("input[name='title']").eq(i).focus();
						go = false;
					}
					if(go == false) {
						return;				
					}
					if ($("textarea[name='lyrics']").eq(i).val() == '') {
						alert((i+1)+"행의 가사를 입력해 주세요");
						$("textarea[name='lyrics']").eq(i).focus();
						go = false;
					}
					if(go == false) {
						return;				
					}
					if ($("input[name='file']").eq(i).val() == '') {
						alert((i+1)+"행의 음원파일을 입력해 주세요");
						$("input[name='file']").eq(i).focus();
						go = false;
					}
				});
 				
				if(go == false) {
					return;				
				}
				
				$("#frm").submit();					
			},
			error: function(){
				if ($("#album_no").val() == '') {
					alert('앨범번호를 입력해주세요.');
					$("#album_no").focus();
				} else if ($("#artist_no").val() == '') {
					alert('아티스트번호를 입력해주세요.');
					$("#artist_no").focus();
				} else {
					alert('앨범번호와 아티스트번호는 숫자만 입력이 가능합니다.');
					$("#album_no").val('');
					$("#artist_no").val('');
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
					<h2>노래 - [쓰기]</h2>
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
										<th scope="row" colspan="2"><label for="">*앨범</label></th>
										<td colspan="10">
											<input type="text" id="album_no" name="album_no" title="앨범 선택" list="albumlisted" autocomplete="off"/>
												<datalist id="albumlisted">
				                                    <c:forEach var="albums" items="${albumList }">
														<option value="${albums.no }">${albums.album }</option>				
													</c:forEach>
												</datalist>
										</td>
									</tr>
									<tr>
										<th scope="row" colspan="2"><label for="">*아티스트</label></th>
										<td colspan="10">
			                            	<input type="text" id="artist_no" name="artist_no" title="아티스트 선택" list="artistlisted" autocomplete="off"/>
												<datalist id="artistlisted">
				                                    <c:forEach var="artists" items="${artistList }">
														<option value="${artists.no }">${artists.artist }</option>				
													</c:forEach>
												</datalist>
										</td>
									</tr>
									<tr style="border-top: 48px solid #fff;">
										<th scope="row" colspan="2"><label for="">*노래제목</label></th>
										<td colspan="10">
											<input type="text" id="title" name="title" class="w100" title="노래제목을 입력해주세요" autocomplete="off"/>	
										</td>
									</tr>
									<tr>
										<th scope="row" colspan="2"><label for="">*장르</label></th>
										<td colspan="10">
											<select id="genre" name="genre" title="장르분류 선택">
			                                    <option value="1">가요</option>
			                                    <option value="2">팝</option>
			                                    <option value="3">재즈</option>
			                                    <option value="4" selected="selected">클래식</option>
			                                </select>
										</td>
									</tr>
									<tr>
										<th scope="row" colspan="2"><label for="">*가사</label></th>
										<td colspan="10">
											<textarea id="lyrics" name="lyrics" title="가사를 입력해주세요" style="width:100%; resize:none;"></textarea>	
										</td>
									</tr>
									<tr>
										<th scope="row" colspan="2"><label for="">*음원파일</label></th>
										<td colspan="10">
											<input style="display: block;" type="file" id="file" name="file" class="w100" title="음원파일을 업로드 해주세요." accept="audio/*"/>	
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
								<div class="btnRight">
									<a id="addHtml" class="btns" href="#" style="cursor:pointer;"><strong>추가</strong></a>
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