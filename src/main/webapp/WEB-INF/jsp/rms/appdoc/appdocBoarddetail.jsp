<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채용관리시스템</title>
<meta name="keyword" content="">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="./Common/js/jquery-1.7.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	  $( "#birth" ).datepicker({
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년'
	  });
	});

	$(document).ready(function() {
			$("#appdocSubmit").click(function() {
				
						if(confirm('<spring:message code="common.appdocsave.msg" />')){
						$("#appDoc").attr("action","<c:url value='./appdocInsert.do'/>").submit();			

					}
				})
		})
		
	$(document).ready(function() {
		$("#gotoback").click(function() {	
					$("#appDoc").attr("action","<c:url value='/rms/recNotice/userNoticeList.do'/>").submit();			
			})
	})
	
	// 선택된 type에 따른 content Ajax로 조회
	function getBranchList1(){
	
	$.post("<c:url value='/rms/appdoc/wishBranchList1.do'/>", $("#appDoc").serialize(), function (html)
	{
		$("#branch_name1").html(html);
	});
	
	}
	
	// 선택된 type에 따른 content Ajax로 조회
	function getBranchList2(){
	
	$.post("<c:url value='/rms/appdoc/wishBranchList2.do'/>", $("#appDoc").serialize(), function (html)
	{
		$("#branch_name2").html(html);
	});
	
	}
	
	
	
	// 사진 미리보기
	function previewImage(targetObj, previewId) {

	    var preview = document.getElementById(previewId); //div id 
	    var ua = window.navigator.userAgent;

	    if (ua.indexOf("MSIE") > -1) {//ie일때

	        targetObj.select();

	        try {
	            var src = document.selection.createRange().text; // get file full path 
	            var ie_preview_error = document.getElementById("ie_preview_error_" + previewId);

	            if (ie_preview_error) {
	                preview.removeChild(ie_preview_error); //error가 있으면 delete
	            }

	            var img = document.getElementById(previewId); //이미지가 뿌려질 곳 

	            // 이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
	            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+ src + "', sizingMethod='scale')"; 
	           
	        } catch (e) {
	            if (!document.getElementById("ie_preview_error_" + previewId)) {
	                var info = document.createElement("<p>");
	                info.id = "ie_preview_error_" + previewId;
	                info.innerHTML = "a";
	                preview.insertBefore(info, null);
	            }
	        }
	    } else { //ie가 아닐때
	        var files = targetObj.files;
	        for ( var i = 0; i < files.length; i++) {

	            var file = files[i];

	            var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
	            if (!file.type.match(imageType))
	                continue;

	            var prevImg = document.getElementById("prev_" + previewId); //이전에 미리보기가 있다면 삭제
	            if (prevImg) {
	                preview.removeChild(prevImg);
	            }

	            var img = document.createElement("img"); //크롬은 div에 이미지가 뿌려지지 않는다. 그래서 자식Element를 만든다.
	            img.id = "prev_" + previewId;
	            img.classList.add("obj");
	            img.file = file;
	            img.style.width = '145px'; //기본설정된 div의 안에 뿌려지는 효과를 주기 위해서 div크기와 같은 크기를 지정해준다.
	            img.style.height = '190px';
	            
	            preview.appendChild(img);

	            if (window.FileReader) { // FireFox, Chrome, Opera 확인.
	                var reader = new FileReader();
	                reader.onloadend = (function(aImg) {
	                    return function(e) {
	                        aImg.src = e.target.result;
	                    };
	                })(img);
	                reader.readAsDataURL(file);
	            } else { // safari is not supported FileReader
	                //alert('not supported FileReader');
	                if (!document.getElementById("sfr_preview_error_"+ previewId)) {
	                    var info = document.createElement("p");
	                    info.id = "sfr_preview_error_" + previewId;
	                    info.innerHTML = "not supported FileReader";
	                    preview.insertBefore(info, null);
	                }
	            }
	        }
	    }
	}
	

</script>
</head>
<body>
<h1>입사지원서 작성</h1>

<form id="appDoc" name="appDoc" action="./appdocInsert.do" method="post" enctype="multipart/form-data">
<input type="hidden" id="rec_noti_no" name="rec_noti_no" value="${rec_noti_no}">
<input type="hidden" id="app_user_no" name="app_user_no" value="${app_user_no}">
<input type="hidden" id="branch_no" name="branch_no" value="${branch_no}">

	
	<table border="1">
			<tr>
			<td>	1지망</td>
			<td>
					<select id="typeSelect1" name="typeSelect1" onclick="getBranchList1()"  style="width: 100px;">
							<c:forEach var="branch" items="${branch}" varStatus="vs">
							<option value="<c:out value="${branch.company_name}"/>">${branch.company_name}</option>
							</c:forEach>
					</select>
			</td>
			<td>
					<select id="branch_name1" name="branch_name1" style="width: 80px;">
					<option>선&nbsp;&nbsp;택</option>						 
					</select>
			</td>
		</tr>
		<tr>
			<td>2지망</td>
			<td>
					<select id="typeSelect2" name="typeSelect2" onclick="getBranchList2()"  style="width: 100px;">
							<c:forEach var="branch" items="${branch}" varStatus="vs">
							<option value="<c:out value="${branch.company_name}"/>">${branch.company_name}</option>
							</c:forEach>
					</select>
			</td>
			<td>
					<select id="branch_name2" name="branch_name2" style="width: 80px;">
					<option>선&nbsp;&nbsp;택</option>						 
					</select>
			</td>
		</tr>	
	</table>
	
	<input type="file" id="imageFile" name="imageFile" onchange="previewImage(this,'previewId')">
	<div id='previewId' name="previewId" style='width: 145px; height: 190px;  border: 1px solid black;'>
	</div>

	<table border="1">	
			<tr>
					<td>한글성명</td>
					<td><input type="text" value="${app_user_name}" readonly="readonly"></td>
			</tr>
		<c:forEach var="list" items="${list}" varStatus="vs">
			<input type="hidden" id="app_list_code" name="app_list_code" value="${list.app_list_code}">
			<input type="hidden" id="app_item_no" name="app_item_no" value="${list.app_item_no}">
			<tr>
<%-- 						<td>${list.app_item_no}</td>	 --%>
						<td>${list.app_item_name}</td>

				<c:choose>
					<c:when test="${list.app_item_name == '생년월일'}">
						<td><input type="text" id="birth" name="app_item_content"></td>
					</c:when>
					<c:when test="${list.app_item_name == '대학구분'}">
						<td>
							<select id="uiv_div" name="app_item_content">
								<option value="전문대학">전문대학</option>
								<option value="대학">대학</option>
								<option value="대학원">대학원</option>
							</select>
						</td>
					</c:when>				
					<c:otherwise>
						<td><input type="text" id="app_item_content" name="app_item_content"></td>						
					</c:otherwise>
				</c:choose>
			</tr>                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
		</c:forEach>
	</table>
	<input type="button" id="appdocSubmit" name="appdocSubmit" value="입사지원">
	<input type="button" id="gotoback" name="gotoback" value="취소">
</form>
</body>
</html>