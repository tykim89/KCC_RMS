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
		var checkedValueId = getCheckedValue("fieldCheckBtn");
		$('#selectTarget').val(checkedValueId);

		$.post("<c:url value='/rms/check/checkUserListAjax.do'/>", $(
				"#checkResultForm").serialize(), function(html) {
			$("#assignedUserList").html(html);
		});
		
	}
	
	function loadCareerDiv() {
		var item = "";

		item = $("#careerDivSelect option:selected").val();

		$("#careerDiv").val(item);

	}

	function loadCheckRes() {
		var item = "";

		item = $("#checkResSelect option:selected").val();

		$("#checkRes").val(item);
	}
	


</script>
</head>

<body onload="firstMenuList();">
	<jsp:include page="/WEB-INF/jsp/rms/main_top.jsp" />

	<form id="checkResultForm" name="checkResultForm" action=""	method="post">
		<input type="hidden" id="message" name="message" value="${message}">
		<input type="hidden" id="selectTarget" name="selectTarget" value="">
		<input type="hidden" id="careerDiv" name="careerDiv" value="">
		<input type="hidden" id="checkRes" name="checkRes" value="">
		
		<div id="wrap">
			<jsp:include page="/WEB-INF/jsp/rms/main_left.jsp" />
		
			<section id="contR"><!--contR:시작-->
        	<section class="cont_top">
                    <div class="path"><img src="/KCC_RMS/images/rms/cmn/btn/btn_path_home.gif" alt="home" />HOME &gt; 항목관리 &gt; <strong>지원서양식관리</strong></div>
                    <div class="name"><span class="name_st">관리자</span>님 반갑습니다.</div>
        	</section>
			<article>
            	<h1>검토결과조회</h1>
                <div class="contents">
                	<div class="listSearch">
                        <span class="btn-pack btn-type_5">
                        	<a class="" href="#" onClick="selectUserListByAdmin()"><span class="ico_ser"></span>검 색</a>
                        </span>
                   	</div>
                	<div id="assignedUserList" class="listType1 mt10">
                        <table>
                            <caption>테이블</caption>
                            <colgroup>
                                <col style="width:100px;" />
                                <col style="width:*" />
                                <col style="width:120px;" />
                                <col style="width:*" />
                                <col style="width:120px;" />
                                <col style="width:*" />
                                <col style="width:100px;" />
                                <col style="width:*" />
                            </colgroup>
                            <tr>
							<th scope="row">지원분야</th>
								<c:set var="j" value="1" />
								<td colspan="7">
									<c:forEach var="i" items="${recFieldList}" varStatus="st">
										<label class="chk_label"> <input type="checkbox" id="fieldCheckBtn" name="fieldCheckBtn${st.index}"
											value="${i.rec_field_name}"> 
											<spanclass="chk_txt">${i.rec_field_name}</span>
										</label>
									</c:forEach>
								</td>
							</tr>
                            <tr>
                                <th scope="row">경력구분</th>
                                <td>
                                    <select id="careerDivSelect" class="select" title=""
										style="width: 185px" onchange="loadCareerDiv()">
										<option value="">전체</option>
										<c:forEach var="i" items="${ careerDivList }" varStatus="st">
											<option value="${i.career_div_code}">${i.career_div_name}</option>
										</c:forEach>
									</select>
                                </td>
                                
                                <th scope="row">검토결과</th>
                                <td>
                                    <select id="checkResSelect" class="select" title=""
										style="width: 185px" onchange="loadCheckRes()">
										<option value="">전체</option>
										<c:forEach var="i" items="${ checkResList }" varStatus="st">
											<option value="${i.check_res_code}">${i.check_res_name}</option>
										</c:forEach>
									</select>
                                </td>
                                <th scope="row">거주지역</th>
                                <td>
                                    <select id="addrSelect" class="select" title=""
										style="width: 185px" onchange="loadAddrArea()">
										<option value="">전체</option>
									</select>
                                </td>
                            </tr>
                            <tr>
                           	  <th scope="row">이름</th>
                              <td colspan="3" class="btn">
                              	<input type="text" id="appUserName" name="appUserName" style="width:180px;"class="ipt_listIn" />
                              </td>
                            	<th scope="row">입사지원일시</th>
                                <td colspan="3" class="btn">
                                    <input type="tel" id="" name="" style="width:80px;" class="ipt_listIn2" />
                                    <span class="btn-pack btn-type_2" style="margin-left:5px;">
                                  		<a class="" href="#"><span class="ico_calendar"></span></a>
                                    </span>
                                    ~
                                    <input type="tel" id="" name="" style="width:80px;" class="ipt_listIn2" />
                                    <span class="btn-pack btn-type_2" style="margin-left:5px;">
                                  		<a class="" href="#"><span class="ico_calendar"></span></a>
                                    </span>
                                </td>
                        	</tr>
                        </table>
                    </div>
                	<!--//테이블2-->
                	<div class="listSearch mt20">
                    	<span class="btn-pack btn-type_5">
                        	<a class="" href="#">검토결과 </a>
                        </span>
                        <span class="btn-pack btn-type_5">
                        	<a class="" href="#">보류관리</a>
                        </span>
                        <span class="btn-pack btn-type_5">
                        	<a class="" href="#">의견등록</a>
                        </span>
                        <span class="btn-pack btn-type_5">
                        	<a class="" href="#"><span class="ico_print"></span>출 력</a>
                        </span>
                        <span class="btn-pack btn-type_1">
                        	<a class="" href="#"><span class="ico_down"></span>지원서다운로드</a>
                        </span>
                        <span class="btn-pack btn-type_1">
                        	<a class="" href="#"><span class="ico_down"></span>이력항목다운로드</a>
                        </span>
                   	</div>
                    <div class="listType2 mt10">
                        <table>
                            <caption>테이블</caption>
                            <colgroup>
                                <col style="width:5%"/>
                                <col style="width:5%"/>
                                <col style="width:*%"/>
                                <col style="width:*%"/>
                                <col style="width:10%"/>
                                <col style="width:*%"/>
                                <col style="width:*%"/>
                                <col style="width:*%"/>
                                <col style="width:*%"/>
                                <col style="width:*%"/>
                                <col style="width:*%"/>
                                <col style="width:*%"/>
                                <col style="width:*%"/>
                                <col style="width:*%"/>
                            </colgroup>
                            <thead>
                                <tr> 
                                	<th scope="col"  rowspan="2"><input name="checkUserBtn" id="checkUserBtn" class="" type="checkbox" /></th>
                                    <th scope="col"  rowspan="2">번 호</th>
                                    <th scope="col"  rowspan="2">지원분야</th>
                                    <th scope="col"  rowspan="2">경력구분</th>
                                    <th scope="col"  rowspan="2">입사지원일시</th>
                                    <th scope="col"  rowspan="2">이름</th>
                                    <th scope="col"  rowspan="2">생년월일 (만나이)</th>
                                    <th scope="col"  rowspan="2">검토결과</th>
                                    <th scope="col"  rowspan="2">보류순위</th>
                                    <th scope="col"  rowspan="2">거주지역</th>
                                    <th scope="col"  rowspan="2">성별</th>
                                    <th scope="col"  rowspan="2">병역사항</th>
                                    <th scope="col"  rowspan="2">어학사항</th>
                                    <th scope="col"  rowspan="2" class="last">최종학력</th>
                                </tr>
                            </thead>
                            <tbody>
								<tr>
									<td colspan="14" style="text-align: center;"><spring:message code="info.nodata.msg" /></td>
								</tr>
							</tbody>
                            <!-- <tbody>
                                <tr class="odd">
                                	<td scope="col"><input name="" id="" class="" type="checkbox" /></td>
                                    <td class="left num">1</td>
                                    <td class="left">웹개발</td>
                                    <td class="left">신입</td>
                                    <td class="left num">2014.04.23</td>
                                    <td class="left">박경미</td>
                                    <td class="left">서울</td>
                                    <td class="left tb_style_1 font_color_red">합격</td>
                                    <td class="left tb_style_1 font_color_red">합격</td>
                                    <td class="left tb_style_1 font_color_red">합격</td>
                                    <td class="btn_O">O</td>
                                    <td class="left tb_style_1 font_color_red">합격</td>
                                    <td class="left tb_style_1 font_color_red last">합격</td>
                                </tr>
                                <tr class="even">
                                	<td scope="col"><input name="" id="" class="" type="checkbox" /></td>
                                    <td class="left num">1</td>
                                    <td class="left">웹개발</td>
                                    <td class="left">신입</td>
                                    <td class="left num">2014.04.23</td>
                                    <td class="left">박경미</td>
                                    <td class="left">서울</td>
                                    <td class="left tb_style_1">불합격</td>
                                    <td class="left tb_style_1">불합격</td>
                                    <td class="left tb_style_1">불합격</td>
                                    <td class="btn_X">N</td>
                                    <td class="left tb_style_1">불합격</td>
                                    <td class="left tb_style_1 last">불합격</td>
                                </tr>
                            </tbody> -->
                        </table>
                    </div><!--//테이블2-->
                    <!-- <div class="pager">
				    	<div class="paging">
							<a href="#" class="prev"><img src="./common/images/btn/btn_prev.gif" alt="이전"></a>
							<span class="current" >1</span>
                            <span><a href="#" >2</a></span>
                            <span><a href="#" >3</a></span>
                            <span><a href="#" >4</a></span>
                            <span><a href="#" >5</a></span>
                            <span><a href="#" >6</a></span>
                            <span><a href="#" >7</a></span>
                            <span><a href="#" >8</a></span>
                            <span><a href="#" >9</a></span>
                            <span><a href="#" >10</a></span>
                            <a href="#"class="next"><img src="./common/images/btn/btn_next.gif" alt="다음"></a>
						</div>//paging  
				    </div>//pager -->
                </div><!--//contents-->
            </article>
        </section><!--//contR:끝-->
    </div><!--//wrap:끝-->
    </form>
    <jsp:include page="/WEB-INF/jsp/rms/main_bottom.jsp" />
    
</body>
</html>
