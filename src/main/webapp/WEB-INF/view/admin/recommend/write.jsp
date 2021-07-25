<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
	$(function(){
		// list.jsp
		getList(1,'','','','');
		
		// session validate
		/* if(sessionStorage.getItem("songlist") != 'null') {
			if(!confirm('이전에 작업하던 내용을 불러오시겠습니까?')) {
				sessionStorage.removeItem("songlist");			
			}
		} */
		
		// sortable
	    $("#sortable").sortable();
	    $("#sortable").disableSelection();
	    
	    $("#sortable > div").click(function(){
	    	if (!$(this).children("input[type='checkbox']").is(':checked')){
		    	$(this).children("input[type='checkbox']").prop("checked", true);
	    	} else {
		    	$(this).children("input[type='checkbox']").prop("checked", false);
	    	}
	    });
	    
	    // reorder, mouseup does not work --> mouseout
	    $("#sortable").mousedown(function(){
		    for (var i = 0; i < $("#sortable > div").length; i++) {
		    	$(this).children("div").eq(i).children("span:nth-child(2)").text(i+1);
			}
	    }).mouseout(function(){
	    	for (var i = 0; i < $("#sortable > div").length; i++) {
		    	$(this).children("div").eq(i).children("span:nth-child(2)").text(i+1);
			}
	    });
	    
	    if ($("#sortable > div").length > 0) {
			document.getElementById('file').disabled = false;
			document.getElementById('group_id').disabled = false;
			document.getElementById('title').disabled = false;
			document.getElementById('sub_title').disabled = false;
		} else {
			$("#file").parent().click(function(){alert('리스트를 먼저 추가해주세요.');});
			$("#title").parent().click(function(){alert('리스트를 먼저 추가해주세요.');});
			$("#sub_title").parent().click(function(){alert('리스트를 먼저 추가해주세요.');});
		}
	});
	
	function getList(reqPage, stype, sval, orderby, direct) {
		$.ajax({
			url: '<%=request.getContextPath()%>/admin/recommend/list.do',
			data: {
				reqPage: reqPage,
				stype: stype,
				sval: sval,
				orderby: orderby,
				direct: direct
			},
			success: function(res) {
				$("#bbs").html(res);
			}
		});
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
	
	function removeList() {
		$("input[type='checkbox'][name='songListCheck']:checked").parent().remove();
	}
	
	function goSave() {
		if ($("#file").val() == '') {
			alert('대표이미지를 입력해주세요.');
			return;
		} else if ($("#title").val() == '') {
			alert('제목/태그를 입력해주세요.');
			return;
		} else if ($("#sub_title").val() == '') {
			alert('부제목을 입력해주세요.');
			return;
		} else if ($("#sortable > div").length < 1) {
			alert('리스트를 구성할 노래를 입력해주세요.');
			return;
		}
		
		$("#frm").submit();
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
					<h2>추천음악 - [쓰기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs" style="width: 50%; float: left;">

					</div>
					<!-- //bbs -->
					<div style="width: 50%; float: left; padding: 29px; box-sizing: border-box;">
						<form method="post" name="frm" id="frm" action="insert.do" enctype="multipart/form-data">
							<div style="width: 100%; height: 690px;">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" style="border-top: #4a4b4f 2px solid;">
									<colgroup>
										<col style="width: 200px" />
										<col />
									</colgroup>
									<thead style="border-bottom: 1px solid #cccdd0;">
										<tr style="height: 52px; background-color: #eeeff0; font-size: 12px;">
											<th style="border-right: 1px solid #cccdd0;">대표이미지</th>
											<th>작성내용</th>
										</tr>
									</thead>
									<tbody>
										<tr style="font-size: 11px; border-bottom: 1px solid #cccdd0;">
											<th rowspan="2" style="height: 200px; border-right: 1px solid #cccdd0;">
												<div style="width: 150px; margin-left: 20px; border: 5px double #ccc; cursor: pointer;" onclick="document.getElementById('file').click();">
													<img id="preview" style="width: 150px; height: 150px;" >
												</div>
												<input type="file" id="file" name="file" style="display: none" title="이미지를 업로드 해주세요." onchange="readURL(this);" accept="image/gif,image/jpeg,image/png" disabled="disabled">
											</th>
											<th style="height: 50px; border-bottom: 1px solid #cccdd0;">
												<select id="group_id" name="group_id" style="width: 7%; height: 20px;" disabled="disabled">
													<option value="1" selected="selected">제목</option>
													<option value="2">태그</option>
												</select>
												<input type="text" id="title" name="title" class="w100" title="[제목 / #태그]를 입력해주세요" style="width: 87.333333%;" placeholder="[제목 / #태그]를 입력해주세요" maxlength="14" autocomplete="off" disabled="disabled"/>
											</th>
										</tr>
										<tr style="font-size: 11px; border-bottom: 1px solid #cccdd0;">
											<th style="height: 150px; border-bottom: 1px solid #cccdd0;">
												<textarea id="sub_title" name="sub_title" title="부제목을 입력해주세요" style="width:95%; height:120px; resize:none; padding: 5px;" placeholder="부제목을 입력해주세요" maxlength="11" disabled="disabled"></textarea>
											</th>
										</tr>
									</tbody>
								</table>
								<div id="sortable" style="width: 100%; height: 350px; margin-top: 50px; border: 1px solid #cccdd0; overflow: auto;">
									<c:forEach var="vo" items="${songlist }" varStatus="status">
										<div style="line-height: 33px; padding: 0px 10px; border: 1px solid #eee; background-color: #fff; cursor: pointer;">
											<input type="checkbox" name="songListCheck">
										    <span>${status.count }</span>
										    <span>(${vo.title })</span>
										    <input type="hidden" name="song_no" value="${vo.no }">
										</div>
									</c:forEach>
								</div>
								<div style="content: ''; display: block; clear: both;">
									<a class="btns" onclick="javascript:removeList();" href="#" style="float: right; display: block; margin-top: 15px; width: 60px; line-height: 25px; text-align: center;"><strong>선택제거</strong> </a>
									<a class="btns" href="removelist.do" style="float: right; display: block; margin-top: 15px; margin-right: 10px; width: 60px; line-height: 25px; text-align: center;"><strong>초기화</strong> </a>
									<a class="btns" onclick="goSave();" style="float: right; display: block; margin-top: 15px; margin-right: 10px; width: 60px; line-height: 25px; text-align: center; cursor: pointer;"><strong>등록</strong> </a>
								</div>
							</div>
						</form>
					</div>
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