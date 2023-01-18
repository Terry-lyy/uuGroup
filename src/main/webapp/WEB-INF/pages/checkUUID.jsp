<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>歡迎使用約約-登入</title>

<!-- 自訂CSS -->
<!-- <link rel="stylesheet" href="/Login/css/login.css"> -->

</head>

<body class="vh-100">

	<main class="form-signin m-5 text-center ">
		<jsp:include page="/WEB-INF/layout/navbar.jsp" />
		<br>
		<form action="${contextRoot}/insertMember2" method="post" id="form1">
			<h1 class="h3 mb-3 fw-normal">請輸入驗證碼</h1>
			<div class="form-floating">
				<input type="text" class="form-control" id="code"
					placeholder="aaa" name="code" required> <label
					for="code">驗證碼</label>
			</div>
		
			<div class=" mb-2">
				<button class="w-25 btn btn-lg btn-primary" id="UUID">檢查驗證碼</button>
			</div>

			<div>
				<button class="w-25 btn btn-lg btn-outline-dark" id="cancel">取消</button>
			</div>
			<div class="mt-5" style="color: red">${message}</div>
		</form>
	</main>

	<div class="text-center m-5">

	</div>

</body>

<script type="text/javascript">
	const code = $("#code");
	const form1=$("#form1");
	$("#UUID").click(function(event){
		event.preventDefault();
		let codeVal= code.val();
		var uuid= '<%=session.getAttribute("token")%>';
		console.log(uuid+","+typeof uuid);
		console.log(codeVal+","+typeof codeVal);
		if (codeVal != uuid){
			alert("驗證碼錯誤")
			return;
		}else{
			form1.submit();
		}
	})
	
	//取消按鈕返回上頁
	$("#cancel").click(function(event) {
		event.preventDefault(); //取消預設行為
		location.href='http://localhost:8080/index';
		//window.history.back(); //返回上一頁
	})
</script>

</html>