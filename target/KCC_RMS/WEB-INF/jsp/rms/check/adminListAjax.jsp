<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<form id="adminAjaxForm" name="adminAjaxForm" method="post">
	<input type="hidden" id="adminTarget" name="adminTarget" value="">
<table>
	<caption></caption>
	<colgroup>

		<col style="width: 5%" />
		<col style="width: *%" />
		<col style="width: *%" />
		<col style="width: *%" />
		<col style="width: *%" />
		<col style="width: *%" />
		<col style="width: 16%" />
		<col style="width: 16%" />
		<col style="width: 14%" />
	</colgroup>
	<thead>
		<tr>
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
				<td colspan="9" style="text-align: center;"><spring:message
						code="info.nodata.msg" /></td>
			</tr>
		</c:if>
		<c:forEach items="${adminList}" var="i" varStatus="st">
			<c:choose>
				<c:when test="${st.index % 2 == 1}">
					<tr class="odd" style="cursor: pointer; curosr: hand;"
						onclick="loadCheckUser('${i.admin_id}')">
						<td><c:out value="${st.index + 1}"></c:out></td>
						<td>${i.company_name }</td>
						<td>${i.dep_name }</td>
						<td>${i.detail_code_name}</td>
						<td value="${i.admin_id}"><c:out value="${i.admin_name}"></c:out></td>
						<td>${i.admin_id}</td>
						<td>${i.admin_email_addr }</td>
						<td class="num">${i.admin_phone_num }</td>
						<td class="num last">${i.admin_tel_num }</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr class="even" style="cursor: pointer; curosr: hand;"
						onclick="loadCheckUser('${i.admin_id}')">
						<td><c:out value="${st.index + 1}"></c:out></td>
						<td>${i.company_name }</td>
						<td>${i.dep_name }</td>
						<td>${i.detail_code_name}</td>
						<td value="${i.admin_id}"><c:out value="${i.admin_name}"></c:out></td>
						<td>${i.admin_id}</td>
						<td>${i.admin_email_addr }</td>
						<td class="num">${i.admin_phone_num }</td>
						<td class="num last">${i.admin_tel_num }</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</tbody>
</table>
</form>