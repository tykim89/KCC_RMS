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
			<th scope="col"><input name="unusingListCheckAllBtn" id="unusingListCheckAllBtn" class="" type="checkbox" onchange="checkAll('unusingListCheckAllBtn','unusingListCheckBtn')"/></th>
			<th scope="col">메뉴명</th>
			<th scope="col" class="last">메뉴설명</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${menuList.size() == 0}">
			<tr class="odd">
				<td colspan="3" style="text-align: center;"><spring:message code="info.nodata.msg" /></td>
			</tr>
		</c:if>
		<c:forEach items="${menuList}" var="menuVO" varStatus="st">
			<tr style="cursor: pointer; curosr: hand;" onclick="">
				<td><input type="checkbox" id="unusingListCheckBtn" name="unusingListCheckBtn${st.index }" value="${menuVO.menu_id}"></td>
				<td><c:out value="${menuVO.menu_name}"></c:out></td>
				<td><c:out value="${menuVO.menu_description}"></c:out></td>
			</tr>
		</c:forEach>
	</tbody>
</table>