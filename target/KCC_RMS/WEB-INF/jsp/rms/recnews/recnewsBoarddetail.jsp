<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function dele(){

		if(confirm('<spring:message code="common.delete.msg"/>')){				
		   	document.location.href = "./recnewsDeleteDetailBoard.do?rec_news_no=${vo.rec_news_no}";
	}
	}
	
	function modi(){		
		if(confirm('<spring:message code="common.update.msg"/>')){	
		document.location.href="./recnewsUpdateBoardForm.do?rec_news_no=${vo.rec_news_no}";
		}
	}
</script>
</head>
<body onload="firstMenuList();">
<!-- 	<header>header:시작 -->
<!--     	<div dlass="hWrap">hwrap:시작 -->
<!--             <h1><a href="#" class="ir">demo</a></h1> -->
<!--             <nav id="gnb">gnb:시작 -->
<!--                 <ul class="gnbLst"> -->
<!--                     <li> -->
<!--                         <h2 class="oD_1"><a href="#" class="on" >홈페이지관리</a></h2> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                     	<h2 class="oD_2"><a href="#">지원서관리</a></h2> -->
<!--                    	</li> -->
<!--                     <li> -->
<!--                     	<h2 class="oD_3"><a href="#">계정관리</a></h2> -->
<!--                    	</li> -->
<!--                     <li> -->
<!--                     	<h2 class="oD_4"><a href="#">항목관리</a></h2> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                     	<h2 class="oD_5"><a href="#">통계관리</a></h2> -->
<!--                    	</li> -->
<!--                     <li> -->
<!--                     	<h2 class="oD_6"><a href="#">코드관리</a></h2> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                     	<h2 class="oD_7"><a href="#">서비스관리</a></h2> -->
<!--                     </li> -->
<!--                 </ul> -->
<!--             </nav>//gnb:끝 -->
<!-- 			<div class="utility"> -->
<!--                 <a href="#"  class="btn_log">Logout</a> -->
<!--             </div> -->
<!--     	</div>//hwrapr:끝 -->
<!-- 	</header>//header:끝 -->

<jsp:include page="/WEB-INF/jsp/rms/main_top.jsp"/>
    <div id="wrap">
    	<jsp:include page="/WEB-INF/jsp/rms/main_left.jsp"/>
    
    
<%--     	<section id="contL"> --%>
<!--         	<nav id="lnb">gnb:시작 -->
<!--             	<h1><a class="lnb_h1_1">홈페이지관리</a></h1> -->
<!--                 <ul> -->
<!--                 	<li class="on"><h2><a href="#" class="on">채용소식관리</a></h2></li> -->
<!--                     <li class=""><h2><a href="#">채용공고관리</a></h2></li> -->
<!--                     <li class=""><h2><a href="#">Q&A 관리</a></h2></li> -->
<!--                     <li class=""><h2><a href="#">FAQ 관리</a></h2></li> -->
<!--                 </ul> -->
<!--             </nav>gnb:끝 -->
<%--         </section><!--//contL:끝--> --%>
        
        
        
        <section id="contR"><!--contR:시작-->
        	<section class="cont_top">
                    <div class="path"><img src="/KCC_RMS/images/rms/cmn/btn/btn_path_home.gif" alt="home" />HOME &gt; 홈페이지관리 &gt; <strong>채용소식관리</strong></div>
                    <div class="name"><span class="name_st">관리자</span>님 반갑습니다.</div>
        	</section>
			<article>
            	<h1>채용소식관리</h1>
                <div class="contents">
                <form action="./recnewsUpdateBoard.do" method="post">
                <input type="hidden" name="rec_news_no" value="${vo.rec_news_no}">
                <input type="hidden" id="pageIndex" name="pageIndex" value="${vo.pageIndex}"/>
                	<div class="listType3 mt30">
                		<table summary="">
                            <colgroup>
                                <col width="15%" />
                                <col width="85% "/>
                            </colgroup>
                         	<tbody>
                                <tr class="odd">
                                    <th>제목</th>
                                    
                                    <td class="left"><input type="text" style="width:650px;" class="ipt_listIn2" value="${vo.rec_news_title}" name="rec_news_title" readonly="readonly"/></td>
                                </tr>
                                <tr class="even">
                                	<th>작성자</th>
                                    <td class="left"><input type="text" id="" name="" style="width:350px;" class="ipt_listIn2" value="${vo.writer}"/></td>
                                </tr>
                                <tr class="odd">
                                	<th>작성일</th>
                                	
                                    <td class="left"><input type="text"  style="width:350px;" class="ipt_listIn2 num" value="<fmt:formatDate value="${vo.write_date}" pattern="yyyy-MM-dd" />" /></td> 
                                </tr>
                                <tr class="even">
                                	<th>내용</th>
                                	 <td class="left"><textarea name="rec_news_content"" readonly="readonly"  style="width:650px; height:200px;">${vo.rec_news_content}</textarea>
                                   </td>
                                </tr>
                                <tr class="odd">
                                	<th>노출위치</th>
                                <td class="left">
                                                               
                                	<c:choose>
                                		<c:when test="${vo.main_view_tf =='T'}">
                                			 <label class="chk_label" ><input type="checkbox" class="chk" name="" id="" checked="checked" onclick="return(false)"/><span class="chk_txt">메인</span></label>
                                		</c:when>
                                		<c:otherwise>
                                			<label class="chk_label" ><input type="checkbox" class="chk" name="" id=""  onclick="return(false)"/><span class="chk_txt">메인</span></label>
                                		</c:otherwise>
                                	</c:choose>
                                	
                                	<c:choose>
                                		<c:when test="${vo.hubmain_view_tf =='T'}">
                                			 <label class="chk_label" ><input type="checkbox" class="chk" name="" id="" checked="checked"  onclick="return(false)"/><span class="chk_txt">허브</span></label>
                                		</c:when>
                                		<c:otherwise>
                                			<label class="chk_label" ><input type="checkbox" class="chk" name="" id=""  onclick="return(false)"/><span class="chk_txt">허브메인</span></label>
                                		</c:otherwise>
                                	</c:choose>
                                	
                                    <c:choose>
                                		<c:when test="${vo.front_view_tf =='T'}">
                                			 <label class="chk_label" ><input type="checkbox" class="chk" name="" id="" checked="checked"  onclick="return(false)"/><span class="chk_txt">프론트</span></label>
                                		</c:when>
                                		<c:otherwise>
                                			<label class="chk_label" ><input type="checkbox" class="chk" name="" id=""  onclick="return(false)"/><span class="chk_txt">프론트</span></label>
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
                        		<a class="" href="#" onclick="document.location.href='./recnewsBoardlist.do?pageIndex=${vo.pageIndex}'"><span class="ico_list"></span>목 록</a>
                            </span>
                            <span class="btn-pack btn-type_5">
                        		<a class="" href="#" onclick="modi()"><span class="ico_modify"></span>수 정</a>
                            </span>
                            <span class="btn-pack btn-type_4">
                                <a class="" href="#" onclick="dele()"><span class="ico_x"></span>삭 제</a>
                            </span>
                        </div><!--//paging_right-->  
				    	
				    </div><!--//pager-->
				    </form>
                </div><!--//contents-->
            </article>
        </section><!--//contR:끝-->
    </div><!--//wrap:끝-->
    		<jsp:include page="/WEB-INF/jsp/rms/main_bottom.jsp"/>
<!--     </form> -->
<!--     <footer> -->
<!--         <div class="fWrap"> -->
<!--         	<span>COPYRIGHT ⓒ 2014 <b>CRM.</b></span> -->
<!--         	<span>ALL RIGHT RESERVED.</span> -->
<!--         </div> -->
<!-- 	</footer> -->






<!-- <form action="./recnewsUpdateBoard.do" method="post"> -->
<%-- <input type="hidden" name="rec_news_no" value="${vo.rec_news_no}"> --%>

<!-- <table> -->
<!-- 	<tr> -->
<%-- 		<th>제목</th><td><input type="text" value="${vo.rec_news_title}" name="rec_news_title" readonly="readonly"></td> --%>
		
<!-- 	</tr> -->
<!-- 	<tr> -->
<%-- 		<th>아이디</th><td>${vo.writer}</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>작성날짜</th> -->
<%-- 		<td><fmt:formatDate value="${vo.write_date}" pattern="yyyy-MM-dd(E)"/></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>내용</th> -->
<%-- 		<td><textarea rows="5" cols="15" name="rec_news_content"" readonly="readonly">${vo.rec_news_content}</textarea></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>허브메인노출여부</th> -->
<%-- 		<td><input type="text" value="${vo.hubmain_view_tf}"></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>메인노출여부</th> -->
<%-- 		<td><input type="text" value="${vo.main_view_tf}"></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>프론트노출여부</th> -->
<%-- 		<td><input type="text" value="${vo.front_view_tf}"></td> --%>
<!-- 	</tr> -->
	
<!-- </table> -->

<%-- <input type="button" value="수정" onclick="document.location.href='./recnewsUpdateBoardForm.do?rec_news_no=${vo.rec_news_no}'"> --%>
<%-- <input type="button" value="삭제" onclick="document.location.href='./recnewsDeleteDetailBoard.do?rec_news_no=${vo.rec_news_no}'"> --%>
<!-- <input type="button" value="뒤로" onclick="document.location.href='./recnewsBoardlist.do'"> -->



</form>
</body>
</html>