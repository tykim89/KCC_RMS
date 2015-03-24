<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q&A Email 수신자 관리</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">

	// 수신자 목록 전체 체크
	function checkAll(bool){

		var doc = document.getElementsByName("fieldCheckBtn");
		for ( var i = 0; i < doc.length; i++) {
			doc[i].checked = bool;

		}
	}
	
// 	function taker(){
// 		document.qnaTakerBoard.action="./qnaTakerUpdate.do";
// 		document.qnaTakerBoard.submit();
// 	}
	
// 	function nontaker(){
// 		document.qnaTakerBoard.action="./nonqanTakerUpdate.do";
// 		document.qnaTakerBoard.submit();
// 	}
	
	//수신자 목록 체크된 값 | 구분자로 연결하여 리턴
	function getCheckedValue() {
		alert(222);
		var idList = [];
		var itemStr = "";
		alert(333);

		$("input[id=fieldCheckBtn]:checked").each(function() {
			idList.push(this.value)
		});

		alert(444);

		$.each(idList, function(index, item) {
			itemStr += item + "|"
		});
		
		alert(555);

		return itemStr;
		
	}
	
	//수신자 목록 체크된 값 수신자로 넘기기

	function taker() {
		alert(1111);
		var checkedValueId = getCheckedValue();
		
		alert(666);

		if (checkedValueId == "") {
			alert('<spring:message code = "common.alert.noSelect"/>');
			
		} else {

			$('#selectTarget').val(checkedValueId);
			$("#searchForm").attr("action",
					"<c:url value='/rms/qna/qnaTaker/qnaTakerUpdate.do'/>").submit();
		}
		alert(222);
	}
	
	// 수신자 목록 체크된 값 비수신자로 넘기기
	
	function nontaker() {
		
		alert(777);
		var checkedValueId = getCheckedValue();
		if (checkedValueId == "") {
			alert('<spring:message code = "common.alert.noSelect"/>');
		} else {
			alert(888);

			$('#selectTarget').val(checkedValueId);
			
			alert(999);
			$("#searchForm").attr("action",
					"<c:url value='/rms/qna/qnaTaker/nonqanTakerUpdate.do'/>").submit();
		}
	}
	
	
	
	

</script>
</head>
<body>
<h1>수신자 관리 목록</h1>

<form action="./qnaTakerBoardlist.do">
	<select name="searchKey">
		<option value="admin_name">이름</option>
		<option value="dept">부서</option>
		<option value="auth_name">권한</option>
	</select>
	<input type="text" name="searchValue">
	<input type="submit" value="검색">
</form>

<form action="" id="searchForm" name="searchForm" method="post">
<input type="hidden" id="selectTarget" name="selectTarget" value="">
<table border="1">
		<tr>
			<th><input type="checkbox" name="checkAllSEL" onclick="checkAll(this.checked)"></th>
			<td>번호</td>
			<td>아이디</td>
			<td>이름</td>
			<td>직급</td>
			<td>부서</td>
			<td>권한</td>
			<td>Email수신여부</td>
		</tr>
		
		<c:set var="j" value="1" />
		<c:forEach var="list" items="${list}" varStatus="st">
			<tr>
				<td><input type="checkbox" id="fieldCheckBtn" name="fieldCheckBtn${st.index}"
				value="${list.admin_id}"></td>				
				<td>${j} <c:set var="j" value="${j+1}" /></td>
				<td>${list.admin_id}</td>
				<td>${list.admin_name}</td>
				<td>${list.detail_code_name}</td>
				<td>${list.dep_name}</td>
				<td>${list.auth_name}</td>
				<td>${list.email_tf}</td>
			</tr>
		</c:forEach>
	</table>
	
<input type="button" value="수신" onclick="taker()">
<input type="button" value="비수신" onclick="nontaker()">
</form>

</body>
</html>