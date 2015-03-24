<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="rms.com.recNotice.vo.RecNoticeVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>채용관리시스템</title>
<meta name="keyword" content="">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/rms/cmn/base.css'/>" />
<!--[if lt IE 9]>
		<script type="text/javascript" src="./common/js/respond.min.js"></script>
<![endif]-->
<!--[if lt IE 9]>
		<script type="text/javascript" src="./common/js/html5shiv.js"></script>
<![endif]-->
<script src="./Common/js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js" type="text/javascript"></script>

<script language="javascript">
$(function() {
	  $( "#rec_start_date, #rec_end_date" ).datepicker({
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

	$(function() {
		  $( "#check_start_date, #check_end_date" ).datepicker({
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
		
	$(function() {
		  $( "#announce_date" ).datepicker({
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

	
	function init()
	{
		if($("#message").val() != "")
		{
			alert($("#message").val());
		}
	}

function view_chk_tf(){ 

	var hubmain_chk_tf = document.getElementById("hubmain_view_tf_chk");    
	var main_chk_tf = document.getElementById("main_view_tf_chk");
	var front_chk_tf = document.getElementById("front_view_tf_chk");
	
	if(hubmain_chk_tf.checked==true){
		document.recNotiUpdateForm.hubmain_view_tf.value = "T";
	}else{
		document.recNotiUpdateForm.hubmain_view_tf.value = "F";
	}
	
	if(main_chk_tf.checked==true){
		document.recNotiUpdateForm.main_view_tf.value = "T";
	}else{
		document.recNotiUpdateForm.main_view_tf.value = "F";
	}
	
	if(front_chk_tf.checked==true){
		document.recNotiUpdateForm.front_view_tf.value = "T";
	}else{
		document.recNotiUpdateForm.front_view_tf.value = "F";
	}
	
	
	
	//필수체크
	if($("#rec_field_no").val()=="" || $("#career_div_code").val() == "" || $("#rec_prog_no").val() == "" || $("#app_from_no").val() == "")
	{
		alert("모집분야, 내용"+'<spring:message code="common.required.msg" />');
		$("#rec_field_no").focus();
	}
	else
	{
		if(confirm('<spring:message code="common.regist.msg" />'))
		{
			$("#recNotiUpdateForm").attr("action", "<c:url value='/rms/recNotice/updateRecNotice.do?rec_noti_no=${recNoticeContent.rec_noti_no }'/>").submit();
		}
	}
	
	
}



</script>


 
</head>

<body>
	<header><!--header:시작-->
    	<div dlass="hWrap"><!--hwrap:시작-->
            <h1><a href="#" class="ir">demo</a></h1>
            <nav id="gnb"><!--gnb:시작-->
                <ul class="gnbLst">
                    <li>
                        <h2 class="oD_1"><a href="#" class="on" >홈페이지관리</a></h2>
                    </li>
                    <li>
                    	<h2 class="oD_2"><a href="#">지원서관리</a></h2>
                   	</li>
                    <li>
                    	<h2 class="oD_3"><a href="#">계정관리</a></h2>
                   	</li>
                    <li>
                    	<h2 class="oD_4"><a href="#">항목관리</a></h2>
                    </li>
                    <li>
                    	<h2 class="oD_5"><a href="#">통계관리</a></h2>
                   	</li>
                    <li>
                    	<h2 class="oD_6"><a href="#">코드관리</a></h2>
                    </li>
                    <li>
                    	<h2 class="oD_7"><a href="#">서비스관리</a></h2>
                    </li>
                </ul>
            </nav><!--//gnb:끝-->
			<div class="utility">
                <a href="#"  class="btn_log">Logout</a>
            </div>
    	</div><!--//hwrapr:끝-->
	</header><!--//header:끝-->
    <div id="wrap">
    	<section id="contL">
        	<nav id="lnb"><!--gnb:시작-->
            	<h1><a class="lnb_h1_1">홈페이지관리</a></h1>
                <ul>
                	<li class=""><h2><a href="#">채용소식관리</a></h2></li>
                    <li class="on"><h2><a href="#" class="on">채용공고관리</a></h2></li>
                    <li class=""><h2><a href="#">Q&A 관리</a></h2></li>
                    <li class=""><h2><a href="#">FAQ 관리</a></h2></li>
                </ul>
            </nav><!--gnb:끝-->
        </section><!--//contL:끝-->
        <section id="contR"><!--contR:시작-->
        	<section class="cont_top">
                    <div class="path"><img src="/KCC_RMS/images/rms/cmn/btn/btn_path_home.gif" alt="home" />HOME &gt; 항목관리 &gt; <strong>지원서양식관리</strong></div>
                    <div class="name"><span class="name_st">관리자</span>님 반갑습니다.</div>
        	</section>
			<article>
            	<h1>채용공고관리</h1>
                <div class="contents">
                	<div class="listType1 mt30">
                	<form id="recNotiUpdateForm" name="recNotiUpdateForm" method="post">
             	   		<input type="hidden" id="message" name="message" value="${message}">
						<input type="hidden" id="hubmain_view_tf" name="hubmain_view_tf" value="F">
						<input type="hidden" id="main_view_tf" name="main_view_tf" value="F">
						<input type="hidden" id="front_view_tf" name="front_view_tf" value="F">
                        <table>
                            <caption>테이블</caption>
                            <colgroup>
                                <col style="width:13%" />
                                <col style="width:24%" />
                                <col style="width:13%" />
                                <col style="width:24%" />
                                <col style="width:13%" />
                                <col style="width:13%" />
                            </colgroup>
                            <tr>
                                <th scope="row">모집분야</th>
                                <td>
                                    <select id="rec_field_no" name="rec_field_no" class="select" title="모집분야" style="width:100px">
                                    	<option value="">선택</option>
                                        <c:forEach items="${recFieldList }" var="rfList">
                                        	<option value="${rfList.rec_field_no }" >${rfList.rec_field_name }</option>
                                        </c:forEach>
                                    </select>
                                    <select id="career_div_code" name="career_div_code" class="select" title="신입경력구분" style="width:100px">
                                    	<option value="">선택</option>
                                        <option value="CAD_0010">신입</option>
                                        <option value="CAD_0020">경력</option>
                                        <option value="CAD_0030">신입/경력</option>
                                    </select>
                                </td>
                                <th scope="row">응시기간</th>
                                <td>
                                    <input type="text" id="rec_start_date" name="rec_start_date" style="width:85px" class="ipt_listIn2" value="<fmt:formatDate value="${recNoticeContent.rec_start_date}" pattern="yyyy-MM-dd"/>">
                                     ~ 
                                     <input type="text" id="rec_end_date" name="rec_end_date" style="width:85px" class="ipt_listIn2" value="<fmt:formatDate value="${recNoticeContent.rec_end_date}" pattern="yyyy-MM-dd"/>"></p>
                                </td>
                                <th scope="row">합격발표일</th>
                                <td class="last">
                                    <input type="text" id="announce_date" name="announce_date" style="width:85px" class="ipt_listIn2" value="<fmt:formatDate value="${recNoticeContent.announce_date}" pattern="yyyy-MM-dd"/>">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">내용</th>
                                <td>
                                    <select id="rec_prog_no" name="rec_prog_no" class="rec_prog_no" title="채용절차" style="width:100px">
                                    		<option value="">선택</option>
                                    	<c:forEach items="${recProcessList }" var="rpList">
                                        	<option value="${rpList.rec_prog_no }">${rpList.rec_prog_name }</option>
                                        </c:forEach>
                                    </select>
                                    <select id="app_form_no" name="app_form_no" class="app_form_no" title="지원서양식" style="width:100px">
                                    		<option value="">선택</option>
                                        <c:forEach items="${appFormList }" var="afList">
                                        	<option value="${afList.app_form_no }">${afList.app_form_name }</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <th scope="row">검토기간</th>
                                <td class="last">
                                    <input type="text" id="check_start_date" name="check_start_date" style="width:85px" class="ipt_listIn2" value="<fmt:formatDate value="${recNoticeContent.check_start_date}" pattern="yyyy-MM-dd"/>">
                                     ~ 
                                     <input type="text" id="check_end_date" name="check_end_date" style="width:85px" class="ipt_listIn2" value="<fmt:formatDate value="${recNoticeContent.check_end_date}" pattern="yyyy-MM-dd"/>"></p>
                                </td>
                                <th scope="row">모집년도</th>
                                <td class="last">
                                    <select id="rec_year" name="rec_year" class="select" title="모집년도" style="width:85px">
                                    	<option value="">선택</option>
                                        <option value="2020">2020</option>
                                        <option value="2019">2019</option>
                                        <option value="2018">2018</option>
                                        <option value="2017">2017</option>
                                        <option value="2016">2016</option>
                                        <option value="2015">2015</option>
                                        <option value="2014">2014</option>
                                        <option value="2013">2013</option>
                                    </select>
                                </td>
                                <td colspan="2"></td>
                            </tr>
                        </table>
                    </div>
                	<div class="listType3 mt30">
                		<table summary="">
                            <colgroup>
                                <col width="15%" />
                                <col width="85% "/>
                            </colgroup>
                         	<tbody>
                         	    <tr class="even">
                                    <th>진행상태</th>
                                    <td>
                                    	<select id="state_code" name="state_code" class="select" style="width:100px">
                                    		<option value="">선택</option>
	                                    	<option value="STA_0010">진행중</option>
	                                    	<option value="STA_0020">마감</option>
                                    	</select>
                                    </td>
                                </tr>
                                <tr class="odd">
                                    <th>제목</th>
                                    <td class="left"><input type="text" id="rec_noti_title" name="rec_noti_title" style="width:650px;" class="ipt_listIn2" value="${recNoticeContent.rec_noti_title }"/></td>
                                </tr>
                                <tr class="even">
                                	<th>내용</th>
                                    <td class="left"><textarea type="text" id="rec_noti_content" name="rec_noti_content" style="width:650px; height:200px;" >${recNoticeContent.rec_noti_content }</textarea></td>
                                </tr>
                                <tr class="odd">
                                	<th>첨부파일</th>
                                    <td class="btn">
                                        <span class="btn-pack btn-type_2">
                                            <a class="" href="#"><span class="ico_file"></span>첨부하기</a></span>
                                        <span class="btn-pack btn-type_2">
                                            <a class="" href="#"><span class="ico_cancel"></span>삭 제</a></span>
                                        <div class="listType4 mt5">
                                                <table>
                                                    <caption>입사지원현황 통계</caption>
                                                    <colgroup>
                                                        <col style="width:5%" />
                                                        <col style="width:*%" />
                                                        <col style="width:12%" />
                                                        <col style="width:12%" />
                                                        <col style="width:12%" />
                                                    </colgroup>
                                                    <thead>
                                                        <tr> 
                                                            <th scope="col"><input name="" id="" class="" type="checkbox" /></th>
                                                            <th scope="col">파일명</th>
                                                            <th scope="col">용량</th>
                                                            <th scope="col">첨부방식</th>
                                                            <th scope="col" class="last">사용기간</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr class="odd">
                                                            <td><input name="" id="" class="" type="checkbox" /></td>
                                                            <td class="left">kcc정보통신 하반기 공개채용.xls</td>
                                                            <td><span class="num">3467kbyte</td>
                                                            <td>-</td>
                                                            <td class="last num">2014.05.15</td>
                                                        </tr>
                                                        <tr class="even">
                                                            <td><input name="" id="" class="" type="checkbox" /></td>
                                                            <td class="left">kcc정보통신 하반기 공개채용.xls</td>
                                                            <td><span class="num">3467kbyte</td>
                                                            <td>-</td>
                                                            <td class="last num">2014.05.15</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div><!--//테이블2-->
                                     </td>
                                </tr>
                                 <tr class="even">
                                	<th>노출위치</th>
                                    <td class="left">
                                    
	                                    <c:choose>
		                                		<c:when test="${recNoticeContent.main_view_tf == 'T' }">
		                                			 <label class="chk_label" ><input type="checkbox" class="chk" name="main_view_tf_chk" id="main_view_tf_chk" checked="checked" /><span class="chk_txt">메인</span></label>
		                                		</c:when>
		                                		<c:otherwise>
		                                			<label class="chk_label" ><input type="checkbox" class="chk" name="main_view_tf_chk" id="main_view_tf_chk" /><span class="chk_txt">메인</span></label>
		                                		</c:otherwise>
		                                	</c:choose>
		                                	<c:choose>
		                                		<c:when test="${recNoticeContent.hubmain_view_tf == 'T' }">
		                                			 <label class="chk_label" ><input type="checkbox" class="chk" name="hubmain_view_tf_chk" id="hubmain_view_tf_chk" checked="checked" /><span class="chk_txt">허브</span></label>
		                                		</c:when>
		                                		<c:otherwise>
		                                			<label class="chk_label" ><input type="checkbox" class="chk" name="hubmain_view_tf_chk" id="hubmain_view_tf_chk" /><span class="chk_txt">허브메인</span></label>
		                                		</c:otherwise>
		                                	</c:choose>
		                                    <c:choose>
		                                		<c:when test="${recNoticeContent.front_view_tf == 'T' }">
		                                			 <label class="chk_label" ><input type="checkbox" class="chk" name="front_view_tf_chk" id="front_view_tf_chk" checked="checked" /><span class="chk_txt">프론트</span></label>
		                                		</c:when>
		                                		<c:otherwise>
		                                			<label class="chk_label" ><input type="checkbox" class="chk" name="front_view_tf_chk" id="front_view_tf_chk" /><span class="chk_txt">프론트</span></label>
		                                		</c:otherwise>
		                                	</c:choose>
                                     </td> 
                                </tr>
                        	</tbody>
                    	</table>
                    </div><!--//테이블2-->
                    <div class="pager">
                    	<div class="paging_right">
                            <span class="btn-pack btn-type_1">
                        	<a class="" href="#" id="recNotiUpdate" onclick="view_chk_tf()"><span class="ico_v"></span>등 록</a>
                        </span>
                        <span class="btn-pack btn-type_5">
                        	<a class="" href="#" onclick="location.href='recNoticeContent.do?rec_noti_no=${recNoticeContent.rec_noti_no }'"><span class="ico_cancel"></span>취 소</a>
                        </span>
                        </form>
                        </div><!--//paging_right-->  
				    </div><!--//pager-->
                </div><!--//contents-->
            </article>
        </section><!--//contR:끝-->
    </div><!--//wrap:끝-->
    <footer>
        <div class="fWrap">
        	<span>COPYRIGHT ⓒ 2014 <b>CRM.</b></span>
        	<span>ALL RIGHT RESERVED.</span>
        </div>
	</footer>
</body>
</html>
