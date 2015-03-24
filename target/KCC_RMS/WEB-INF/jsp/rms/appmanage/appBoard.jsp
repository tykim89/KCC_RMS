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
<script src="//code.jquery.com/jquery-1.10.2.js"></script>

<script type="text/javascript">
	
	//지원분야 체크된 값 | 구분자로 연결하여 리턴
	function getCheckedValue(checkBtnId) {
		var idList = [];
		var itemStr = "";

		$("input[id=" + checkBtnId + "]:checked").each(function() {
			idList.push(this.value)
		});

		$.each(idList, function(index, item) {
			itemStr += item + "|"
		});

		return itemStr;
	}

	//선택된 값 넘기기

	function selectUserSearch() {
		var checkedValueId = getCheckedValue("fieldCheckBtn");
		$('#selectTarget').val(checkedValueId);

		$.post("<c:url value='/rms/appmanage/appBoardBySearch.do'/>", $(
				"#searchForm").serialize(), function(html) {
			$("#appUserList").html(html);
		});

	}

	//입사지원자 전체 체크
	function checkAll() {
		if ($("#checkAllBtn").is(":checked")) {
			$('input[id=checkBtn]').attr("checked", true);
		} else {
			$('input[id=checkBtn]').attr("checked", false);
		}
	}

	//지원자 리스트 체크된 값 | userValue구분자로 연결하여 리턴
	function getUserValue() {
		var idList = [];
		var titleList = [];
		var itemStr = "";

		$("input[id=checkBtn]:checked").each(function() {
			var str = this.value.split('|')
			idList.push(str[0])
			titleList.push(str[1])
		});

		var result = "";
		var zeroTitle = "";
		$
				.each(
						titleList,
						function(index, item) {
							if (index == 0) {
								zeroTitle = item;
							} else {
								if (zeroTitle != item) {
									alert('<spring:message code = "common.alert.noMatchRecNoti"/>');
									result = "false";
								}
							}
						});

		if (result != "false") {
			$.each(idList, function(index, item) {
				itemStr += item + "|"

			});
			result = itemStr;
		}

		return result;
	}

	function loadCareerDiv() {
		var item = "";

		item = $("#careerDivSelect option:selected").val();

		$("#careerDiv").val(item);

	}

	function loadRecStep() {
		var item = "";

		item = $("#recStepSelect option:selected").val();

		$("#recStep").val(item);
	}

	function loadRecRes() {
		var item = "";

		item = $("#recResSelect option:selected").val();

		$("#recRes").val(item);
	}

	function mngRecResult() {

		var checkedValueId = getUserValue();

		if (checkedValueId == "") {
			alert('<spring:message code = "common.alert.noAppUser"/>');
		} else {
			if (checkedValueId != "false") {
				//팝업화면을 생성하여, 해당 팝업에 URL과 파라미터를 전달한다.
				$('#selectUsrTarget').val(checkedValueId);

				$.post("<c:url value='/rms/appmanage/manageRecResult.do'/>", $("#searchForm").serialize(), function(html) {

					$("#recResultPop").html(html);
				});
			}
		}
	}
</script>

</head>
<body onload="firstMenuList();">
	<jsp:include page="/WEB-INF/jsp/rms/main_top.jsp" />

	<form action="<c:url value='/rms/appmanage/appBoard.do'/>"
		id="searchForm" method="post" name="boardSearch">
		<input type="hidden" id="selectTarget" name="selectTarget" value="">
		<input type="hidden" id="message" name="message" value="${message}">
		<input type="hidden" id="careerDiv" name="careerDiv" value="">
		<input type="hidden" id="recStep" name="recStep" value=""> 
		<input type="hidden" id="recRes" name="recRes" value="">
		<input type="hidden" id="selectUsrTarget" name="selectUsrTarget" value="">

		<div id="wrap">
			<jsp:include page="/WEB-INF/jsp/rms/main_left.jsp" />

			<section id="contR"><!--contR:시작--> <section
				class="cont_top">
			<div class="path">
				<img src="/KCC_RMS/images/rms/cmn/btn/btn_path_home.gif" alt="home" />HOME
				&gt; 항목관리 &gt; <strong>지원서양식관리</strong>
			</div>
			<div class="name">
				<span class="name_st">관리자</span>님 반갑습니다.
			</div>
			</section> <article>
			<h1>입사지원조회</h1>
			<div class="contents">
				<div class="listSearch">
					<span class="btn-pack btn-type_5" id="searchFormBtn"> <a
						href="#LINK" onClick="selectUserSearch()" tabindex="7"><span
							class="ico_ser"></span>검 색</a>
					</span>
				</div>
				<div class="listType1 mt10">
					<table>

						<colgroup>
							<col style="width: 100px;" />
							<col style="width: *" />
							<col style="width: 120px;" />
							<col style="width: *" />
							<col style="width: 120px;" />
							<col style="width: *" />
							<col style="width: 100px;" />
							<col style="width: *" />
						</colgroup>
						<th scope="row">지원분야</th>
						<c:set var="j" value="1" />
						<td colspan="7"><c:forEach var="i" items="${recFieldList}"
								varStatus="st">
								<label class="chk_label"> <input type="checkbox"
									id="fieldCheckBtn" name="fieldCheckBtn${st.index}"
									value="${i.rec_field_name}"> <spanclass="chk_txt">${i.rec_field_name}</span></label>
							</c:forEach></td>
						</tr>
						<tr>
							<th scope="row">경력구분</th>
							<td><select id="careerDivSelect" class="select" title=""
								style="width: 185px" onchange="loadCareerDiv()">
									<option value="">전체</option>
									<c:forEach var="i" items="${ careerDivList }" varStatus="st">
										<option value="${i.career_div_code}">${i.career_div_name}</option>
									</c:forEach>
							</select></td>
							<th scope="row">채용전형단계</th>
							<td><select id="recStepSelect" class="select" title=""
								style="width: 185px" onchange="loadRecStep()">
									<option value="">전체</option>
									<c:forEach var="i" items="${ recStepList }" varStatus="st">
										<option value="${i.rec_step_code}">${i.rec_step_name}</option>
									</c:forEach>
							</select></td>
							<th scope="row">전형결과</th>
							<td><select id="recResSelect" class="select" title=""
								style="width: 185px" onchange="loadRecRes()">
									<option value="">전체</option>
									<c:forEach var="i" items="${ recResList }" varStatus="st">
										<option value="${i.rec_res_code}">${i.rec_res_name}</option>
									</c:forEach>
							</select></td>
							<th scope="row">거주지역</th>
							<td><select id="select04" class="select" title="">
									<option value="">전체</option>
							</select></td>
						</tr>
						<tr>
							<th scope="row">이름</th>
							<td colspan="3" class="btn"><input type="tel" id="" name=""
								style="width: 180px;" class="ipt_listIn" /> <span
								class="btn-pack btn-type_2" style="margin-left: 5px;"
								id="searchNameBtn"> <a href="#LINK"><span
										class="ico_ser"></span>검 색</a>
							</span></td>
							<th scope="row">입사지원일시</th>
							<td colspan="3" class="btn"><input type="tel" id="" name=""
								style="width: 80px;" class="ipt_listIn2" /> <span
								class="btn-pack btn-type_2" style="margin-left: 5px;"> <a
									class="" href="#"><span class="ico_calendar"></span> </a>
							</span> ~ <input type="tel" id="" name="" style="width: 80px;"
								class="ipt_listIn2" /> <span class="btn-pack btn-type_2"
								style="margin-left: 5px;"> <a class="" href="#"><span
										class="ico_calendar"></span></a>
							</span></td>
						</tr>
					</table>
				</div>

				<!--//테이블2-->

				<div class="listSearch mt20">
					<span class="btn-pack btn-type_5" id="recResultBtn"
						name="recResultBtn"> <a id="recResult" href="#LINK"
						onclick="mngRecResult()" tabindex="7">전형결과</a>
					</span> <span class="btn-pack btn-type_5"> <a class="" href="#"><span
							class="ico_print"></span>출 력</a>
					</span> <span class="btn-pack btn-type_1"> <a class="" href="#"><span
							class="ico_down"></span>지원서다운로드</a>
					</span> <span class="btn-pack btn-type_1"> <a class="" href="#"><span
							class="ico_down"></span>이력항목다운로드</a>
					</span>
				</div>
				<div class="listType2 mt10" id="appUserList">
					<table>

						<colgroup>
							<col style="width: 5%" />
							<col style="width: 5%" />
							<col style="width: *%" />
							<col style="width: *%" />
							<col style="width: 10%" />
							<col style="width: *%" />
							<col style="width: *%" />
							<col style="width: *%" />
							<col style="width: *%" />
							<col style="width: *%" />
							<col style="width: *%" />
							<col style="width: *%" />
							<col style="width: *%" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col" rowspan="2"><input type="checkbox"
									id="checkAllBtn" name="checkAllBtn" onclick="checkAll()">
								</th>
								<th scope="col" rowspan="2">번 호</th>
								<th scope="col" rowspan="2">지원분야</th>
								<th scope="col" rowspan="2">경력구분</th>
								<th scope="col" rowspan="2">입사지원일시</th>
								<th scope="col" rowspan="2">이름</th>
								<th scope="col" rowspan="2">생년월일</th>
								<th scope="col" rowspan="2">지역</th>
								<th scope="col" colspan="2">검토결과건수</th>
								<th scope="col" rowspan="2">전형상태</th>
								<th scope="col" rowspan="2">시험유무</th>
								<th scope="col" rowspan="2" class="last">전형일정여부</th>
							</tr>
							<tr>
								<th scope="col">검토전체</th>
								<th scope="col">검토합격</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${userList.size() == 0}">
								<tr class="odd">
									<td colspan="13" style="text-align: center;"><spring:message
											code="info.nodata.msg" /></td>
								</tr>
							</c:if>
							
							<c:forEach var="i" items="${ userList }" varStatus="st">
								<c:choose>
									<c:when test="${st.index %2 == 1}">
										<tr class="odd">
											<td scope="col"><input type="checkbox" id="checkBtn"
												name="checkBtn${st.index}" value="${i.app_user_no}"></td>
											<td class="num" >${i.num}</td>
											<td class="">${i.rec_field_name}</td>
											<td class="">${i.career_div_code}</td>
											<td class="num">${i.write_date}</td>
											<td class="">${i.app_user_name}</td>
											<td class="">88.12.23</td>
											<td class="">서울</td>
											<c:choose>
											<c:when test="${i.rec_res_code == '합격' || i.rec_res_code == '진행중'}">
												<td class="tb_style_1">${i.countAll}</td>
												<c:choose>
													<c:when test="${i.countPass >= 1 }">
														<td class="tb_style_1">${i.countPass}</td>
													</c:when>
													<c:otherwise>
														<td class="tb_style_1">0</td>
													</c:otherwise>
												</c:choose>
	
												<td class="tb_style_1">${i.step_item_code}전형 ${i.rec_res_code}</td>
												<td class="btn_O">O</td>
												<c:choose>
													<c:when test="${i.enable_tf == 'T'}">
														<td class="tb_style_1">YES</td>
													</c:when>
													<c:otherwise>
														<td class="tb_style_1 last">NO</td>
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
												<td class="tb_style_1 font_color_red">${i.countAll}</td>
												<c:choose>
													<c:when test="${i.countPass >= 1 }">
														<td class="tb_style_1 font_color_red">${i.countPass}</td>
													</c:when>
													<c:otherwise>
														<td class="tb_style_1 font_color_red">0</td>
													</c:otherwise>
												</c:choose>
												<td class="tb_style_1 font_color_red">${i.step_item_code}전형 ${i.rec_res_code}</td>
												<td class="btn_O">O</td>
												<c:choose>
													<c:when test="${i.enable_tf == 'T'}">
														<td class="tb_style_1 font_color_red">YES</td>
													</c:when>
													<c:otherwise>
														<td class="tb_style_1 font_color_red last">NO</td>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
											</c:choose>

										</tr>
									</c:when>
									<c:otherwise>
										<tr class="even">
											<td scope="col"><input type="checkbox" id="checkBtn"
												name="checkBtn${st.index}"
												value="${i.app_user_no}"></td>
											<td class="num">${i.num}</td>
											<td class="">${i.rec_field_name}</td>
											<td class="">${i.career_div_code}</td>
											<td class="num">${i.write_date}</td>
											<td class="">${i.app_user_name}</td>
											<td class="">88.12.23</td>
											<td class="">서울</td>
											<c:choose>
											<c:when test="${i.rec_res_code == '합격' || i.rec_res_code == '진행중'}">
												<td class="tb_style_1">${i.countAll}</td>
												<c:choose>
													<c:when test="${i.countPass >= 1 }">
														<td class="tb_style_1">${i.countPass}</td>
													</c:when>
													<c:otherwise>
														<td class="tb_style_1">0</td>
													</c:otherwise>
												</c:choose>
	
												<td class="tb_style_1">${i.step_item_code}전형 ${i.rec_res_code}</td>
												<td class="btn_O">O</td>
												<c:choose>
													<c:when test="${i.enable_tf == 'T'}">
														<td class="tb_style_1">YES</td>
													</c:when>
													<c:otherwise>
														<td class="tb_style_1 last">NO</td>
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
												<td class="tb_style_1 font_color_red">${i.countAll}</td>
												<c:choose>
													<c:when test="${i.countPass >= 1 }">
														<td class="tb_style_1 font_color_red">${i.countPass}</td>
													</c:when>
													<c:otherwise>
														<td class="tb_style_1 font_color_red">0</td>
													</c:otherwise>
												</c:choose>
												<td class="tb_style_1 font_color_red">${i.step_item_code}전형 ${i.rec_res_code}</td>
												<td class="btn_O">O</td>
												<c:choose>
													<c:when test="${i.enable_tf == 'T'}">
														<td class="tb_style_1 font_color_red">YES</td>
													</c:when>
													<c:otherwise>
														<td class="tb_style_1 font_color_red last">NO</td>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
											</c:choose>

										</tr>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<br><br>
				<div class="pager">
                    <div id="paging">
						<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
						<form:hidden path="pageIndex" />
					</div>
				</div>
				<%-- <div id="paging">
					<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
					<form:hidden path="pageIndex" />
				</div> --%>
	</form>
	</div>
	</article>
	</section>
	</div>
	</form>
	<jsp:include page="/WEB-INF/jsp/rms/main_bottom.jsp" />

	<div class="layPop" id="recResultPop" name="recResultPop"></div>
	
</body>
</html>