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

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="./Common/js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script type="text/javaScript" language="javascript">

	function fn_egov_link_page(pageNo){
		document.searchForm.pageIndex.value = pageNo;
		document.searchForm.action = "<c:url value='/rms/check/getAdminList.do'/>";
	   	document.searchForm.submit();
	}
	
	/* 글 목록 화면 function */
	function fn_egov_selectList() {
		document.searchForm.action = "<c:url value='/rms/check/getAdminList.do'/>";
	   	document.searchForm.submit();
	}
</script>
		<div id="adminListAjax">
								<div class="listType4 mt10">
									<table>
										<caption></caption>
										<colgroup>
											<col style="width: 5%" />
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
												<th scope="col"><input name="allCheckAdminBtn" id="allCheckAdminBtn"
												class="" type="checkbox" onchange="checkAll('allCheckAdminBtn','checkUserBtn')" /></th>
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
												<tr class="${rowClass }" >
															<td><input type="checkbox" id="checkUserBtn" name="checkUserBtn${st.index}" value="${i.admin_id}"></td>
															<td><c:out value="${st.index + 1}"></c:out></td>
															<td>${i.company_name }</td>
															<td>${i.dep_name }</td>
															<td>${i.detail_code_name}</td>
															<td value="${i.admin_id}"><c:out
																	value="${i.admin_name}"></c:out></td>
															<td>${i.admin_id}</td>
															<td>${i.admin_email_addr }</td>
															<td class="num">${i.admin_phone_num }</td>
															<td class="num last">${i.admin_tel_num }</td>
														</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="pager">
									<div id="paging">
										<ui:pagination paginationInfo = "${paginationInfo}"
														type="image"
														jsFunction="fn_egov_link_page"
																   />
										<form:hidden path="pageIndex" />
									</div>
								</div><!--//pager-->
								</div>
