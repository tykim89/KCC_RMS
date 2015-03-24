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
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/rms/cmn/base.css'/>" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>

<script type="text/javascript">
	$(document).ready();

	//시작
	function init() {
		if ($("#message").val() != "" && $("#message").val() != undefined) {
			alert($("#message").val());
		}

	}

	//전체 체크
	function checkAll(allBtnId, checkBtnId) {
		if ($("#" + allBtnId).is(":checked")) {
			$("input[id=" + checkBtnId + "]").prop("checked", true);
		} else {
			$("input[id=" + checkBtnId + "]").prop("checked", false);
		}
	}

	//체크된 값 | 구분자로 연결하여 리턴
	function getCheckedValue(checkBtnId) {
		var idList = [];
		var itemStr = "";

		$("input[id=" + checkBtnId + "]:checked").each(function() {
			idList.push(this.value)
		});

		$.each(idList, function(index, item) {
			itemStr += item + "|"
		});

		return itemStr;
	}

	//원하는 채용공고 선택
	function loadUsrByRecField() {
		var item = "";
		var checkUsrTarget = $("#adminTarget").val();
		$("#checkUsrTarget").val(checkUsrTarget);
		if(checkUsrTarget == "")
		{
			alert("<spring:message code='alert.add.noCheckUser' />");
		} else
		{
			item = $("#recFieldSelect option:selected").val();
			$("#recFieldNo").val(item);
			alert(checkUsrTarget);
			getUnassignUsrList();
		}

	}

	//미할당된 지원자  
	function getUnassignUsrList() {

		$.post("<c:url value='/rms/check/getUnassignUsrList.do'/>", $(
				"#checkAssignForm").serialize(), function(html) {
			$("#unassignUser").html(html);
		});
	}

	//할당된 지원자  
	function getAssignUsrList() {

		$.post("<c:url value='/rms/check/getAssignUsrList.do'/>", $(
				"#checkAssignForm").serialize(), function(html) {
			$("#assignUser").html(html);
		});
	}

	//체크된 지원자 검토할당 추가
	function addUser() {
		$("#div").attr("value", "add");

		//현재 체크한 지원자번호 가져오기
		var leftTarget = getCheckedValue("checkBtn");

		//누적된 지원자 번호 가져오기
		var addTarget = $("#addTarget").val();
		$("#addTarget").val(addTarget + leftTarget);

		if (leftTarget == "") {
			alert("<spring:message code='alert.add.noSelect' />");
		} else {
			if (confirm("<spring:message code='common.update.msg' />")) {

				$.post("<c:url value='/rms/check/addUserByAssign.do'/>", $(
						"#checkAssignForm").serialize(), function(message) {
					$("#message").val(message);

					getUnassignUsrList()
					getAssignUsrList();
				});
			} else {
				$("#leftTarget").val("");
			}

		}
	}

	Array.prototype.remove = function(index) {
		//return (index<0 || index>this.length) ? this : this.slice(0, index).concat(this.slice(index+1, this.length));
		this.splice(index, 1);
	};

	function removeRightTarget(checkBtnId) {

		var addTarget = $("#addTarget").val();
		var addTargetList = addTarget.split('|');
		var rightTargetList = [];
		var itemStr = "";

		$("input[id=" + checkBtnId + "]:checked").each(function() {
			rightTargetList.push(this.value)
		});

		$.each(rightTargetList, function(rightIndex, rightItem) {
			$.each(addTargetList, function(addIndex, addItem) {
				if (addTargetList[addIndex] == rightTargetList[rightIndex]) {
					addTargetList.remove(addIndex);
				}
			});
		});

		$.each(addTargetList, function(index, item) {
			if (addTargetList[index] != "") {
				itemStr += item + "|"
			}
		});

		return itemStr;

	}
	//체크된 지원자 검토할당 제거
	function removeUser() {
		$("#div").attr("value", "remove");
		//현재 체크한 지원자번호 가져오기
		var rightTarget = getCheckedValue("AssigncheckBtn");

		var result = "";

		//alert(rightTarget);

		if (rightTarget == "") {
			alert("<spring:message code='alert.remove.noSelect' />");
		} else {
			if (confirm("<spring:message code='common.update.msg' />")) {

				result = removeRightTarget("AssigncheckBtn");
				$("#addTarget").val(result);
				$.post("<c:url value='/rms/check/removeUserByAssign.do'/>", $(
						"#checkAssignForm").serialize(), function(message) {
					$("#message").val(message);

					getAssignUsrList();
					getUnassignUsrList();
				});
			} else {
				$("#rightTarget").val("");
			}

		}
	}

	function selectCheckUser() {
		var addTarget = "";
		addTarget = $("#addTarget").val();
		if(addTarget == "")
		{
			$.post("<c:url value='/rms/check/gotoAdminPop.do'/>", $(
					"#checkAssignForm").serialize(), function(html) {
				$("#adminListPop").html(html);
			});
		} else
		{
			alert("<spring:message code='alert.add.noSelectCheckUser' />");
		}
	}
	
	function updateCheckAssgin(){
		var addTarget = "";
		var checkUsrTarget ="";
		addTarget = $("#addTarget").val();
		checkUsrTarget = $("#checkUsrTarget").val();
		
		$("#checkAssignForm").attr("action",
		"<c:url value='/rms/check/updateCheckAssign.do'/>").submit();
	}
	
		
	
</script>

</head>

<body onload="firstMenuList();">
	<jsp:include page="/WEB-INF/jsp/rms/main_top.jsp" />

	<form id="checkAssignForm" name="checkAssignForm" action=""	method="post">
		<input type="hidden" id="message" name="message" value="${message}">
		<input type="hidden" id="recFieldNo" name="recFieldNo" value="">
		<input type="hidden" id="div" name="div" value=""> 

		<input type="hidden" id="checkUsrTarget" name="checkUsrTarget" val="">
		<input type="hidden" id="addTarget" name="addTarget" value=""> 
		<input type="hidden" id="rightTarget" name="rightTarget" value=""> 
		<input type="hidden" id="leftTarget" name="leftTarget" value="">
		
		<div id="wrap">
			<jsp:include page="/WEB-INF/jsp/rms/main_left.jsp" />

			<section id="contR"><!--contR:시작--> <section
				class="cont_top">
			<div class="path">
				<img src="/KCC_RMS/images/rms/cmn/btn/btn_path_home.gif" alt="home" />HOME
				&gt; 항목관리 &gt; <strong>지원서양식관리</strong>
			</div>
			<div class="name">
				<span class="name_st">관리자</span>님 반갑습니다.
			</div>
			</section> <article>
			<h1>지원서할당</h1>
			<div align="center">
			<section class="sec_third mt10" >
				<div class="listSearch_left" style="padding-left: 3%">
					<span class="btn-pack btn-type_1"> <a class="" href="#"
						onClick="selectCheckUser()"><span class="ico_v"></span>검토자 등록/수정</a>
					</span> 
				</div>
				<div class="listType4 mt30" align="center" style="height: 60px; width: 93%;" >
					<div id="assignAdmin" class="" style="" >
						<table>
							<caption>검토자 등록</caption>
							<colgroup>
								<col style="width: 5%" />
								<col style="width: 10%" />
								<col style="width: 10%" />
								<col style="width: 5%" />
								<col style="width: 10%" />
								<col style="width: 10%" />
								<col style="width: 20%" />
								<col style="width: 20%" />
								<col style="width: 10%" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">회사</th>
									<th scope="col">부서</th>
									<th scope="col">직급</th>
									<th scope="col">이름</th>
									<th scope="col">아이디</th>
									<th scope="col">이메일주소</th>
									<th scope="col">휴대폰번호</th>
									<th scope="col" class="last">내선번호</th>

								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="9" style="text-align: center;"><spring:message code="info.nodata.msg" /></td>
								</tr>
							</tbody>

						</table>
					</div>
				</div>

				</section>
				</div>
			<div class="contents">
			
				<section class="sec_thirdX2"  style="padding-left:1%">
				<section class="sec_half2 mt10">
				<h3>미할당 지원자</h3>
				<div class="listSearch_left"<!--  style = "padding-bottom:1%" -->>
					
					<select id="recFieldSelect" class="select" title=""
						style="width: 185px" onchange="loadUsrByRecField()">
						<option value="">채용공고</option>
						<c:forEach var="i" items="${ recFieldList }" varStatus="st">
							<option value="${i.rec_noti_no}">${i.rec_noti_title}</option>
						</c:forEach>
					</select>
				</div>
				<div class="tree_wrap" style="height: 520px;">
					<div id="unassignUser" class="listType4">
						<table>
							<caption></caption>
							<colgroup>
								<col style="width: 15%" />
								<col style="width: 20%" />
								<col style="width: *%" />
								<col style="width: 25%" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col"><input name="" id="" class=""
										type="checkbox" /></th>
									<th scope="col">번호</th>
									<th scope="col">이름</th>
									<th scope="col" class="last">생년월일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="4" style="text-align: center;"><spring:message
											code="common.alert.noSelect" /></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				</section> 
				<section class="sec_half2_tit" style="height:320px; padding-top:200px;"> <a href="#"
					class="move_right" onclick="addUser()">
					<img src="/KCC_RMS/images/rms/cmn/btn/move_right.gif" alt="이전"></a> 
					<a href="#" class="move_left" onclick="removeUser()">
					<img src="/KCC_RMS/images/rms/cmn/btn/move_left.gif" alt="이전"></a> 
					</section> 
				<section class="sec_half2 mt10" style="padding-right:1%">
				<h3>할당 지원자</h3>
				<div class="listSearch_left" style="padding-bottom: 1%"></div>
				<div class="tree_wrap" style="height: 520px;">
					<div id="assignUser" class="listType4">
						<table>
							<caption></caption>
							<colgroup>
								<col style="width: 15%" />
								<col style="width: 20%" />
								<col style="width: *%" />
								<col style="width: 25%" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col"><input name="" id="" class=""
										type="checkbox" /></th>
									<th scope="col">번호</th>
									<th scope="col">이름</th>
									<th scope="col" class="last">생년월일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="4" style="text-align: center;"><spring:message
											code="common.alert.noSelect" /></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				</section>
				</section>
				<section class="sec_third mt10" style="padding-right:1%" >

						<h3>지원서검토</h3>
                    	<div class="listSearch_left" style="padding-bottom: 1%"></div>
                    	 <div class="tree_wrap mt5" style="height:527px;">
                        	<div id="checkAssignList" class="listType4">
                        	
                                <table>
                                    
                                    <colgroup>
                                        <col style="width:15%" />
                                        <col style="width:25%" />
                                        <col style="width:*%" />
                                    </colgroup>
                                    <thead>
                                        <tr> 
                                            <th scope="col">번호</th>
                                            <th scope="col">이름</th>
                                            <th scope="col" class="last">생년월일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="odd">
                                            <td colspan="3" style="text-align: center;"><spring:message
											code="common.alert.noSelect" /></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                  	</section>
				<section class="sec_half mt10" style="padding-top:1%">
				<div class="" align="center" >
					<span class="btn-pack btn-type_1"> <a class="" href="#" onClick="updateCheckAssgin()">
						<span class="ico_v"></span> 저 장 </a>
					</span>
					<span class="btn-pack btn-type_1"> <a class="" href="#" >
						<span class="ico_v"></span> 초기화 </a>
					</span>
				</div>
				</section>
				 
			</div>
			
			<!--//contents--> </article>
			</section>
			<!--//contR:끝-->
		</div>
		<!--//wrap:끝-->
		
		
		</form>
		<jsp:include page="/WEB-INF/jsp/rms/main_bottom.jsp" />
		
		<!-- page1 시작 -->
		<div class="layPop" id="adminListPop" name="adminListPop"></div>
	
</body>
</html>
