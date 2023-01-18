<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>約約</title>
</head>
<body>
	
		<jsp:include page="/WEB-INF/layout/navbar.jsp" />
	
	<img src="${contextRoot}/images/party.jpeg" style="width:100%;height:100%;display:flex;margin:auto">
</body>
</html>