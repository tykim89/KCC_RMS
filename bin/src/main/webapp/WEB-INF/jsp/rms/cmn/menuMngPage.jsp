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
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/com.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/button.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/common.css'/>" type="text/css">
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
<body onload="init()">
	<form id="menuMngForm" name="menuMngForm" action="" method="post">
	<input type="hidden" id="message" name="message" value="${message}">
		<div id="menuModifyForm" name="menuModifyForm" style="display:none;">
			<table border="1">
				<tr>
					<th>메뉴명</th><td><input id="auth_name" name="menu_name" type="text"></td>
				</tr>
				<tr>
					<th>권한설명</th><td><textarea id="auth_description" name="auth_description" rows="3" cols="40" ></textarea></td>
				</tr>
			</table>
		</div>
		<div>
			<table>
				<tr>
					<td>
						<span class="button" id="insertFormBtn"><a href="#LINK" onClick="insertAuthForm()" tabindex="7">등록</a></span>
						<span class="button" id="saveAuthBtn" style="display: none;"><a href="#LINK" onClick="saveAuth()" tabindex="7">저장</a></span>
						<span class="button" id="modifyAuthBtn" style="display: none;"><a href="#LINK" onClick="modifyAuth()" tabindex="7">수정</a></span>
					<td/>
					<td>&nbsp;<span class="button" id="deleteAuthBtn"><a href="#LINK" onClick="deleteAuth()" tabindex="7">삭제</a></span></td>
					<td>&nbsp;<span class="button"><a href="#LINK" onClick="gotoList()" tabindex="7">목록</a></span></td>
				</tr>			
			</table>
			<table border="1">
				<tr>
					<th>
						<input type="checkbox" id="checkAllBtn" name="checkAllBtn" onclick="checkAll()">
					</th>
					<th>상위메뉴ID</th><th>메뉴ID</th><th>메뉴명</th><th>URL</th><th>메뉴이미지URL</th><th>로그인필수여부</th><th>DEPTH</th><th>정렬순서</th>
				</tr>
			<c:if test="${authList.size() == 0}">
				<tr>
					<td colspan="8">
						<spring:message code="info.nodata.msg" />
					</td>
				</tr>
			</c:if>
			<c:forEach items="${menuList}" var="menuVO" varStatus="st">
				<tr style="cursor:pointer;curosr:hand;" onclick="">
					<td><input type="checkbox" id="checkBtn" name="checkBtn${st.index }" value="${menuVO.auth_id}"></td>
					<td><c:out value="${menuVO.parent_menu_id}"></c:out></td>
					<td><c:out value="${authVO.menu_id}"></c:out></td>
					<td><c:out value="${authVO.menu_name}"></c:out></td>
					<td><c:out value="${authVO.url}"></c:out></td>
					<td><c:out value="${authVO.menu_img_url}"></c:out></td>
					<td><c:out value="${authVO.login_yn}"></c:out></td>
					<td><c:out value="${authVO.depth}"></c:out></td>
					<td><c:out value="${authVO.sort_seq}"></c:out></td>
				</tr>
			</c:forEach>
			</table>
		</div>
	</form>
</body>
</html>