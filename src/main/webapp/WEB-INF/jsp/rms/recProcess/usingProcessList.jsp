<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<table>
	<caption></caption>
	<colgroup>
		<col style="width: 10%" />
		<col style="width: 90%" />
	</colgroup>
	<thead>
		<tr>
			<th scope="col"><input name="useProcessAllCheckBtn" id="useProcessAllCheckBtn" class="" type="checkbox" onchange="checkAll('useProcessAllCheckBtn','useProcessCheckBtn')"/></th>
			<th scope="col" class="last">선택</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${stepItem.size() == 0}">
			<tr class="odd">
				<td colspan="3" style="text-align: center;"><spring:message code="info.nodata.msg" /></td>
			</tr>
		</c:if>
		<c:forEach items="${stepItem}" var="stepItemVO" varStatus="st">
			<tr style="cursor: pointer; curosr: hand;" onclick="">
				<td><input type="checkbox" id="useProcessCheckBtn" name="useProcessCheckBtn${st.index }" value="${stepItemVO.detail_code }"></td>
				<td><c:out value="${stepItemVO.detail_code_name }"></c:out></td>
			</tr>
		</c:forEach>
	</tbody>
</table>