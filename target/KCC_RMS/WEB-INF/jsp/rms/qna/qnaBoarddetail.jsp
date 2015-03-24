<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
<style type="text/css">
.btn_end {
	height: 30px;
}
</style>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="./Common/js/jquery-1.7.1.min.js" type="text/javascript"></script>
<!-- <script src="http://code.jquery.com/jquery-1.6.4.min.js"></script> -->
<script type="text/javascript">
	// 		function updateboard(){
	// 			document.getElementById("qnadetailBoard").submit();
	// 		}

	// 수정 버튼 누르면 수정 가능
	function chagetoupdate() {
		var wr = document.getElementsByName("writer")[0];
		var we = document.getElementsByName("writer_email")[0];
		var qqt = document.getElementsByName("qna_quest_title")[0];
		var qqc = document.getElementsByName("qna_quest_content")[0];
		var qqp = document.getElementsByName("qna_quest_pw")[0];
		var com = document.getElementById("update");
		var upd = document.getElementById("gotoupdate");
		var qnaupd = document.getElementById("qnaupdate");
		
		

		wr.readOnly = false;
		we.readOnly = false;
		qqt.readOnly = false;
		qqc.readOnly = false;
		qqp.readOnly = false;
		com.style.display = "inline";
		upd.style.display = "none";
		qnaupd.style.display="block";

		document.getElementById("qna_type").style.display = "none";
		document.getElementById("qna_type_code").style.display = "inline";
		document.getElementById("scrlistform").style.display = "none";
		document.getElementById("scrupdateform").style.display = "inline";
		


	}

	//Q&A 수정
	$(document).ready(function() {
			$("#qnaupdate").click(function() {
				$("#qnadetailBoard").attr("action","<c:url value='/rms/qna/qnaUpdateBoard.do'/>")	.submit();
				
				})
		})
		
	
	// 선택된 type에 따른 content Ajax로 조회
	function getFrqContentList(){
	
	$.post("<c:url value='/rms/qna/qnafrq/qnaFrqContentList.do'/>", $("#qna_answer").serialize(), function (html)
	{
		$("#frq_answer_content").html(html);
	});
	
	}
	
	// 선택된 content 를 textarea로 값 이동
	function moveFrqContent(){
		
		form = document.qna_answer;
		var sel = $("#frq_answer_content option:selected").val();
		var dis = 1;
		
		if(sel == null){
			sel ="";
			dis = 0;
		}
				
		
		if(sel == "직접입력"){
			sel ="";
			dis = 0;
		}
		
		form.qna_answer_content.value=sel;
// 		form.qna_answer_content.disabled = dis;
	
	}
	
	// 댓글 삭제
	function answerDelete(no) {
			$("#qna_answer_no").val(no);
			$("#answerList").attr("action","<c:url value='/rms/qna/qnaanswer/qnaAnswerDelete.do'/>").submit();
			
	}

	
	//댓글 수정하기로 변환
	function answerUpdateForm(no){
		
// 		$("#qna_answer_no").val(no);	
		
		alert(no);
 		var reply1 = "reply1"+no;
 		var reply2 = "reply2"+no;
 		var answerUpdate1 = "answerUpdate1"+no;
 		var answerUpdate2 = "answerUpdate2"+no;
	
		$("#"+reply1).css("display","none");
		$("#"+reply2).css("display","block");	
		
		$("#"+answerUpdate1).css("display","none");
		$("#"+answerUpdate2).css("display","block");
		
	}
	
	// 댓글 수정
	function answerUpdate(no){
		var qna_an_content = "qna_an_content"+no;
		$("#qna_answer_no").val(no);	
		alert($("#"+qna_an_content).val());
		$("#qna_answer_content1").val($("#"+qna_an_content).val());
		$("#answerList").attr("action","<c:url value='/rms/qna/qnaanswer/qnaAnswerUpdate.do'/>").submit();
	}
	
	function gotolist(){
		document.location.href="/KCC_RMS/rms/qna/qnaBoardlist.do";
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

	<!-- <input type="button" value="검색" name="addrbtn" onclick="pwchk()"/> -->
	<section id="contR"><!--contR:시작--> <section class="cont_top">
	<div class="path">
		<img src="/KCC_RMS/images/rms/cmn/btn/btn_path_home.gif" alt="home" />HOME
		&gt; 항목관리 &gt; <strong>지원서양식관리</strong>
	</div>
	<div class="name">
		<span class="name_st">관리자</span>님 반갑습니다.
	</div>
	</section> 
	<article>
	<h1>Q&A 상세 조회</h1>
	
	<div class="contents">
		<div class="listType3 mt30">
			<form action="./qnaUpdateBoard.do" method="post" id="qnadetailBoard"
				name="qnadetailBoard">
				<input type="hidden" name="qna_quest_no" value="${vo.qna_quest_no}">
				<table summary="">
					<colgroup>
						<col width="15%" />
						<col width="35% " />
						<col width="15%" />
						<col width="*%" />
					</colgroup>
					<tbody>
						<tr class="odd">
							<th>질문유형</th>

							<td class="left">
							<input type="text" name="qna_type" id="qna_type" value="${vo.qna_type_code}" readonly="readonly"
								style="display: inline; width:250px;" class="ipt_listIn2 num"> 
								
								<select name="qna_type_code" id="qna_type_code" style="display: none; width:250px;"  class="ipt_listIn2 num">
									<c:forEach var="type" items="${itemList}" varStatus="vs">
									<option value="<c:out value="${type.detail_code_name}"/>">${type.detail_code_name}</option>
									<c:if test="${vo.qna_type_code == type.detail_code_name}">selected="selected"</c:if>
									<c:out value="${type.detail_code_name}"/>
									</c:forEach>
								</select>
								

			
<!-- 								<select name="qna_type_code" -->
<!-- 								id="qna_type_code" style="display: none"> -->
<%-- 									<c:forEach var="type" items="${itemList}" varStatus="vs"> --%>
<%-- 										<option value="<c:out value="${type.detail_code_name}"/>">${type.detail_code_name}</option> --%>
<%-- 										<c:if test="${vo.qna_type_code == type.detail_code_name}">selected="selected"</c:if> --%>
<%-- 										<c:out value="${type.detail_code_name}" /> --%>
<%-- 									</c:forEach> --%>
<!-- 							</select>  -->
							<!--<input type="text" id="" name="" style="width:250px;" class="ipt_listIn2 num" value="지원관련" /> -->

							</td>
							<th>작성자</th>
							<td class="left"><input type="text" name="writer" id="writer" value="${vo.writer}" readonly="readonly"
								style="display: inline-table; width:250px;" class="ipt_listIn2 num"> <!--<input type="text" id="" name="" style="width:250px;" class="ipt_listIn2 num" value="박경미" /> -->
							</td>
						</tr>

						<tr class="even">
							<th>이메일</th>
							<td class="left"><input type="text" name="writer_email" value="${vo.writer_email}" readonly="readonly" style="width:250px;" class="ipt_listIn2" > <!--<input type="text" id="" name="" style="width:250px;" class="ipt_listIn2" value="pkm@kcc.co.kr" /> -->
							</td>
							<th>등록일시</th>
							<td id="write_date" class="letf"><input type="text" value="<fmt:formatDate value="${vo.write_date}" pattern="yyyy-MM-dd" />" readonly="readonly"
							style="width:250px;" class="ipt_listIn2 num"></td>
							<td id="modi_date" class="letf" style="display: none;"><input type="hidden" value="<fmt:formatDate value="${vo.write_date}" pattern="yyyy-MM-dd(E)" />" readonly="readonly"></td>
						</tr>

						<tr class="even">
							<th>비밀번호</th>
							<td class="left"><input type="password" name="qna_quest_pw"
								value="${vo.qna_quest_pw}" readonly="readonly" style="width:250px;" class="ipt_listIn2"> <!--<input type="text" id="" name="" style="width:250px;" class="ipt_listIn2" value="pkm@kcc.co.kr" /> -->
							</td>
							<th>비밀글여부</th>
							
							<td>	
							<a id="scrlistform">					
							 <c:choose>			
                                		<c:when test="${vo.qna_quest_scr_tf =='T'}">
                                			 <label class="chk_label" ><input type="checkbox" class="chk" name="qna_quest_scr_tf" id="qna_quest_scr_tf" checked="checked" onclick="return(false)"/><span class="chk_txt"></span></label>
                                		</c:when>
                                		<c:otherwise>
                                			<label class="chk_label" ><input type="checkbox" class="chk" name="qna_quest_scr_tf" id="qna_quest_scr_tf" onclick="return(false)" /><span class="chk_txt"></span></label>
                                		</c:otherwise>                          		
                                	</c:choose>
                            </a>
                            <a id="scrupdateform" style="display: none;">					
							 <c:choose>			
                                		<c:when test="${vo.qna_quest_scr_tf =='T'}">
                                			 <label class="chk_label" ><input type="checkbox" class="chk" name="qna_quest_scr_tf" id="qna_quest_scr_tf" checked="checked" /><span class="chk_txt"></span></label>
                                		</c:when>
                                		<c:otherwise>
                                			<label class="chk_label" ><input type="checkbox" class="chk" name="qna_quest_scr_tf" id="qna_quest_scr_tf" /><span class="chk_txt"></span></label>
                                		</c:otherwise>                          		
                                	</c:choose>
                            </a>	
							</td>			
							
<%-- 							<td><input type="checkbox" name="qna_quest_scr_tf" >${vo.qna_quest_scr_tf}</td> --%>
						</tr>


						<tr class="odd">
							<th>제목</th>
							<td class="left" colspan="3"><input type="text" name="qna_quest_title" value="${vo.qna_quest_title}" readonly="readonly" style="width:650px;" class="ipt_listIn2"> <!--<input type="text" id="" name="" style="width:650px;" class="ipt_listIn2" value="합격자발표가 났습니다."/> -->
							</td>
						</tr>
						<tr class="even">
							<th>내용</th>
							<td class="left" colspan="3"><textarea rows="5" cols="30" value="${vo.qna_quest_content}" readonly="readonly" name="qna_quest_content" style="width:650px; height:200px;">${vo.qna_quest_content}</textarea></td>
						</tr>
					</tbody>
				</table>
				  </div><!--//테이블2-->			

				<div class="pager">
					<div class="paging_right">
						<span class="btn-pack btn-type_5"> <a onclick="gotolist()"><span class="ico_list"></span>목 록</a>
						</span>
						<!--                     		<a id = "gotoupdate" onclick="chagetoupdate()">수정</a> -->

						<span class="btn-pack btn-type_5"> <a class=""
							id="gotoupdate" href="#LINK" onclick="chagetoupdate()"><span
								class="ico_modify"></span>수 정</a>
						</span> 
						<span class="btn-pack btn-type_5">
							<a class="" id="qnaupdate" href="#LINK" onclick="" style="display: none;">
								<span class="ico_modify"></span> 등 록
							</a>
						</span> 
						<span class="btn-pack btn-type_4"> 
							<a onclick="document.location.href='./qnaDeleteDetailBoard.do?qna_quest_no=${vo.qna_quest_no}'">
							<span class="ico_x"></span>삭 제
							</a>
						</span>

					</div>
					<!--//paging_right-->
					
					<input id="gotoupdate" type="hidden" value="수정화면으로" onclick="chagetoupdate()" style="display: inline;"> 
					<input id="update" type="hidden" value="수정하기" style="display: none;">
				</div>
				</form>

				<!--//pager-->
							  	
				  	<!-- 댓글관리시작 -->

                    <section class="mt30">
                    <div class="btn_end"></div>
                        <h4 class="cmt_h4">댓글 관리 </h4>
                        <div class="comment_form">
                        	<form action="<c:url value='/rms/qna/qnaanswer/qnaAnswerInsertBoard.do'/>" method="post" id="qna_answer" name="qna_answer">
							<input type="hidden" name="qna_quest_no" value="${vo.qna_quest_no}">
							<input type="hidden" name="frq_answer_content">
							     <div class="cmt_info">
							   		 	<select name="typeSelect" id="typeSelect"  onclick="getFrqContentList()"  style="width:250px;" class="ipt_listIn2 num">
<!-- 										<select name="qna_type_code" id="qna_type_code" onchange="getFraContentList()"  style="width:250px;" class="ipt_listIn2 num">	 -->
												<c:forEach var="type" items="${qflist}" varStatus="vs">
													<option value="<c:out value="${type.qna_type_code}"/>">${type.qna_type_code}</option>
<%-- 											<c:if test="${vo.qna_type_code == type.detail_code_name}">selected="selected"</c:if> --%>
<%-- 											<c:out value="${type.detail_code_name}"/> --%>
												</c:forEach>
										</select>
										
										
										<select id="frq_answer_content" name="frq_answer_content" onclick="moveFrqContent()" style="width:500px;" class="ipt_listIn2 num">
										</select>

                            </div>
							<div class="cmt_write">
                            <textarea type="text" id="qna_answer_content" name="qna_answer_content" style="height:50px; overflow: hidden;" class="textarea_st"></textarea>			
                               <span class="btn-pack btn-type_6">
                                	<input id="" name="" class="cmt_btn" type="submit" value="댓글등록">
                            	</span>
                            </div>
							</form>                          
                        </div>

                        <div class="cmt_list">
                        	<form action="" id="answerList"  name="answerList">
                        	<input type="hidden" id="qna_answer_no" name="qna_answer_no" value=""> 
                        	<input type="hidden" id="qna_answer_content1" name="qna_answer_content" value=""> 
                        	<input type="hidden" name="qna_quest_no" value="${vo.qna_quest_no}">
                            <table class="" summary="프로필 사진, 댓글내용, 추천하기 등의 댓글정보를 제공합니다.">
                                <colgroup>
                                    <col width="17%;" />
                                    <col width="*" />
                                    <col width="150px;" />
                            	</colgroup>
                                <tbody>
                                
                                <c:forEach var="list" items="${qalist}" varStatus="vs">
                                <tr>
                                    	<th>                        	 
                                     	<span class="txt_nicknam">${list.writer }</span>
                                            <span class="txt_time num"><fmt:formatDate value="${list.write_date}" pattern="yyyy-MM-dd" /></span>                                          
                                        </th>
                                        <td class="cmt_reply">
                                            <p class="txt_reply1" id="reply1${list.qna_answer_no}" name="reply1" style="display: block;">${list.qna_answer_content}</p>
                                            <p class="txt_reply2" id="reply2${list.qna_answer_no}" name="reply2"style="display: none;"><input type="text" id="qna_an_content${list.qna_answer_no}" name="qna_an_content${list.qna_answer_no}" value=""/></p>
                                        </td>
                                        <td class="cmt_btn btn last">
                                        	<span class="btn-pack btn-type_2" style="margin-left:5px;">
                                                <a class="answerUpdate1" href="#" id="answerUpdate1${list.qna_answer_no}" onclick="answerUpdateForm('${list.qna_answer_no}')" ><span class="ico_modify"></span>수 정</a>
                                                <a class="answerUpdate2" href="#" id="answerUpdate2${list.qna_answer_no}" onclick="answerUpdate('${list.qna_answer_no}')" style="display: none"><span class="ico_modify"></span>등 록 </a>
                                            </span>
                                            <span class="btn-pack btn-type_2" style="margin-left:5px;">
                                                <a class="" href="#" id="answerDelete" name="answerDelete" onclick="answerDelete('${list.qna_answer_no}')"><span class="ico_x2"></span>삭 제</a>
                                            </span>
                                        </td>
                                </tr>
                                </c:forEach>
               															
                                </tbody>
                            </table>	
                            </form>
                        </div>

                    </section>


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
				

<!-- 		<input id="gotoupdate" type="hidden" value="수정화면으로" onclick="chagetoupdate()" style="display: inline;">  -->
<!-- 		<input id="update" type="hidden" value="수정하기" style="display: none;"> -->
<!-- 		</form> -->
		
<%-- 		<form action="<c:url value='/rms/qna/qnaanswer/qnaAnswerInsertBoard.do'/>" method="post" id="qna_answer" name="qna_answer"> --%>
<%-- 		<input type="hidden" name="qna_quest_no" value="${vo.qna_quest_no}"> --%>
		
<!-- 			<table border="1"> -->
<!-- 				<tr> -->
<!-- 					<td> -->
<!-- 						<select name="qna_type_code"> -->
<%-- 							<c:forEach var="qna_type" items="${qnaFrqTypeList}" varStatus="vs"> --%>
<%-- 									<option>aa${qna_type.qna_type_code}지원자</option> --%>
<%-- 							</c:forEach> --%>
<!-- 						</select> -->
<!-- 					</td> -->
<!-- 					<td> -->
<!-- 						<select name="qna_type_code" onchange="getContent()"> -->
<%-- 						<c:forEach var="type" items="${itemList}" varStatus="vs"> --%>
<%-- 						<option value="<c:out value="${type.detail_code_name}"/>">${type.detail_code_name}</option> --%>
<%-- 						<c:if test="${vo.qna_type_code == type.detail_code_name}">selected="selected"</c:if> --%>
<%-- 						<c:out value="${type.detail_code_name}"/> --%>
<%-- 						</c:forEach> --%>
<!-- 						</select> -->
<!-- 					</td> -->
<!-- 					<td> -->
<!-- 						<select id="select_answer_content" name="frq_answer_content"> -->
<!-- 							<option>답변 선택</option> -->
<!-- 						</select> -->
<!-- 					</td> -->
<!-- 					<td></td> -->
<!-- 					<td></td>	 -->
<!-- 				</tr> -->
<!-- 				<tr></tr> -->
<!-- 				<tr> -->
<!-- 					<td> -->
<%-- 						<textarea rows="3" cols="100" id="qna_answer_content" name="qna_answer_content">${answerList.qna_answer_content}</textarea> --%>
<!-- 						<input type="submit" value="댓글등록"> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
			
			<!--                     <div class="pager"> -->
<!-- 					<div class="paging_right"> -->
<!-- 						<span class="btn-pack btn-type_5"> <a -->
<!-- 							onclick="document.location.href='./qnaBoardlist.do'"><span -->
<!-- 								class="ico_list"></span>목 록</a> -->
<!-- 						</span> -->
<!-- 						                    		<a id = "gotoupdate" onclick="chagetoupdate()">수정</a> -->

<!-- 						<span class="btn-pack btn-type_5"> <a class="" -->
<!-- 							id="gotoupdate" href="#LINK" onclick="chagetoupdate()"><span -->
<!-- 								class="ico_modify"></span>수 정</a> -->
<!-- 						</span> <span class="btn-pack btn-type_5"> <a class="" -->
<!-- 							id="qnaupdate" href="#LINK" onclick=""><span -->
<!-- 								class="ico_modify"></span> 완 료</a> -->
<!-- 						</span> <span class="btn-pack btn-type_4"> <a -->
<%-- 							onclick="document.location.href='./qnaDeleteDetailBoard.do?qna_quest_no=${vo.qna_quest_no}'"><span --%>
<!-- 								class="ico_x"></span>삭 제</a> -->
<!-- 						</span> -->

<!-- 					</div> -->
<!-- 					//paging_right -->
					
<!-- 					<input id="gotoupdate" type="hidden" value="수정화면으로" onclick="chagetoupdate()" style="display: inline;">  -->
<!-- 					<input id="update" type="hidden" value="수정하기" style="display: none;"> -->
<!-- 					</form> -->

<!-- 				</div> -->
<!-- 				//pager -->
<!-- 		</form> -->
</body>
</html>