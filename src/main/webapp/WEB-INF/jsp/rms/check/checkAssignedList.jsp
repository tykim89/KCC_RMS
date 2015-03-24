<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<form id="userAjaxForm" name="userAjaxForm" method="post">
	<input type="hidden" id="adminTarget1" name="adminTarget1"	value="${target}">
	<table>

		<colgroup>
			<col style="width: 15%" />
			<col style="width: 25%" />
			<col style="width: *%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">이름</th>
				<th scope="col" class="last">생년월일</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${userList.size() == 0}">
				<tr class="odd">
					<td colspan="3" style="text-align: center;"><spring:message
							code="info.nodata.msg" /></td>
				</tr>
			</c:if>
			<c:forEach items="${userList}" var="i" varStatus="st">
				<c:choose>
					<c:when test="${st.index % 2 == 1}">
						<tr class="odd">
							<td><c:out value="${st.index + 1}"></c:out></td>
							<td value="${i.app_user_no}"><c:out value="${i.app_user_name}"></c:out></td>
							<td class="last">1990/07/23</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr class="even">
							<td><c:out value="${st.index + 1}"></c:out></td>
							<td value="${i.app_user_no}"><c:out
									value="${i.app_user_name}"></c:out></td>
							<td class="last">1990/07/23</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>

		</tbody>
	</table>
</form>