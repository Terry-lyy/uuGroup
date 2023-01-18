<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

				<!DOCTYPE html>

				<html>

				<head>

					<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />

					<link id="style-switch" rel="stylesheet" type="text/css"
						href="${pageContext.request.contextPath}/css/style.css">
					<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
					<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
					<meta charset="UTF-8">
					<title>Insert title here</title>
					<base href="/webapp/">

				</head>

				<body>
					<header class="navbar-light fixed-top header-static bg-mode" style="height:70px;">
						<jsp:include page="/WEB-INF/layout/navbar.jsp" />
						</a>
					</header>



					<main>

<img alt="" src="${contextRoot}/showPicture?postId=${postBean.postid}">

					</main>




					<footer>
						<jsp:include page="/WEB-INF/layout/footer.jsp" />
					</footer>

				</body>

				</html>