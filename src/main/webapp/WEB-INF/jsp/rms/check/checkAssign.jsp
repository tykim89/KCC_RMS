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
		
		item = $("#recFieldSelect option:selected").val();
		$("#recFieldNo").val(item);
		
		$.post("<c:url value='/rms/check/getFirstCheckUserList.do'/>", $("#checkAssignForm").serialize(), function(html) {
			$("#assignAdmin").html(html);
		});
		
		getUnassignUsrList();
		
		$("#checkUsrTarget").val("");
		$("#addTarget").val("");
		$.post("<c:url value='/rms/check/getDetailAssignList.do'/>", $(
			"#checkAssignForm").serialize(), function(html) {
			
			$("#assignUser").html(html);	
		});
	}
	
	//미할당된 지원자  
	function getUnassignUsrList() {

		$.post("<c:url value='/rms/check/getDetailUnassignList.do'/>", $(
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
	
	//검토자를 눌렀을 때, 해당 할당된 지원자 보여주기
	function loadCheckUser(id){
		var checkUsrTarget ="";
		
		
		$("#checkUsrTarget").val(id);
		
		$.post("<c:url value='/rms/check/getDetailAssignList.do'/>", $(
				"#checkAssignForm").serialize(), function(html) {
			$("#assignUser").html(html);	
			
			$("#addTarget").val($("#assignUserTarget").val());
			$.post("<c:url value='/rms/check/getDetailUnassignList.do'/>", $(
			"#checkAssignForm").serialize(), function(html) {
				$("#unassignUser").html(html);
			});
		});	
	}
	
	//검토자 추가를 눌렀을 때
	function selectChkUser() {
		var chkUserTarget = $("input[id=checkUserTarget]").val();
		$("#checkUsrTarget").val(chkUserTarget);
		
		$.post("<c:url value='/rms/check/gotoAdminPop.do'/>", $("#checkAssignForm").serialize(), function(html) {
				$("#adminListPop").html(html);
			});
		
	}
	
	
	
/* 	function deleteChkUser(){
		var target = getCheckedValue("chkUsrBtn");
		var result = "";

		if (target == "") {
			alert("<spring:message code='alert.remove.noSelect' />");
		} else {
			if (confirm("<spring:message code='common.update.msg' />")) {
				result = deleteAdminTarget("chkUsrBtn");
				$("#mainAdminTarget").val(result);
				$.post("<c:url value='/rms/check/getCheckUserList.do'/>", $("#checkAssignForm").serialize(), function(html) {
					$("#assignAdmin").html(html);
				});
			} else {
				$("#rightTarget").val("");
			}
		}
	}
	
	function deleteAdminTarget(checkBtnId){
		//추가된 검토자 리스트
		var target = "";
		target = $("input[id=target]").val();
		$("#mainAdminTarget").val(target);
		
		var mainAdminTargetList = target.split('|');
		
		var deleteAdminTargetList = [];
		var itemStr = "";

		$("input[id=" + checkBtnId + "]:checked").each(function() {
			deleteAdminTargetList.push(this.value)
		});

		$.each(deleteAdminTargetList, function(deleteIndex, deleteItem) {
			$.each(mainAdminTargetList, function(adminIndex, adminItem) {
				if (mainAdminTargetList[adminIndex] == deleteAdminTargetList[deleteIndex]) {
					mainAdminTargetList.remove(adminIndex);
				}
			});
		});

		$.each(mainAdminTargetList, function(index, item) {
			if (mainAdminTargetList[index] != "") {
				itemStr += item + "|"
			}
		});

		return itemStr;
		
	} */
	
	//체크된 지원자 검토할당 추가
	function addUser() {
		
		$("#div").attr("value", "add");
		//alert($("input[id=assignUserTarget]").val());
		if($("input[id=assignUserTarget]").val() != "" || $("input[id=assignUserTarget]").val() != null)
		{
			var target = "";
			target = $("input[id=assignUserTarget]").val();
			$("#addTarget").val(target);
			//alert("있어" + target);
			$("input[id=assignUserTarget]").val("");
			
		} 
		
		
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
		
		if (rightTarget == "") {
			alert("<spring:message code='alert.remove.noSelect' />");
		} else {
			if (confirm("<spring:message code='common.update.msg' />")) {

				result = removeRightTarget("AssigncheckBtn");
				$("#addTarget").val(result);
				//alert("정답 : " + result);
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
	
	function updateCheckAssgin(){		
		
		if(confirm("<spring:message code='common.save.msg' />"))
		{
			$.post("<c:url value='/rms/check/updateCheckAssign.do'/>", $("#checkAssignForm").serialize(), function(html) {
				$("#assignAdmin").html(html);
				});
			alert("<spring:message code='success.common.save' />");
		}
	}
	
	////////////////////////////////////////////삭제
	function deleteChecker() {
		var dt = getCheckedValue("checkerBtn");
		var rnn = $("#recFieldSelect").val();
		var list;
		var itemStr = "";
		if (dt == "") {
			alert("<spring:message code='alert.add.noSelect' />");
		} else {
			if (confirm("<spring:message code='common.delete.msg' />")) {		
				$.post("<c:url value='/rms/check/checkUnderAppUser.json'/>", {deleteTarget : dt, rec_noti_no : rnn}, function(data) {
					
					list=data.checkerList;
					$.each(list, function(index, item) {
						itemStr += item + ", "
					});
					
					
					if(itemStr == "")
					{
						$.post("<c:url value='/rms/check/deleteChecker.do'/>", {deleteTarget : dt, rec_noti_no : rnn}, function(html) {
							$("#assignAdmin").html(html);
						});
					} else
					{
						if(confirm("할당된 지원자가 존재합니다. 삭제하시겠습니까?")){
							$.post("<c:url value='/rms/check/deleteAssignedUser.do'/>", {deleteTarget : dt, rec_noti_no : rnn}, function(html) {
								$("#assignAdmin").html(html);
							});
							
							
							$("#checkUsrTarget").val("");
							$("#addTarget").val("");
							
							$.post("<c:url value='/rms/check/getDetailAssignList.do'/>", $(
								"#checkAssignForm").serialize(), function(html) {
								
								$("#assignUser").html(html);	
							});
							getUnassignUsrList();
						}
						
					}
					//alert(data.checkUnderResultList);
				});
			
			} 
		}
	}
	
	function gotoClean(){
		//$.post("<c:url value='/rms/check/gotoCheckAssignPage.do'/>", {}, function(){}); 
		$("#checkAssignForm").attr("action",	"<c:url value='/rms/check/gotoCheckAssignPage.do'/>").submit();
	}
</script>
</head>

<body onload="firstMenuList();">
	<jsp:include page="/WEB-INF/jsp/rms/main_top.jsp" />

	<form id="checkAssignForm" name="checkAssignForm" action=""	method="post">
		<input type="hidden" id="recFieldNo" name="recFieldNo" value="">
		<input type="hidden" id="div" name="div" value="">
		<input type="hidden" id="checkUsrTarget" name="checkUsrTarget" val="">
		<input type="hidden" id="addTarget" name="addTarget" value=""> 
		<input type="hidden" id="rightTarget" name="rightTarget" value=""> 
		<input type="hidden" id="leftTarget" name="leftTarget" value="">
		<input type="hidden" id="mainAdminTarget" name="mainAdminTarget" value="">
		
		<%-- <input type="hidden" id="message" name="message" value="${message}">
		<input type="hidden" id="recFieldNo" name="recFieldNo" value="">
		<input type="hidden" id="div" name="div" value=""> 
		<input type="hidden" id="mainAdminTarget" name="mainAdminTarget" value="">
		<input type="hidden" id="checkUsrTarget" name="checkUsrTarget" val="">
		<input type="hidden" id="addTarget" name="addTarget" value=""> 
		<input type="hidden" id="rightTarget" name="rightTarget" value=""> 
		<input type="hidden" id="leftTarget" name="leftTarget" value=""> --%>
		
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
			<section class="sec_third mt10" style="padding-left: 0%">
				<div class="listSearch_left" style="padding-left: 70%; padding-top: 2%; padding-bottom:1%">
					<select id="recFieldSelect" class="select" title=""	style="width: 185px" onchange="loadUsrByRecField()">
						<option value="">진행중인 채용공고</option>
						<c:forEach var="i" items="${ recFieldList }" varStatus="st">
							<option value="${i.rec_noti_no}">${i.rec_noti_title}</option>
						</c:forEach>
					</select>
					<span class="btn-pack btn-type_2" style="margin-left:5px;">
                    	<a class="" href="#" onclick="selectChkUser();"><span class="ico_v2"></span>검토자 추가</a>
                    </span>
                    <span class="btn-pack btn-type_2" style="margin-left:5px;">
                       	<a class="" href="#" onclick="deleteChecker();"><span class="ico_x2"></span>삭 제</a>
                    </span>
				</div>
				<!-- <h3>검토자목록</h3> -->
				<div class="tree_wrap" style="height: 200px; width:94%">
				<div id="assignAdmin" class="listType4" align="center">
					
						<table>
							<colgroup>
								<col style="width: 5%" />
								<col style="width: 10%" />
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
									<th scope="col"><input name="" id="" class="" type="checkbox" /></th>
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
									<td colspan="10" style="text-align: center;"><spring:message code="info.nodata.msg" /></td>
								</tr>
							</tbody>

						</table>
					</div>
					</div>

				</section>
				</div>
			
			<div class="contents">
			
			
			

				<section class="sec_half2 mt10" style="padding-left: 1%">
				
				<div id="unassignUser">
				<h3>미할당 지원자</h3>
				<div class="tree_wrap" style="height: 520px">
					<div class="listType4">
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
				</div>
				</section> 
				<section class="sec_half2_tit" style="height:320px; padding-top:200px;"> <a href="#"
					class="move_right" onclick="addUser()">
					<img src="/KCC_RMS/images/rms/cmn/btn/move_right.gif" alt="이전"></a> 
					<a href="#" class="move_left" onclick="removeUser()">
					<img src="/KCC_RMS/images/rms/cmn/btn/move_left.gif" alt="이전"></a> 
					</section> 
				<section class="sec_half2 mt10" style="padding-right:1%">
				<!-- <div class="listSearch_left" style="padding-bottom: 3%"></div> -->
				<div id="assignUser">
				<h3>할당 지원자</h3>
				<div class="tree_wrap" style="height: 520px">
					<div class="listType4">
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
									<td colspan="4" style="text-align: center;"><spring:message code="common.alert.noSelect" /></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				</div>
				</section>

				

				<section class="sec_half mt10" style="padding-top:1%">
				<div class="" align="center" >
					<span class="btn-pack btn-type_1"> <a class="" href="#" onClick="updateCheckAssgin()">
						<span class="ico_v"></span> 저 장 </a>
					</span>
					<span class="btn-pack btn-type_1"> <a class="" href="#" onClick="gotoClean()">
						<span class="ico_v"></span> 초기화 </a>
					</span>
				</div>
				</section>
                </div><!--//contents-->
            </article>
        </section><!--//contR:끝-->
    </div><!--//wrap:끝-->

		
		</form>
		<jsp:include page="/WEB-INF/jsp/rms/main_bottom.jsp" />
		
		<!-- page1 시작 -->
		<div class="layPop" id="adminListPop" name="adminListPop"></div>
	
</body>
</html>
