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
		if ($('#artist').val().trim() == "") {
			alert("아티스트명을 입력해 주세요.");
			$("#arist").focus();
			return false;
		}
		if ($('#debdate').val().trim() == "") {
			alert("데뷔일을 입력해 주세요.");
			$("#debdate").focus();
			return false;
		}
		if ($('#debdate').val().trim().toString().length != 8) {
			alert("올바른 형식으로 데뷔일을 입력해 주세요.");
			$("#reldate").focus();
			return false;
		}
		if ($('#info').val().trim() == "") {
			alert("아티스트정보를 입력해 주세요.");
			$("#info").focus();
			return false;
		}
		if ($('#file').val().trim() == "") {
			alert("아티스트이미지를 입력해 주세요.");
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
					<h2>아티스트 - [쓰기]</h2>
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
										<th scope="row"><label for="">*아티스트명</label></th>
										<td colspan="10">
											<input type="text" id="artist" name="artist" class="w100" title="아티스트명을 입력해주세요" autocomplete="off"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*데뷔일</label></th>
										<td colspan="10">
											<input type="text" id="debdate" name="debdate" class="w100" title="데뷔일을 입력해주세요" placeholder="ex) 19970112" maxlength="8" onkeypress="return isNumberKey(event)" autocomplete="off"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*아티스트정보</label></th>
										<td colspan="10">
											<textarea id="info" name="info" title="내용을 입력해주세요" style="width:100%; resize:none;" maxlength="316"></textarea>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*아티스트이미지</label></th>
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