<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keyword" content="">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=Edge; text/html; charset=UTF-8"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/rms/cmn/base.css'/>" />
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>

<script type="text/javaScript" language="javascript">
	function init()
	{
		if($("#message").val() != "")
		{
			alert($("#message").val());
		}
	}

	//권한 입력폼 띄우기
	function insertAuthForm()
	{
		//등록/수정폼을 보여준다.
		$("#authModifyForm").show();
		//등록버튼을 감춘다.
		$("#insertFormBtn").hide();
		//저장버튼을 보여준다.
		$("#saveAuthBtn").show();
		//삭제버튼을 감춘다
		$("#deleteAuthBtn").hide();
	}
	
	//권한 등록
	function saveAuth()
	{
		//필수체크
		if($("#auth_name").val() == "")
		{
			alert("권한명"+'<spring:message code="common.required.msg" />');
			$("#auth_name").focus();
		}
		else
		{
			if(confirm('<spring:message code="common.regist.msg" />'))
			{
				$("#authMngForm").attr("action", "<c:url value='/rms/cmn/insertAuth.do'/>").submit();
			}
		}
	}
	
	//권한 수정폼 띄우기
	function modifyAuthForm(auth_id, auth_name, auth_description)
	{
		//체크박스 클릭시 이벤트 제외
		if(event.srcElement.tagName != "INPUT")
		{
			//등록/수정폼을 보여준다.
			$("#authModifyForm").show();
			
			$("#auth_name").val(auth_name);
			$("#auth_description").html(auth_description);
			
			//수정버튼을 보여준다.
			$("#modifyAuthBtn").show();
			//등록버튼을 감춘다.
			$("#insertFormBtn").hide();
			//저장버튼을 감춘다.
			$("#saveAuthBtn").hide();
			//삭제버튼을 감춘다.
			$("#deleteAuthBtn").hide();
			
			$("#modifyTarget").val(auth_id);
		}
	}
	
	//권한 수정
	function modifyAuth()
	{
		//필수체크
		if($("#auth_name").val() == "")
		{
			alert("권한명"+'<spring:message code="common.required.msg" />');
			$("#auth_name").focus();
		}
		else
		{
			if(confirm('<spring:message code="common.update.msg" />'))
			{
				$("#authMngForm").attr("action", "<c:url value='/rms/cmn/modifyAuth.do'/>").submit();
			}
			else
			{
				$("#modifyTarget").val("");
			}
		}
	}
	
	//권한 삭제
	function deleteAuth()
	{
		var deleteTargetId = getCheckedValue();
		//authModifyForm.style.display="none";
		if(deleteTargetId == "")
		{
			alert('<spring:message code="common.alert.noSelect" />');
		}
		else
		{
			if(confirm('<spring:message code="common.delete.msg" />'))
			{
				$("#deleteTarget").val(deleteTargetId);
				$("#authMngForm").attr("action", "<c:url value='/rms/cmn/deleteAuth.do'/>").submit();
			}
			else
			{
				$("#deleteTarget").val("");
			}
		}
	}
	
	
	
	//목록으로 가기
	function gotoList()
	{
		//input값 초기화
		$("#auth_name").val("");
		$("#auth_description").html("");
		$("#deleteTarget").val("");
		$("#modifyTarget").val("");
		
		
		//등록/수정폼을 감춘다.
		$("#authModifyForm").hide();
		//등록버튼을 보여준다.
		$("#insertFormBtn").show();
		//저장버튼을 감춘다.
		$("#saveAuthBtn").hide();
		//수정버튼을 감춘다.
		$("#modifyAuthBtn").hide();
		//삭제버튼을 보여준다.
		$("#deleteAuthBtn").show();
	}
	
	
	//전체 체크
	function checkAll()
	{
		if($("#checkAllBtn").is(":checked"))
		{
			$('input[id=checkBtn]').attr("checked", true);	
		}
		else
		{
			$('input[id=checkBtn]').attr("checked", false);
		}
	}
	
	//체크된 값 | 구분자로 연결하여 리턴
	function getCheckedValue()
	{
		var idList = [];
		var itemStr = "";
		
		$("input[id=checkBtn]:checked").each(function(){idList.push(this.value)});
		
		$.each(idList, function(index, item){itemStr += item + "|"});
		
		return itemStr;
	}
</script>
</head>
<body onload="init();firstMenuList();">
	<jsp:include page="/WEB-INF/jsp/rms/main_top.jsp" />
	<form id="authMngForm" name="authMngForm" action="<c:url value='/aaa.do'/>" method="post">
		<input type="hidden" id="message" name="message" value="${message}">
		<input type="hidden" id="deleteTarget" name="deleteTarget" value="">
		<input type="hidden" id="modifyTarget" name="modifyTarget" value="">
		<div id="wrap"><!-- wrap -->
			<jsp:include page="/WEB-INF/jsp/rms/main_left.jsp" />
			<section id="contR"> <!-- contR --> 
				<section class="cont_top">
					<div class="path">
						<img src="/KCC_RMS/images/rms/cmn/btn/btn_path_home.gif" alt="home" />HOME &gt; 관리자 &gt; <strong>권한관리</strong>
					</div>
					<div class="name">
						<span class="name_st">관리자</span>님 반갑습니다.
					</div>
				</section> 
				
				<article>
					<h1>권한관리</h1>
					<div class="contents"><!-- contents -->
						<div id="authModifyForm" name="authModifyForm" style="display:none;" class="listType3 mt30">
							<table border="1">
								<colgroup>
									<col style="width: 10%" />
									<col style="width: *%" />
								</colgroup>
								<tr>
									<th>권한명</th><td><input id="auth_name" name="auth_name" type="text"></td>
								</tr>
								<tr>
									<th>권한설명</th><td><textarea id="auth_description" name="auth_description" rows="3" cols="40" ></textarea></td>
								</tr>
							</table>
						</div>
						
						<div class="listType4 mt10">
							<table border="1">
								<colgroup>
									<col style="width: 50px" />
									<col style="width: 20%" />
									<col style="width: *%" />
								</colgroup>
								<thead>
									<tr>
										<th>
											<input type="checkbox" id="checkAllBtn" name="checkAllBtn" onclick="checkAll()">
										</th>
										<th>
											권한명
										</th>
										<th>
											권한설명
										</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${authList.size() == 0}">
										<tr>
											<td colspan="3" style="text-align: center;"><spring:message code="info.nodata.msg" /></td>
										</tr>
									</c:if>
									<c:forEach items="${authList}" var="authVO" varStatus="st">
										<tr style="cursor:pointer;curosr:hand;" onclick="modifyAuthForm('${authVO.auth_id}','${authVO.auth_name}','${authVO.auth_description}')">
											<td><input type="checkbox" id="checkBtn" name="checkBtn${st.index }" value="${authVO.auth_id}"></td>
											<td><c:out value="${authVO.auth_name}"></c:out></td>
											<td><c:out value="${authVO.auth_description}"></c:out></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="pager">
								<div class="paging_right">
									<span class="btn-pack btn-type_5" id="insertFormBtn">
										<a href="#LINK" onClick="insertAuthForm()" tabindex="7"><span class="ico_v2"></span>등록</a>
		                        	</span>
		                        	<span class="btn-pack btn-type_5" id="saveAuthBtn" style="display: none;">
		                        		<a href="#LINK" onClick="saveAuth()" tabindex="7"><span class="ico_v2"></span>저장</a>
		                        	</span>
		                        	<span class="btn-pack btn-type_5" id="modifyAuthBtn" style="display: none;">
		                        		<a href="#LINK" onClick="modifyAuth()" tabindex="7"><span class="ico_modify"></span>수정</a>
		                        	</span>
		                        	<span class="btn-pack btn-type_5" id="deleteAuthBtn">
		                        		<a href="#LINK" onClick="deleteAuth()" tabindex="7"><span class="ico_x2"></span>삭제</a>
									</span>
									<span class="btn-pack btn-type_5">
		                        		<a href="#LINK" onClick="gotoList()" tabindex="7"><span class="ico_list"></span>목록</a>
									</span>
	                        	</div>
                        	</div>
						</div>
					</div><!-- contents -->
				</article> 
			</section><!-- contR -->
		</div><!-- wrap -->
	</form>
</body>
</html>