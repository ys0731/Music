<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	$(function(){
	    $(".listbox1").click(function(){
	    	if (!$(this).children("input[type='checkbox']").is(':checked')){
		    	$(this).children("input[type='checkbox']").prop("checked", true);
	    	} else {
		    	$(this).children("input[type='checkbox']").prop("checked", false);
	    	}
	    });
	    
	    $(".listbox2").click(function(){
	    	if (!$(this).children("input[type='checkbox']").is(':checked')){
		    	$(this).children("input[type='checkbox']").prop("checked", true);
	    	} else {
		    	$(this).children("input[type='checkbox']").prop("checked", false);
	    	}
	    });
	});
	
	function checklist() {
		if($("input[type='checkbox'][name='num1']:checked").length != 4) {
			alert('오늘 리스트에서 4개를 선택해주세요.');
			return;
		}
		
		if($("input[type='checkbox'][name='num2']:checked").length != 4) {
			alert('태그 리스트에서 4개를 선택해주세요.');
			return;
		}

    	var chkArr1 = new Array();
    	var chkArr2 = new Array();
		
    	$("input[type='checkbox'][name='num1']:checked").each(function(){
			chkArr1.push($(this).attr("data-Num"));
		});
    	
    	$("input[type='checkbox'][name='num2']:checked").each(function(){
			chkArr2.push($(this).attr("data-Num"));
		});
    	
        $.ajax({
	        url: 'sendtwolist.do',
	        type: 'post',
	        traditional: true,
	        data: {
	        	chkArr1: chkArr1,	
	        	chkArr2: chkArr2	
	        },
	        success : function(res){
	        	alert("선택된 리스트가 추가되었습니다.");
	        	location.href='index.do';
	        },
		    error : function(res){
		    	alert("리스트 선택이 부적절합니다.");
		    }
        });
	}
	
	function isEd() {
		var chkArr = new Array();
		
		$('input:checkbox[name="num1"]:checked').each(function(){
			chkArr.push($(this).attr("data-Num"));
		});
		$('input:checkbox[name="num2"]:checked').each(function(){
			chkArr.push($(this).attr("data-Num"));
		});
		
		if (chkArr.length > 1) {
			alert('하나의 리스트만 선택해주세요.');
			return;
		} else if (chkArr.length == 0) {
			alert('수정할 리스트를 선택해주세요.');
			return;
		}
		
		var checked = chkArr[0];
		
		location.href='edit.do?no='+checked;
	}
	
	function isDel() {
		if (confirm("삭제하시겠습니까?")) {
			var chkArr = new Array();
			
			$('input:checkbox[name="num1"]:checked').each(function(){
				chkArr.push($(this).attr("data-Num"));
			});
			$('input:checkbox[name="num2"]:checked').each(function(){
				chkArr.push($(this).attr("data-Num"));
			});
			
			if (chkArr.length == 0) {
				alert('선택된 리스트가 없습니다.');
				return;
			}
			
			$.ajax({
				url: 'delete.do',
				method: 'post',
				data: {
					chkArr : chkArr.toString()
				},
				success: function(res) {
       				if (res.trim() == 'failed') {
       					alert('삭제를 실패하였습니다.')
       				} else {
						alert('총 ' + res.trim() +'건이 삭제되었습니다.');
						location.href='index.do';
       				}
				}
			});
		}
	}
</script>
<div style="float: left; width: 66.666666%; content: ''; display: block; clear: both;">
	<div id="todayList" style="float: left; width: 49%; height: 600px; margin: 0 0.5%; border: 1px solid #cccdd0; box-sizing: border-box; overflow: auto;">
		<div style="line-height: 48px; background-color: #ccced0; text-align: center; color: #fff;">
			<strong style="font-weight: bold;">오늘 리스트</strong>
		</div>
		<c:forEach var="vo" items="${todayList }" varStatus="status">
			<div class="listbox1" style="line-height: 48px; padding: 0px 10px; border: 1px solid #eee; box-sizing: border-box; background-color: #fff; cursor: pointer;">
				<input type="checkbox" name="num1" data-num="${vo.no }">
			    <span></span>
			    <span>(${vo.title }/${vo.sub_title })</span>
			</div>
		</c:forEach>
	</div>
	<div id="tagList" style="float: left; width: 49%; height: 600px; margin: 0 0.5%; border: 1px solid #cccdd0; box-sizing: border-box; overflow: auto;">
		<div style="line-height: 48px; background-color: #ccced0; text-align: center; color: #fff;">
			<strong style="font-weight: bold;">태그 리스트</strong>
		</div>
		<c:forEach var="vo" items="${tagList }" varStatus="status">
			<div class="listbox2" style="line-height: 48px; padding: 0px 10px; border: 1px solid #eee; box-sizing: border-box; background-color: #fff; cursor: pointer;">
				<input type="checkbox" name="num2" data-num="${vo.no }">
			    <span></span>
			    <span>(${vo.title }/${vo.sub_title })</span>
			</div>
		</c:forEach>
	</div>
	<div style="margin-top: 620px; margin-right: 6px;">
		<a class="btns" style="float: right;" href="javascript:isDel();"><strong>삭제</strong></a>
		<a class="btns" style="float: right;" href="javascript:isEd();"><strong>수정</strong></a>
		<a class="btns" style="float: right;" href="javascript:checklist();"><strong>추가</strong></a>
	</div>
</div>