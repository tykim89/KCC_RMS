<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="rms.com.faq.vo.FaqVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.*"%>

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
 

 
<script language="javascript">


$(document).ready(function(){
	var category="${faqContent.faq_type_code}";
	$("#faq_type_code").val(category);
}); 


function init()
{
	if($("#message").val() != "")
	{
		alert($("#message").val());
	}
}

//FAQ 수정
function updateFaq()
{

	//필수체크
	if($("#faq_type_code").val()=="" || $("#faq_quest_content").val() == "")
	{
		alert("질문유형, FAQ제목"+'<spring:message code="common.required.msg" />');
		$("#faq_quest_content").focus();
	}
	else
	{
		if(confirm('<spring:message code="common.update.msg" />'))
		{

			$("#faqUpdateForm").attr("action", "<c:url value='/rms/faq/updateFaq.do?faq_no=${faqContent.faq_no}'/>").submit();
		}
	}
}



	
</script>
 
 
 
</head>

<body onload="firstMenuList();">
<jsp:include page="/WEB-INF/jsp/rms/main_top.jsp"/>
    <div id="wrap">
    <jsp:include page="/WEB-INF/jsp/rms/main_left.jsp"/>
        <section id="contR"><!--contR:시작-->
        	<section class="cont_top">
                    <div class="path"><img src="/KCC_RMS/images/rms/cmn/btn/btn_path_home.gif" alt="home" />HOME &gt; 홈페이지관리 &gt; FAQ관리 &gt; <strong>FAQ수정</strong></div>
                    <div class="name"><span class="name_st">관리자</span>님 반갑습니다.</div>
        	</section>
			<article>
            	<h1>FAQ관리</h1>
                <div class="contents">
                	<div class="listType3 mt30">
                		<form id="faqUpdateForm" name="faqUpdateForm" method="post">
           				<input type="hidden" id="message" name="message" value="${message}">
                		<table summary="">
                            <colgroup>
                                <col width="15%" />
                                <col width="85% "/>
                            </colgroup>
                         	<tbody>
                         		<tr class="odd">
                                	<th>질문유형</th>
                                <td class="left">
                                <form id="ff" name="select" >
                                	<input type="hidden" id="aa" name="aa" value="${faqContent.faq_type_code }"/>
                                   <select id="faq_type_code" name="faq_type_code" class="select" title="FAQ질문유형코드" style="width:100px">
										<option value="">선택</option>
                                        <option value="FAQ_0010" >지원서</option>
                                        <option value="FAQ_0020" >전형절차</option>
                                        <option value="FAQ_0030" >일정</option>
                                        <option value="FAQ_0040" >시스템</option>
                                        <option value="FAQ_0050" >기타</option>
                                    </select>
                                 </form>
                                 </td> 
                                </tr>
                                <tr class="odd">
                                    <th>제목</th>
                                    <td class="left"><input type="text" id="faq_quest_content" name="faq_quest_content" style="width:350px;" class="ipt_listIn2" value="${faqContent.faq_quest_content }"/></td>
                                </tr>
                              
                                <tr class="even">
                                	<th>내용</th>
                                    <td class="left"><textarea type="text" id="faq_answer_content" name="faq_answer_content" style="width:650px; height:200px;" >${faqContent.faq_answer_content }</textarea></td>
                                </tr>
                                
                        	</tbody>
                    	</table>
                    </div><!--//테이블2-->
                    <div class="pager">
                    	<div class="paging_right">
                            <span class="btn-pack btn-type_1" id="faqUpdate">
                        	<a class="" href="#" onclick="updateFaq()"><span class="ico_v"></span>등 록</a>
                        </span>
                        <span class="btn-pack btn-type_5">
                        	<a class="" href="#" onclick="location.href='faqContent.do?faq_no=${faqContent.faq_no }'"><span class="ico_cancel"></span>취 소</a>
                        </span>
                   </form>
                        </div><!--//paging_right-->  
				    	
				    </div><!--//pager-->
                </div><!--//contents-->
            </article>
        </section><!--//contR:끝-->
    </div><!--//wrap:끝-->
<jsp:include page="/WEB-INF/jsp/rms/main_bottom.jsp"/>
</body>
</html>