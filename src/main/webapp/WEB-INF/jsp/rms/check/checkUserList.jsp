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
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/rms/cmn/base.css'/>" />
<script type="text/javaScript" language="javascript">


</script>


<form id="adminForm" name="adminForm" method="post">
	<input type="hidden" id="checkUserTarget" name="checkUserTarget" value="${checkUserTarget}">

	<table>
		<caption>검토자 등록</caption>
		<colgroup>
			<col style="width: 5%" />
			<col style="width: 10%" />
			<col style="width: 10%" />
			<col style="width: 10%" />
			<col style="width: 5%" />
			<col style="width: 10%" />
			<col style="width: 10%" />
			<col style="width: 20%" />
			<col style="width: 20%" />
			<col style="width: 10%" />

		</colgroup>
		<thead>
			<tr>
				<th scope="col"><input name="allCheckUserBtn" id="allCheckUserBtn"
				class="" type="checkbox" onchange="checkAll('allCheckUserBtn','checkerBtn')" /></th>
				<th scope="col">번호</th>
				<th scope="col">회사</th>
				<th scope="col">부서</th>
				<th scope="col">직급</th>
				<th scope="col">이름</th>
				<th scope="col">아이디</th>
				<th scope="col">이메일주소</th>
				<th scope="col">휴대폰번호</th>
				<th scope="col" class="last">내선번호</th>

			</tr>
		</thead>
		<tbody>
			<c:if test="${adminList.size() == 0}">
				<tr class="odd">
					<td colspan="10" style="text-align: center;"><spring:message
							code="info.nodata.msg" /></td>
				</tr>
			</c:if>
			<c:forEach items="${adminList}" var="i" varStatus="st">
				<c:choose>
					<c:when test="${st.index % 2 == 1}">
						<c:set var="rowClass" value="odd"/>
					</c:when>
					<c:otherwise>
						<c:set var="rowClass" value="even"/>
					</c:otherwise>
				</c:choose>
				<tr class="${rowClass }" style="cursor: pointer; curosr: hand;" onclick="loadCheckUser('${i.admin_id}')">
					<td><input type="checkbox" id="checkerBtn" name="checkerBtn" value="${i.admin_id}"></td>
					<td><c:out value="${st.index + 1}"></c:out></td>
					<td>${i.company_name }</td>
					<td>${i.dep_name }</td>
					<td>${i.detail_code_name}</td>
					<td value="${i.admin_id}"><c:out value="${i.admin_name}"></c:out></td>
					<td>${i.admin_id}</td>
					<td>${i.admin_email_addr }</td>
					<td>${i.admin_phone_num}</td>
					<td>${i.admin_tel_num}</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>
</form>