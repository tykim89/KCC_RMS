<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="keyword" content="">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=Edge; text/html; charset=UTF-8"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/rms/cmn/base.css'/>" />
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<script type="text/javaScript" language="javascript">
	$(window).load(function()
	               {
	                  init();
	                  firstMenuList();
	               });

	function init() 
	{
		if ($("#message").val() != "") 
		{
			alert($("#message").val());
		}
	}

	//메뉴 입력폼 띄우기
	function insertMenuForm() 
	{
		//등록/수정폼을 보여준다.
		$("#menuModifyForm").show();
		//등록버튼을 감춘다.
		$("#insertFormBtn").hide();
		//저장버튼을 보여준다.
		$("#saveMenuBtn").show();
		//삭제버튼을 감춘다
		$("#deleteMenuBtn").hide();
	}

	//메뉴 등록
	function saveMenu() 
	{
		//필수체크
		if (validation()) 
		{
			if (confirm('<spring:message code="common.regist.msg" />')) 
			{
				$("#menuMngForm").attr("action", "<c:url value='/rms/cmn/insertMenu.do'/>").submit();
			}
		}
	}

	//필수 체크
	function validation() 
	{
		if ($("#menu_id").val() == "") 
		{
			alert("메뉴ID" + '<spring:message code="common.required.msg" />');
			$("#menu_id").focus();
			
		}
		else if ($("#url").val() == "") 
		{
			alert("URL" + '<spring:message code="common.required.msg" />');
			$("#url").focus();
			
		} 
		else
		{
			return true;
		}
	}

	//메뉴 수정폼 띄우기
	function modifyMenuForm(jsonString)
	{
		var menuInfo = $.parseJSON(jsonString);
		//체크박스 클릭시 이벤트 제외
		if (event.srcElement.tagName != "INPUT") 
		{
			//등록/수정폼을 보여준다.
			$("#menuModifyForm").show();

			$("#parent_menu_id").val(menuInfo.parent_menu_id);
			$("#menu_id").val(menuInfo.menu_id);
			$("#menu_name").val(menuInfo.menu_name);
			$("#login_yn").val(menuInfo.login_yn);
			$("#url").val(menuInfo.url);
			$("#menu_img_url").val(menuInfo.menu_img_url);
			$("#menu_description").val(menuInfo.menu_description);
			$("#sort_seq").val(menuInfo.sort_seq);

			//수정버튼을 보여준다.
			$("#modifyMenuBtn").show();
			//등록버튼을 감춘다.
			$("#insertFormBtn").hide();
			//저장버튼을 감춘다.
			$("#saveMenuBtn").hide();
			//삭제버튼을 감춘다.
			$("#deleteMenuBtn").hide();

			$("#modifyTarget").val(menuInfo.menu_id);
		}
	}

	//메뉴 수정
	function modifyMenu() 
	{
		//필수체크
		if (validation()) 
		{
			if (confirm('<spring:message code="common.update.msg" />')) 
			{
				$("#menuMngForm").attr("action", "<c:url value='/rms/cmn/modifyMenu.do'/>").submit();
			} else {
				$("#modifyTarget").val("");
			}
		}
	}

	//메뉴 삭제
	function deleteMenu() 
	{
		var deleteTargetId = getCheckedValue();
		//menuModifyForm.style.display="none";
		if (deleteTargetId == "") {
			alert('<spring:message code="common.alert.noSelect" />');
		} 
		else 
		{
			if (confirm('<spring:message code="common.delete.msg" />')) 
			{
				$("#deleteTarget").val(deleteTargetId);
				$("#menuMngForm").attr("action",
						"<c:url value='/rms/cmn/deleteMenu.do'/>").submit();
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
		$("#menuModifyForm").hide();
		//등록버튼을 보여준다.
		$("#insertFormBtn").show();
		//저장버튼을 감춘다.
		$("#saveMenuBtn").hide();
		//수정버튼을 감춘다.
		$("#modifyMenuBtn").hide();
		//삭제버튼을 보여준다.
		$("#deleteMenuBtn").show();
	}

	//전체 체크
	function checkAll() 
	{
		if ($("#checkAllBtn").is(":checked")) 
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

		$("input[id=checkBtn]:checked").each(function() 
		                                    {
												idList.push(this.value)
											});

		$.each(idList, function(index, item) {
			itemStr += item + "|"
		});

		return itemStr;
	}
</script>
</head>

<body>
<jsp:include page="/WEB-INF/jsp/rms/main_top.jsp"/>
	<form id="menuMngForm" name="menuMngForm" action="" method="post">
		<input type="hidden" id="message" name="message" value="${message}">
		<input type="hidden" id="deleteTarget" name="deleteTarget" value="">
		<input type="hidden" id="modifyTarget" name="modifyTarget" value="">
		<div id="wrap">
			<jsp:include page="/WEB-INF/jsp/rms/main_left.jsp"/>
			<section id="contR"> 
				<section class="cont_top">
	                    <div class="path"><img src="/KCC_RMS/images/rms/cmn/btn/btn_path_home.gif" alt="home" />HOME &gt; 관리자 &gt; <strong>메뉴관리</strong></div>
	                    <div class="name"><span class="name_st">관리자</span>님 반갑습니다.</div>
	        	</section>
				<article>
					<h1>메뉴관리</h1>
					<div class="contents">
						<div id="menuModifyForm" name="menuModifyForm" style="display: none;" class="listType3 mt30">
							<table>
								<colgroup>
									<col style="width: 10%" />
									<col style="width: *%" />
									<col style="width: 10%" />
									<col style="width: *%" />
								</colgroup>
								<tr>
									<th>상위메뉴ID</th>
									<td><input id="parent_menu_id" name="parent_menu_id" type="text"></td>
									<th>메뉴ID</th>
									<td><input id="menu_id" name="menu_id" type="text"></td>
								</tr>
								<tr>
									<th>메뉴명</th>
									<td><input id="menu_name" name="menu_name" type="text"></td>
									<th>로그인필수여부</th>
									<td><input id="login_yn" name="login_yn" type="text"></td>
								</tr>
								<tr>
									<th>URL</th>
									<td><input id="url" name="url" type="text"></td>
									<th>메뉴이미지URL</th>
									<td><input id="menu_img_url" name="menu_img_url" type="text"></td>
								</tr>
								<tr>
									<th>메뉴설명</th>
									<td><input id="menu_description" name="menu_description" type="text"></td>
									<th>정렬순서</th>
									<td><input id="sort_seq" name="sort_seq" type="text"></td>
								</tr>
							</table>
						</div>
						<div class="listType4 mt10">
							<table border="1">
								<colgroup>
	                                <col style="width:3%"/>
	                                <col style="width:8%" />
	                                <col style="width:12%" />
	                                <col style="width:*%" />
	                                <col style="width:*%" />
	                                <col style="width:*%" />
	                                <col style="width:8%" />
	                                <col style="width:5%" />
	                                <col style="width:5%" />
	                            </colgroup>
								<thead>
									<tr>
										<th scope="col"><input type="checkbox" id="checkAllBtn" name="checkAllBtn" onclick="checkAll()"></th>
										<th scope="col">메뉴ID</th>
										<th scope="col">메뉴명</th>
										<th scope="col">메뉴설명</th>
										<th scope="col">URL</th>
										<th scope="col">메뉴이미지URL</th>
										<th scope="col">로그인필수여부</th>
										<th scope="col">DEPTH</th>
										<th scope="col">정렬순서</th>
									</tr>
								</thead>
								<tbody>
								<c:if test="${menuList.size() == 0}">
									<tr>
										<td colspan="9" style="text-align: center;"><spring:message code="info.nodata.msg" /></td>
									</tr>
								</c:if>
								<c:forEach items="${menuList}" var="menuVO" varStatus="st">
									<tr style="cursor: pointer; curosr: hand;" onclick="modifyMenuForm('<c:out value="${menuVO.jsonString}"/>')">
										<td><input type="checkbox" id="checkBtn" name="checkBtn${st.index }" value="${menuVO.menu_id}"></td>
										<td><c:out value="${menuVO.menu_id}"></c:out></td>
										<td style="text-align: left;">${fn:replace(menuVO.menu_name, ' ', '&nbsp;&nbsp;')}</td>
										<td><c:out value="${menuVO.menu_description}"></c:out></td>
										<td><c:out value="${menuVO.url}"></c:out></td>
										<td><c:out value="${menuVO.menu_img_url}"></c:out></td>
										<td><c:out value="${menuVO.login_yn}"></c:out></td>
										<td><c:out value="${menuVO.depth}"></c:out></td>
										<td><c:out value="${menuVO.sort_seq}"></c:out></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<div class="pager">
								<div class="paging_right">
									<span class="btn-pack btn-type_5" id="insertFormBtn">
										<a href="#LINK" onClick="insertMenuForm()" tabindex="7"><span class="ico_v2"></span>등록</a>
		                        	</span>
		                        	<span class="btn-pack btn-type_5" id="saveMenuBtn" style="display: none;">
		                        		<a href="#LINK" onClick="saveMenu()" tabindex="7"><span class="ico_v2"></span>저장</a>
		                        	</span>
		                        	<span class="btn-pack btn-type_5" id="modifyMenuBtn" style="display: none;">
		                        		<a href="#LINK" onClick="modifyMenu()" tabindex="7"><span class="ico_modify"></span>수정</a>
		                        	</span>
		                        	<span class="btn-pack btn-type_5" id="deleteMenuBtn">
		                        		<a href="#LINK" onClick="deleteMenu()" tabindex="7"><span class="ico_x2"></span>삭제</a>
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
		<jsp:include page="/WEB-INF/jsp/rms/main_bottom.jsp"/>
	</form>
</body>
</html>