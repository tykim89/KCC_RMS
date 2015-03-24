<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
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
<meta http-equiv="X-UA-Compatible" content="IE=Edge; text/html; charset=UTF-8"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/rms/cmn/base.css'/>" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<htm lang="ko"l>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	
	$(document).ready(function() {
		$("#btnInsert").click(function() {
			
				if($("#rec_news_title").val()=="" || $("#rec_news_title").val() == null || $("#rec_news_content").val()=="" ||  $("#rec_news_content").val()==null){
					alert("제목과 내용은"+'<spring:message code="common.required.msg" />');
				}
				else{			
					if(confirm('<spring:message code="common.regist.msg" />')){
					$("#recnewsInsert").attr("action","<c:url value='./recnewsInsertBoard.do'/>").submit();			
					}
				}
			})
	})
	
	function view_chk_tf(){ 

		//주임님한거
// 		var hubmain_chk_tf = document.getElementById("hubmain_view_tf_chk");   
// 		var main_chk_tf = document.getElementsByName("main_view_tf_chk");
// 		var front_chk_tf = document.getElementsByName("front_view_tf_chk");

		//내가한거
		var hubmain_chk_tf = document.getElementById("hubmain_view_tf_chk");    
		var main_chk_tf = document.getElementById("main_view_tf_chk");
		var front_chk_tf = document.getElementById("front_view_tf_chk");
		
		if(hubmain_chk_tf.checked==true){
			document.recnewsInsert.hubmain_view_tf.value = "T";
		}else{
			document.recnewsInsert.hubmain_view_tf.value = "F";
		}
		
		//내가하는거
		if(main_chk_tf.checked==true){
			document.recnewsInsert.main_view_tf.value = "T";
		}else{
			document.recnewsInsert.main_view_tf.value = "F";
		}
		
		if(front_chk_tf.checked==true){
			document.recnewsInsert.front_view_tf.value = "T";
		}else{
			document.recnewsInsert.front_view_tf.value = "F";
		}
	}

</script>
</head>
<body onload="firstMenuList();">
<jsp:include page="/WEB-INF/jsp/rms/main_top.jsp"/>
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
                <form method="post" id="recnewsInsert" name="recnewsInsert">
					<input type="hidden" name="checkResult">
					<input type="hidden" id="hubmain_view_tf" name="hubmain_view_tf" value="F">
					<input type="hidden" id ="main_view_tf" name="main_view_tf" value="F">
					<input type="hidden" id = "front_view_tf" name="front_view_tf" value="F">
                	<div class="listType3 mt30">
                		<table summary="">
                            <colgroup>
                                <col width="15%" />
                                <col width="85% "/>
                            </colgroup>
                         	<tbody>
                                <tr class="odd">
                                    <th>제목</th>
                                    <td class="left"><input type="text" id="rec_news_title" name="rec_news_title" style="width:650px;" class="ipt_listIn2"/></td>
                                </tr>
                                <!--  <tr class="even">
                                	<th>작성자</th>
                                    <td class="left"><input type="text" id="" name="" style="width:350px;" class="ipt_listIn2" value="관리자" /></td>
                                </tr>
                                <tr class="odd">
                                	<th>작성일</th>
                                    <td class="left"><input type="text" id="" name="" style="width:350px;" class="ipt_listIn2 num" value="2014.05.13" /></td> 
                                </tr>
                                -->
                                <tr class="even">
                                	<th>내용</th>
                                    <td class="left"><textarea type="text" id="rec_news_content" name="rec_news_content" style="width:650px; height:200px;" ></textarea></td>
                                </tr>
                                <tr class="odd">
                                	<th>노출위치</th>
                                <td class="left">
                                    <label class="chk_label" ><input type="checkbox" id="main_view_tf_chk" name="main_view_tf_chk" value=""/><span class="chk_txt">메인</span></label>
                                    <label class="chk_label" ><input type="checkbox" id="hubmain_view_tf_chk" name="hubmain_view_tf_chk" value=""/><span class="chk_txt">허브메인</span></label>
                                    <label class="chk_label" ><input type="checkbox" id="front_view_tf_chk" name="front_view_tf_chk" value=""/>프론트</span></label>
                                 </td> 
                                </tr>
                        	</tbody>
                    	</table>
                    </div><!--//테이블2-->
                    <div class="pager">
                    	<div class="paging_right">
                            <span class="btn-pack btn-type_1">
                        	<a class="" href="#" id="btnInsert" onclick="view_chk_tf()"><span class="ico_v"></span>등 록</a>
                        </span>
                        <span class="btn-pack btn-type_5">
                        	<a class="" href="#" onclick="document.location.href='./recnewsBoardlist.do'"><span class="ico_cancel"></span>취 소</a>
                        </span>
                        </div><!--//paging_right-->  
				    	</form>
				    </div><!--//pager-->
                </div><!--//contents-->
            </article>
        </section><!--//contR:끝-->
    </div><!--//wrap:끝-->
    
    <jsp:include page="/WEB-INF/jsp/rms/main_bottom.jsp"/>
    
<!--     <footer> -->
<!--         <div class="fWrap"> -->
<!--         	<span>COPYRIGHT ⓒ 2014 <b>CRM.</b></span> -->
<!--         	<span>ALL RIGHT RESERVED.</span> -->
<!--         </div> -->
<!-- 	</footer> -->




<!-- <form action="./recnewsInsertBoard.do" method="post" name="recnewsInsert">
<input type="hidden" name="checkResult">
<input type="hidden" id="hubmain_view_tf" name="hubmain_view_tf" value="F">
<input type="hidden" id ="main_view_tf" name="main_view_tf" value="F">
<input type="hidden" id = "fron
t_view_tf" name="front_view_tf" value="F">
<table>
	<tr>
		<th>제목</th><td><input type="text" name="rec_news_title"></td>
		
	</tr>
 -->	
<!-- 	<tr> -->
<%-- 		<th>아이디</th><td><input type="text" value="${vo.rec_news_title} " name = "title" readonly="readonly"></td> --%>
<!-- 	</tr> -->
<!-- 	<tr>
		<th>내용</th><td><textarea rows="5" cols="15" name="rec_news_content"></textarea></td>
	</tr>
</table>
<p/>
<input type="checkbox" id="hubmain_view_tf_chk" name="hubmain_view_tf_chk" value="">허브메인노출
<input type="checkbox" id="main_view_tf_chk" name="main_view_tf_chk" value="">메인노출
<input type="checkbox" id="front_view_tf_chk" name="front_view_tf_chk" value="">프론트노출<br>
<input type="submit" value="확인" onclick="view_chk_tf()">
</form>
 -->
</body>
</html>