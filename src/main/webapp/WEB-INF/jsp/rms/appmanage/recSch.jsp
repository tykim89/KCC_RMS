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
<script type="text/javaScript" language="javascript">
	function updateRecSch() {

		if ($("#rec_sch_content").val() == "") {
			alert("<spring:message code='alert.add.noSelect' />");
		} else {
			if (confirm("<spring:message code='common.update.msg' />")) {
				$("#recSchForm").attr("action",
						"<c:url value='/rms/appmanage/updateRecSch.do'/>")
						.submit();
			}
		}
	}

	/* layPop */
	function layPop(id) {
		var layPopH = $(id).height();
		var layPopW = $(id).width();

		var topPos = (($(window).height() - layPopH) / 4);
		var leftPos = (($(window).width() - layPopW) / 3);
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

	$(document).ready(function() {

		layPop(recSchPop);

	})
</script>
</head>
<!-- loding_pop -->

<div class="layPop" id="loding">
	<div class="loding">
		페이지를 불러오고 있습니다.
		<div class="logo">
			<img src="/KCC_RMS/images/rms/cmn/common/logo_loding.gif" alt="로딩 로고" />
		</div>
	</div>
</div>
<!-- //loding_pop -->


<form id="recSchForm" name="recSchForm" method="post">
	<input type="hidden" id=selectUsrTarget name="selectUsrTarget"
		value="${selectUsrTarget }">
	<div class="layPop" id="recSchPop">
		<div class="wrap" style="width: 700px;">
			<div class="bg_lt"></div>
			<div class="bg_rt"></div>
			<div class="cont">
				<dl class="pop_list">
					<dt>새 전형일정 만들기</dt>
					<dd>
						<div class="con_wrap" style="height: 500px;">
							<div class="wcont">
								<div class="listType3 mt10">
									<table>
											<caption></caption>
											<tbody>
												<tr>
													<th class="" style="width: 180px; height: 400px;">메시지 내용</th>
													<td><textarea type="text" id="rec_sch_content"
													name="rec_sch_content" style="width: 93%; height: 400px;">${rec_sch_content }</textarea></td>
												</tr>
											</tbody>
										</table>
								</div>
								<!--//테이블2-->
							<div class="pop_btn">
								<span class="btn-pack btn-type_1"> <a class=""
									href="#LINK" onclick="updateRecSch()"><span class="ico_v"></span>
										확 인 </a>
								</span>
							</div>
							</div>
						</div>
					</dd>
				</dl>
				<div class="close">
					<a href="#" onclick="layPopClose(recSchPop);"><img
						src="/KCC_RMS/images/rms/cmn/btn/pop_btn_close.gif" alt="닫기" /></a>
				</div>
			</div>
			<div class="bg_lb"></div>
			<div class="bg_rb"></div>
		</div>
	</div>

	

</form>

<div class="popup_bg"></div>
</html>
