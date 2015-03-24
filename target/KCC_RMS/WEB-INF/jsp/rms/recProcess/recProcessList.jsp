<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
 
</head>

<body onload="firstMenuList();">
	<jsp:include page="/WEB-INF/jsp/rms/main_top.jsp" />
<!-- 	<header>header:시작
    	<div dlass="hWrap">hwrap:시작
            <h1><a href="#" class="ir">demo</a></h1>
            <nav id="gnb">gnb:시작
                <ul class="gnbLst">
                    <li>
                        <h2 class="oD_1"><a href="#" >홈페이지관리</a></h2>
                    </li>
                    <li>
                    	<h2 class="oD_2"><a href="#">지원서관리</a></h2>
                   	</li>
                    <li>
                    	<h2 class="oD_3"><a href="#">계정관리</a></h2>
                   	</li>
                    <li>
                    	<h2 class="oD_4"><a href="#" class="on">항목관리</a></h2>
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
            </nav>//gnb:끝
			<div class="utility">
                <a href="#"  class="btn_log">Logout</a>
            </div>
    	</div>//hwrapr:끝
	</header>//header:끝 -->
    <div id="wrap">
		<jsp:include page="/WEB-INF/jsp/rms/main_left.jsp" />
<!--     	<section id="contL">
        	<nav id="lnb">gnb:시작
            	<h1><a class="lnb_h1_4">항목관리</a></h1>
                <ul>
                	<li class="on"><h2><a href="#" class="on">채용절차관리</a></h2></li>
                    <li class=""><h2><a href="#">지원서양식관리</a></h2></li>
                    <li class=""><h2><a href="#">모집분야관리</a></h2></li>
                    <li class=""><h2><a href="#">시험항목관리</a></h2></li>
                </ul>
            </nav>gnb:끝
        </section>//contL:끝 -->
        <section id="contR"><!--contR:시작-->
        	<section class="cont_top">
                    <div class="path"><img src="/KCC_RMS/images/rms/cmn/btn/btn_path_home.gif" alt="home" />HOME &gt; 항목관리 &gt; <strong>채용절차관리</strong></div>
                    <div class="name"><span class="name_st">관리자</span>님 반갑습니다.</div>
        	</section>
			<article>
            	<h1>채용절차관리</h1>
                <div class="contents">
                	<div class="listSearch">
                        <div class="listSearch_pos">
                            <form class="form_pos">
                                <fieldset>
                                    <legend>선택</legend>
                                    <select id="searchKey" name="searchKey" class="slt_search" style="width:90px">
                                        <option value="">선택</option>
                                        <option value="rec_prog_name">채용절차명</option>
                                        <option value="rec_prog_memo">메모</option>
                                    </select> 
                                    <input type="text" class="ipt_search" id="searchValue" name="searchValue" />
                                    <input type="image" name="" id="" onclick="document.location.href='./recNoticeList.do'" src="/KCC_RMS/images/rms/cmn/btn/btn_search.gif" alt="검색">
                                </fieldset>
                            </form>
                        </div>
                   	</div>

                    <div class="listType2 mt10">
                        <table>
                            <caption>채용절차관리</caption>
                            <colgroup>
                                <col style="width:5%"/>
                                <col style="width:20%" />
                                <col style="width:*%" />
                                <col style="width:10%" />
                                <col style="width:10%" />
                                <col style="width:15%"/>
                            </colgroup>
                            <thead>
                                <tr> 
                                    <th scope="col">번 호</th>
                                    <th scope="col">채용절차명</th>
                                    <th scope="col">채용절차</th>
                                    <th scope="col">작성자</th>
                                    <th scope="col">작성일</th>
                                    <th scope="col" class="last"></th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${recProcessList }" var="rpList" >
                                <tr class="even" onclick="location.href='recProcessContent.do?rec_prog_no=${rpList.rec_prog_no }'">
                                    <td class="left num">${rpList.rec_prog_no }</td>
                                    <td class="left tb_style_1">${rpList.rec_prog_name }</td>
                                    <td class="left">${rpList.step_item_list }</td>
                                    <td class="left tb_style_1">${rpList.writer }</td>
                                    <td class="left">${rpList.write_date }</td>
                                    <td class="btn last ">
                                    <span class="btn-pack btn-type_2">
                                    	<a class="" href="#"><span class="ico_modify"></span>수 정</a></span>
                                    <span class="btn-pack btn-type_2">
                                  		<a class="" href="#"><span class="ico_x2"></span>삭 제</a></span>
                             		</td>   		
                                </tr>
                            </c:forEach>    
                            </tbody>
                        </table>
                    </div><!--//테이블2-->
                    <div class="pager">
                    	<div class="paging_right">
                            <span class="btn-pack btn-type_1">
                        	<a class="" href="#" onclick="document.location.href='./insertRecProcessForm.do'"><span class="ico_v"></span>채용절차등록</a>
                        </span>
                        </div><!--//paging_right-->  
                        
				    	<!-- <div class="paging">
							<a href="#" class="prev"><img src="/KCC_RMS/images/rms/cmn/btn/btn_prev.gif" alt="이전"></a>
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
                            <a href="#"class="next"><img src="/KCC_RMS/images/rms/cmn/btn/btn_next.gif" alt="다음"></a>
						</div>//paging   -->
						
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












<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채용절차</title>
</head>
<body>
<h2>채용절차 List</h2><br/>


<form action="./recProcessList.do">
	<select name="searchKey">
		<option value="rec_prog_name">채용절차명</option>
		<option value="rec_prog_memo">채용절차 메모내용</option>
	</select>
	<input type="text" name="searchValue">
	<input type="submit" value="검색">
</form>

<table border="1" cellpadding="5" cellspacing="0" width="600" >
		<tr>
			<th>번호</th>
			<th>채용절차명</th>
			<th>채용단계</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		
		<c:forEach items="${recProcessList }" var="rpList" >
		<tr onclick="location.href=''">
			<td>${rpList.rec_prog_no }</td>
			<td>${rpList.rec_prog_name}</td>
 			<td>${rpList.step_item_list}</td>
			<td>${rpList.writer }</td>
			<td>${rpList.write_date }</td>
		</tr>
		</c:forEach>
</table>

<input type="button" value="등록" onclick="document.location.href='./insertRecProcessForm.do'">
<input type="button" value="수정테스트" onclick="document.location.href='./updateRecProcess.do'">
<input type="button" value="삭제테스트" onclick="document.location.href='./deleteRecProcess.do'">

</body>
</html>