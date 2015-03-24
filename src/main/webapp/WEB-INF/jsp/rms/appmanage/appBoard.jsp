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
<link rel="stylesheet" type="text/css" href="<c:url value='/css/rms/cmn/base.css'/>" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready();
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
		//var checkedValueId = getCheckedValue("fieldCheckBtn");
		//$('#selectTarget').val(checkedValueId);

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

	function loadRecNoti() {
		var item = "";
		
		item = $("#recNotiSelect option:selected").val();
		$("#recNoti").val(item);
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
	
	// 전형일정 등록
	function mngRecSch(){
		
		var checkedValueId = getUserValue();
		
		if(checkedValueId == ""){
			alert('<spring:message code = "common.alert.noAppUser"/>');
			
		}else{
			
			if(checkedValueId != "false"){
				$("#selectUsrTarget").val(checkedValueId);
				$.post("<c:url value='/rms/appmanage/mangeRecSch.do'/>", $("#searchForm").serialize(), function(html){
					
					$("#recSchPop").html(html);
				});
			}
		}
		
	}
	
	function gotoAppDocDetail(id, recNoti){
		$("#userId").val(id);
		var temp = $("#recNoti").val(recNoti);
		$("#searchForm").attr("action",	"<c:url value='/rms/appmanage/appBoardDetail.do'/>").submit();
	}
	
	$(function() {
		  $( "#start_date, #end_date" ).datepicker({
		    dateFormat: 'yy-mm-dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNames: ['일','월','화','수','목','금','토'],
		    dayNamesShort: ['일','월','화','수','목','금','토'],
		    dayNamesMin: ['일','월','화','수','목','금','토'],
		    showMonthAfterYear: true,
		    yearSuffix: '년'
		  });
		});
	
	function gotoScheduler(appUserNo, recNotiNo, stepItemCode, recResCode) {
		if(recResCode == '진행중')
		{
			alert("현재 전형결과는 '진행중'입니다. 결과를 선택해 주세요.");
		} 
		else
		{
			$.post("<c:url value='/rms/appmanage/getRecScheJson.json'/>", {app_user_no 	: appUserNo}, 
				function(data){
				$("#content").val(data.content);
				$("#appUserNameLabel").html(data.userName);
				$("#recNotiNameLabel").html(data.recNotiName);
			});
			
			$("#stepItemCodeLabel").html(stepItemCode);
			$("#recResCodeLabel").html(recResCode);
			$("#userNo").val(appUserNo);
			$("#recNotiNo").val(recNotiNo);
			
			layPop(page3);
		}
	}
	
	function setContent(option)
	{
		if(option == 'add')
		{
			if(confirm("등록 하시겠습니까??"))
			{
				$.post("<c:url value='/rms/appmanage/updateResScheJson.json'/>", $("#recScheFormForPage").serialize(), function(data){
					if(data.updateContentResult > 0)
					{
						$("#searchForm").attr("action","<c:url value='/rms/appmanage/appBoard.do'/>").submit();
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
				$("#content").val("");
				$.post("<c:url value='/rms/appmanage/updateResScheJson.json'/>", $("#recScheFormForPage").serialize(), function(data){
					if(data.updateContentResult > 0)
					{
						$("#searchForm").attr("action","<c:url value='/rms/appmanage/appBoard.do'/>").submit();
						alert("삭제되었습니다.");
					}else
					{
						alert("삭제 실패");
					}
				});
			}
		}
	}
	/* layPop */
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
	
</script>

</head>
<body onload="firstMenuList();">
	<jsp:include page="/WEB-INF/jsp/rms/main_top.jsp" />

	<form action="<c:url value='/rms/appmanage/appBoard.do'/>"
		id="searchForm" method="post" name="boardSearch">
		<input type="hidden" id="selectTarget" name="selectTarget" value="">
		<input type="hidden" id="message" name="message" value="${message}">
		<input type="hidden" id="careerDiv" name="careerDiv" value="">
		<input type="hidden" id="recNoti" name="recNoti" value="">
		<input type="hidden" id="recStep" name="recStep" value=""> 
		<input type="hidden" id="recRes" name="recRes" value="">
		<input type="hidden" id="selectUsrTarget" name="selectUsrTarget" value="">
		<input type="hidden" id="userId" name="userId" value="">

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
						<tr>
						<th scope="row">채용공고</th>
							<td colspan="7"><select id="recNotiSelect" class="select" title=""
								style="width: 185px" onchange="loadRecNoti()">
									<option value="">전체</option>
									<c:forEach var="i" items="${ recNotiList }" varStatus="st">
										<option value="${i.rec_noti_no}">${i.rec_noti_title}</option>
									</c:forEach>
							</select></td>
						<%-- <th scope="row">지원분야</th>
						<c:set var="j" value="1" />
						<td colspan="7"><c:forEach var="i" items="${recFieldList}"
								varStatus="st">
								<label class="chk_label"> <input type="checkbox"
									id="fieldCheckBtn" name="fieldCheckBtn${st.index}"
									value="${i.rec_field_name}"> <spanclass="chk_txt">${i.rec_field_name}</span></label>
							</c:forEach></td>
						</tr> --%>
						<tr>
							
							<th scope="row">경력구분</th>
							<td><select id="careerDivSelect" class="select" title="" style="width: 185px" onchange="loadCareerDiv()">
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
							<td colspan="3" class="btn"><input type="text" id="userName" name="userName"
								style="width: 180px;" class="ipt_listIn" />
							</td>
							<th scope="row">입사지원일시</th>
							<td colspan="3" class="btn">
                                <input type="tel" id="start_date" name="start_date" style="width:80px;" class="ipt_listIn2" />                                    
                                    ~
                                <input type="tel" id="end_date" name="end_date" style="width:80px;" class="ipt_listIn2" />                                    
                            </td>
                            
							
							
						</tr>
					</table>
				</div>

				<!--//테이블2-->

				<div class="listSearch mt20">
					<span class="btn-pack btn-type_5" id="recResSchBtn"
						name="recResSchBtn"> <a id="recResSch" href="#LINK"
						onclick="mngRecSch()" >전형일정 등록</a>
					</span>
					<span class="btn-pack btn-type_5" id="recResultBtn"
						name="recResultBtn"> <a id="recResult" href="#LINK"
						onclick="mngRecResult()" >전형결과</a>
					</span> 
					<span class="btn-pack btn-type_5"> <a class="" href="#"><span
							class="ico_print"></span>출 력</a>
					</span> 
					<span class="btn-pack btn-type_1"> <a class="" href="#"><span
							class="ico_down"></span>지원서다운로드</a>
					</span> 
					<span class="btn-pack btn-type_1"> <a class="" href="#"><span
							class="ico_down"></span>이력항목다운로드</a>
					</span>
				</div>
				<div class="listType2 mt10" id="appUserList">
					<table>

						<colgroup>
							<col style="width: 5%" />
							<col style="width: 5%" />
							<col style="width: 15%" />
							<col style="width: *%" />
							<col style="width: *%" />
							<col style="width: 10%" />
							<col style="width: 10%" />
							<col style="width: *%" />
							<col style="width: *%" />
							<col style="width: 5%" />
							<col style="width: *%" />
							<col style="width: *%" />
							<col style="width: 10%" />
							<col style="width: 5%" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col" rowspan="2"><input type="checkbox"
									id="checkAllBtn" name="checkAllBtn" onclick="checkAll()">
								</th>
								<th scope="col" rowspan="2">번 호</th>
								<th scope="col" rowspan="2">채용공고</th>
								<th scope="col" rowspan="2">지원분야</th>
								<th scope="col" rowspan="2">경력구분</th>
								<th scope="col" rowspan="2">입사지원일시</th>
								<th scope="col" rowspan="2">이름</th>
								<th scope="col" rowspan="2">생년월일</th>
								<th scope="col" rowspan="2">지역</th>
								<th scope="col" rowspan="2">시험유무</th>
								<th scope="col" colspan="2">검토결과건수</th>
								<th scope="col" rowspan="2">전형상태</th>
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
									<td colspan="14" style="text-align: center;"><spring:message
											code="info.nodata.msg" /></td>
								</tr>
							</c:if>
							
							<c:forEach var="i" items="${ userList }" varStatus="st">
								<c:choose>
									<c:when test="${st.index % 2 == 1}">
										<c:set var="rowClass" value="odd"/>
									</c:when>
									<c:otherwise>
										<c:set var="rowClass" value="even"/>
									</c:otherwise>
								</c:choose>
									<tr class="${rowClass }">
										<td scope="col"><input type="checkbox" id="checkBtn" name="checkBtn${st.index}"	value="${i.app_user_no}"></td>
										<td class="num" style="cursor: pointer; curosr: hand;" onclick="gotoAppDocDetail('${i.app_user_no}', '${i.rec_noti_no }')">${i.num}</td>
										<td class="" style="cursor: pointer; curosr: hand;" onclick="gotoAppDocDetail('${i.app_user_no}', '${i.rec_noti_no }')">${i.rec_noti_title}</td>
										<td class="" style="cursor: pointer; curosr: hand;" onclick="gotoAppDocDetail('${i.app_user_no}', '${i.rec_noti_no }')">${i.rec_field_name}</td>
										<td class="" style="cursor: pointer; curosr: hand;" onclick="gotoAppDocDetail('${i.app_user_no}', '${i.rec_noti_no }')">${i.career_div_code}</td>
										<td class="num" style="cursor: pointer; curosr: hand;" onclick="gotoAppDocDetail('${i.app_user_no}', '${i.rec_noti_no }')">${i.write_date}</td>
										<td class="" style="cursor: pointer; curosr: hand;" onclick="gotoAppDocDetail('${i.app_user_no}', '${i.rec_noti_no }')">${i.app_user_name}</td>
										<td class="" style="cursor: pointer; curosr: hand;" onclick="gotoAppDocDetail('${i.app_user_no}', '${i.rec_noti_no }')">${i.app_user_birth }</td>
										<td class="" style="cursor: pointer; curosr: hand;" onclick="gotoAppDocDetail('${i.app_user_no}', '${i.rec_noti_no }')">서울</td>
										<td>O</td>
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
												
												<c:choose>
													<c:when test="${i.rec_sch_content == null || i.rec_sch_content == ''}">
														<td class="tb_style_1" style="cursor: pointer; curosr: hand;" onclick="gotoScheduler('${i.app_user_no}', '${i.rec_noti_no }', '${i.step_item_code}','${i.rec_res_code}')">
															<input type="hidden" id="schNo" name="schNo" value="N">NO
														</td>
													</c:when>
													<c:otherwise>
														<td class="tb_style_1 last" style="cursor: pointer; curosr: hand;" onclick="gotoScheduler('${i.app_user_no}', '${i.rec_noti_no }', '${i.step_item_code}','${i.rec_res_code}')">
															<input type="hidden" id="schYes" name="schYes" value="Y">YES
														</td>
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
												<c:choose>
													<c:when test="${i.rec_sch_content == null || i.rec_sch_content == ''}">
														<td class="tb_style_1 font_color_red" style="cursor: pointer; curosr: hand;" onclick="gotoScheduler('${i.app_user_no}', '${i.rec_noti_no }', '${i.step_item_code}','${i.rec_res_code}')">
															<input type="hidden" id="schNo" name="schNo" value="N">NO
														</td>
													</c:when>
													<c:otherwise>
														<td class="tb_style_1 font_color_red last" style="cursor: pointer; curosr: hand;" onclick="gotoScheduler('${i.app_user_no}', '${i.rec_noti_no }', '${i.step_item_code}','${i.rec_res_code}')">
															<input type="hidden" id="schYes" name="schYes" value="Y">YES
														</td>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
											</c:choose>

								</tr>

							</c:forEach>
						</tbody>
					</table>
				
				<br><br>
				<div class="pager">
                    <div id="paging">
						<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
						<form:hidden path="pageIndex" />
					</div>
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
	<div class="layPop" id="recSchPop" name="recSchPop"></div>
	
	<!-- page3 시작 -->
	<div class="layPop" id="page3">
		<div class="wrap" style="width: 700px;">
			<div class="bg_lt"></div>
			<div class="bg_rt"></div>
			<div class="cont">
				<dl class="pop_list">
					<dt>전형일정</dt>
					<dd>
						<div class="con_wrap" style="height: 600px;">
							<div class="wcont">
								<div class="listType3 mt10">
								<form name="recScheFormForPage" id="recScheFormForPage" action="" method="post">	
									<table>
										<caption></caption>
										<tbody>
											<tr class="odd" >
												<th class="" style="width: 180px">받는사람</th>
												<td class="left"><input type="hidden" id="userNo" name="app_user_no"><label id="appUserNameLabel"></td>
											</tr>
											<tr>
												<th class="" style="width: 180px">채용공고</th>
												<td class="left"><input type="hidden" id="recNotiNo" name="rec_noti_no"><label id="recNotiNameLabel"></td>
											</tr>
											<tr>
												<th class="" style="width: 180px">진행상태</th>
												<td class="left"><label id="stepItemCodeLabel"></label>전형 <label id="recResCodeLabel"></label></td>
											</tr>
											<tr>
												<th class="" style="width: 90%; height: 400px;">메시지 내용</th>
												<td><textarea type="text" id="content" name="rec_sch_content" style="width: 90%; height: 400px;"></textarea></td>
											</tr>
										</tbody>
									</table>
									</form>
								</div>								
								<div class="pop_btn">
									<span class="btn-pack btn-type_1"> <a class="" href="#" onclick="setContent('add');"><span
											class="ico_v"></span> 등 록 </a>
									</span> <span class="btn-pack btn-type_4"> <a class="" href="#" onclick="setContent('del');"><span
											class="ico_x"></span>삭 제 </a>
									</span> <span class="btn-pack btn-type_5"> <a class="" href="#" onclick="layPopClose(page3);"><span
											class="ico_cancel"></span> 닫 기 </a>
									</span>
								</div>
							</div>
						</div>
					</dd>
				</dl>
				<div class="close">
					<a href="#" onclick="layPopClose(page3);"><img
						src="/KCC_RMS/images/rms/cmn/btn/pop_btn_close.gif" alt="닫기" /></a>
				</div>
			</div>
			<div class="bg_lb"></div>
			<div class="bg_rb"></div>
		</div>
	</div>
	<!-- //page3 끝 -->
	
</body>
</html>