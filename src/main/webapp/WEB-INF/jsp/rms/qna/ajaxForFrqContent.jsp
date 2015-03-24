<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javaScript" language="javascript">
</script>
<c:forEach items="${contentList}" var="frqContent" varStatus="st">
<option><c:out value="${frqContent.frq_answer_content}"></c:out></option>
</c:forEach>