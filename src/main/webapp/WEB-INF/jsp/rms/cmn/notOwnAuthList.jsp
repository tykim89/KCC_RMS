<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<table>
	<caption></caption>
	<colgroup>
		<col style="width: 5%" />
		<col style="width: 20%" />
		<col style="width: *%" />
	</colgroup>
	<thead>
		<tr>
			<th scope="col"><input name="notOwnAllCheckBtn" id="notOwnAllCheckBtn" class="" type="checkbox" onchange="checkAll('notOwnAllCheckBtn','notOwnCheckBtn')"/></th>
			<th scope="col">권한명</th>
			<th scope="col" class="last">권한설명</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${authList.size() == 0}">
			<tr class="odd">
				<td colspan="3" style="text-align: center;"><spring:message code="info.nodata.msg" /></td>
			</tr>
		</c:if>
		<c:forEach items="${authList}" var="authVO" varStatus="st">
			<tr style="cursor: pointer; curosr: hand;" onclick="">
				<td><input type="checkbox" id="notOwnCheckBtn" name="notOwnCheckBtn${st.index }" value="${authVO.auth_id}"></td>
				<td><c:out value="${authVO.auth_name}"></c:out></td>
				<td><c:out value="${authVO.auth_description}"></c:out></td>
			</tr>
		</c:forEach>
	</tbody>
</table>