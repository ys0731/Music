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
		if ($('#album').val().trim() == "") {
			alert("앨범명을 입력해 주세요.");
			$("#album").focus();
			return false;
		}
		if ($('#reldate').val().trim() == "") {
			alert("발매일을 입력해 주세요.");
			$("#reldate").focus();
			return false;
		}
		if ($('#info').val().trim() == "") {
			alert("앨범정보를 입력해 주세요.");
			$("#info").focus();
			return false;
		}
		if ($('#file').val().trim() == "") {
			alert("앨범커버를 입력해 주세요.");
			$("#file").focus();
			return false;
		}
		$("#frm").submit();
	}
	
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById('preview').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		} else {
			document.getElementById('preview').src = "";
		}
	}
	
    function isNumberKey(event){
        var charCode = (event.which) ? event.which : event.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
        return true;
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
					<h2>앨범 - [쓰기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="insert.do" enctype="multipart/form-data">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="15%" />
									<col width="85%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">*앨범명</label></th>
										<td colspan="10">
											<input type="text" id="album" name="album" class="w100" title="앨범명을 입력해주세요" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*장르</label></th>
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
										<th scope="row"><label for="">*발매일</label></th>
										<td colspan="10">
											<input type="text" id="reldate" name="reldate" class="w100" title="발매일을 입력해주세요" placeholder="ex) 19970112" maxlength="8" onkeypress="return isNumberKey(event)" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*앨범정보</label></th>
										<td colspan="10">
											<textarea id="info" name="info" title="내용을 입력해주세요" style="width:100%; resize:none;"></textarea>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*앨범커버</label></th>
										<td colspan="10">
											<div style="width: 100px; border: 5px double #ccc; margin-bottom: 10px;">
												<img id="preview" style="width: 100px; height: 100px;">
											</div>
											<input style="display: block;" type="file" id="file" name="file" class="w100" title="이미지를 업로드 해주세요." onchange="readURL(this);" accept="image/gif,image/jpeg,image/png"/>	
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