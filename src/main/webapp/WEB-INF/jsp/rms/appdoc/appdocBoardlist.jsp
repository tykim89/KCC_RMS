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
<script type="text/javascript">
// function getApp_item_no(){ 
	
// 	alert(111);
// 	var noList = [];
// 	var itemStr = "";
// 	var i ;
// 	for(i=0; i< $("#listSize").val(); i++)
// 	{
// 		$("input[id=target" + i + "]").each(function() {
// 			noList.push(this.value)
// 		})	;
// 	}
	
// 	$.each(noList, function(index, item){
// 		if(noList[index] != "") {
// 			itemStr += item + "|";
// 		}
// 	}); 
	
// 	$("#target").val(itemStr);
// 	$("#userLogin").attr("action","<c:url value= './appdocBoarddetail.do'/>").submit();

	
// }
</script>
</head>
<body>
 <h1>온라인 입사지원</h1>

<form id="userLogin" name="userLogin" action="./appdocBoarddetail.do" method="post">
<%-- 	<input type="hidden" id="app_item_no" name="app_item_no" value="${list.app_item_no}"> --%>
<!-- <input type="hidden" id="app_item_no" name="app_item_no" /> -->
<%-- <input type="hidden" id="listSize" name="listSize" value="${list.size()}"/> --%>
<!-- <input type="hidden" id="target" name="target" value=""/> -->
	<table>
		<c:forEach var="list" items="${list}" varStatus="vs">
		<tr>
			<td>${list.app_item_no}</td>
			<td>${list.app_item_name}</td>
<%-- 			<td><input type="text" id="appContent" name="appContent${vs.index}"></td> --%>
<!-- 			<td><input type="text" id="appContent" name="appContent"></td> -->
			<c:choose>
				<c:when test="${list.app_item_name == '비밀번호'}">
					<td><input type="password"  id="app_item_content" name="app_item_content" ></td>
				</c:when>
				<c:otherwise>
					<td><input type="text" id="app_item_content" name="app_item_content"></td>
				</c:otherwise>
			</c:choose>
		</tr> 
<%-- 		<input type="hidden" id="target${vs.index}" name="target${vs.index}" value="${list.app_item_no}">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      --%>
		</c:forEach>
	</table>
<!-- 	<input type="button" onClick="getApp_item_no()" value="입사지원하기"> -->
<!-- 	<input type="button" onclick="getApp_item_no()" value="테스트"> -->
<input type="submit" value="입사지원">
</form>

 
</body>
</html>