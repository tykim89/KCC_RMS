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
<title>채용관리시스템</title>
<meta name="keyword" content="">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />

<link rel="stylesheet" href="<c:url value='/css/rms/cmn/base.css'/>"
	type="text/css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="./Common/js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script type="text/javaScript" language="javascript">
	
</script>
</head>
<div class="listType4" id="holdRankingListDIV">
	<table>
		<caption></caption>
		<colgroup>
			<col style="width: 10%" />
			<col style="width: *%" />
			<col style="width: *%" />
			<col style="width: *%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col"><input name="holdRankingAll" id="holdRankingAll" class="" type="checkbox" onclick="checkAll('holdRankingAll','holdRankingbtn');"/></th>
				<th scope="col">보류순위</th>
				<th scope="col">지원자이름</th>
				<th scope="col" class="last">생년월일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="hList" items="${holdrankingList}" varStatus="st">
				
				<c:choose>
					<c:when test="${st.index %2 ==0 }">
						<c:set var="rowClass" value="odd" />
					</c:when>
					<c:otherwise>
						<c:set var="rowClass" value="even" />
					</c:otherwise>
				</c:choose>
				<tr class="${rowClass }" onclick="setSelectedAppUser('${hList.app_user_no }');" id="${hList.app_user_no }">
					<input name="hiddenAppUserNo" type="hidden" value="${hList.app_user_no }"/> 
					<td><input name="holdRankingbtn" id="holdRankingbtn" class="" type="checkbox" value="${hList.app_user_no }"/></td>
					<td class="num">${hList.hold_ranking }</td>
					<td>${hList.app_user_name }</td>
					<td class="num last"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</html>