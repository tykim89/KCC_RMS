<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<c:url value='/css/rms/cmn/base.css'/>"
	type="text/css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="./Common/js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script type="text/javaScript" language="javascript">

</script>
<div id="checkResultListDIV">
	<div class="listType2 mt10">
		<table>
			<caption>테이블</caption>
			<colgroup>
				<col style="width: 2%" />
				<col style="width: 3%" />
				<col style="width: *%" />
				<col style="width: 4%" />
				<col style="width: 4%" />
				<col style="width: 5%" />
				<col style="width: 5%" />
				<col style="width: 4%" />
				<col style="width: 4%" />
				<col style="width: 4%" />
				<col style="width: 4%" />
				<col style="width: 4%" />
				<col style="width: 4%" />
				<col style="width: *%" />
				<col style="width: *%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col" rowspan="2"><input name="checkResAll"
						id="checkResAll" class="" type="checkbox"
						onclick="checkAll('checkResAll','checkResbtn');" /></th>
					<th scope="col" rowspan="2">번 호</th>
					<th scope="col" rowspan="2">채용공고</th>
					<th scope="col" rowspan="2">지원분야</th>
					<th scope="col" rowspan="2">경력구분</th>
					<th scope="col" rowspan="2">입사지원일시</th>
					<th scope="col" rowspan="2">이름</th>
					<th scope="col" rowspan="2">생년월일 (만나이)</th>
					<th scope="col" rowspan="2">검토결과</th>
					<th scope="col" rowspan="2">검토의견</th>
					<th scope="col" rowspan="2">보류순위</th>
					<th scope="col" rowspan="2">거주지역</th>
					<th scope="col" rowspan="2">성별</th>
					<th scope="col" rowspan="2">병역사항</th>
					<th scope="col" rowspan="2">어학사항</th>
					<th scope="col" rowspan="2" class="last">최종학력</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${checkList.size() == 0}">
					<tr class="odd">
						<td colspan="13" style="text-align: center;"><spring:message
								code="info.nodata.msg" /></td>
					</tr>
				</c:if>
				<c:forEach var="checkResult" items="${ checkList }" varStatus="st">
					<c:choose>
						<c:when test="${st.index %2 == 1}">
							<c:set var="rowClass" value="odd" />
						</c:when>
						<c:otherwise>
							<c:set var="rowClass" value="even" />
						</c:otherwise>
					</c:choose>
					<tr class="${rowClass }">

						<td scope="col"><input type="checkbox" id="checkResbtn"
							name="checkResbtn"
							value="${checkResult.app_user_no}^${checkResult.rec_noti_no}"></td>
						<td class="num">${st.index+1 }</td>
						<td class="">${checkResult.rec_noti_title}</td>
						<td class="">${checkResult.rec_field_name}</td>
						<td class="">${checkResult.career_div_name}</td>
						<td class="num">${checkResult.write_date}</td>
						<td class="">${checkResult.app_user_name}</td>
						<td class="">88.12.23</td>
						<td class="">${checkResult.check_res_name}</td>
						<td class="">${checkResult.check_yn}</td>
						<td class="">${checkResult.hold_ranking}</td>
						<td class="">서울</td>
						<td class="">여자</td>
						<td class="">병역사항</td>
						<td class="">어학사항</td>
						<td class="">최종학력</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
	</div>
	<!--//테이블2-->
	<div class="pager">

		<div id="paging">
			<ui:pagination paginationInfo="${paginationInfo}" type="image"
				jsFunction="fn_egov_link_page" />
			<form:hidden path="pageIndex" />
		</div>
	</div>
	<!--//pager-->
</div>
</html>