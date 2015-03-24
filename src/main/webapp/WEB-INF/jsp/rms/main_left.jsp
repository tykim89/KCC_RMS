<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javaScript" language="javascript">
	
	function viewSecondMenu(parentMenuId, menu_name) {
	
		var secondMenuList = $.parseJSON('${depth2menu}');
		var secondMenuVO;
		var secondMenuHtml = "<h1><a class='lnb_h1_2'>" + menu_name
				+ "</a></h1><ul>";

		for ( var i = 0; i < secondMenuList.length; i++) {
			secondMenuVO = secondMenuList[i];
			if (parentMenuId == secondMenuVO.parent_menu_id) {
				secondMenuHtml += "<li style='cursor: pointer; curosr: hand;'><h2><a onclick=\"gotoSelectedMenu('"
						+ secondMenuVO.url + "','" + menu_name + "','"
						+ secondMenuVO.parent_menu_id + "', '" + secondMenuVO.menu_id + "')\">"
						+ secondMenuVO.menu_name + "</a></h2></li>";

			}
		}

		$("#lnb").html(secondMenuHtml + "</ul>");

	}

	function viewThirdMenu(firstMenuName, firstMenuId, secondMenuId) {
		var secondMenuList = $.parseJSON('${depth2menu}');
		var secondMenuVO;
		var secondMenuHtml = "<h1><a class='lnb_h1_2'>" + firstMenuName
				+ "</a></h1><ul>";
		var thirdMenuList = $.parseJSON('${depth3menu}');
		var thirdMenuVO;

		for ( var i = 0; i < secondMenuList.length; i++) {
			secondMenuVO = secondMenuList[i];
			if (firstMenuId == secondMenuVO.parent_menu_id) {
				secondMenuHtml += "<li><h2><a onclick=\"gotoSelectedMenu('"
						+ secondMenuVO.url + "','" + firstMenuName
						+ "','" + firstMenuId + "','"+secondMenuVO.menu_id+"')\">"
						+ secondMenuVO.menu_name + "</a></h2></li>";
				for ( var k = 0; k < thirdMenuList.length; k++) {
					thirdMenuVO = thirdMenuList[k];
					if (secondMenuVO.menu_id == thirdMenuVO.parent_menu_id && secondMenuId == thirdMenuVO.parent_menu_id) {
						secondMenuHtml += "<h3 style='cursor: pointer; curosr: hand;'><a onclick=\"gotoSelectedSecondMenu('"
								+ thirdMenuVO.url + "', '', '', '"+secondMenuId+"')\">"
								+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + thirdMenuVO.menu_name + "</a></h3>";
					}
				} 
			}
		}

		$("#lnb").html(secondMenuHtml + "</ul>");
	}

	function gotoSelectedMenu(url, firstMenuName, firstMenuId, currentMenuId) {
		if (url == "undefined") {
			viewThirdMenu(firstMenuName, firstMenuId, currentMenuId);
		} else {
			$.post("<c:url value='/rms/setSessionSelectedMenu.do'/>", {}, function(){}); 
			$('form').prop("action", "/KCC_RMS" + url).submit();
		}
		
	}
	function gotoSelectedSecondMenu(url, firstMenuName, firstMenuId, currentMenuId) {
			$.post("<c:url value='/rms/setSessionSelectedMenu.do'/>", {selectedSecondMenuId : currentMenuId}, function(){}); 
			$('form').prop("action", "/KCC_RMS" + url).submit();
	}
	
</script>
<section id="contL">
	<nav id="lnb">
	
		<ul>
			<h1>
				<a class="lnb_h1_2"> </a>
				
			</h1>
		</ul>
	</nav>
	<!--gnb:끝-->
</section>
<!--//contL:끝-->