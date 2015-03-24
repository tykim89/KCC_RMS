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
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" media="all" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready();

	function init() {
		if ($("#message").val() != "" && $("#message").val() != undefined) {
			alert($("#message").val());
		}
	}

	//전체 체크
	function checkAll(allBtnId, checkBtnId) {
		if ($("#" + allBtnId).is(":checked")) {
			$("input[id=" + checkBtnId + "]").prop("checked", true);
		} else {
			$("input[id=" + checkBtnId + "]").prop("checked", false);
		}
	}

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

	//지원분야 체크된 값 넘기기

	function selectUserListByAdmin() {

		$.post("<c:url value='/rms/check/getCheckResultList.do'/>", $(
				"#checkResultForm").serialize(), function(html) {
			$("#checkResultListDIV").html(html);
		});

	}

	function loadListForRecNoti() {
		var item = "";
		item = $("#rec_noti_no option:selected").val();
		$.post("<c:url value='/rms/check/getCheckResultList.do'/>", {
			rec_noti_no : item
		}, function(html) {
			$("#checkResultListDIV").html(html);
		});
	}

	function loadCheckRes() {
		var item = "";

		item = $("#checkResSelect option:selected").val();

		$("#checkRes").val(item);
	}
	function fn_egov_link_page(pageNo) {
		document.searchForm.pageIndex.value = pageNo;
		$.post("<c:url value='/rms/check/getCheckResultList.do'/>", $(
				"#checkResultForm").serialize(), function(html) {
			$("#checkResultListDIV").html(html);
		});
	}

	/* 글 목록 화면 function */
	function fn_egov_selectList() {
		document.searchForm.action = "<c:url value='/rms/check/gotoCheckResultPage.do'/>";
		document.searchForm.submit();
	}

	function layPop(id) {
		var layPopH = $(id).height();
		var layPopW = $(id).width();

		var topPos = (($(window).height() - layPopH) / 2);
		var leftPos = (($(window).width() - layPopW) / 2);
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

	function checkResSubmit(ff) {

		var str = getCheckedValue('checkResbtn');

		if (confirm("등록하시겠습니까?")) {
			layPopClose(page1);
			$("#checkedValue").val(str);
			$("#check_res_code1").val(ff);

			$.post("<c:url value='/rms/check/updateCheckResult.do'/>", $(
					"#checkResultForm").serialize(), function(html) {
				$("#checkResultListDIV").html(html);
			});
		}

	}

	function resClick() {
		var str = getCheckedValue('checkResbtn');
		if (str == "") {
			alert("등록할 항목을 선택하세요");
		} else {
			layPop(page1);
		}
	}

	function holdRanking() {
		var currentNotiNo = $("#rec_noti_no option:selected").val();
		if (currentNotiNo == "") {
			alert("채용공고를 선택해주세요.");
		} else {
			$.post("<c:url value='/rms/check/getHoldranking.do'/>", {
				rec_noti_no : currentNotiNo
			}, function(html) {
				$("#holdRankingListDIV").html(html);

			});
			layPop(page2);
		}
	}
	function saveHoldRanking() {

		var holdRankingString = getTempHoldranking();
		var currentNotiNo = $("#rec_noti_no option:selected").val();
		if (confirm("저장 하시겠습니까??")) {
			$.post("<c:url value='/rms/check/setHoldRanking.do'/>", {
				rec_noti_no : currentNotiNo,
				holdRanking : holdRankingString
			}, function(html) {
				$("#holdRankingListDIV").html(html);

			});
		}
	}

	function setSelectedAppUser(appUserNo) {
		$("#selectedAppUserForHoldRank").val(appUserNo);
		getCheckComment(appUserNo);
	}

	function getTempHoldranking() {
		var idList = [];
		var itemStr = "";

		$("input[name='hiddenAppUserNo']").each(function() {
			idList.push($(this).val());
		});

		$.each(idList, function(index, item) {
			itemStr += item + "|"
		});

		return itemStr;
	}

	$(function() {
		$("#start_date, #end_date").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					yearSuffix : '년'
				});
	});

	function ListToExcel() {

		var recNotiNo = $("#rec_noti_no").val();
		var recResult = $("#check_res_code").val();
		var name = encodeURIComponent($("#app_user_name").val());
		var startDate = $("#start_date").val();
		var endDate = $("#end_date").val();

		location.href = "/KCC_RMS/rms/check/checkResult.xls?rec_noti_no="
				+ recNotiNo + "&check_res_code=" + recResult
				+ "&app_user_name=" + name + "&start_date=" + startDate
				+ "&end_date=" + endDate;

		//$.post("<c:url value='/rms/check/checkResult.xls'/>",  $("#checkResultForm").serialize());
	}

	function moveUpItem() {

		var idStr = '#' + $("#selectedAppUserForHoldRank").val();
		var prevHtml = $(idStr).prev().html();
		if (prevHtml == null) {
			alert("최상위 리스트입니다!");
			return;
		}
		var prevcurrentMark = $(idStr).prev().attr("id");
		var currcurrentMark = $(idStr).attr("id");
		var currHtml = $(idStr).html();

		//값 변경 
		$(idStr).html(prevHtml);
		$(idStr).prev().html(currHtml);

		//id 값도 변경
		$(idStr).prev().attr("id", "TEMP_TR");
		$(idStr).attr("onclick",
				"setSelectedAppUser('" + prevcurrentMark + "');");
		$(idStr).attr("id", prevcurrentMark);
		$("#TEMP_TR").attr("onclick",
				"setSelectedAppUser('" + currcurrentMark + "');");
		$("#TEMP_TR").attr("id", currcurrentMark);

	}
	function moveDownItem() {

		var idStr = '#' + $("#selectedAppUserForHoldRank").val();
		var nextHtml = $(idStr).next().html();
		if (nextHtml == null) {
			alert("최하위 리스트입니다!");
			return;
		}
		var nextcurrentMark = $(idStr).next().attr("id");
		var currcurrentMark = $(idStr).attr("id");
		var currHtml = $(idStr).html();
		$(idStr).next().html(currHtml);
		// $(idStr).next().attr("id",currcurrentMark);

		//값 변경 
		$(idStr).html(nextHtml);

		//id 값도 변경
		$(idStr).next().attr("id", "TEMP_TR");
		$(idStr).attr("onclick",
				"setSelectedAppUser('" + nextcurrentMark + "');");
		$(idStr).attr("id", nextcurrentMark);
		$("#TEMP_TR").attr("onclick",
				"setSelectedAppUser('" + currcurrentMark + "');");
		$("#TEMP_TR").attr("id", currcurrentMark);

	}
	function checkResSubmit2(ff) {

		var currentNotiNo = $("#rec_noti_no option:selected").val();
		var str = getCheckedValue('holdRankingbtn');

		if (confirm("등록하시겠습니까?")) {
			$("#checkedValue").val(str);
			$("#check_res_code1").val(ff);

			$.post("<c:url value='/rms/check/updateCheckResult.do'/>", {
				check_res_code1 : ff,
				checkedValue : str,
				rec_noti_no : currentNotiNo,
				option : 'holdRankingCall'
			}, function(html) {
				$("#holdRankingListDIV").html(html);
			});
		}

	}

	function closeHoldRanking() {
		$.post("<c:url value='/rms/check/updateCheckResult.do'/>", $(
				"#checkResultForm").serialize(), function(html) {
			$("#checkResultListDIV").html(html);
		});
		layPopClose(page2);
	}
	function closeCheckComment() {
		$.post("<c:url value='/rms/check/updateCheckResult.do'/>", $(
				"#checkResultForm").serialize(), function(html) {
			$("#checkResultListDIV").html(html);
		});
		layPopClose(page3);
	}
	
	function getCheckComment(appUserNo) {
		var currentNotiNo = $("#rec_noti_no option:selected").val();
		$.post("<c:url value='/rms/check/getCheckComment.do'/>", {
			app_user_no : appUserNo,
			rec_noti_no : currentNotiNo
		}, function(html) {

			$("#commentForm").html(html);
		});
	}
	function getCheckCommentJson()
	{
		var checkCount =0;
		$("input[id='checkResbtn']:checked").each(function() {
			checkCount++;
		});
		if(checkCount ==1)
		{
			var appUserNo
			$("input[id='checkResbtn']:checked").each(function() {
				appUserNo = $(this).val();
			});
			var currentNotiNo = $("#rec_noti_no option:selected").val();
			 
			$.post("<c:url value='/rms/check/getCheckCommentJson.json'/>", {app_user_no : appUserNo, rec_noti_no : currentNotiNo}, function(data){
				$("#check_comment").val(data.comment);
				$("#appUserNameLabel").html(data.appUserName);
				$("#recNotiNoForPage3").val(currentNotiNo);
				$("#appUserNoForPage3").val(appUserNo);
			});
			layPop(page3);
			
		}else
		{			
			alert("한명의 지원자를 선택해주세요");			
		}
	}
	
	function setComment(option)
	{
		if(option == 'add')
		{
			if(confirm("등록 하시겠습니까??"))
			{
				$.post("<c:url value='/rms/check/updateCheckComment.json'/>", $("#commentFormForPage3").serialize(), function(data){
					if(data.updateCommentResult > 0)
					{
						alert("등록되었습니다.");
					}else
					{
						alert("등록 실패");
					}
				});
			}
		}else if(option == 'del'){
			if(confirm("삭제 하시겠습니까??"))
			{
				$("#check_comment").val("");
				$.post("<c:url value='/rms/check/updateCheckComment.json'/>", $("#commentFormForPage3").serialize(), function(data){
					if(data.updateCommentResult > 0)
					{
						alert("삭제되었습니다.");
					}else
					{
						alert("삭제 실패");
					}
				});
			}
		}
	}
</script>
</head>

<body onload="firstMenuList();">
	<jsp:include page="/WEB-INF/jsp/rms/main_top.jsp" />




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
		<h1>검토결과조회</h1>
		<div class="contents">
			<div class="listSearch">
					<span class="btn-pack btn-type_5" id=""> <a
						href="#LINK" onClick="selectUserListByAdmin()" tabindex="7"><span
							class="ico_ser"></span>검 색</a>
					</span>
			</div>
			<div id="assignedUserList" class="listType1 mt10">
				<form id="checkResultForm" name="checkResultForm" action=""
					method="post">
					<table>
						<caption>테이블</caption>
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
						<tr>
							<th scope="row">채용공고</th>
							<c:set var="j" value="1" />
							<td colspan="7"><select id="rec_noti_no" class="select"
								title="" name="rec_noti_no" style="width: 185px"
								onchange="loadListForRecNoti();">
									<option value="">전체</option>
									<c:forEach var="j" items="${ recNoticeListForAdmin }"
										varStatus="st">
										<option value="${j.rec_noti_no}">${j.rec_noti_title}</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>

							<th scope="row">검토결과</th>
							<td><select id="check_res_code" class="select" title=""
								name="check_res_code" style="width: 185px">
									<option value="">전체</option>
									<c:forEach var="i" items="${ checkResList }" varStatus="st">
										<option value="${i.detail_code}">${i.detail_code_name}</option>
									</c:forEach>
							</select></td>
							<th scope="row">거주지역</th>
							<td><select id="addrSelect" class="select" title=""
								style="width: 185px">
									<option value="">전체</option>
							</select></td>
							<th scope="row">이름</th>
							<td class="btn"><input type="text" id="app_user_name"
								name="app_user_name" style="width: 180px;" class="ipt_listIn" />
							</td>
							<th scope="row">입사지원일시</th>
							<td class="btn"><input type="tel"
								id="start_date" name="start_date" style="width: 80px;"
								class="ipt_listIn2" /> ~ <input type="tel" id="end_date"
								name="end_date" style="width: 80px;" class="ipt_listIn2" /></td>
						</tr>
					</table>
					<input type="hidden" id="check_res_code1" name="check_res_code1"
						value="" /> <input type="hidden" id="selectedAppUserForHoldRank"
						name="selectedAppUserForHoldRank" value="" /> <input type="hidden"
						id="checkedValue" name="checkedValue" value="" />

				</form>
			</div>
			<!--//테이블2-->
			<div class="listSearch mt20">
				<span class="btn-pack btn-type_5"> <a class="" href="#"
					onclick="resClick();">검토결과 </a>
				</span> <span class="btn-pack btn-type_5"> <a class="" href="#"
					onclick="holdRanking();">보류관리</a>
				</span> <span class="btn-pack btn-type_5"> <a class="" href="#" onclick="getCheckCommentJson();">의견등록</a>
				</span> <span class="btn-pack btn-type_5"> <a class="" href="#"><span
						class="ico_print"></span>출 력</a>
				</span> <span class="btn-pack btn-type_1"> <a class="" href="#"><span
						class="ico_down"></span>지원서다운로드</a>
				</span> <span class="btn-pack btn-type_1"> <a class="" href="#"
					onclick="ListToExcel();"><span class="ico_down"></span>이력항목다운로드</a>
				</span>
			</div>
			<div id="checkResultListDIV">
				<div class="listType2 mt10">
					<table>
						<caption>테이블</caption>
						<colgroup>
							<col style="width: 2%" />
							<col style="width: 3%" />
							<col style="width: *%" />
							<col style="width: *%" />
							<col style="width: 4%" />
							<col style="width: 5%" />
							<col style="width: *%" />
							<col style="width: *%" />
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
							<c:forEach var="checkResult" items="${ checkList }"
								varStatus="st">
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
									<td class="">${checkResult.app_user_birth}</td>
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
				<br><br>
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
		</div>
		<!--//contents--> </article> </section>
		<!--//contR:끝-->
	</div>
	<!--//wrap:끝-->
	<!-- loding_pop -->
	<div class="layPop" id="loding">
		<div class="loding">
			페이지를 불러오고 있습니다.
			<div class="logo">
				<img src="/KCC_RMS/images/rms/cmn/common/logo_loding.gif"
					alt="로딩 로고" />
			</div>
		</div>
	</div>
	<!-- //loding_pop -->
	<!-- page1 시작 -->
	<div class="layPop" id="page1">
		<div class="wrap" style="width: 400px;">
			<div class="bg_lt"></div>
			<div class="bg_rt"></div>
			<div class="cont">
				<dl class="pop_list">
					<dt>검토결과 등록</dt>
					<dd>


						<div class="con_wrap" style="height: 70px;">
							<div class="wcont">

								<div class="pop_btn">
									<span class="btn-pack btn-type_1"> <a class="" href="#"
										onclick="checkResSubmit('CHR_0010');"><span class="ico_v"></span>
											합 격 </a>
									</span> <span class="btn-pack btn-type_5"> <a class="btn_O"
										href="#" onclick="checkResSubmit('CHR_0030');"><span
											class="ico_cancel"></span> 보 류 </a>
									</span> <span class="btn-pack btn-type_4"> <a class="" href="#"
										onclick="checkResSubmit('CHR_0020');"><span class="ico_x"></span>불합격</a>
									</span>
								</div>
							</div>
						</div>
					</dd>
				</dl>
				<div class="close">
					<a href="#" onclick="layPopClose(page1);"><img
						src="/KCC_RMS/images/rms/cmn/btn/pop_btn_close.gif" alt="닫기" /></a>
				</div>
			</div>
			<div class="bg_lb"></div>
			<div class="bg_rb"></div>
		</div>
	</div>
	<!-- //page1 끝 -->
	<!-- page2 시작 -->
	<div class="layPop" id="page2">
		<div class="wrap" style="width: 700px;">
			<div class="bg_lt"></div>
			<div class="bg_rt"></div>
			<div class="cont">
				<dl class="pop_list">
					<dt>보류순위</dt>
					<dd>
						<div class="con_wrap" style="height: 510px;">
							<div class="wcont">

								<table>
									<tr>
										<td valign="top">
											<div class="listType4" id="holdRankingListDIV">
												<table>
													<caption></caption>
													<colgroup>
														<col style="width: 10%" />
														<col style="width: *%" />
														<col style="width: *%" />
														<col style="width: *%" />
													</colgroup>
													<thead>
														<tr>
															<th scope="col"><input name="" id="" class=""
																type="checkbox" /></th>
															<th scope="col">보류순위</th>
															<th scope="col">지원자이름</th>
															<th scope="col" class="last">생년월일</th>
														</tr>
													</thead>
													<tbody>
													</tbody>
												</table>
											</div>
										</td>
										<td width="5%" align="center">
											<table>
												<tr>
													<td><span class="btn-pack btn-type_3"> <a
															class="" href="#" onclick="moveUpItem();"><span
																class="ico_up"></span></a>
													</span></td>
												</tr>
												<tr height="50">
													<td></td>
												</tr>
												<tr>
													<td><span class="btn-pack btn-type_3"> <a
															class="" href="#" onclick="moveDownItem();"><span
																class="ico_down2"></span></a>
													</span></td>
												</tr>
											</table>
										</td>
										<td>
											<div class="listType4">
												<form action="" id="commentForm" name="commentForm"
													method="post">
													<input type="hidden" name="rec_noti_no" id="rec_noti_no"
														value="" /> <input type="hidden" name="app_user_no"
														id="app_user_no" value="" />
													<table>
														<caption></caption>
														<colgroup>
															<col style="width: *%" />
														</colgroup>
														<thead>
															<tr>
																<th scope="col" class="last">의견내용</th>
															</tr>
														</thead>
														<tbody>
															<tr class="odd">
																<td class="last left"><textarea type="text" id=""
																		name="" style="width: 90%; height: 400px;"></textarea>
																</td>
															</tr>
														</tbody>
													</table>
												</form>
											</div>
										</td>
									</tr>
								</table>



								<div class="pop_btn">
									<span class="btn-pack btn-type_1"> <a class="" href="#"
										onclick="checkResSubmit2('CHR_0010');"><span class="ico_v"></span>
											합 격 </a>
									</span> <span class="btn-pack btn-type_4"> <a class="" href="#"
										onclick="checkResSubmit2('CHR_0020');"><span class="ico_x"></span>불합격</a>
									</span> <span class="btn-pack btn-type_5"> <a class="" href="#"
										onclick="saveHoldRanking();">저 장 </a>
									</span> <span class="btn-pack btn-type_5"> <a class="" href="#"
										onclick="closeHoldRanking();">닫 기 </a>
									</span>
								</div>
							</div>
						</div>
					</dd>
				</dl>
				<div class="close">
					<a href="#" onclick="closeHoldRanking();"><img
						src="/KCC_RMS/images/rms/cmn/btn/pop_btn_close.gif" alt="닫기" /></a>
				</div>
			</div>
			<div class="bg_lb"></div>
			<div class="bg_rb"></div>
		</div>
	</div>
	<!-- //page2 끝 -->
	<!-- page3 시작 -->
	<div class="layPop" id="page3">
		<div class="wrap" style="width: 700px;">
			<div class="bg_lt"></div>
			<div class="bg_rt"></div>
			<div class="cont">
				<dl class="pop_list">
					<dt>의견등록</dt>
					<dd>
						<div class="con_wrap" style="height: 240px;">
							<div class="wcont">
								<div class="listType4">
								<form name="commentFormForPage3" id="commentFormForPage3" action="" method="post">	
								<input type="hidden" name="rec_noti_no" id="recNotiNoForPage3" value=""/>
								<input type="hidden" name="app_user_no" id="appUserNoForPage3" value=""/>				
									<table>
										<caption></caption>
										<colgroup>
											<col style="width: 15%" />
											<col style="width: *%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">이름</th>
												<th scope="col" class="last">의견내용</th>
											</tr>
										</thead>
										
										<tbody>
											<tr class="odd">
												<td><label id="appUserNameLabel"></label> </td>
												<td class="last left"><textarea type="text" id="check_comment"
														name="check_comment" style="width: 485px; height: 100px;" value=""></textarea>
												</td>
											</tr>
										</tbody>
									</table>
									</form>
								</div>								
								<div class="pop_btn">
									<span class="btn-pack btn-type_1"> <a class="" href="#" onclick="setComment('add');"><span
											class="ico_v"></span> 등 록 </a>
									</span> <span class="btn-pack btn-type_4"> <a class="" href="#" onclick="setComment('del');"><span
											class="ico_x"></span>삭 제 </a>
									</span> <span class="btn-pack btn-type_5"> <a class="" href="#" onclick="closeCheckComment();"><span
											class="ico_cancel"></span> 닫 기 </a>
									</span>
								</div>
							</div>
						</div>
					</dd>
				</dl>
				<div class="close">
					<a href="#" onclick="closeCheckComment();"><img
						src="/KCC_RMS/images/rms/cmn/btn/pop_btn_close.gif" alt="닫기" /></a>
				</div>
			</div>
			<div class="bg_lb"></div>
			<div class="bg_rb"></div>
		</div>
	</div>
	<!-- //page3 끝 -->

	<div class="popup_bg"></div>

	<jsp:include page="/WEB-INF/jsp/rms/main_bottom.jsp" />

</body>
</html>
