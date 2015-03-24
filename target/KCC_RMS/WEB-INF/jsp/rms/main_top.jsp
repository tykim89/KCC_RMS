<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javaScript" language="javascript">
	function loadSecondMenu(secondMenuList, menu_name)
	{
		$.post("<c:url value='/rms/setSessionSelectedMenu.do'/>", {selectedMenuId : secondMenuList, selectedMenuName : menu_name}, function(){});  
		viewSecondMenu(secondMenuList, menu_name);
	}
	
	function firstMenuList()
	{
	   	var firstMenuId = "<c:out value='${sessionScope.selectedMenuId}'/>";
	   	var firstMenuName = "<c:out value='${sessionScope.selectedMenuName}'/>";
	   	var secondMenuId = "<c:out value='${sessionScope.selectedSecondMenuId}'/>";
	   
	   	if(secondMenuId != "")
		{
		 
		   viewThirdMenu(firstMenuName, firstMenuId, secondMenuId);
		}else
		{
			viewSecondMenu(firstMenuId, firstMenuName);
		}
		
	}
	function logout(){
		$('form').attr("action", "<c:url value='/rms/sys/logout.do'/>").submit();	
	}
	
</script>
<header><!--header:시작-->
	<div dlass="hWrap"><!--hwrap:시작-->
	
		<h1>
			<a href="#" class="ir"></a>
		</h1>
		
		<nav id="gnb">
			<!--gnb:시작-->
			<ul class="gnbLst">

				<c:forEach items="${menuMap['depth1']}" var="menuVO" varStatus="st">
						<li>
							<h2 class="oD_${st.index+1}">
								<a href="#" onclick="loadSecondMenu('${menuVO.menu_id}','${menuVO.menu_name}')">
								<%-- <c:out value="${menuVO.menu_name}"></c:out> --%></a>
								
							</h2>
						</li>
				</c:forEach>
			</ul>
		</nav>
		<!--//gnb:끝-->
		<div class="utility">
			<a href="#" class="btn_log" onclick="logout();">Logout</a>
		</div>
	</div>
	<!--//hwrap:끝-->
</header>
<!--//header:끝-->
