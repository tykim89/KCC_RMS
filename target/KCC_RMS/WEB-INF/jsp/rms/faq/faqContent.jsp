<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*"%>
<%@page import="rms.com.faq.vo.FaqVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

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

function init()
{
	if($("#message").val() != "")
	{
		alert($("#message").val());
	}
}

//삭제 
function deleteFaq()
{
    var fcf  = document.faqContentForm;

    if( confirm('<spring:message code="common.delete.msg" />') )
    {
    	fcf.action = './deleteFaq.do?faq_no=${faqContent.faq_no}';
    }

    fcf.submit();
}


</script>
 
</head>

<body onload="init()">
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
                	<li class="on"><h2><a href="#" class="on">채용소식관리</a></h2></li>
                    <li class=""><h2><a href="#">채용공고관리</a></h2></li>
                    <li class=""><h2><a href="#">Q&A 관리</a></h2></li>
                    <li class=""><h2><a href="#">FAQ 관리</a></h2></li>
                </ul>
            </nav><!--gnb:끝-->
        </section><!--//contL:끝-->
        <section id="contR"><!--contR:시작-->
        	<section class="cont_top">
                    <div class="path"><img src="/KCC_RMS/images/rms/cmn/btn/btn_path_home.gif" alt="home" />HOME &gt; 홈페이지관리 &gt; FAQ관리 &gt; <strong>FAQ상세조회</strong></div>
                    <div class="name"><span class="name_st">관리자</span>님 반갑습니다.</div>
        	</section>
			<article>
            	<h1>FAQ관리</h1>
                <div class="contents">
                	<div class="listType3 mt30">
                		<form id="faqContentForm" name="faqContentForm" method="post">
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
                                   <select id="faq_type_code" name="faq_type_code" class="select" title="FAQ질문유형코드" style="width:100px">
                                        <option value="">${faqContent.faq_type_name }</option>
                                    </select>
                                 </td> 
                                </tr>
                                <tr class="odd">
                                    <th>제목</th>
                                    <td class="left"><input type="text" id="" name="faq_quest_content" style="width:350px;" class="ipt_listIn2" value="${faqContent.faq_quest_content }" readonly="readonly" /></td>
                                </tr>
                                <tr class="even">
                                	<th>작성자</th>
                                    <td class="left"><input type="text" id="" name="writer" style="width:150px;" class="ipt_listIn2" value="${faqContent.writer }" readonly="readonly" /></td>
                                </tr>
                                <tr class="odd">
                                	<th>내용</th>
                                    <td class="left"><textarea type="text" id="" name="faq_answer_content" style="width:650px; height:200px;" readonly="readonly">${faqContent.faq_answer_content }</textarea></td>
                                </tr>
                                
                        	</tbody>
                    	</table>
                    </div><!--//테이블2-->
                    <div class="pager">
                    	<div class="paging_right">
                    	    <span class="btn-pack btn-type_5">
                        		<a class="" href="#" onclick="document.location.href='./faqList.do'"><span class="ico_list"></span>목 록</a>
                            </span>
                         	<span class="btn-pack btn-type_5">
                        		<a class="" href="#" onclick="document.location.href='./updateFaqForm.do?faq_no=${faqContent.faq_no }'"><span class="ico_modify"></span>수 정</a>
                            </span>
                            <span class="btn-pack btn-type_4" id="deleteFaqBtn">
                                <a class="" href="#" onclick="deleteFaq()"><span class="ico_x"></span>삭 제</a>
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
