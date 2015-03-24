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

	function loadCheckUser(id) {
		var adminTarget = "";
		adminTarget = id;
		$("#adminTarget").val(adminTarget);

		if (adminTarget == "") {
			alert("<spring:message code='alert.add.noSelect' />");
		} else {
			if (confirm("<spring:message code='common.update.msg' />")) {

				$.post("<c:url value='/rms/check/getCheckUserList.do'/>", $("#adminForm").serialize(), function(html) {
					
					layPopClose(adminListPop);
					$("div[id=assignAdmin]").html(html);
					
				});
				
				$.post("<c:url value='/rms/check/getUserListByCheck.do'/>", $("#adminForm").serialize(), function(html) {
					
					$("div[id=checkAssignList]").html(html);
				});
				
			} else {
				$("#adminTarget").val("");
			}

		}
	}
	function loadAdminByCompany() {
		var item = "";

		item = $("#companySelect option:selected").val();

		$("#companyNo").val(item);

	}

	function loadAdminByDept() {
		var item = "";

		item = $("#deptSelect option:selected").val();

		$("#deptNo").val(item);
	}

	function loadAdminByPosition() {
		var item = "";

		item = $("#positionSelect option:selected").val();

		$("#position").val(item);
	}

	function loadAdminByInfo() {
		var item = "";

		//adminName || adminId
		item = $("#infoSelect option:selected").val();

		$("#info").val(item);
	}

	function selectAdmin() {

		$.post("<c:url value='/rms/check/getAdminList.do'/>", $("#adminForm").serialize(), function(html) {
			
			$("#adminListAjax").html(html);
		});
	}

	/* layPop */

	function layPop(id) {
		var layPopH = $(id).height();
		var layPopW = $(id).width();

		var topPos = (($(window).height() - layPopH) / 4);
		var leftPos = (($(window).width() - layPopW) / 4);
		$(id).css({
			'left' : leftPos,
			'top' : topPos
		});

		popup_bg();
		$(id).show();
		$("html").css("overflow", "hidden");

	}
	function layPopClose(id) {
		popup_bg_close();
		$(id).hide();
		$("html").css("overflow", "auto");
	}

	/* popup_bg */
	function popup_bg() {
		$(".popup_bg").height(($(document).height()));
		$(".popup_bg").show();
	}
	function popup_bg_close() {
		$(".popup_bg").hide();
	}

	$(document).ready(function() {

		layPop(adminListPop);

	})
</script>
</head>
<!-- loding_pop -->
<div class="layPop" id="loding">
	<div class="loding">
		페이지를 불러오고 있습니다.
		<div class="logo">
			<img src="./common/images/common/logo_loding.gif" alt="로딩 로고" />
		</div>
	</div>
</div>
<!-- //loding_pop -->

<form id="adminForm" name="adminForm" method="post">
	<input type="hidden" id="companyNo" name="companyNo" value="">
	<input type="hidden" id="deptNo" name="deptNo" value=""> 
	<input type="hidden" id="position" name="position" value=""> 
	<input type="hidden" id="info" name="info" value="">
	<input type="hidden" id="adminTarget" name="adminTarget" value="">

	<!-- page1 시작 -->
	<div class="layPop" id="adminListPop" name="adminListPop">
		<div class="wrap" style="width: 900px;">
			<div class="bg_lt"></div>
			<div class="bg_rt"></div>
			<div class="cont">
				<dl class="pop_list">
					<dt>관리자 검색</dt>
					<dd>
						<div class="con_wrap" style="height: 510px;">
							<div class="wcont">
								<div class="listSearch">
									<span class="btn-pack btn-type_5" id="searchFormBtn"> <a
										href="#LINK" onClick="selectAdmin()" tabindex="4"><span
											class="ico_ser"></span>검 색</a>
									</span>
								</div>
								<div class="listType1 mt10">
									<table>
										<caption>테이블</caption>
										<colgroup>
											<col style="width: 10%" />
											<col style="width: *%" />
											<col style="width: 10%" />
											<col style="width: *%" />
											<col style="width: 10%" />
											<col style="width: *%" />
										</colgroup>
										<tr>
											<th scope="row">회사</th>
											<td><select id="companySelect" class="select" title=""
												style="width: 110px" onchange="loadAdminByCompany()">
													<option value="">전체</option>
													<c:forEach var="i" items="${ companyList }" varStatus="st">
														<option value="${i.company_no}">

															${i.company_name}</option>
													</c:forEach>
											</select></td>
											<th scope="row">부서</th>
											<td><select id="deptSelect" class="select" title=""
												style="width: 110px" onchange="loadAdminByDept()">
													<option value="">전체</option>
													<c:forEach var="i" items="${ depList }" varStatus="st">
														<option value="${i.dep_no}">${i.dep_name}</option>
													</c:forEach>
											</select></td>
											<th scope="row">직급</th>
											<td><select id="positionSelect" class="select" title=""
												style="width: 110px" onchange="loadAdminByPosition()">
													<option value="">전체</option>
													<c:forEach var="i" items="${ positionList }" varStatus="st">
														<option value="${i.position_code}">${i.detail_code_name}</option>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<th scope="row" colspan="2"><select id="infoSelect"
												class="select" title="" style="width: 150px"
												onchange="loadAdminByInfo()">
													<option value="">전체</option>
													<option value="adminName">이름</option>
													<option value="adminId">아이디</option>
											</select></th>
											<td colspan="4"><input type="text" id="adminInfo"
												name="adminInfo" class="ipt_listIn" /></td>

										</tr>
									</table>
								</div>
								<!--//테이블2-->
								<div id="adminListAjax" class="listType4 mt10">
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
															<td value="${i.admin_id}"><c:out
																	value="${i.admin_name}"></c:out></td>
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
															<td value="${i.admin_id}"><c:out
																	value="${i.admin_name}"></c:out></td>
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
								</div>

								
							</div>
						</div>
					</dd>
				</dl>
				<div class="close">
					<a href="#" onclick="layPopClose(adminListPop);"><img
						src="/KCC_RMS/images/rms/cmn/btn/pop_btn_close.gif" alt="닫기" /></a>
				</div>
			</div>
			<div class="bg_lb"></div>
			<div class="bg_rb"></div>
		</div>
	</div>
	<!-- //page1 끝 -->
</form>
<div class="popup_bg"></div>
</html>