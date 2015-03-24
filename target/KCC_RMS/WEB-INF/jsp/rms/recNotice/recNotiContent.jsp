<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>채용관리시스템</title>
<meta name="keyword" content="">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/rms/cmn/base.css'/>" />

<script src="./Common/js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>

 
<script language="javascript">

function init()
{
	if($("#message").val() != "")
	{
		alert($("#message").val());
	}
}

//삭제 
function deleteRecNotice()
{
    var fcf  = document.recNotiContentForm;

    if( confirm('<spring:message code="common.delete.msg" />') )
    {
    	fcf.action = './deleteRecNotice.do?rec_noti_no=${recNoticeContent.rec_noti_no}';
    }

    fcf.submit();
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
              	    <form id="recNotiContentForm" name="recNotiContentForm" method="post">
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
                                    <select id="select01" class="select" title="모집분야" style="width:100px">
                                        <option id="" value="">${recNoticeContent.rec_field_name} </option>
                                    </select>
                                    <select id="select02" class="select" title="경력" style="width:100px">
                                        <option value="">${recNoticeContent.career_div_code}</option>
                                    </select>
                                </td>
                                <th scope="row">응시기간</th>
                                <td>
                                    <select id="select03" class="select" title="응시일자 선택" style="width:90px">
                                        <option><fmt:formatDate value="${recNoticeContent.rec_start_date}" pattern="yyyy-MM-dd"/></option>
                                    </select> ~ 
                                    <select class="select4" title="응시마감 선택" style="width:90px">
                                        <option><fmt:formatDate value="${recNoticeContent.rec_end_date}" pattern="yyyy-MM-dd"/></option>
                                    </select>
                                </td>
                                <th scope="row">합격발표일</th>
                                <td class="last">
                                    <select class="select9" title="응시마감 선택" style="width:90px">
                                        <option><fmt:formatDate value="${recNoticeContent.announce_date}" pattern="yyyy-MM-dd"/></option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">내용</th>
                                <td>
                                    <select id="select05" class="select" title="채용절차" style="width:100px">
                                        <option id="" value="">${recNoticeContent.rec_prog_name}</option>
                                    </select>
                                    <select id="select06" class="select" title="양식" style="width:100px">
                                        <option value=""> ${recNoticeContent.app_form_name}</option>
                                    </select>
                                </td>
                                <th scope="row">검토기간</th>
                                <td class="last">
                                    <select id="select07" class="select" title="응시일자 선택" style="width:90px">
                                        <option><fmt:formatDate value="${recNoticeContent.check_start_date}" pattern="yyyy-MM-dd"/></option>
                                    </select> ~ 
                                    <select class="select8" title="응시마감 선택" style="width:90px">
                                        <option><fmt:formatDate value="${recNoticeContent.check_end_date}" pattern="yyyy-MM-dd"/></option>
                                    </select>
                                </td>
                                <th scope="row">모집년도</th>
                                <td class="last">
                                    <select id="select010" class="select" title="모집년도" style="width:90px">
                                        <option>${recNoticeContent.rec_year}</option>
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
	                                    	<option value="">${recNoticeContent.state_code }</option>
                                    	</select>
                                    </td>
                                </tr>
                                <tr class="odd">
                                    <th>제목</th>
                                    <td class="left"><input type="text" id="" name="" style="width:650px;" class="ipt_listIn2" readonly="readonly" value="${recNoticeContent.rec_noti_title}"/></td>
                                </tr>
                                <tr class="even">
                                	<th>작성자</th>
                                    <td class="left"><input type="text" id="" name="" style="width:350px;" class="ipt_listIn2" readonly="readonly" value="${recNoticeContent.writer }" /></td>
                                </tr>
                                <tr class="odd">
                                	<th>작성일</th>
                                    <td class="left"><input type="text" id="" name="" style="width:350px;" class="ipt_listIn2 num" readonly="readonly" value="<fmt:formatDate value="${recNoticeContent.write_date }" pattern="yyyy-MM-dd"/>" /></td> 
                                </tr>
                                <tr class="even">
                                	<th>내용</th>
                                    <td class="left"><textarea type="text" id="" name="" style="width:650px; height:200px;" readonly="readonly">${recNoticeContent.rec_noti_content}</textarea></td>
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
                                                        <tr class="even">
                                                            <td><input name="" id="" class="" type="checkbox" /></td>
                                                            <td class="left">${recNoticeContent.att_file_code}</td>
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
	                                			 <label class="chk_label" ><input type="checkbox" class="chk" name="" id="" checked="checked" onclick="return(false)"/><span class="chk_txt">메인</span></label>
	                                		</c:when>
	                                		<c:otherwise>
	                                			<label class="chk_label" ><input type="checkbox" class="chk" name="" id="" onclick="return(false)"/><span class="chk_txt">메인</span></label>
	                                		</c:otherwise>
	                                	</c:choose>
	                                	
	                                	<c:choose>
	                                		<c:when test="${recNoticeContent.hubmain_view_tf == 'T' }">
	                                			 <label class="chk_label" ><input type="checkbox" class="chk" name="" id="" checked="checked" onclick="return(false)"/><span class="chk_txt">허브</span></label>
	                                		</c:when>
	                                		<c:otherwise>
	                                			<label class="chk_label" ><input type="checkbox" class="chk" name="" id="" onclick="return(false)"/><span class="chk_txt">허브메인</span></label>
	                                		</c:otherwise>
	                                	</c:choose>
	                                	
	                                    <c:choose>
	                                		<c:when test="${recNoticeContent.front_view_tf == 'T' }">
	                                			 <label class="chk_label" ><input type="checkbox" class="chk" name="" id="" checked="checked" onclick="return(false)"/><span class="chk_txt">프론트</span></label>
	                                		</c:when>
	                                		<c:otherwise>
	                                			<label class="chk_label" ><input type="checkbox" class="chk" name="" id="" onclick="return(false)"/><span class="chk_txt">프론트</span></label>
	                                		</c:otherwise>
	                                	</c:choose>
                                	
                                     </td> 
                                </tr>
                        	</tbody>
                    	</table>
                    </div><!--//테이블2-->
                    <div class="pager">
                    	<div class="paging_right">
                    	    <span class="btn-pack btn-type_5">
                        		<a class="" href="#" onclick="document.location.href='./recNoticeList.do'"><span class="ico_list"></span>목 록</a>
                            </span>
                         	<span class="btn-pack btn-type_5">
                        		<a class="" href="#" onclick="document.location.href='./updateRecNoticeForm.do?rec_noti_no=${recNoticeContent.rec_noti_no }'"><span class="ico_modify"></span>수 정</a>
                            </span>
                            <span class="btn-pack btn-type_4">
                                <a class="" href="#" onclick="deleteRecNotice()"><span class="ico_x"></span>삭 제</a>
                            </span>
                        </div><!--//paging_right-->  
				    	</form>
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
