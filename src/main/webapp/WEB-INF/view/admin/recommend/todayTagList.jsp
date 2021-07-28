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
			alert('���� ����Ʈ���� 4���� �������ּ���.');
			return;
		}
		
		if($("input[type='checkbox'][name='num2']:checked").length != 4) {
			alert('�±� ����Ʈ���� 4���� �������ּ���.');
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
	        	alert("���õ� ����Ʈ�� �߰��Ǿ����ϴ�.");
	        	location.href='index.do';
	        },
		    error : function(res){
		    	alert("����Ʈ ������ �������մϴ�.");
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
			alert('�ϳ��� ����Ʈ�� �������ּ���.');
			return;
		} else if (chkArr.length == 0) {
			alert('������ ����Ʈ�� �������ּ���.');
			return;
		}
		
		var checked = chkArr[0];
		
		location.href='edit.do?no='+checked;
	}
	
	function isDel() {
		if (confirm("�����Ͻðڽ��ϱ�?")) {
			var chkArr = new Array();
			
			$('input:checkbox[name="num1"]:checked').each(function(){
				chkArr.push($(this).attr("data-Num"));
			});
			$('input:checkbox[name="num2"]:checked').each(function(){
				chkArr.push($(this).attr("data-Num"));
			});
			
			if (chkArr.length == 0) {
				alert('���õ� ����Ʈ�� �����ϴ�.');
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
       					alert('������ �����Ͽ����ϴ�.')
       				} else {
						alert('�� ' + res.trim() +'���� �����Ǿ����ϴ�.');
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
			<strong style="font-weight: bold;">���� ����Ʈ</strong>
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
			<strong style="font-weight: bold;">�±� ����Ʈ</strong>
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
		<a class="btns" style="float: right;" href="javascript:isDel();"><strong>����</strong></a>
		<a class="btns" style="float: right;" href="javascript:isEd();"><strong>����</strong></a>
		<a class="btns" style="float: right;" href="javascript:checklist();"><strong>�߰�</strong></a>
	</div>
</div>