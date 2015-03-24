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

$(document).ready(function() {
	$("#appdocSubmit").click(function() {
		
				if(confirm('<spring:message code="common.appdocsave.msg" />')){
				$("#appDoc").attr("action","<c:url value='/rms/appdoc/appdocUpdate.do'/>").submit();			

			}
		})
})

$(document).ready(function() {
$("#gotoback").click(function() {	
			$("#appDoc").attr("action","<c:url value='/rms/recNotice/userNoticeList.do'/>").submit();			
	})
})
</script>
</head>
<body>
기존에 작성중이었던 지원자
지원서 계속 작성 TEST page
<br>
<br>

<form id="appDoc" name="appDoc" method="post">
<input type="hidden" id="rec_noti_no" name="rec_noti_no" value="${rec_noti_no}">
<input type="hidden" id="app_user_no" name="app_user_no" value="${app_user_no}">
	<table border="1">
	
<!-- 		<tr> -->
<%-- 			<td>${rec_noti_no}</td> --%>
<%-- 			<td>${app_user_no}</td> --%>
<!-- 		</tr> -->
		<tr>
			<td style="width: 100px;">한글성명</td>
			<td><input type="text" value="${name}" readonly="readonly"></td>
		</tr>
	
	
<!-- 	가로로 뽑아보자 -->
<!-- 			<tr> -->
<%-- 		<c:forEach var="list" items="${list}" varStatus="vs"> --%>
<%--   				<td>${list.app_item_content_no}</td> --%> 
<%--  				<td>${list.app_item_name}</td>					  --%>

<%-- 				<c:choose> --%>
<%-- 					<c:when test="${list.app_item_name == '한글성명'}"> --%>
<%-- 						<td><input type="text" value="${list.app_item_content}" readonly="readonly"></td>				 --%>
<%-- 					</c:when> --%>
<%-- 					<c:when test="${list.app_item_name == '대학구분'}"> --%>
<!-- 						<td> -->
<!-- 							<select> -->
<!-- 								<option>전문대학</option> -->
<!-- 								<option>대학</option> -->
<!-- 								<option>대학원</option> -->
<!-- 							</select> -->
<!-- 						</td> -->
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<%-- 						<td><input type="text" value="${list.app_item_content}"></td> --%>
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose>						  --%>
<%--  		</c:forEach> --%>
<!-- 			</tr> -->
			
			
			
			
			
<!-- 		세로로 뽑아보자 	 -->
		<c:forEach var="list" items="${list}" varStatus="vs">
		<input type="hidden" id="app_item_no" name="app_item_no" value="${list.app_item_no}">
			<tr>
<%--  				<td>${list.app_item_content_no}</td> --%>
 				<td>${list.app_item_name}</td>					 

				<c:choose>
					<c:when test="${list.app_item_name == '대학구분'}">
						<td>
							<select id="uiv_div" name="app_item_content">
								<option>전문대학</option>
								<option>대학</option>
								<option>대학원</option>
							</select>
						</td>
					</c:when>
					<c:otherwise>
						<td><input type="text" value="${list.app_item_content}" id="app_item_content" name="app_item_content"></td>
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