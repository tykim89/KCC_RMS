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
<link rel="stylesheet" href="<c:url value='/css/rms/cmn/layout.css'/>"
	type="text/css">
<link rel="stylesheet" href="<c:url value='/css/rms/cmn/base.css'/>"
	type="text/css">
<link rel="stylesheet" href="<c:url value='/css/rms/cmn/content.css'/>"
	type="text/css">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="/js/rms/com/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>

<script type="text/javaScript" language="javascript">
$(document).ready(function(){
	var addUserResult = '${addUserResult}';
	if(addUserResult !="")
	{
		if(addUserResult != 0)
		{
			alert("계정등록 성공.");					
		}else if(addUserResult == 0)
		{
			alert("계정등록 실패.");
		}
	}
});
	function init()
	{
	   if ($("#message").val() != "" && $("#message").val() != undefined)
	   {
	      alert($("#message").val());
	   }
	}
	function idChange() {
		$("#overlapCheckTf").val('F');
	}
	function preUserChange() {
		$("#preCheckTf").val('F');
	}
	function checkValid() {
		if($("#overlapCheckTf").val()=='T')
		{
			if($("#preCheckTf").val()=='T')
			{
				$("#addUserForm").attr("action", "<c:url value='/rms/sys/addUser.do'/>").submit();				
			}else
			{
				alert("기등록 확인을 실시해 주세요");
			}
		}else
		{
			alert("중복 확인을 실시해 주세요");
		}
	}
	function pwEqualCheck() {
		var pw = $("#admin_pw").val();
		var pwcheck =$("#pwcheck").val();
		if(pw !=pwcheck)
		{	
			if(pwcheck == "")
			{
				$("#pwEqualResult").html("  비밀번호 재확인 입력");
			}
			else
			{
				$("#pwEqualResult").html("  비밀번호가 일치하지 않습니다.");
			}
		}else
		{
			$("#pwEqualResult").html("");
		}
	}
	function layPop(id) {
		var layPopH = $(id).height();
		var layPopW = $(id).width();

		var topPos = (($(window).height() - layPopH) / 2);
		var leftPos = (($(window).width() - layPopW) / 2);
		$(id).css({
			'left' : leftPos,
			'top' : topPos
		});

		popup_bg();
		$(id).show();
		$("html").css("overflow", "hidden");

	}
	function layPopClose(id) {
		popup_bg_close();
		$(id).hide();
		$("html").css("overflow", "auto");
	}

	/* popup_bg */
	function popup_bg() {
		$(".popup_bg").height(($(document).height()));
		$(".popup_bg").show();
	}
	function popup_bg_close() {
		$(".popup_bg").hide();
	}
	function checkIdOverlap(num) {
		layPopClose(page1);
		layPopClose(page2);
		if(num==null)
		{
			num="";
		}
		if ($("#admin_id"+num).val() == "") 
		{
			alert('<spring:message code="cop.id.msg" />');
			$("#admin_id"+num).focus();
		} 
		else 
		{
			var id = $("#admin_id"+num).val();
			 $.post("<c:url value='/rms/sys/checkOverlap.do'/>", {admin_id : id}, function(xml)
	                  {						
				 			if($(xml).find('check').text()==0)
				 			{
				 				
				 					$("#admin_id").val(id);
				 					
				 				$("#overlapCheckTf").val('T');
				 				layPop(page2);
				 			}else
				 			{
				 				$("#admin_id2").val("");
				 				layPop(page1);
				 			}
	                  });
		}

	}
 	function checkPreUser() {
		layPopClose(page3);
		layPopClose(page4);
		if ($("#admin_name").val() == "") {
			
			alert('<spring:message code="cop.name.msg" />');
			$("#admin_name").focus();

		} 
		else if($("#admin_email_id").val() == "")
		{
			alert('<spring:message code="cop.email.msg" />');
			$("#admin_email_id").focus();
		}
		else
		{
			var name = $("#admin_name").val();
			var email=$("#admin_email_id").val();
			var email_url = $("#admin_email_addr_url").val();
			$.post("<c:url value='/rms/sys/checkPreUser.do'/>", {admin_name : name, admin_email_id : email, admin_email_addr_url : email_url}, function(xml)
	                  {						
				 			if($(xml).find('check1').text()==0)
				 			{
				 				$("#preCheckTf").val('T');
				 				layPop(page4);
				 			}else
				 			{
				 				layPop(page3);
				 			}
	                  });
		}

	}
</script>
</head>
<body onload="firstMenuList();">

<jsp:include page="/WEB-INF/jsp/rms/main_top.jsp" flush="true"/>
	<div id="wrap">
	<jsp:include page="/WEB-INF/jsp/rms/main_left.jsp" />
		<section id="contR"><!--contR:시작--> <%-- 	<section class="cont_top">
	<div class="path">
		<img src="./common/images/btn/btn_path_home.gif" alt="home" />HOME
		&gt; 항목관리 &gt; <strong>지원서양식관리</strong>
	</div>
	<div class="name">
		<span class="name_st">관리자</span>님 반갑습니다.
	</div>
	</section>  --%> <article>
		<h1>계정정보등록</h1>
		<div class="contents">
			<div class="listSearch">
				<span class="btn-pack btn-type_1"> <a class="" href="#LINK" onclick="checkValid();"><span
						class="ico_v"></span>등 록</a>
				</span>
			</div>
			<div class="listType3 mt10">
			<form id="addUserForm" name="addUserForm" action="" method="post">
			
				<table summary="">
					<colgroup>
						<col width="180px" />
						<col width="15%" />
						<col width="*%" />
					</colgroup>
					<tbody>
					
						<tr class="odd">
							<th rowspan="11"><img
								src="/KCC_RMS/images/rms/cmn/btn/icon-person.png" alt="사진" /></th>
							<th>아이디</th>
							
							<td class="left"><input type="text" id="admin_id"
								name="admin_id" style="width: 170px;" class="ipt_listIn2"
								value="" onchange="idChange()"/> <span class="btn-pack btn-type_2"> <a
									class="" href="#LINK" onclick="checkIdOverlap();"><span
										class="ico_v2"></span>중복확인</a></span></td>
						</tr>
						<input type="hidden" id="overlapCheckTf" name="overlapCheckTf" value=""/>
						<tr class="even">
							<th>비밀번호</th>
							<td class="left"><input type="password" id="admin_pw" name="admin_pw"
								style="width: 150px;" class="ipt_listIn2" value="" onchange="pwEqualCheck();"/></td>
						</tr>
						<tr class="odd">
							<th>비밀번호 재확인</th>
							<td class="left"><input type="password" id="pwcheck" name="pwcheck"
								style="width: 150px;" class="ipt_listIn2" value="" onchange="pwEqualCheck();"/><font color="red"><text id="pwEqualResult"></text></font></td>
						</tr>

						<tr class="even">
							<th>성명</th>
							<td class="left"><input type="text" id="admin_name" name="admin_name"
								style="width: 170px;" class="ipt_listIn2" value="" onchange="preUserChange();" /></td>
						</tr>
						<tr class="odd">
							<th>부서</th>
							<td class="left"><select name="company_no" style="width: 150px;"
								class="slt_blank">
									<c:forEach var="cList" items="${ companyList }">
									<option value="${cList.company_no }">${cList.company_name }</option>
									</c:forEach>
							</select> <select name="branch_no" style="width: 150px;" class="slt_blank">
									<c:forEach var="bList" items="${ branchList }">
									<option value="${bList.branch_no }">${bList.branch_name }</option>
									</c:forEach>
							</select> <select name="dep_no" style="width: 150px;" class="slt_blank">
									<c:forEach var="dList" items="${ deptList }">
									<option value="${dList.dep_no }">${dList.dep_name }</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr class="even">
							<th>직급</th>
							<td class="left"><select name="position_code" style="width: 150px;"
								class="slt_blank">
									<c:forEach var="pList" items="${ positionList }">
									<option value="${pList.detail_code }">${pList.detail_code_name }</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr class="odd">
							<th>휴대폰번호</th>
							<td class="left"><select id="phone_num1" name="phone_num1" style="width: 70px;"
								class="slt_blank">
									<option value="010" SELECTED>010</option>
									<option value="011">011</option>
									<option value="019">019</option>
									<option value="016">016</option>
									<option value="018">018</option>
							</select> - <input type="tel" id="phone_num2" name="phone_num2" style="width: 80px;"
								class="ipt_listIn2" value="" /> - <input type="tel" id="phone_num3" name="phone_num3"
								style="width: 80px;" class="ipt_listIn2" value="" /></td>

						</tr>
						<tr class="even">
							<th>내선번호</th>
							<td class="left"><select id="tel_num1" name="tel_num1" style="width: 70px;"
								class="slt_blank">
									<option value="02" SELECTED>02</option>
									<option value="031">031</option>
									<option value="032">032</option>
									<option value="042">042</option>
									<option value="062">062</option>
									<option value="051">051</option>
									<option value="053">053</option>
									<option value="033">033</option>
									<option value="041">041</option>
									<option value="043">043</option>
									<option value="061">061</option>
									<option value="063">063</option>
									<option value="055">055</option>
									<option value="054">054</option>
									<option value="064">064</option>
							</select> - <input type="tel" id="tel_num2" name="tel_num2" style="width: 80px;"
								class="ipt_listIn2" /> - <input type="tel" id="tel_num3" name="tel_num3"
								style="width: 80px;" class="ipt_listIn2" /></td>

						</tr>
						<tr class="odd">
							<th>E-mail</th>
							<td class="left"><input type="text" id="admin_email_id" name="admin_email_id"
								style="width: 150px;" class="ipt_listIn2" onchange="preUserChange();" />
								<select id="admin_email_addr_url" name="admin_email_addr_url" style="width: 150px;"
								class="ipt_listIn2" onchange="preUserChange();">
								<option value="kcc.co.kr" SELECTED>@ kcc.co.kr</option>
								<option value="kccsecurity.com">@ kccsecurity.com</option>
								<option value="sysone.co.kr">@ sysone.co.kr</option>
								</select>
								<input type="hidden" id="preCheckTf" value="F"/><span class="btn-pack btn-type_2">
									<a class="" href="#LINK" onclick="checkPreUser();"><span class="ico_v2"></span>기등록확인</a>
							</span></td>
						</tr>
					</tbody>
				</table>
				</form>
			</div>
			<!--//테이블2-->
		</div>
		<!--//contents--> </article> </section>
	</div>
	<!--//contR:끝-->
	<!--  -->
	<div class="layPop" id="page1">
		<div class="wrap" style="width: 550px;">
			<div class="cont">
				<dl class="pop_list">
					<dt>아이디 중복 확인</dt>
					<dd>
						<div class="con_wrap" style="height: 130px;">
						<form action="" id="">
							<div class="wcont">
								<div class="noti_box mt10">
									<p>
										이미 사용중인 아이디 입니다.<br /> 다른 아이디를 입력해 주세요.
									</p>

									<p class="mt10">
										<input type="text" id="admin_id2" name="admin_id2" style="width: 180px;"
											class="ipt_listIn" /> <span class="btn-pack btn-type_2">
											<a class="" href="#LINK" onclick="checkIdOverlap(2);"><span class="ico_ser"></span>검 색</a>
										</span>
									</p>
								</div>
								</form>
								<!--//테이블2-->
							</div>
						</div>
					</dd>
				</dl>
				<div class="close">
					<a href="#" onclick="layPopClose(page1);"><img
						src="/images/rms/cmn/btn/pop_btn_close.gif" alt="닫기" /></a>
				</div>
			</div>
		</div>
	</div>
	


	<!-- //page1 끝 -->
	<!-- page2 시작 -->
	<div class="layPop" id="page2">
		<div class="wrap" style="width: 550px;">
			<div class="cont">
				<dl class="pop_list">
					<dt>아이디 중복 확인</dt>
					<dd>
						<div class="con_wrap" style="height: 110px;">
							<div class="wcont">
								<div class="noti_box mt10">
									<p>사용 가능한 아이디입니다.</p>
								</div>
								<!--//테이블2-->
								<div class="pop_btn">
									<span class="btn-pack btn-type_1"> <a class="" href="#LINK" onclick="layPopClose(page2);"><span
											class="ico_v"></span> 확 인</a>
									</span>
								</div>
							</div>
						</div>
					</dd>
				</dl>
				<div class="close">
					<a href="#" onclick="layPopClose(page2);"><img
						src="/images/rms/cmn/btn/pop_btn_close.gif" alt="닫기" /></a>
				</div>
			</div>
		</div>
	</div>
	<!-- //page2 끝 -->
	<!-- page1 시작 -->
<div class="layPop" id="page3">
	<div class="wrap" style="width:550px;">
		<div class="cont">
			<dl class="pop_list">
				<dt>기등록확인</dt>
				<dd>
					<div class="con_wrap" style="height:110px;">
						<div class="wcont">
							<div class="noti_box mt10">
                                <p>이미 등록된 사용자 입니다.</p>
                            </div><!--//테이블2-->
                            <div class="pop_btn">
                                <span class="btn-pack btn-type_5">
                                    <a class="" href="#"><span class="ico_ser"></span>아이디찾기</a>
                                </span>
                                <span class="btn-pack btn-type_1">
                                    <a class="" href="#" onclick="layPopClose(page3);"><span class="ico_v"></span> 확 인</a>
                                </span>
                            </div>
						</div>
					</div>
				</dd>
			</dl>
			<div class="close"><a href="#" onclick="layPopClose(page3);"><img src="/images/rms/cmn/btn/pop_btn_close.gif" alt="닫기" /></a></div>
		</div>
	</div>
</div>
<!-- //page1 끝 -->
<!-- page1 시작 -->
<div class="layPop" id="page4">
	<div class="wrap" style="width:550px;">
		<div class="cont">
			<dl class="pop_list">
				<dt>기등록확인</dt>
				<dd>
					<div class="con_wrap" style="height:110px;">
						<div class="wcont">
							<div class="noti_box mt10">
                                <p>신규 등록 사용자입니다.</p>
                            </div><!--//테이블2-->
                            <div class="pop_btn">
                                <span class="btn-pack btn-type_1">
                                    <a class="" href="#" onclick="layPopClose(page4);"><span class="ico_v"></span> 확 인</a>
                                </span>
                            </div>
						</div>
					</div>
				</dd>
			</dl>
			<div class="close"><a href="#" onclick="layPopClose(page4);"><img src="/images/rms/cmn/btn/pop_btn_close.gif" alt="닫기" /></a></div>
		</div>
	</div>
</div>
<!-- //page1 끝 -->
	<div class="popup_bg"></div>
	<!--  -->
<jsp:include page="/WEB-INF/jsp/rms/main_bottom.jsp" />
</body>
</html>