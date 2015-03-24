<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>::: kcc :::</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge; text/html; charset=UTF-8" />
<meta charset="utf-8">
<meta name="Generator" content="EditPlus">
<meta name="Author" content="">
<meta name="keyword" content="">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/rms/kcc/style.css'/>" />
<style type="text/css">
body {
	overflow-y:auto;
	overflow-x:hidden;
}
</style>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="./Common/js/jquery-1.7.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js" type="text/javascript"></script>
<script src="/js/rms/com/jquery-1.7.1.min.js" type="text/javascript"></script>
<script language="JavaScript" src="/KCC_RMS/js/rms/kcc/common2.js"></script>
<script language="JavaScript" src="/KCC_RMS/js/rms/kcc/selectbox.js"></script>
<script type="text/javascript">

		//동적 테이블 생성
		function addDynamicTable(section){
			
			var lastListNo = $("#"+section+"LastListNo").val();	
			alert(lastListNo);
			var nextListNo = parseInt(lastListNo)+1;
			alert(nextListNo);
			
			$("input[id='"+section+"InputId']").each(function() {
				$(this).attr("id", "TEMPID");			
			});
			
			var addHtml = "<div class='listType3' id='"+section+"Div"+nextListNo+"'>"+$('#'+section+'Div1').html()+"</div>";
			alert("더하는"+addHtml);
			$("input[id='TEMPID']").each(function() {
				$(this).attr("id", section+"InputId");			
			});	
			$('#'+section+'DivHead').append(addHtml);
			//alert("아이디랑 네임바뀌기전"+addHtml);		
			$("input[id='TEMPID']").each(function() {
				var tempName = $(this).attr("name");
				var nameSplit = tempName.split('|');
				$(this).val("");
				$(this).attr("name", nameSplit[0]+"|"+nameSplit[1]+"|"+nextListNo);	
				alert("nextListNo"+nextListNo);
				alert("nameSplit[2]"+nameSplit[2]);
				$(this).attr("id", section+"InputId"+nextListNo);
			});
			
			$("#"+section+"LastListNo").val(nextListNo);	
			alert("결과"+$('#'+section+'Div'+nextListNo).html());

			
		}

		//F5 새로고침 방지
		function noEvent() { 
			 if (event.keyCode == 116) { 
			 event.keyCode= 2; 
			 return false; 
			 } 
			 else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82)) 
			 { 
			 return false; 
			 } 
			} 
			document.onkeydown = noEvent; 
			
// 			function addDynamicTable(section){
// 				var lastListNo = $("#"+section+"LastListNo").val();	
// 				alert("1/"+lastListNo);
// 				var nextListNo = parseInt(lastListNo)+1;
// 				alert("2/"+nextListNo);
				
// 			}

		/*
		$(function() {
			  $( "#day" ).datepicker({
			    dateFormat: 'yy-mm-dd',
			    prevText: '이전 달',
			    nextText: '다음 달',
			    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			    dayNames: ['일','월','화','수','목','금','토'],
			    dayNamesShort: ['일','월','화','수','목','금','토'],
			    dayNamesMin: ['일','월','화','수','목','금','토'],
			    showMonthAfterYear: true,
			    yearSuffix: '년',
			    showOn : "button",
			    buttonImage: "/KCC_RMS/images/rms/kcc/calendar.gif",
			    buttonImageOnly: true
			  });
			});
		*/
		
		function search(){
			
			var url="<c:url value='/rms/appdoc/postsearch.do'/>";
			var title="post";
			var prop = "width=400px, height=370px, scrollbars=yes, resizable=yes";
			window.open(url, title, prop);
		}
		
		// 사진 미리보기
		function previewImage(targetObj, previewId) {

		    var preview = document.getElementById(previewId); //div id 
		    var ua = window.navigator.userAgent;

		    if (ua.indexOf("MSIE") > -1) {//ie일때

		        targetObj.select();

		        try {
		            var src = document.selection.createRange().text; // get file full path 
		            var ie_preview_error = document.getElementById("ie_preview_error_" + previewId);

		            if (ie_preview_error) {
		                preview.removeChild(ie_preview_error); //error가 있으면 delete
		            }

		            var img = document.getElementById(previewId); //이미지가 뿌려질 곳 

		            // 이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
		            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+ src + "', sizingMethod='scale')"; 
		           
		        } catch (e) {
		            if (!document.getElementById("ie_preview_error_" + previewId)) {
		                var info = document.createElement("<p>");
		                info.id = "ie_preview_error_" + previewId;
		                info.innerHTML = "a";
		                preview.insertBefore(info, null);
		            }
		        }
		    } else { //ie가 아닐때
		        var files = targetObj.files;
		        for ( var i = 0; i < files.length; i++) {

		            var file = files[i];

		            var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
		            if (!file.type.match(imageType))
		                continue;

		            var prevImg = document.getElementById("prev_" + previewId); //이전에 미리보기가 있다면 삭제
		            if (prevImg) {
		                preview.removeChild(prevImg);
		            }

		            var img = document.createElement("img"); //크롬은 div에 이미지가 뿌려지지 않는다. 그래서 자식Element를 만든다.
		            img.id = "prev_" + previewId;
		            img.classList.add("obj");
		            img.file = file;
		            img.style.width = '145px'; //기본설정된 div의 안에 뿌려지는 효과를 주기 위해서 div크기와 같은 크기를 지정해준다.
		            img.style.height = '190px';
		            
		            preview.appendChild(img);

		            if (window.FileReader) { // FireFox, Chrome, Opera 확인.
		                var reader = new FileReader();
		                reader.onloadend = (function(aImg) {
		                    return function(e) {
		                        aImg.src = e.target.result;
		                    };
		                })(img);
		                reader.readAsDataURL(file);
		            } else { // safari is not supported FileReader
		                //alert('not supported FileReader');
		                if (!document.getElementById("sfr_preview_error_"+ previewId)) {
		                    var info = document.createElement("p");
		                    info.id = "sfr_preview_error_" + previewId;
		                    info.innerHTML = "not supported FileReader";
		                    preview.insertBefore(info, null);
		                }
		            }
		        }
		    }
		}
		
		// 선택된 type에 따른 content Ajax로 조회
		function getBranchList1(){
		
		$.post("<c:url value='/rms/appdoc/wishBranchList1.do'/>", $("#frm").serialize(), function (html)
		{
			$("#branch_name1").html(html);
		});
		
		}
		
		// 선택된 type에 따른 content Ajax로 조회
		function getBranchList2(){
		
		$.post("<c:url value='/rms/appdoc/wishBranchList2.do'/>", $("#frm").serialize(), function (html)
		{
			$("#branch_name2").html(html);
		});
		
		}
		
		function sub(){
			
			var chk_tf = document.getElementById("exam"); 	
			
			//검정고시 체크 여부 확인
			if(chk_tf.checked == true){					
				$.post("<c:url value='/rms/appdoc/exam1.do'/>", $("#frm").serialize(), function (html)
						{							
							$("#exam_tf").html(html);
						});				
			}else{				
				$.post("<c:url value='/rms/appdoc/exam2.do'/>", $("#frm").serialize(), function (html)
						{
							$("#exam_tf").html(html);
						});
			}
			
			// 날짜 입력 제한
			var chk_day_length = document.getElementById("day");			
			var day_val = chk_day_length.value;			
			var day_Array = day_val.split("-");
			
			/*
			var chk_mili_start_day_length = document.getElementById("mili_start_day");			
			var mili_start_day_val = chk_mili_start_day_length.value;			
			var mili_start_day_Array = mili_start_day_val.split("-");
			*/

			if(day_val==null || day_val==""){
					//실제 submit을 통한 입사지원서 저장
					$("#frm").attr("action", "<c:url value='/rms/appdoc/appdocInsert.do'/>").submit();						
			}else{
				
					if(day_Array[0].length==4 && day_Array[1].length==2 && day_Array[2].length==2){
						//실제 submit을 통한 입사지원서 저장
						$("#frm").attr("action", "<c:url value='/rms/appdoc/appdocInsert.do'/>").submit();				
					}else{
						alert("날짜 입력 형식이 잘못되었습니다.");
						document.getElementById("day").focus();				
					}	
			}
			
		}
		
</script>
</head>

<body>
<br/><br/>
		<!-- #### body #### -->
		<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td style="padding:25 0 0 25" width="657">
					<!-- #### title #### -->

					<table border="0" cellpadding="0" cellspacing="0" class="mgn_b01">
						<tr>
							<td background="/KCC_RMS/images/rms/kcc/bg_subTitle.gif">
								<table width="657" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="124"><img src="/KCC_RMS/images/rms/kcc/title_online.gif"></td>
										<td valign="top" style="padding-top:6"><img src="/KCC_RMS/images/rms/kcc/bg_newsExp.gif"></td>
										<td align="right" class="history"><a href="../index.asp" class="history">Home</a> >  <a href="../about/sub_main.asp" class="history">기업정보</a> > <a href="./news.asp" class="history">채용정보</a> > <span class="history"><strong>온라인 입사지원</strong></span></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>

					<!-- #### //title #### -->
					<table border="0" cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td class="lpad_01"><img src="/KCC_RMS/images/rms/kcc/txt_online02_01.gif"></td>
						</tr>
					</table>
					<!-- #### 여백 #### -->
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr><td class="h_02"></td></tr>
					</table>
					<!-- #### //여백 #### -->
					
				</td>
			</tr>
		</table>
			<!-- #### //body #### -->	
						
		<!-- #### 입사지원서 작성 폼 #### -->

		<form id="frm" name="frm" method="post" enctype="multipart/form-data" >
		  
			<input type="hidden" id="app_user_no" name="app_user_no" value="${app_user_no}">
			<input type="hidden" id="rec_noti_no" name="rec_noti_no" value="${rec_noti_no}">
			<input type="hidden" id="branch_no" name="branch_no" value="${branch_no}">
			
		  		<table>
					<tr>
							<td class="stit"><font style="color:black">희망지사</font></td>
					</tr>
				</table>
				<table width="60%" class="box_02">
					<tr>
							<td>	1지망</td>
							<td>
									<select id="typeSelect1" name="typeSelect1" onclick="getBranchList1()"  style="width: 180px;">
											<c:forEach var="branch" items="${branch}" varStatus="vs">
											<option value="<c:out value="${branch.company_name}"/>">${branch.company_name}</option>
											</c:forEach>
									</select>
							</td>
							<td>
									<select id="branch_name1" name="branch_name1" style="width: 130px;">
									<option value="">선택</option>						 
									</select>
							</td>
							<td>2지망</td>
							<td>
									<select id="typeSelect2" name="typeSelect2" onclick="getBranchList2()"  style="width: 180px;">
											<c:forEach var="branch" items="${branch}" varStatus="vs">
											<option value="<c:out value="${branch.company_name}"/>">${branch.company_name}</option>
											</c:forEach>
									</select>
							</td>
							<td>
									<select id="branch_name2" name="branch_name2" style="width: 130px;">
									<option value="">선택</option>						 
									</select>
							</td>
					</tr>	
				</table>
													
						<c:forEach var="fil" items="${formItemList }">
						<c:set var="appListCode" value="${fil.app_list_code }"/>
							<c:choose>
								<c:when test="${appListCode =='PSINFO01' }">
								<section style="padding-top: 2%; padding-bottom: 0%"></section>		
								<c:set var="abi" value="${appBaseInfo }"/>
<%-- 									<h3>${fil.app_list_code_name }</h3> --%>
									
									<div class="listType3 mt10">
										<table>
											<tr>
													<td class="stit"><font style="color:black">개인정보</font></td>
												</tr>
										</table>
										<table width="60%" class="box_02">
<!-- 												<tr> -->
<!-- 													<td class="stit"><font style="color:black">개인정보</font></td> -->
<!-- 												</tr> -->
											<tbody>
												<tr class="odd">
													<th rowspan="7" style="text-align: center; width: 145px; height: 190px;  border: 1px solid black;" id="previewId" name="previewId" ></th>														
													<th style="text-align: center;">성명</th>
													<td class="left">${abi.app_user_name }</td>
													<th style="text-align: center;">${PSINFO01[0].app_item_name}</th>
													<td class="left">
														<select style="width: 100px;" id="gender" name="PSINFO01|PSINFO007|1">
															<option value="남자">남자</option>
															<option value="여자">여자</option>
														</select>
													</td>
												</tr>
												<tr class="even">
													<th style="text-align: center;"><c:out value="${PSINFO01[1].app_item_name }"></c:out></th>
													<td class="left">
														<input type="text" id="day" name="PSINFO01|PSINFO002|1"  class="ipt_st01" maxlength="10">&nbsp;예)2014-09-02				
																																				
													</td>
													<th style="text-align: center;">
														<c:out value="${PSINFO01[2].app_item_name }"></c:out>
													</th>
													<td class="left"><input type="text" id="eng_name" name="PSINFO01|PSINFO001|1"  class="ipt_st01"></td>
													
													</td>
												</tr>
												<tr class="odd">
													<th style="text-align: center;">채용구분</th>
													<td class="left" style="color: red;">${abi.rec_noti_title}</td>
													<th style="text-align: center;">지원분야</th>
													<td class="left" style="color: red;">${abi.rec_field_name}</td>
												</tr>
												<tr class="even">
													<th style="text-align: center;">경력구분</th>
													<td class="left">
														<select style="100px;">
															<option value="신입">신입</option>
															<option value="경력">경력</option>
														</select>
													</td>
													<th style="text-align: center;">추가지원</th>
													<td class="left"></td>
												</tr>																						
												<tr class="odd">
													<th style="text-align: center;">${PSINFO01[3].app_item_name}</th>
													<td class="left" colspan="3">
<!-- 													<input type="text" id="zipcode1" name="zipcode1" style="width: 50px;">&nbsp;-&nbsp;<input type="text" name="zipcode2"  style="width: 50px;"> -->
													<input type="text" name="PSINFO01|PSINFO004|1"  class="ipt_st01" readonly="readonly"/>
<!-- 													<input type="button" value="검색" name="addrbtn" onclick="search()"/> -->
													<img src="/KCC_RMS/images/rms/kcc/btn_zipcode.gif" name="addrbtn" onclick="search();">
													</td>
												</tr>
												<tr class="odd">
													<th style="text-align: center;">주소</th>
													<td class="left" colspan="3">
													<input type="text" name="PSINFO01|PSINFO005|1" readonly="readonly" style="width: 300px;" class="ipt_st01"/>
													<input type="text" name="PSINFO01|PSINFO006|1" style="width: 300px;"  class="ipt_st01"/>												
													</td>
												</tr>
												<tr class="even">
													<th style="text-align: center;">${PSINFO01[6].app_item_name}</th>
													<td class="left">
														<input type="text" id="phone_num" name="PSINFO01|PSINFO003|1"  class="ipt_st01" maxlength="13">
													</td>
													<th style="text-align: center;">${PSINFO01[7].app_item_name}</th>
													<td class="left">
														<input type="text"  id="tel_num" name="PSINFO01|PSINFO008|1"  class="ipt_st01" maxlength="13">
													</td>
												</tr>
												<tr class="odd">
													<th><input type="file" id="imageFile" name="imageFile" onchange="previewImage(this,'previewId')"></th>
													<th style="text-align: center;">E-mail</th>
													<td class="left" colspan="3">${abi.app_user_email_addr}</td>
												</tr>
												
											
											</tbody>
										</table>
									</div>
								</c:when>


								<c:when test="${ appListCode == 'BASINFO01'}">
									<section style="padding-top: 2%; padding-bottom: 0%"></section>						
<%-- 									<h3><c:out value="${fil.app_list_code_name }"></c:out> </h3> --%>
									<div class="listType3 mt10">
										<table width="60%" class="box_02">												
											<tbody>											
												<tr class="odd">
													<th style="text-align: center;">병역사항</th>
													<td scope="col">
														<select id="miliSelect" name="BASINFO01|BASICINFO005|1" style="width: 100px;" >
															<option value="">선택</option>
															<option value="필">필</option>
															<option value="미필">미필</option>
															<option value="면제">면제</option>
														</select>
													</td>
													<th style="text-align: center;">군별</th>
													<td><input type="text" id="miliKind" name="BASINFO01|BASICINFO006|1" class="ipt_st01"></td>
													<th style="text-align: center;">병과</th>
													<td><input type="text" id="" name="BASINFO01|BASICINFO007|1" class="ipt_st01"></td>
													<th style="text-align: center;">계급</th>
													<td><input type="text" id="" name="BASINFO01|BASICINFO008|1" class="ipt_st01"></td>
													<th style="text-align: center;">복무기간</th>
													<td class="btn">
						                                <input type="text" id="mili_start_day" name="BASINFO01|BASICINFO009|1" style="width:80px;" class="ipt_st01" maxlength="10"/>                                    
						                                    ~
						                                <input type="text" id="mili_end_day" name="BASINFO01|BASICINFO010|1" style="width:80px;" class="ipt_st01" maxlength="10"/>                                
						                            </td>
												</tr>
												<tr class="even">
													<th scope="col">보훈사항</th>
													<td scope="col">
														<select id="protectSelect" name="BASINFO01|BASICINFO001|1" style="width: 100px;" onchange="">
															<option value="">선택</option>
															<option value="미대상">미대상</option>
															<option value="대상">대상</option>
														</select>
													</td>
													<th scope="col">보훈번호</th>
													<td colspan="7" scope="col"><input type="text" id="" name="BASINFO01|BASICINFO002|1" class="ipt_st01"></td>
													
												</tr>
												<tr class="odd">
													<th scope="col">장애사항</th>
													<td scope="col">
														<select id="protectSelect" name="BASINFO01|BASICINFO003|1" style="width: 100px;" onchange="">
															<option value="">선택</option>
															<option value="미대상">미대상</option>
															<option value="대상">대상</option>
														</select>
													</td>
													<th scope="col">장애등급</th>
													<td colspan="7" scope="col"><input type="text" id="" name="BASINFO01|BASICINFO004|1" class="ipt_st01"></td>
													
												</tr>																							
											</tbody>
										</table>
									</div>
								</c:when>								


								<c:when test="${appListCode =='FAM01'}">
									<c:set var="fam" value="${FAM01}"/>
									<section style="padding-top: 2%; padding-bottom: 0%"></section>
<%-- 									<h3><c:out value="${fil.app_list_code_name }"></c:out></h3> --%>
										<table>		
												<tr>
													<td class="stit"><font style="color:black">가족사항</font></td>
												</tr>
										</table>
									<div class="listType3 mt10">
										<table  width="60%" class="box_02">
											<thead>
												<tr>													
													<th class="th"></th>
													<c:set var="famSize" value="0"/>
													<c:forEach var="i" items="${fam}">													
														<c:set var="famSize" value="${famSize+1 }"/>
														<th class="th"><c:out value="${i.app_item_name}"></c:out></th>
													</c:forEach>													
												</tr>
												
											</thead>
											<tbody>
												<tr class="odd">
													<th class="th" rowspan="${fam.size()/famSize }">가족관계</th>
													<c:set var="tempIdx" value="0"/>
													<c:forEach var="j" items="${fam}">													
													<c:if test="${tempIdx == famSize }">
												</tr>
												<tr class="odd">
													</c:if>
													<c:set var="tempIdx" value="${tempIdx+1 }"/>
													<td style="text-align:center;"><input type="text" id="relation" name="FAM01|${j.app_item_no}|1" class="ipt_st01"></td>													
													</c:forEach>
												</tr>
											</tbody>
										</table>
									</div>
								</c:when>
								

								
  
								<c:when test="${appListCode =='STUDY01'}">
									<section style="padding-top: 2%; padding-bottom: 0%"></section>
									
<%-- 									<h3><c:out value="${fil.app_list_code_name }"></c:out></h3> --%>
									<div class="listType3 mt10">
										<table>
											<tr>
													<td class="stit"><font style="color:black">고등학교</font></td>
												</tr>
										</table>
										<table  width="60%" class="box_02">
<!-- 												<tr> -->
<!-- 													<td class="stit"><font style="color:black">고등학교</font></td> -->
<!-- 												</tr> -->
											<tbody>											
												<tr class="odd">
													<th scope="col" style="text-align: center;"><c:out value="${STUDY01[0].app_item_name }"/></th>
													<td colspan="3"><input type="text" id="" name="STUDY01|STUDY001|1" class="ipt_st01">
														<input type="checkbox" id="exam" name="exam"> <spanclass="chk_txt">검정고시</span>
														<div id="exam_tf" name="exam_tf">

														</div>
													</td>
												</tr>
												<tr class="even">
													<th scope="col" style="text-align: center;"><c:out value="${STUDY01[2].app_item_name }"/></th>
														<td scope="col">
															<input type="text" id="" name="STUDY01|STUDY003|1" value="" class="ipt_st01" maxlength="7">
															~
															<input type="text" id="" name="STUDY01|STUDY004|1" value="" class="ipt_st01" maxlength="7">
															&nbsp;예)2014-09
														</td>
													<th scope="col" style="text-align: center;"><c:out value="${STUDY01[4].app_item_name }"/></th>
													<td scope="col">
 														<select id="" name="STUDY01|STUDY005|1" onchange="" style="width: 100px">
 															<option value="">선택</option>
															<option value="졸업">졸업</option>
 															<option value="졸업예정">졸업예정</option>
 															<option value="중퇴">중퇴</option>
														</select>
													</td>
												</tr>
												<tr class="odd">
													<th scope="col" style="text-align: center;" ><c:out value="${STUDY01[5].app_item_name}"/></th>
													<td colspan="3">
														<select id="" name="STUDY01|STUDY006|1" style="width: 100px">
															<option value="">계열선택</option>
															<option value="인문계">인문계</option>
															<option value="예체능계">예/체능계</option>
															<option value="공업계">공업계</option>
															<option value="상업계">상업계</option>
															<option value="실업기타분야">실업기타분야</option>
														</select>
													</td>
												</tr>
												<tr class="even">
													<th scope="col" style="text-align: center;" width="150"><c:out value="${STUDY01[6].app_item_name}"/></th>
													<td scope="col" colspan="3">
														<input type="text" id="" name="STUDY01|STUDY007|1" value="" class="ipt_st01">
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									</c:when>
									<c:when test="${appListCode=='STUDY02' }">
										<div class="listType3 mt10">
										<section style="padding-top: 2%; padding-bottom: 0%"></section>
											<table>
												<tr>
													<td class="stit"><font style="color:black">대학</font></td>
												</tr>
											</table>
											<table width="60%" class="box_02">
<!-- 												<tr> -->
<!-- 													<td class="stit"><font style="color:black">대학</font></td> -->
<!-- 												</tr> -->
												<tbody>												
													<tr class="odd">
														<th scope="col" style="text-align: center;"><c:out value="${STUDY02[0].app_item_name}"/></th>
														<td scope="col"><input type="text" id="" name="STUDY02|STUDY001|1" value="" class="ipt_st01"><c:out value="${STUDY02[0].app_item_content}"/></td>
													</tr>
													<tr class="even">
														<th scope="col" style="text-align: center;"><c:out value="${STUDY02[1].app_item_name}"/></th>
														<td scope="col"><input type="text" id="" name="STUDY02|STUDY002|1" class="ipt_st01" maxlength="7"><c:out value="${STUDY02[1].app_item_content}"/>
															<select id="" name="STUDY02|STUDY004|1" style="width: 100px;" onchange="">
																<option value="">선택</option>
																<option value="entrance">입학</option>
																<option value="transfer">편입</option>
															</select>
															~
															<input type="text" id="" name="STUDY02|STUDY003|1" class="ipt_st01" maxlength="7" >
															<select id="" name="STUDY02|STUDY005|1" class="select" title="졸업구분" style="width: 100px" onchange="">
																<option value="">선택</option>
																<option value="졸업">졸업</option>
																<option value="졸업예정">졸업예정</option>
																<option value="중퇴">중퇴</option>
																<option value="수료">수료</option>
																<option value="휴학">휴학</option>
															</select>
															&nbsp;예)2014-09
														</td>
													</tr>	
													<tr class="odd">
														<th rowspan="2" scope="col" style="text-align: center;" width="150">전공</th>
														<td scope="col" width="400">
															<select id="" name="STUDY02|STUDY006|1" class="select" title="전공구분" style="width: 100px" onchange="">
																<option value="전문 학사">(전문)학사</option>
																<option value="학사">학사</option>
																<option value="석사">석사</option>
																<option value="박사">박사</option>
															</select>
															<input type="text" id="" name="STUDY02|STUDY007|1" value="" class="ipt_st01">
														</td>
														<th scope="col" style="text-align: center;" width="150">학점</th>
														<td scope="col">
															<input type="text" id="" name="STUDY02|STUDY010|1" class="ipt_st01">
															<select id="" name="STUDY02|STUDY011|1" class="select" title="총점" style="width: 100px;" onchange="">
																<option value="">총점</option>
																<option value="3.80">3.80</option>
																<option value="4.0">4.0</option>
																<option value="4.5">4.50</option>
																<option value="100">100</option>
															</select>
														</td>
													</tr>
													<tr class="odd">
														<td colspan="3" scope="col">
															<select id="" name="STUDY02|STUDY008|1" class="select" title="전공구분" style="width: 100px;" onchange="">
																<option value="복수전공">복수전공</option>
																<option value="부전공">부전공</option>
															</select>
															<input type="text" id="" name="STUDY02|STUDY009|1" value="" class="ipt_st01">
														</td>
														
													</tr>
													<tr class="even">
														<th scope="col" style="text-align: center;" width="150">소재지</th>
														<td colspan="3" scope="col">
															<input type="text" id="" name="STUDY02|STUDY012|1" class="ipt_st01">
														</td>
													</tr>
												</tbody>
											</table>
										</div>									
								</c:when>					
								
						<c:when test="${ appListCode == 'LANG01'}">
								<section style="padding-top: 2%; padding-bottom: 0%"></section>						
<%-- 								<h3><c:out value="${fil.app_list_code_name }"></c:out> </h3> --%>
								<table>
										<tr>
											<td class="stit"><font style="color:black">어학사항</font></td>
										</tr>
								</table>
								<c:set var="langLastListNo" value="1"/>
								<div id="langDivHead">
								<div class="listType3" id="langDiv${langLastListNo}">

								<table  width="60%" class="box_02">					
										<tr class="odd">
												<th style="text-align: center;"><c:out value="${LANG01[0].app_item_name}"/></th>
												<td scope="col">
												<input type="text" id="langInputId${LANG01[0].list_no}" name="LANG01|LANG001|${langLastListNo}" value="" class="ipt_st01"> 
												</td>
												<th style="text-align: center;"><c:out value="${LANG01[1].app_item_name}"/></th>
												<td scope="col">
													<input type="text" id="langInputId${LANG01[1].list_no}" name="LANG01|LANG002|${langLastListNo}" value="" class="ipt_st01">
												</td>
												<th style="text-align: center;"><c:out value="${LANG01[2].app_item_name}"/></th>
												<td scope="col">												
													<input type="text" id="langInputId${LANG01[2].list_no}" name="LANG01|LANG003|${langLastListNo}" value="" class="ipt_st01">
												</td>
										</tr>
										<tr class="even">
											<th style="text-align: center;"><c:out value="${LANG01[3].app_item_name}"/></th>
											<td scope="col"><input type="text" id="langInputId${lang[3].list_no }" name="LANG01|LANG004|${langLastListNo}" class="ipt_st01"></td>
											<th style="text-align: center;"><c:out value="${LANG01[4].app_item_name}"/></th>
											<td scope="col">
												<input type="text" id="langInputId${LANG01[4].list_no}" name="LANG01|LANG005|${langLastListNo}" value="" class="ipt_st01" maxlength="10">
												&nbsp;예)2014-09-02
											</td>
										</tr>
								</table>
								
								</div>
							</div>							
							
							<input type="text" id="langLastListNo" name="langLastListNo" value="${langLastListNo}"/>
							<input type="button" value="추가" onclick="addDynamicTable('lang')">

						</c:when>

						
						<c:when test="${ appListCode == 'CERTI01'}">
								<section style="padding-top: 2%; padding-bottom: 0%"></section>						
<%-- 								<h3><c:out value="${fil.app_list_code_name }"></c:out> </h3> --%>
								<table>
										<tr>
											<td class="stit"><font style="color:black">자격/면허사항</font></td>
										</tr>
								</table>
								<table  width="60%" class="box_02">
<!-- 										<tr> -->
<!-- 											<td class="stit"><font style="color:black">자격/면허사항</font></td> -->
<!-- 										</tr> -->
										<tr class="odd">
										<th style="text-align: center;">자격증명</th>
										<td scope="col">
											<input type="text" id="" name="CERTI01|CERTI001|1" value="" class="ipt_st01">
										</td>
									</tr>
									<tr class="even">
										<th style="text-align: center;">발급기관</th>
										<td><input type="text" id="" name="CERTI01|CERTI002|1" value="" class="ipt_st01"></td>
										<th style="text-align: center;">취득일자</th>
										<td>
											<input type="text" id="" name="CERTI01|CERTI003|1" value="" class="ipt_st01" maxlength="10">
											&nbsp;예)2014-09-02
										</td>
									</tr>
								</table>
						</c:when>
						
						<c:when test="${ appListCode == 'EDU01'}">
								<section style="padding-top: 2%; padding-bottom: 0%"></section>						
<%-- 								<h3><c:out value="${fil.app_list_code_name }"></c:out> </h3> --%>
									<table>
										<tr>
										<td class="stit"><font style="color:black">교육사항</font></td>
										</tr>
									</table>
									<table  width="60%" class="box_02">
<!-- 									<tr> -->
<!-- 										<td class="stit"><font style="color:black">교육사항</font></td> -->
<!-- 									</tr> -->
								<tbody>
								
									<tr class="odd">
										<th style="text-align: center;">교육기관</th>
										<td colspan="3" scope="col">
											<input type="text" id="" name="EDU01|EDU001|1" value="" class="ipt_st01">
										</td>
									</tr>
									<tr class="even">
										<th style="text-align: center;">과목명</th>
										<td><input type="text" id="" name="EDU01|EDU002|1" value="" class="ipt_st01"></td>
										<th style="text-align: center;">교육기간</th>
										<td>
											<input type="text" id="" name="EDU01|EDU003|1" value="" class="ipt_st01" maxlength="10">
											~
											<input type="text" id="" name="EDU01|EDU004|1" value="" class="ipt_st01" maxlength="10">
										&nbsp;예)2014-09-02
										</td>
									</tr>
									<tr class="odd">
										<th style="text-align: center;">내용 (500자이내)</th>
										<td colspan="3" scope="col">
											<input type="text" id="" name="EDU01|EDU005|1" value="" style="width: 500px;" class="ipt_st01">
										</td>
									</tr>
								</tbody>
							</table>
						</c:when>
						
							<c:when test="${ appListCode == 'EXP01'}">
								<section style="padding-top: 2%; padding-bottom: 0%"></section>						
<%-- 								<h3><c:out value="${fil.app_list_code_name }"></c:out> </h3> --%>
								<table>
									<tr>
											<td class="stit"><font style="color:black">해외경험</font></td>
									</tr>
								</table>
								<table  width="60%" class="box_02">
<!-- 									<tr> -->
<!-- 											<td class="stit"><font style="color:black">해외경험</font></td> -->
<!-- 									</tr> -->
								<tbody>
								
									<tr class="odd">
										<th style="text-align: center;">국가명</th>
										<td scope="col">
											<input type="text" id="" name="EXP01|EXP001|1" value="" class="ipt_st01">
										</td>
										<th style="text-align: center;">체류기간</th>
										<td scope="col">
											<input type="text" id="" name="EXP01|EXP002|1" value="" class="ipt_st01" maxlength="10">
											~
											<input type="text" id="" name="EXP01|EXP003|1" value="" class="ipt_st01" maxlength="10">
											&nbsp;예)2014-09-02
										</td>
									</tr>
									<tr class="even">
										<th style="text-align: center;">목적 및 내용</th>
										<td colspan="3" scope="col">
											<input type="text" id="" name="EXP01|EXP004|1" value="" style="width: 500px;" class="ipt_st01">
										</td>
									</tr>
								</tbody>
							</table>
						</c:when>
						
						<c:when test="${ appListCode == 'AWARD01'}">
								<section style="padding-top: 2%; padding-bottom: 0%"></section>						
<%-- 								<h3><c:out value="${fil.app_list_code_name }"></c:out> </h3> --%>
								<table>
									<tr>
											<td class="stit"><font style="color:black">수상내역</font></td>
									</tr>
								</table>
								<table  width="60%" class="box_02">
								<tbody>
								
									<tr class="odd">
										<th style="text-align: center;">수상내역</th>
										<td colspan="3" scope="col">
											<input type="text" id="" name="AWARD01|AWARD001|1" value="" class="ipt_st01">
										</td>
									</tr>
									<tr class="even">
										<th style="text-align: center;">수여기관</th>
										<td scope="col">
											<input type="text" id="" name="AWARD01|AWARD002|1" value="" class="ipt_st01">
										</td>
										<th style="text-align: center;">수상날짜</th>
										<td>
											<input type="text" id="" name="AWARD01|AWARD003|1" value="" class="ipt_st01" maxlength="10">
											&nbsp;예)2014-09-02
										</td>
									</tr>
								</tbody>
							</table>
						</c:when>
						
						<c:when test="${ appListCode == 'ACTIV01'}">
								<section style="padding-top: 2%; padding-bottom: 0%"></section>						
<%-- 								<h3><c:out value="${fil.app_list_code_name }"></c:out> </h3> --%>
								<table>
									<tr>
											<td class="stit"><font style="color:black">대외활동</font></td>
									</tr>
								</table>
								<table  width="60%" class="box_02">
<!-- 									<tr> -->
<!-- 											<td class="stit"><font style="color:black">대외활동</font></td> -->
<!-- 									</tr> -->
								<tbody>								
									<tr class="odd">
										<th style="text-align: center;">활동구분</th>
										<td colspan="3" scope="col">
											<input type="text" id="" name="ACTIV01|ACTIV001|1" value="" class="ipt_st01">
										</td>
									</tr>
									<tr class="even">
										<th style="text-align: center;">봉사기관/장소</th>
										<td scope="col">
											<input type="text" id="" name="ACTIV01|ACTIV002|1" value="" class="ipt_st01">
										</td>
										<th style="text-align: center;">활동기간</th>
										<td>
											<input type="text" id="" name="ACTIV01|ACTIV003|1" value="" class="ipt_st01" maxlength="10"> 
											~
											<input type="text" id="" name="ACTIV01|ACTIV004|1" value="" class="ipt_st01" maxlength="10"> 	
											&nbsp;예)2014-09-02									
										</td>
									</tr>
									<tr class="odd">
										<th style="text-align: center;">활동내용</th>
										<td colspan="3" scope="col">
											<input type="text" id="" name="ACTIV01|ACTIV005|1" value="" style="width: 500px;" class="ipt_st01">
										</td>
									</tr>
								</tbody>
							</table>
						</c:when>
						
						<c:when test="${ appListCode == 'CAREER01'}">
								<section style="padding-top: 2%; padding-bottom: 0%"></section>						
<%-- 								<h3><c:out value="${fil.app_list_code_name }"></c:out> </h3> --%>
								<table>
										<tr>
											<td class="stit"><font style="color:black">경력사항</font></td>
										</tr>
								</table>
								<table  width="60%" class="box_02">
<!-- 										<tr> -->
<!-- 											<td class="stit"><font style="color:black">경력사항</font></td> -->
<!-- 										</tr> -->
								<tbody>								
									<tr class="odd">
										<th style="text-align: center;">회사명</th>
										<td colspan="3" scope="col">
											<input type="text" id="" name="CAREER01|CAREER001|1" value="" class="ipt_st01">
										</td>
									</tr>
									<tr class="even">
										<th style="text-align: center;">고용형태</th>
										<td scope="col">
											<input type="text" id="" name="CAREER01|CAREER002|1" value="" class="ipt_st01">
										</td>
										<th style="text-align: center;">이직사유</th>
										<td>
											<input type="text" id="" name="CAREER01|CAREER003|1" value="" class="ipt_st01">
										</td>
									</tr>
									<tr class="odd">
										<th style="text-align: center;">근무기간</th>
										<td colspan="3" scope="col">
											<input type="text" id="" name="CAREER01|CAREER004|1" value="" class="ipt_st01" maxlength="10">
											~
											<input type="text" id="" name="CAREER01|CAREER005|1" value="" class="ipt_st01" maxlength="10">
											&nbsp;예)2014-09-02
										</td>
									</tr>
									<tr class="even">
										<th style="text-align: center;">근무부서</th>
										<td scope="col">
											<input type="text" id="" name="CAREER01|CAREER006|1" value="" class="ipt_st01"> 
										</td>
										<th style="text-align: center;">직급</th>
										<td>
											<input type="text" id="" name="CAREER01|CAREER007|1" value="" class="ipt_st01">
										</td>
									</tr>
									<tr class="odd">
										<th style="text-align: center;">연봉</th>
										<td scope="col">
											<input type="text" id="" name="CAREER01|CAREER008|1" value="" class="ipt_st01">&nbsp;만원
										</td>
										<th style="text-align: center;">희망연봉</th>
										<td>
											<input type="text" id="" name="CAREER01|CAREER009|1" value="" class="ipt_st01">&nbsp;만원
										</td>
									</tr>
									<tr class="odd">
										<th style="text-align: center;">담당업무</th>
										<td colspan="3" scope="col">
											<input type="text" id="" name="CAREER01|CAREER010|1" value="" class="ipt_st01">
										</td>
									</tr>
									<tr class="even">
										<th rowspan="2" scope="col" style="text-align: center;">경력기술 상세</th>
										<td colspan="3" scope="col">
											영업활동에서 주로 활용하는 기법을 기술해 주시기 바랍니다. (예: 동호회활동, 내방고객 위주 등)
										</td>
									</tr>
									<tr class="odd">
										<td colspan="3" scope="col">
											<input type="text" id="" name="CAREER01|CAREER011|1" value="" style="width: 500px;" class="ipt_st01">
										</td>
									</tr>
									<tr>
										<td class="t_gray_11px" colspan="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="/KCC_RMS/images/rms/kcc/ico_num01.gif" class="ico_txt2">신입의 경우 경력 사항은 반드시 입력하지 않으셔도 됩니다.</td>
									</tr>
									<tr><td height="7"></td></tr>
									<tr>
										<td class="t_gray_11px" colspan="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="/KCC_RMS/images/rms/kcc/ico_num02.gif" class="ico_txt2">인턴과 같이 풀 타임(full-time)으로 기업체에서 근무하신 경험 위주로 기재하시기 바랍니다.</td>
									</tr>	
								</tbody>
							</table>
						</c:when>
						
						<c:when test="${ appListCode == 'RESUME01'}">
								<section style="padding-top: 2%; padding-bottom: 0%"></section>						
<%-- 								<h3><c:out value="${fil.app_list_code_name }"></c:out> </h3> --%>
								<table>
										<tr>
											<td class="stit"><font style="color:black">자기소개서</font></td>
										</tr>
								</table>
								<table  width="60%" class="box_02">
								<tbody>
									<tr class="odd">
										<th style="text-align: center;" width="100">성장과정</th>
										<td scope="col">
											<textarea type="text" name="RESUME01|RESUME001|1" style="width:900px; height:200px;"></textarea>
										</td>
									</tr>
								</tbody>
							</table>
						</c:when>
								
				</c:choose>							
			</c:forEach>						
  
						
						
						<!--  					
						<h3>어학능력</h3>
						<div class="listType3 mt10">
							<table border="1">
								<colgroup>
									<col width="180px" />
									<col width="*%" />
									<col width="15%" />
									<col width="*% " />
								</colgroup>
								<tbody>
								
									<tr class="odd">
										<th style="text-align: center;">시험명</th>
										<td scope="col">
											<input type="text" id="" name="LANG001" value=""> 
										</td>
										<th style="text-align: center;">점수</th>
										<td scope="col">
											<input type="text" id="" name="LANG002" value="">
										</td>
									</tr>
									<tr class="even">
										<th style="text-align: center;">발급기관</th>
										<td><input type="text" id="" name="LANG004"></td>
										<th style="text-align: center;">취득일자</th>
										<td>
											<input type="text" id="" name="LANG005" value="">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						-->
						
						
						<!--  					
						<h3>자격증</h3>
						<div class="listType3 mt10">
							<table border="1">
								<colgroup>
									<col width="180px" />
									<col width="*%" />
									<col width="15%" />
									<col width="*% " />
								</colgroup>
								<tbody>
								
									<tr class="odd">
										<th style="text-align: center;">자격증명</th>
										<td colspan="3" scope="col">
											<input type="text" id="" name="" value="">
										</td>
									</tr>
									<tr class="even">
										<th style="text-align: center;">발급기관</th>
										<td><input type="text" id="" name="" value=""></td>
										<th style="text-align: center;">취득일자</th>
										<td>
											<input type="text" id="" name="" value="">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						-->
						
						
						<!--  					
						<h3>교육수료사항</h3>
						<div class="listType3 mt10">
							<table border="1">
								<colgroup>
									<col width="180px" />
									<col width="*%" />
									<col width="15%" />
									<col width="*% " />
								</colgroup>
								<tbody>
								
									<tr class="odd">
										<th style="text-align: center;">교육기관</th>
										<td colspan="3" scope="col">
											<input type="text" id="" name="" value="">
										</td>
									</tr>
									<tr class="even">
										<th style="text-align: center;">과목명</th>
										<td><input type="text" id="" name="" value=""></td>
										<th style="text-align: center;">교육기간</th>
										<td>
											<input type="text" id="" name="" value="">
											~
											<input type="text" id="" name="" value="">
										</td>
									</tr>
									<tr class="odd">
										<th style="text-align: center;">내용 (500자이내)</th>
										<td colspan="3" scope="col">
											<input type="text" id="" name="" value="">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						-->
						
						
						<!--  					
						<h3>해외연수 및 경험</h3>
						<div class="listType3 mt10">
							<table border="1">
								<colgroup>
									<col width="180px" />
									<col width="*%" />
									<col width="15%" />
									<col width="*% " />
								</colgroup>
								<tbody>
								
									<tr class="odd">
										<th style="text-align: center;">국가명</th>
										<td scope="col">
											<input type="text" id="" name="" value="">
										</td>
										<th style="text-align: center;">체류기간</th>
										<td>
											<input type="text" id="" name="" value="">
											~
											<input type="text" id="" name="" value="">

										</td>
									</tr>
									<tr class="even">
										<th style="text-align: center;">목적 및 내용</th>
										<td colspan="3" scope="col">
											<input type="text" id="" name="" value="">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						-->
						
														
						<!--  			
						<h3>수상경력</h3>
						<div class="listType3 mt10">
							<table border="1">
								<colgroup>
									<col width="180px" />
									<col width="*%" />
									<col width="15%" />
									<col width="*% " />
								</colgroup>
								<tbody>
								
									<tr class="odd">
										<th style="text-align: center;">수상내역</th>
										<td colspan="3" scope="col">
											<input type="text" id="" name="" value="">
										</td>
									</tr>
									<tr class="even">
										<th style="text-align: center;">수여기관</th>
										<td scope="col">
											<input type="text" id="" name="" value="">
										</td>
										<th style="text-align: center;">수상날짜</th>
										<td>
											<input type="text" id="" name="" value="">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						-->
							
						<!--  				
						<h3>기타활동 (봉사 및 동호회 활동)</h3>
						<div class="listType3 mt10">
							<table border="1">
								<colgroup>
									<col width="180px" />
									<col width="*%" />
									<col width="15%" />
									<col width="*% " />
								</colgroup>
								<tbody>
								
									<tr class="odd">
										<th style="text-align: center;">활동구분</th>
										<td colspan="3" scope="col">
											<input type="text" id="" name="" value="">
										</td>
									</tr>
									<tr class="even">
										<th style="text-align: center;">봉사기관/장소</th>
										<td scope="col">
											<input type="text" id="" name="" value="">
										</td>
										<th style="text-align: center;">활동기간</th>
										<td>
											<input type="text" id="" name="" value=""> 
											~
											<input type="text" id="" name="" value="">											
										</td>
									</tr>
									<tr class="odd">
										<th style="text-align: center;">활동내용</th>
										<td colspan="3" scope="col">
											<input type="text" id="" name="" value="" style="width: 150px;">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						-->
						
								
						<!-- 			
						<h3>경력사항</h3>
						<div class="listType3 mt10">
							<table border="1">
								<colgroup>
									<col width="180px" />
									<col width="*%" />
									<col width="15%" />
									<col width="*% " />
								</colgroup>
								<tbody>
								
									<tr class="odd">
										<th style="text-align: center;">회사명</th>
										<td colspan="3" scope="col">
											<input type="text" id="" name="" value="">
										</td>
									</tr>
									<tr class="even">
										<th style="text-align: center;">고용형태</th>
										<td scope="col">
											<input type="text" id="" name="" value="">
										</td>
										<th style="text-align: center;">이직사유</th>
										<td>
											<input type="text" id="" name="" value="">
										</td>
									</tr>
									<tr class="odd">
										<th style="text-align: center;">근무기간</th>
										<td colspan="3" scope="col">
											<input type="text" id="" name="" value="">
											~
											<input type="text" id="" name="" value="">
										</td>
									</tr>
									<tr class="even">
										<th style="text-align: center;">근무부서</th>
										<td colspan="3" scope="col">
											<input type="text" id="" name="" value=""> 
										</td>
									</tr>
									<tr class="odd">
										<th style="text-align: center;">연봉</th>
										<td scope="col">
											<input type="text" id="" name="" value="">만원
										</td>
										<th style="text-align: center;">희망연봉</th>
										<td>
											<input type="text" id="" name="" value="">만원
										</td>
									</tr>
									<tr class="odd">
										<th style="text-align: center;">담당업무</th>
										<td colspan="3" scope="col">
											<input type="text" id="" name="" value="">
										</td>
									</tr>
									<tr class="even">
										<th rowspan="2" scope="col" style="text-align: center;">경력기술 상세</th>
										<td colspan="3" scope="col">
											영업활동에서 주로 활용하는 기법을 기술해 주시기 바랍니다. (예: 동호회활동, 내방고객 위주 등)
										</td>
									</tr>
									<tr class="odd">
										<td colspan="3" scope="col">
											<input type="text" id="" name="" value="" style="width: 500px;">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						 -->
						
								
						<!-- 			
						<h3>자기소개서</h3>
						<div class="listType3 mt10">
							<table border="1">
								<colgroup>
									<col width="180px" />
									<col width="*%" />
								</colgroup>
								<tbody>
									<tr class="odd">
										<th style="text-align: center;">성장과정</th>
										<td colspan="3" scope="col">
											<textarea rows="6" cols="170"></textarea>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						 -->
					
	<input type="button" id="appdocSubmit" name="appdocSubmit" value="저장" onclick="sub()">

</form>

</body>
</html> 