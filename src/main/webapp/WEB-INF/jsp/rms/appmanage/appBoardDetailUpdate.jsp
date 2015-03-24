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
	function gotoAppBoard(){
		$("#appDetailUpdateForm").attr("action","<c:url value='/rms/appmanage/appBoard.do'/>").submit();
	}
	
	function gotoUpdateClean(){
		$("#appDetailUpdateForm").attr("action","<c:url value='/rms/appmanage/gotoUpdatePage.do'/>").submit;
	}
	
	function updateAppUserInfo() {
		$("#appDetailForm").attr("action","<c:url value='/rms/appmanage/updateAppUserInfo.do'/>").submit();
	}
	function setUpdateState(id, name){
		var nameIncludeState = name+'|T'
		$("#"+id).attr("name", nameIncludeState);
	}
	//동적 테이블 생성
	function addDynamicTable(section){
		var lastListNo = $("#"+section+"LastListNo").val();		
		var nextListNo = parseInt(lastListNo)+1;
		
		$("input[id='"+section+"InputId1']").each(function() {
			$(this).attr("id", "TEMPID");			
		});			
		var addHtml = "<div class='listType3 mt10' id='"+section+"Div"+nextListNo+"'>"+$('#'+section+'Div1').html()+"</div>";
		$("input[id='TEMPID']").each(function() {
			$(this).attr("id", section+"InputId1");			
		});	
		$('#'+section+'DivHead').append(addHtml);
		//alert("아이디랑 네임바뀌기전"+addHtml);		
		$("input[id='TEMPID']").each(function() {
			var tempName = $(this).attr("name");
			var nameSplit = tempName.split('|');
			//alert(nameSplit[0]);
			$(this).val("");
			$(this).attr("name", nameSplit[0]+"|"+nextListNo);	
			$(this).attr("id", section+"InputId"+nextListNo);
		});
		$("#"+section+"LastListNo").val(nextListNo);
		alert("결과"+$('#'+section+'Div'+nextListNo).html());
		//alert("희생양"+$('#"+section+"Div1').html());
	}
	function deleteDynamicTable(section){
		var lastListNo = $("#"+section+"LastListNo").val();
		var renewLastListNo = parseInt(lastListNo)-1;
		if(lastListNo == 1)
		{
			$("input[id='"+section+"InputId1']").each(function() {				
			$(this).val("");			
			});
		}else{
			$("#"+section+"Div"+lastListNo).remove();		
			$("#"+section+"LastListNo").val(renewLastListNo);
		}
	}
	$(function() {
		  $( "#birth_day" ).datepicker({
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
	

</script>


</head>

<body onload="firstMenuList();">
<form id="appDetailForm" name="appDetailForm" method="post">
	<input type="hidden" id="app_user_no" name="app_user_no" value="${user.app_user_no}">
	<input type="hidden" id="version" name="version" value="${user.version}">
	<jsp:include page="/WEB-INF/jsp/rms/main_top.jsp" />
	<div id="wrap">
		<jsp:include page="/WEB-INF/jsp/rms/main_left.jsp" />
		<section id="contR">
			<!--contR:시작-->
			<section class="cont_top">
				<div class="path">
					<img src="/KCC_RMS/images/rms/cmn/btn/btn_path_home.gif" alt="home" />HOME
					&gt; 항목관리 &gt; <strong>지원서양식관리</strong>
				</div>
				<div class="name">
					<span class="name_st">관리자</span>님 반갑습니다.
				</div>
			</section>
			<article>
				<h1>입사지원조회</h1>
				<div class="contents">

						<div class="listSearch">
							</span> <span class="btn-pack btn-type_5"> <a class="" href="#" onclick="updateAppUserInfo();"
								><span class="ico_modify"></span>저 장</a>
							</span>
						</div>
						
						
						<c:forEach var="fil" items="${formItemList }">
						<c:set var="appListCode" value="${fil.app_list_code }"/>
							<c:choose>
								<c:when test="${appListCode =='PSINFO01' }">
								<c:set var="abi" value="${appBaseInfo }"/>
									<h3>${fil.app_list_code_name }</h3>
									<div class="listType3 mt10">
										<table summary="">
											<colgroup>
												<col width="180px" />
												<col width="15%" />
												<col width="*%" />
												<col width="15%" />
												<col width="*% " />
											</colgroup>
											<tbody>
											
												<tr class="odd">
												<c:choose>
													<c:when test="${appUserVO.att_file_no =='IMG00000' }">
														<th rowspan="8" style="text-align: center;"><img src="/KCC_RMS/images/rms/cmn/btn/icon-person.png" /></th>														
													</c:when>
													<c:otherwise>
														<th rowspan="8" style="text-align: center;"><img src="/KCC_RMS/images/rms/applicant/${appUserVO.att_file_name }${appUserVO.att_file_extention }" height="220" width="170" /></th>
													</c:otherwise>
												</c:choose>
													<th style="text-align: center;">성명</th>
													<td class="left"><input type="hidden" id="app_user_name" name="app_user_name" value="${abi.app_user_name }"/>${abi.app_user_name }</td>
													<th style="text-align: center;"><input type="hidden" id="" name="" value="${appUserDetailMap.PSINFO01[0][0].app_item_name}" >${appUserDetailMap.PSINFO01[0][0].app_item_name}</th>
													<td class="left"><input type="text" id="${appUserDetailMap.PSINFO01[0][0].app_item_no}|${appUserDetailMap.PSINFO01[0][0].list_no}" name="${appUserDetailMap.PSINFO01[0][0].app_list_code}|${appUserDetailMap.PSINFO01[0][0].app_item_no}|${appUserDetailMap.PSINFO01[0][0].list_no}" value="${appUserDetailMap.PSINFO01[0][0].app_item_content}"></td>
												</tr>
												<tr class="even">
													<th style="text-align: center;"><c:out value="${appUserDetailMap.PSINFO01[0][1].app_item_name }"></c:out></th>
													<td class="left"><input type="text" id="${appUserDetailMap.PSINFO01[0][1].app_item_no}|${appUserDetailMap.PSINFO01[0][1].list_no}" name="${appUserDetailMap.PSINFO01[0][1].app_list_code}|${appUserDetailMap.PSINFO01[0][1].app_item_no}|${appUserDetailMap.PSINFO01[0][1].list_no}" value="${appUserDetailMap.PSINFO01[0][1].app_item_content }"></td>
													<th style="text-align: center;"><input type="hidden" id="eng_name" name="eng_name" value="${appUserDetailMap.PSINFO01[0][2].app_item_name }" ><c:out value="${appUserDetailMap.PSINFO01[0][2].app_item_name }"></c:out></th>
													<td class="left"><input type="text" id="${appUserDetailMap.PSINFO01[0][2].app_item_no}|${appUserDetailMap.PSINFO01[0][2].list_no}" name="${appUserDetailMap.PSINFO01[0][2].app_list_code}|${appUserDetailMap.PSINFO01[0][2].app_item_no}|${appUserDetailMap.PSINFO01[0][2].list_no}" value="${appUserDetailMap.PSINFO01[0][2].app_item_content }" ></td>
												</tr>
												<tr class="odd">
													<th style="text-align: center;">채용구분</th>
													<td class="left"><input type="hidden" id="rec_noti_title" name="rec_noti_title" value="${abi.rec_noti_title}">${abi.rec_noti_title}</td>
													<th style="text-align: center;">지원분야</th>
													<td class="left"><input type="hidden" id="rec_field_name" name="rec_field_name" value="${abi.rec_field_name}">${abi.rec_field_name}</td>
												</tr>
												<tr class="even">
													<th style="text-align: center;">경력구분</th>
													<td class="left"><input type="hidden" id="career_div_code" name="career_div_code" value="${abi.career_div_code}">${abi.career_div_code}</td>
													<th style="text-align: center;">추가지원</th>
													<td class="left"></td>
												</tr>
												<tr class="odd">
													<th style="text-align: center;">${appUserDetailMap.PSINFO01[0][3].app_item_name}</th>
													<td class="left" colspan="3">
													<input type="text" id="${appUserDetailMap.PSINFO01[0][3].app_item_no}|${appUserDetailMap.PSINFO01[0][3].list_no}" name="${appUserDetailMap.PSINFO01[0][3].app_list_code}|${appUserDetailMap.PSINFO01[0][3].app_item_no}|${appUserDetailMap.PSINFO01[0][3].list_no}" value="${appUserDetailMap.PSINFO01[0][3].app_item_content}">
													</td>
												</tr>
												<tr class="odd">
													<th style="text-align: center;">주소</th>
													<td class="left" colspan="3">
													<input type="text" id="${appUserDetailMap.PSINFO01[0][4].app_item_no}|${appUserDetailMap.PSINFO01[0][4].list_no}" name="${appUserDetailMap.PSINFO01[0][4].app_list_code}|${appUserDetailMap.PSINFO01[0][4].app_item_no}|${appUserDetailMap.PSINFO01[0][4].list_no}" value="${appUserDetailMap.PSINFO01[0][4].app_item_content}">
													<input type="text" id="${appUserDetailMap.PSINFO01[0][5].app_item_no}|${appUserDetailMap.PSINFO01[0][5].list_no}" name="${appUserDetailMap.PSINFO01[0][5].app_list_code}|${appUserDetailMap.PSINFO01[0][5].app_item_no}|${appUserDetailMap.PSINFO01[0][5].list_no}" value="${appUserDetailMap.PSINFO01[0][5].app_item_content}">
													${user.addr} ${user.addr_detail}
													</td>
												</tr>
												<tr class="even">
													<th style="text-align: center;">${appUserDetailMap.PSINFO01[0][6].app_item_name}</th>
													<td class="left"><input type="text" id="${appUserDetailMap.PSINFO01[0][6].app_item_no}|${appUserDetailMap.PSINFO01[0][6].list_no}" name="${appUserDetailMap.PSINFO01[0][6].app_list_code}|${appUserDetailMap.PSINFO01[0][6].app_item_no}|${appUserDetailMap.PSINFO01[0][6].list_no}" value="${appUserDetailMap.PSINFO01[0][6].app_item_content}"></td>
													<th style="text-align: center;">${appUserDetailMap.PSINFO01[0][7].app_item_name}</th>
													<td class="left"><input type="text" id="${appUserDetailMap.PSINFO01[0][7].app_item_no}|${appUserDetailMap.PSINFO01[0][7].list_no}" name="${appUserDetailMap.PSINFO01[0][7].app_list_code}|${appUserDetailMap.PSINFO01[0][7].app_item_no}|${appUserDetailMap.PSINFO01[0][7].list_no}" value="${appUserDetailMap.PSINFO01[0][7].app_item_content}"></td>
												</tr>
												<tr class="odd">
													<th style="text-align: center;">E-mail</th>
													<td class="left" colspan="3"><input type="text" id="app_user_email_addr" name="app_user_email_addr" value="${abi.app_user_email_addr}"></td>
												</tr>
												
											
											</tbody>
										</table>
									</div>
								</c:when>
								<c:when test="${ appListCode == 'BASINFO01'}">
									<section style="padding-top: 2%; padding-bottom: 0%"></section>						
									<h3><c:out value="${fil.app_list_code_name }"></c:out> </h3>
									<div class="listType3 mt10">
										<table summary="">
											<colgroup>
												<col width="180px" />
												<col width="15%" />
												<col width="7%" />
												<col width="10% " />
												<col width="7%" />
												<col width="10% " />
												<col width="7%" />
												<col width="10% " />
												<col width="7%" />
												<col width="*% " />
												
											</colgroup>
											<tbody>											
												<tr class="odd">
													<th style="text-align: center;"><c:out value="${appUserDetailMap.BASINFO01[0][0].app_item_name }"/></th>
													<td scope="col">
														<input type="text" id="${appUserDetailMap.BASINFO01[0][0].app_item_no}|${appUserDetailMap.BASINFO01[0][0].list_no}" name="${appUserDetailMap.BASINFO01[0][0].app_list_code}|${appUserDetailMap.BASINFO01[0][0].app_item_no}|${appUserDetailMap.BASINFO01[0][0].list_no}" value="<c:out value='${appUserDetailMap.BASINFO01[0][0].app_item_content }'/>">
														<!-- <select id="miliSelect" class="select" title="병역구분"	style="width: 180px" onchange="">
															<option value="">선택</option>
															<option value="">필</option>
															<option value="">미필</option>
															<option value="">면제</option>
														</select> -->
													</td>
													<th style="text-align: center;"><c:out value="${appUserDetailMap.BASINFO01[0][1].app_item_name }"/></th>
													<td><input type="text" id="${appUserDetailMap.BASINFO01[0][1].app_item_no}|${appUserDetailMap.BASINFO01[0][1].list_no}" size="5" name="${appUserDetailMap.BASINFO01[0][1].app_list_code}|${appUserDetailMap.BASINFO01[0][1].app_item_no}|${appUserDetailMap.BASINFO01[0][1].list_no}" value="<c:out value='${appUserDetailMap.BASINFO01[0][1].app_item_content }'/>"></td>
													<th style="text-align: center;"><c:out value="${appUserDetailMap.BASINFO01[0][2].app_item_name }"/></th>
													<td><input type="text" id="${appUserDetailMap.BASINFO01[0][2].app_item_no}|${appUserDetailMap.BASINFO01[0][2].list_no}" name="${appUserDetailMap.BASINFO01[0][2].app_list_code}|${appUserDetailMap.BASINFO01[0][2].app_item_no}|${appUserDetailMap.BASINFO01[0][2].list_no}" value="<c:out value='${appUserDetailMap.BASINFO01[0][2].app_item_content }'/>"></td>
													<th style="text-align: center;"><c:out value="${appUserDetailMap.BASINFO01[0][3].app_item_name }"/></th>
													<td><input type="text" id="${appUserDetailMap.BASINFO01[0][3].app_item_no}|${appUserDetailMap.BASINFO01[0][3].list_no}" name="${appUserDetailMap.BASINFO01[0][3].app_list_code}|${appUserDetailMap.BASINFO01[0][3].app_item_no}|${appUserDetailMap.BASINFO01[0][3].list_no}" value="<c:out value='${appUserDetailMap.BASINFO01[0][3].app_item_content }'/>"></td>
													<th style="text-align: center;"><c:out value="${appUserDetailMap.BASINFO01[0][4].app_item_name }"/></th>
													<td class="btn">
						                               <input type="text" id="${appUserDetailMap.BASINFO01[0][4].app_item_no}|${appUserDetailMap.BASINFO01[0][4].list_no}" name="${appUserDetailMap.BASINFO01[0][4].app_list_code}|${appUserDetailMap.BASINFO01[0][4].app_item_no}|${appUserDetailMap.BASINFO01[0][4].list_no}" value="<c:out value='${appUserDetailMap.BASINFO01[0][4].app_item_content }'/>">
						                                   ~
						                                <input type="text" id="${appUserDetailMap.BASINFO01[0][5].app_item_no}|${appUserDetailMap.BASINFO01[0][5].list_no}" name="${appUserDetailMap.BASINFO01[0][5].app_list_code}|${appUserDetailMap.BASINFO01[0][5].app_item_no}|${appUserDetailMap.BASINFO01[0][5].list_no}" value="<c:out value='${appUserDetailMap.BASINFO01[0][5].app_item_content }'/>">
						                                                                  
						                            </td>
												</tr>
												<tr class="even">
													<th scope="col"><c:out value="${appUserDetailMap.BASINFO01[0][6].app_item_name }"/></th>
													<td scope="col">
														<input type="text" id="${appUserDetailMap.BASINFO01[0][6].app_item_no}|${appUserDetailMap.BASINFO01[0][6].list_no}" name="${appUserDetailMap.BASINFO01[0][6].app_list_code}|${appUserDetailMap.BASINFO01[0][6].app_item_no}|${appUserDetailMap.BASINFO01[0][6].list_no}" value="<c:out value='${appUserDetailMap.BASINFO01[0][6].app_item_content }'/>">
														<!-- <select id="protectSelect" class="select" title="보훈구분"	style="width: 180px" onchange="">
															<option value="">선택</option>
															<option value="">미대상</option>
															<option value="">대상</option>
														</select> -->
													</td>
													<th scope="col"><c:out value="${appUserDetailMap.BASINFO01[0][7].app_item_name }"/></th>
													<td colspan="7" scope="col"><input type="text" id="${appUserDetailMap.BASINFO01[0][7].app_item_no}|${appUserDetailMap.BASINFO01[0][7].list_no}" name="${appUserDetailMap.BASINFO01[0][7].app_list_code}|${appUserDetailMap.BASINFO01[0][7].app_item_no}|${appUserDetailMap.BASINFO01[0][7].list_no}" value="${appUserDetailMap.BASINFO01[0][7].app_item_content }"></td>
													
												</tr>
												<tr class="odd">
													<th scope="col"><c:out value="${appUserDetailMap.BASINFO01[0][8].app_item_name }"/></th>
													<td scope="col">
														<input type="text" id="${appUserDetailMap.BASINFO01[0][8].app_item_no}|${appUserDetailMap.BASINFO01[0][8].list_no}" name="${appUserDetailMap.BASINFO01[0][8].app_list_code}|${appUserDetailMap.BASINFO01[0][8].app_item_no}|${appUserDetailMap.BASINFO01[0][8].list_no}" value="<c:out value='${appUserDetailMap.BASINFO01[0][8].app_item_content }'/>">
														<!-- <select id="protectSelect" class="select" title="장애구분"	style="width: 180px" onchange="">
															<option value="">선택</option>
															<option value="">미대상</option>
															<option value="">대상</option>
														</select> -->
													</td>
													<th scope="col"><c:out value="${appUserDetailMap.BASINFO01[0][9].app_item_name }"/></th>
													<td colspan="7" scope="col"><input type="text" id="${appUserDetailMap.BASINFO01[0][9].app_item_no}|${appUserDetailMap.BASINFO01[0][9].list_no}" name="${appUserDetailMap.BASINFO01[0][9].app_list_code}|${appUserDetailMap.BASINFO01[0][9].app_item_no}|${appUserDetailMap.BASINFO01[0][9].list_no}" value="<c:out value='${appUserDetailMap.BASINFO01[0][9].app_item_content }'/>"></td>
													
												</tr>																							
											</tbody>
										</table>
									</div>
								</c:when>
								<c:when test="${appListCode =='FAM01'}">
									<c:set var="fam" value="${appUserDetailMap.FAM01[0]}"/>
									<section style="padding-top: 2%; padding-bottom: 0%"></section>
									<h3><c:out value="${fil.app_list_code_name }"></c:out></h3>
									<div class="listType3 mt10">
										<table>
											<colgroup>
												<col width="180px" />
												<col width="10%" />
												<col width="20%" />
												<col width="20%" />
												<col width="*%" />
												<col width="10% " />
											</colgroup>
											<thead>
												<tr>													
													<th scope="col" rowspan="3">가족사항</th>											
													<c:forEach var="i" items="${fam}">						
														<th scope="col"><c:out value="${i.app_item_name}"></c:out></th>
													</c:forEach>													
												</tr>
												
											</thead>
											<c:forEach var="k" items="${appUserDetailMap.FAM01 }">
											<tbody>
												<tr class="odd">																									
														<c:forEach var="j" items="${k}">												
														<td scope="col" style="text-align:center;"><input type="text" id="relation" name="relation"	value="<c:out value='${j.app_item_content}'></c:out>"></td>													
														</c:forEach>												
												</tr>
											</tbody>
											</c:forEach>
										</table>
									</div>
								</c:when>
								<c:when test="${appListCode =='STUDY01'}">
									<section style="padding-top: 2%; padding-bottom: 0%"></section>
									
									<h3><c:out value="${fil.app_list_code_name }"></c:out></h3>
									<div class="listType3 mt10">
										<table summary="">
											<colgroup>
												<col width="180px" />
												<col width="*%" />
												<col width="15%" />
												<col width="*% " />
											</colgroup>
											<tbody>
												
												<tr class="odd">
													<th scope="col" style="text-align: center;"><c:out value="${appUserDetailMap.STUDY01[0][0].app_item_name }"/></th>
													<td colspan="3" scope="col"><input type="text" id="" name="" value="<c:out value='${appUserDetailMap.STUDY01[0][0].app_item_content }'/>">
														<label class=""> <input type="checkbox"	id="" name="" value="검정고시"> <spanclass="chk_txt">검정고시</span></label>
													</td>
												</tr>
												<tr class="even">
													<th scope="col" style="text-align: center;"><c:out value="${appUserDetailMap.STUDY01[0][2].app_item_name }"/></th>
													<td scope="col"><input type="text" id="" name="" value="<c:out value='${appUserDetailMap.STUDY01[0][2].app_item_content }'/>"> ~ 										
														<input type="text" id="" name="" value="<c:out value='${appUserDetailMap.STUDY01[0][3].app_item_content }'/>">
													</td>
													<th scope="col" style="text-align: center;"><c:out value="${appUserDetailMap.STUDY01[0][4].app_item_name }"/></th>
													<td scope="col">
														<input type="text" id="" name="" value="<c:out value='${appUserDetailMap.STUDY01[0][4].app_item_content}'/>">
														<!-- <select id="" class="select" title="졸업여부" style="width: 180px" onchange="">
															<option value="">선택</option>
															<option value="">졸업</option>
															<option value="">졸업예정</option>
															<option value="">중퇴</option>
														</select> -->
													</td>
												</tr>
												<tr class="odd">
													<th scope="col" style="text-align: center;"><c:out value="${appUserDetailMap.STUDY01[0][5].app_item_name}"/></th>
													<td colspan="3" scope="col">
														<input type="text" id="" name="" value="<c:out value='${appUserDetailMap.STUDY01[0][5].app_item_content}'/>">
														<!-- <select id="" class="select" title="계열선택" style="width: 180px" onchange="">
															<option value="">계열선택</option>
															<option value="">인문계</option>
															<option value="">예/체능계</option>
															<option value="">공업계</option>
															<option value="">상업계</option>
															<option value="">실업기타분야</option>
														</select> -->
													</td>
												</tr>
												<tr class="even">
													<th scope="col" style="text-align: center;"><c:out value="${appUserDetailMap.STUDY01[0][6].app_item_name}"/></th>
													<td colspan="3" scope="col">
														<input type="text" id="" name="" value="<c:out value='${appUserDetailMap.STUDY01[0][6].app_item_content}'/>">
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</c:when>
								<c:when test="${appListCode =='STUDY02'}">
								<c:set var="studyLastListNo" value="0"/>	
								<div id="studyDivHead">	
								<c:forEach var="study" items="${appUserDetailMap.STUDY02 }">
								<c:set var="studyLastListNo" value="${study[0].list_no }"/>
								<div class="listType3 mt10" id="studyDiv${study[0].list_no }">
								
											<table summary="">
												<colgroup>
													<col width="180px" />
													<col width="*%" />
													<col width="15%" />
													<col width="*% " />
												</colgroup>
												<tbody>
												
													<tr class="odd">
														<th scope="col" style="text-align: center;"><c:out value="${study[0].app_item_name}"/></th>
														<td colspan="3" scope="col"><input type="text" id="studyInputId${study[0].list_no }" name="${study[0].app_item_no}|${study[0].list_no }" value="<c:out value='${study[0].app_item_content}'/>"></td>
													</tr>
													<tr class="even">
														<th scope="col" style="text-align: center;"><c:out value="${study[1].app_item_name}"/></th>
														<td colspan="3" scope="col"><input type="text" id="studyInputId${study[1].list_no }" name="${study[1].app_item_no}|${study[1].list_no }" value="<c:out value='${study[1].app_item_content}'/>">
															<input type="text" id="studyInputId${study[3].list_no }" name="${study[3].app_item_no}|${study[3].list_no }" value="<c:out value='${study[3].app_item_content}'/>">
															<!-- <select id="" class="select" title="입학구분" style="width: 180px" onchange="">
																<option value="">선택</option>
																<option value="">입학</option>
																<option value="">편입</option>
															</select> -->
															~
															<input type="text" id="studyInputId${study[2].list_no }" name="${study[2].app_item_no}|${study[2].list_no }" value="<c:out value='${study[2].app_item_content}'/>">
															<input type="text" id="studyInputId${study[4].list_no }" name="${study[4].app_item_no}|${study[4].list_no }" value="<c:out value='${study[4].app_item_content}'/>">
															<!-- <select id="" class="select" title="졸업구분" style="width: 180px" onchange="">
																<option value="">선택</option>
																<option value="">졸업</option>
																<option value="">졸업예정</option>
																<option value="">중퇴</option>
																<option value="">수료</option>
																<option value="">휴학</option>
															</select> -->
														</td>
													</tr>	
													<tr class="odd">
														<th rowspan="2" scope="col" style="text-align: center;"><c:out value="${study[5].app_item_name}"/></th>
														<td scope="col">
															<input type="text" id="studyInputId${study[5].list_no }" name="${study[5].app_item_no}|${study[5].list_no }" value="<c:out value='${study[5].app_item_content}'/>">
															<!-- <select id="" class="select" title="전공구분" style="width: 180px" onchange="">
																<option value="">(전문)학사</option>
																<option value="">학사</option>
																<option value="">석사</option>
																<option value="">박사</option>
															</select> -->
															<input type="text" id="studyInputId${study[6].list_no }" name="${study[6].app_item_no}|${study[6].list_no }" value="<c:out value='${study[6].app_item_content}'/>">
														</td>
														<th scope="col" style="text-align: center;"><c:out value="${study[9].app_item_name}"/></th>
														<td scope="col">
															<input type="text" id="studyInputId${study[9].list_no }" name="${study[9].app_item_no}|${study[9].list_no }" value="<c:out value='${study[9].app_item_content}'/>"> /
															<input type="text" id="studyInputId${study[10].list_no }" name="${study[10].app_item_no}|${study[10].list_no }" value="<c:out value='${study[10].app_item_content}'/>">
															<!-- <select id="" class="select" title="총점" style="width: 180px" onchange="">
																<option value="">총점</option>
																<option value="">3.80</option>
																<option value="">4.0</option>
																<option value="">4.50</option>
																<option value="">100</option>
															</select> -->
														</td>
													</tr>
													<tr class="odd">
														<td colspan="3" scope="col">
															<input type="text" id="studyInputId${study[7].list_no }" name="${study[7].app_item_no}|${study[7].list_no }" value="<c:out value='${study[7].app_item_content}'/>">
															<!-- <select id="" class="select" title="전공구분" style="width: 180px" onchange="">
																<option value="">복수전공</option>
																<option value="">부전공</option>
															</select> -->
															<input type="text" id="studyInputId${study[8].list_no }" name="${study[8].app_item_no}|${study[8].list_no }" value="<c:out value='${study[8].app_item_content}'/>">
														</td>
														
													</tr>
													<tr class="even">
														<th scope="col" style="text-align: center;"><c:out value="${study[11].app_item_name}"/></th>
														<td colspan="3" scope="col">
															<input type="text" id="studyInputId${study[11].list_no }" name="${study[11].app_item_no}|${study[11].list_no }" value="<c:out value='${study[11].app_item_content}'/>">
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										</c:forEach>
										</div>
										<input type="text" id="studyLastListNo" name="studyLastListNo" value="${studyLastListNo }"/>

									<span class="btn-pack btn-type_2" style="margin-left:5px;">
				                    	<a class="" id="langAddbtn" href="#" onclick="addDynamicTable('study');"><span class="ico_v2"></span>추 가</a>
				                    </span>
				                    <span class="btn-pack btn-type_2" style="margin-left:5px;">
				                       	<a class="" id="langDeletebtn" href="#" onclick="deleteDynamicTable('study');"><span class="ico_x2"></span>삭 제</a>
				                    </span>
								</c:when>
								<c:when test="${appListCode =='LANG01'}">
									<section style="padding-top: 2%; padding-bottom: 0%"></section>
									
									<h3><c:out value="${fil.app_list_code_name }"></c:out></h3>
									<c:set var="langLastListNo" value="0"/>		
									<div id="langDivHead">				
									<c:forEach var="lang" items="${appUserDetailMap.LANG01 }">
									<c:set var="langLastListNo" value="${lang[0].list_no }"/>
									<div class="listType3 mt10" id="langDiv${lang[0].list_no }">									
										<table summary="" >
											<colgroup>
												<col width="180px" />
												<col width="*%" />
												<col width="15%" />
												<col width="*% " />
											</colgroup>
											
											<tbody>											
												<tr class="odd">
													<th style="text-align: center;"><c:out value="${lang[0].app_item_name}"/></th>
													<td scope="col" id="testTd">
														<input type="text" id="langInputId${lang[0].list_no }" name="${lang[0].app_item_no}|${lang[0].list_no }" value="<c:out value='${lang[0].app_item_content}'/>"></td>
													<th style="text-align: center;"><c:out value="${lang[1].app_item_name}"/></th>
													<td scope="col">
														<input type="text" id="langInputId${lang[1].list_no }" name="${lang[1].app_item_no}|${lang[1].list_no }" value="<c:out value='${lang[1].app_item_content}'/>">  / 
														<input type="text" id="langInputId${lang[2].list_no }" name="${lang[2].app_item_no}|${lang[2].list_no }" value="<c:out value='${lang[2].app_item_content}'/>">
													</td>
												</tr>
												<tr class="even">
													<th style="text-align: center;"><c:out value="${lang[3].app_item_name}"/></th>
													<td><input type="text" id="langInputId${lang[3].list_no }" name="${lang[3].app_item_no}|${lang[3].list_no }" value="<c:out value='${lang[3].app_item_content}'/>"></td>
													<th style="text-align: center;"><c:out value="${lang[4].app_item_name}"/></th>
													<td>
														<input type="text" id="langInputId${lang[4].list_no }" name="${lang[4].app_item_no}|${lang[4].list_no }" value="<c:out value='${lang[4].app_item_content}'/>">
													</td>
												</tr>
											</tbody>
											
										</table>
								
									</div>
									</c:forEach>
									</div>	
									<input type="text" id="langLastListNo" name="langLastListNo" value="${langLastListNo }"/>
									<span class="btn-pack btn-type_2" style="margin-left:5px;">
				                    	<a class="" id="langAddbtn" href="#" onclick="addDynamicTable('lang');"><span class="ico_v2"></span>추 가</a>
				                    </span>
				                    <span class="btn-pack btn-type_2" style="margin-left:5px;">
				                       	<a class="" id="langDeletebtn" href="#" onclick="deleteDynamicTable('lang');"><span class="ico_x2"></span>삭 제</a>
				                    </span>
									
									
								</c:when>
								<c:when test="${appListCode =='CERTI01'}">
									<section style="padding-top: 2%; padding-bottom: 0%"></section>
											
									<h3><c:out value="${fil.app_list_code_name }"></c:out></h3>
									
									<c:set var="certiLastListNo" value="0"/>	
									<div id="certiDivHead">	
									<c:forEach var="certi" items="${appUserDetailMap.CERTI01 }">
									<c:set var="certiLastListNo" value="${certi[0].list_no }"/>
									<div class="listType3 mt10" id="certiDiv${certi[0].list_no }">									
										<table summary="">
											<colgroup>
												<col width="180px" />
												<col width="*%" />
												<col width="15%" />
												<col width="*% " />
											</colgroup>
											
											<tbody>										
												<tr class="odd">
													<th style="text-align: center;"><c:out value="${certi[0].app_item_name}"/> </th>
													<td colspan="3" scope="col">
														<input type="text" id="certiInputId${certi[0].list_no }" name="${certi[0].app_item_no}|${certi[0].list_no }" value="<c:out value='${certi[0].app_item_content}'/>">
													</td>
												</tr>
												<tr class="even">
													<th style="text-align: center;"><c:out value="${certi[1].app_item_name}"/></th>
													<td><input type="text" id="certiInputId${certi[1].list_no }" name="${certi[1].app_item_no}|${certi[1].list_no }" value="<c:out value='${certi[1].app_item_content}'/>"></td>
													<th style="text-align: center;"><c:out value="${certi[2].app_item_name}"/></th>
													<td>
														<input type="text" id="certiInputId${certi[2].list_no }" name="${certi[2].app_item_no}|${certi[2].list_no }" value="<c:out value='${certi[2].app_item_content}'/>">
													</td>
												</tr>
									
											</tbody>
										</table>
									</div>
									</c:forEach>
									</div>
									<input type="text" id="certiLastListNo" name="certiLastListNo" value="${certiLastListNo }"/>
									<span class="btn-pack btn-type_2" style="margin-left:5px;">
				                    	<a class="" id="certiAddbtn" href="#" onclick="addDynamicTable('certi');"><span class="ico_v2"></span>추 가</a>
				                    </span>
				                    <span class="btn-pack btn-type_2" style="margin-left:5px;">
				                       	<a class="" id="certiDeletebtn" href="#" onclick="deleteDynamicTable('certi');"><span class="ico_x2"></span>삭 제</a>
				                    </span>
								</c:when>							
								<c:when test="${appListCode =='EDU01'}">
									<section style="padding-top: 2%; padding-bottom: 0%"></section>
											
									<h3><c:out value="${fil.app_list_code_name }"></c:out></h3>
									
									<c:set var="eduLastListNo" value="0"/>	
									<div id="eduDivHead">	
									<c:forEach var="edu" items="${appUserDetailMap.EDU01 }">
									<c:set var="eduLastListNo" value="${edu[0].list_no }"/>
									<div class="listType3 mt10" id="eduDiv${edu[0].list_no }">	
									
										<table summary="">
											<colgroup>
												<col width="180px" />
												<col width="*%" />
												<col width="15%" />
												<col width="*% " />
											</colgroup>
											<tbody>
											
												<tr class="odd">
													<th style="text-align: center;"><c:out value="${edu[0].app_item_name}"/></th>
													<td colspan="3" scope="col">
														<input type="text" id="eduInputId${edu[0].list_no }" name="${edu[0].app_item_no}|${edu[0].list_no }" value="<c:out value='${edu[0].app_item_content}'/>">
													</td>
												</tr>
												<tr class="even">
													<th style="text-align: center;"><c:out value="${edu[1].app_item_name}"/></th>
													<td><input type="text" id="eduInputId${edu[1].list_no }" name="${edu[1].app_item_no}|${edu[1].list_no }" value="<c:out value='${edu[1].app_item_content}'/>"></td>
													<th style="text-align: center;"><c:out value="${edu[2].app_item_name}"/></th>
													<td>
														<input type="text" id="eduInputId${edu[2].list_no }" name="${edu[2].app_item_no}|${edu[2].list_no }" value="<c:out value='${edu[2].app_item_content}'/>"> ~
														<input type="text" id="eduInputId${edu[3].list_no }" name="${edu[3].app_item_no}|${edu[3].list_no }" value="<c:out value='${edu[3].app_item_content}'/>">
													</td>
												</tr>
												<tr class="odd">
													<th style="text-align: center;"><c:out value="${edu[4].app_item_name}"/></th>
													<td colspan="3" scope="col">
														<input type="text" id="eduInputId${edu[4].list_no }" name="${edu[4].app_item_no}|${edu[4].list_no }" value="<c:out value='${edu[4].app_item_content}'/>">
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									</c:forEach>
									</div>
									<input type="text" id="eduLastListNo" name="eduLastListNo" value="${eduLastListNo }"/>
									<span class="btn-pack btn-type_2" style="margin-left:5px;">
				                    	<a class="" id="eduAddbtn" href="#" onclick="addDynamicTable('edu');"><span class="ico_v2"></span>추 가</a>
				                    </span>
				                    <span class="btn-pack btn-type_2" style="margin-left:5px;">
				                       	<a class="" id="eduDeletebtn" href="#" onclick="deleteDynamicTable('edu');"><span class="ico_x2"></span>삭 제</a>
				                    </span>
								</c:when>
								<c:when test="${appListCode =='EXP01'}">
									<section style="padding-top: 2%; padding-bottom: 0%"></section>
											
									<h3><c:out value="${fil.app_list_code_name }"></c:out></h3>
									<c:set var="expLastListNo" value="0"/>	
									<div id="expDivHead">	
									<c:forEach var="exp" items="${appUserDetailMap.EXP01 }">
									<c:set var="expLastListNo" value="${exp[0].list_no }"/>
									<div class="listType3 mt10" id="expDiv${exp[0].list_no }">										
										<table summary="">
											<colgroup>
												<col width="180px" />
												<col width="*%" />
												<col width="15%" />
												<col width="*% " />
											</colgroup>
											<tbody>
											
												<tr class="odd">
													<th style="text-align: center;"><c:out value="${exp[0].app_item_name}"/></th>
													<td scope="col">
														<input type="text" id="expInputId${exp[0].list_no }" name="${exp[0].app_item_no}|${exp[0].list_no }" value="<c:out value='${exp[0].app_item_content}'/>">
													</td>
													<th style="text-align: center;"><c:out value="${exp[1].app_item_name}"/></th>
													<td>
														<input type="text" id="expInputId${exp[1].list_no }" name="${exp[1].app_item_no}|${exp[1].list_no }" value="<c:out value='${exp[1].app_item_content}'/>">~
														<input type="text" id="expInputId${exp[2].list_no }" name="${exp[2].app_item_no}|${exp[2].list_no }" value="<c:out value='${exp[2].app_item_content}'/>">
													</td>
												</tr>
												<tr class="even">
													<th style="text-align: center;"><c:out value="${exp[3].app_item_name}"/></th>
													<td colspan="3" scope="col">
														<input type="text" id="expInputId${exp[3].list_no }" name="${exp[3].app_item_no}|${exp[3].list_no }" value="<c:out value='${exp[3].app_item_content}'/>">
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									</c:forEach>
									</div>
									<input type="text" id="expLastListNo" name="expLastListNo" value="${expLastListNo }"/>
									<span class="btn-pack btn-type_2" style="margin-left:5px;">
				                    	<a class="" id="expAddbtn" href="#" onclick="addDynamicTable('exp');"><span class="ico_v2"></span>추 가</a>
				                    </span>
				                    <span class="btn-pack btn-type_2" style="margin-left:5px;">
				                       	<a class="" id="expDeletebtn" href="#" onclick="deleteDynamicTable('exp');"><span class="ico_x2"></span>삭 제</a>
				                    </span>
								</c:when>
								<c:when test="${appListCode =='AWARD01'}">
									<section style="padding-top: 2%; padding-bottom: 0%"></section>
											
									<h3><c:out value="${fil.app_list_code_name }"></c:out></h3>
									<c:set var="awardLastListNo" value="0"/>	
									<div id="awardDivHead">	
									<c:forEach var="award" items="${appUserDetailMap.AWARD01 }">
									<c:set var="awardLastListNo" value="${award[0].list_no }"/>
									<div class="listType3 mt10" id="awardDiv${award[0].list_no }">
										<table summary="">
											<colgroup>
												<col width="180px" />
												<col width="*%" />
												<col width="15%" />
												<col width="*% " />
											</colgroup>
											<tbody>
											
												<tr class="odd">
													<th style="text-align: center;"><c:out value="${award[0].app_item_name}"/></th>
													<td colspan="3" scope="col">
														<input type="text" id="awardInputId${award[0].list_no }" name="${award[0].app_item_no}|${award[0].list_no }" value="<c:out value='${award[0].app_item_content}'/>">
													</td>
												</tr>
												<tr class="even">
													<th style="text-align: center;"><c:out value="${award[1].app_item_name}"/></th>
													<td scope="col">
														<input type="text" id="awardInputId${award[1].list_no }" name="${award[1].app_item_no}|${award[1].list_no }" value="<c:out value='${award[1].app_item_content}'/>">
													</td>
													<th style="text-align: center;"><c:out value="${award[2].app_item_name}"/></th>
													<td>
														<input type="text" id="awardInputId${award[2].list_no }" name="${award[2].app_item_no}|${award[2].list_no }" value="<c:out value='${award[2].app_item_content}'/>">
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									</c:forEach>
									</div>
									<input type="text" id="awardLastListNo" name="awardLastListNo" value="${awardLastListNo }"/>
									<span class="btn-pack btn-type_2" style="margin-left:5px;">
				                    	<a class="" id="awardAddbtn" href="#" onclick="addDynamicTable('award');"><span class="ico_v2"></span>추 가</a>
				                    </span>
				                    <span class="btn-pack btn-type_2" style="margin-left:5px;">
				                       	<a class="" id="awardDeletebtn" href="#" onclick="deleteDynamicTable('award');"><span class="ico_x2"></span>삭 제</a>
				                    </span>
								</c:when>
								<c:when test="${appListCode =='ACTIV01'}">
									<section style="padding-top: 2%; padding-bottom: 0%"></section>
											
									<h3><c:out value="${fil.app_list_code_name }"></c:out></h3>
									<c:set var="activLastListNo" value="0"/>	
									<div id="activDivHead">	
									<c:forEach var="activ" items="${appUserDetailMap.ACTIV01 }">
									<c:set var="activLastListNo" value="${activ[0].list_no }"/>
									<div class="listType3 mt10" id="activDiv${activ[0].list_no }">
										<table summary="">
											<colgroup>
												<col width="180px" />
												<col width="*%" />
												<col width="15%" />
												<col width="*% " />
											</colgroup>
											<tbody>
											
												<tr class="odd">
													<th style="text-align: center;"><c:out value="${activ[0].app_item_name}"/></th>
													<td colspan="3" scope="col">
														<input type="text" id="activInputId${activ[0].list_no }" name="${activ[0].app_item_no}|${activ[0].list_no }" value="<c:out value='${activ[0].app_item_content}'/>">
													</td>
												</tr>
												<tr class="even">
													<th style="text-align: center;"><c:out value="${activ[1].app_item_name}"/></th>
													<td scope="col">
														<input type="text" id="activInputId${activ[1].list_no }" name="${activ[1].app_item_no}|${activ[1].list_no }" value="<c:out value='${activ[1].app_item_content}'/>">
													</td>
													<th style="text-align: center;"><c:out value="${activ[2].app_item_name}"/></th>
													<td>
														<input type="text" id="activInputId${activ[2].list_no }" name="${activ[2].app_item_no}|${activ[2].list_no }" value="<c:out value='${activ[2].app_item_content}'/>">~
														<input type="text" id="activInputId${activ[3].list_no }" name="${activ[3].app_item_no}|${activ[3].list_no }" value="<c:out value='${activ[3].app_item_content}'/>">
													</td>
												</tr>
												<tr class="odd">
													<th style="text-align: center;"><c:out value="${activ[4].app_item_name}"/></th>
													<td colspan="3" scope="col">
														<input type="text" id="activInputId${activ[4].list_no }" name="${activ[4].app_item_no}|${activ[4].list_no }" value="<c:out value='${activ[4].app_item_content}'/>">
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									</c:forEach>
									</div>
									<input type="text" id="activLastListNo" name="activLastListNo" value="${activLastListNo }"/>
									<span class="btn-pack btn-type_2" style="margin-left:5px;">
				                    	<a class="" id="activAddbtn" href="#" onclick="addDynamicTable('activ');"><span class="ico_v2"></span>추 가</a>
				                    </span>
				                    <span class="btn-pack btn-type_2" style="margin-left:5px;">
				                       	<a class="" id="activDeletebtn" href="#" onclick="deleteDynamicTable('activ');"><span class="ico_x2"></span>삭 제</a>
				                    </span>
								</c:when>
								<c:when test="${appListCode =='CAREER01'}">
									<section style="padding-top: 2%; padding-bottom: 0%"></section>
											
									<h3><c:out value="${fil.app_list_code_name }"></c:out></h3>
									<c:set var="careerLastListNo" value="0"/>	
									<div id="careerDivHead">	
									<c:forEach var="career" items="${appUserDetailMap.CAREER01 }">
									<c:set var="careerLastListNo" value="${career[0].list_no }"/>
									<div class="listType3 mt10" id="careerDiv${career[0].list_no }">
								
										<table summary="">
											<colgroup>
												<col width="180px" />
												<col width="*%" />
												<col width="15%" />
												<col width="*% " />
											</colgroup>
											<tbody>
											
												<tr class="odd">
													<th style="text-align: center;"><c:out value="${career[0].app_item_name}"/></th>
													<td colspan="3" scope="col">
														<input type="text" id="careerInputId${career[0].list_no }" name="${career[0].app_item_no}|${career[0].list_no }" value="<c:out value='${career[0].app_item_content}'/>">
													</td>
												</tr>
												<tr class="even">
													<th style="text-align: center;"><c:out value="${career[1].app_item_name}"/></th>
													<td scope="col">
														<input type="text" id="careerInputId${career[1].list_no }" name="${career[1].app_item_no}|${career[1].list_no }" value="<c:out value='${career[1].app_item_content}'/>">
													</td>
													<th style="text-align: center;"><c:out value="${career[2].app_item_name}"/></th>
													<td>
														<input type="text" id="careerInputId${career[2].list_no }" name="${career[2].app_item_no}|${career[2].list_no }" value="<c:out value='${career[2].app_item_content}'/>">
													</td>
												</tr>
												<tr class="odd">
													<th style="text-align: center;"><c:out value="${career[3].app_item_name}"/></th>
													<td colspan="3" scope="col">
														<input type="text" id="careerInputId${career[3].list_no }" name="${career[3].app_item_no}|${career[3].list_no }" value="<c:out value='${career[3].app_item_content}'/>"> ~
														<input type="text" id="careerInputId${career[4].list_no }" name="${career[4].app_item_no}|${career[4].list_no }" value="<c:out value='${career[4].app_item_content}'/>">
											
													</td>
												</tr>
												<tr class="even">
													<th style="text-align: center;"><c:out value="${career[5].app_item_name}"/></th>
													<td colspan="3" scope="col">
														<input type="text" id="careerInputId${career[5].list_no }" name="${career[5].app_item_no}|${career[5].list_no }" value="<c:out value='${career[5].app_item_content}'/>"> 
														<input type="text" id="careerInputId${career[6].list_no }" name="${career[6].app_item_no}|${career[6].list_no }" value="<c:out value='${career[6].app_item_content}'/>">  
													</td>
												</tr>
												<tr class="odd">
													<th style="text-align: center;"><c:out value="${career[7].app_item_name}"/></th>
													<td scope="col">
														<input type="text" id="careerInputId${career[7].list_no }" name="${career[7].app_item_no}|${career[7].list_no }" value="<c:out value='${career[7].app_item_content}'/> ">
													</td>
													<th style="text-align: center;"><c:out value="${career[8].app_item_name}"/></th>
													<td>
														<input type="text" id="careerInputId${career[8].list_no }" name="${career[8].app_item_no}|${career[8].list_no }" value="<c:out value='${career[8].app_item_content}'/> ">
													</td>
												</tr>
												<tr class="odd">
													<th style="text-align: center;"><c:out value="${career[9].app_item_name}"/></th>
													<td colspan="3" scope="col">
														<input type="text" id="careerInputId${career[9].list_no }" name="${career[9].app_item_no}|${career[9].list_no }" value="<c:out value='${career[9].app_item_content}'/>"> 
													</td>
												</tr>
												<tr class="even">
													<th rowspan="2" scope="col" style="text-align: center;"><c:out value="${career[10].app_item_name}"/></th>
													<td colspan="3" scope="col">
														영업활동에서 주로 활용하는 기법을 기술해 주시기 바랍니다. (예: 동호회활동, 내방고객 위주 등)
													</td>
												</tr>
												<tr class="odd">
													<td colspan="3" scope="col">
														<input type="text" id="careerInputId${career[10].list_no }" name="${career[10].app_item_no}|${career[10].list_no }" value="<c:out value='${career[10].app_item_content}'/>">
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									</c:forEach>
									</div>
									<input type="text" id="careerLastListNo" name="careerLastListNo" value="${careerLastListNo }"/>
									<span class="btn-pack btn-type_2" style="margin-left:5px;">
				                    	<a class="" id="careerAddbtn" href="#" onclick="addDynamicTable('career');"><span class="ico_v2"></span>추 가</a>
				                    </span>
				                    <span class="btn-pack btn-type_2" style="margin-left:5px;">
				                       	<a class="" id="careerDeletebtn" href="#" onclick="deleteDynamicTable('career');"><span class="ico_x2"></span>삭 제</a>
				                    </span>
								</c:when>
								<c:when test="${appListCode =='RESUME01'}">
									<section style="padding-top: 2%; padding-bottom: 0%"></section>
											
									<h3><c:out value="${fil.app_list_code_name }"></c:out></h3>
									<div class="listType3 mt10">
										<table summary="">
											<colgroup>
												<col width="180px" />
												<col width="*%" />
											</colgroup>
											<tbody>
												<tr class="odd">
													<th style="text-align: center;">성장과정</th>
													<td colspan="3" scope="col">
														<input type="textField" id="" name="" value="">
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</c:when>								
							</c:choose>							
						</c:forEach>
					</div>
					</article>
					</section>
				</div>
				<!--//contents-->
			
		
		<!--//contR:끝-->
	<!--//wrap:끝-->
	<jsp:include page="/WEB-INF/jsp/rms/main_bottom.jsp" />
</form>
</body>
</html> 
