<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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


					<main class="form-signin m-5 text-center " style="text-align:middle">
						<jsp:include page="/WEB-INF/layout/navbar.jsp" />
						<br>
						<form action="${contextRoot}/login" method="post" id="form1" style="align-items:center">
							<h1 class="h3 mb-3 fw-normal">會員登入</h1>

							<div class="form-floating">
								<input type="text" class="form-control" id="floatingAccount" placeholder="aaa"
									name="account" required> <label for="floatingInput">帳號</label>
							</div>
							<div class="form-floating">
								<input type="text" class="form-control" id="floatingPassword" placeholder="Password"
									name="password" required> <label for="floatingPassword">密碼</label>
									 <i id="checkEye" class="fas fa-eye"></i>
							</div>
							<br>
							<div class="mb-2">
								 <input type="checkbox" class="custom-control-input" id="chkPasw">
									<label class="custom-control-label" for="chkPasw"><span style="font-size:smaller;font-weight:900">顯示密碼</span></label><br>
								<label> <a href="${contextRoot}/checkEmail">忘記密碼了嗎?</a>
								</label>
							</div>
							<div class=" mb-2">
								<button class="w-25 btn btn-lg btn-primary" id="loginBtn">登入</button>
							</div>
							<div class=" mb-2">
								<input type="button" class="w-25 btn btn-lg btn-primary"
									onclick="location.href='googlelogin';" value="Google登入" />
							</div>
							<div>
								<button class="w-25 btn btn-lg btn-outline-dark" id="cancel">取消</button>
							</div>
							<div class="mt-5" style="color: red">${message}</div>
						</form>
					</main>

					<div class="text-center m-5">
						快速登入:
						<button class="btn btn-outline-info fastLogin2">Leo</button>
						<button class="btn btn-outline-info fastLogin2">Kevin</button>
						<button class="btn btn-outline-info fastLogin2">Jerry</button>
						<button class="btn btn-outline-info fastLogin2">Mary</button>
						<button class="btn btn-outline-info fastLogin2">Terry</button>
						<button class="btn btn-outline-info fastLogin" value="admin">admin</button>
						<!-- 		<button class="btn btn-outline-info fastLogin">易穎</button> -->
						<!-- 		<button class="btn btn-outline-info fastLogin">博宇</button> -->
						<!-- 		<button class="btn btn-outline-info fastLogin">宇豐</button> -->
								<button class="btn btn-outline-info fastLogin3"
									style="border: none; opacity: 0;">DEMO</button>

					</div>

				</body>

				<script type="text/javascript">
					$("#loginBtn").click(function (event) {
						event.preventDefault();
						var account = $("#floatingAccount").val();
						var password = $("#floatingPassword").val();
						let formData = new FormData();
						formData.append("account", account);
						formData.append("password", password);
						fetch("${contextRoot}/checkMem", { method: "POST", body: formData }).then(result => result.json()).then(flag => {
							if (flag) {
								// 				alert("帳號密碼正確");
								$("#form1").submit();
							}
							else {
								alert("帳號或密碼錯誤，請輸入正確的帳號密碼");
								return;
							}
						})
					})

					//快速登入
					$(".fastLogin2").click(function () {

						console.log(this.innerHTML)
						if (this.innerHTML == "Terry") {
							$("#floatingAccount").val("andy911026@gmail.com");
						} else {
							$("#floatingAccount").val(this.innerHTML + "001");
						}

						$("#floatingPassword").val("1234");
					});
					$(".fastLogin").click(function () {
						$("#floatingAccount").val(this.innerHTML);
						$("#floatingPassword").val(this.innerHTML);
					});
					
					$(".fastLogin3").click(function () {
						$("#floatingAccount").val("ispandating6666@gmail.com");
						$("#floatingPassword").val("456789");
					});
					//密碼可視切換
					$("#checkEye").click(function () {
						if ($(this).hasClass('fa-eye')) {
							$("#floatingPassword").attr('type', 'password');
						} else {
							$("#floatingPassword").attr('type', 'text');
						}
						$(this).toggleClass('fa-eye').toggleClass('fa-eye-slash');
					});

					//取消按鈕返回上頁
					$("#cancel").click(function (event) {
						event.preventDefault(); //取消預設行為
						window.history.back(); //返回上一頁
					})
					
				$(document).ready(function () {   
	ShowHidePasw();//一進來先隱藏密碼
	$('#chkPasw').attr('onclick', 'ShowHidePasw()');
						   
});
	

//密碼顯示或是隱藏
function ShowHidePasw() {
	var txtPasw = $("#floatingPassword");
	//alert(txtPasw.attr("type"));
	if (txtPasw.attr("type") == "password") {
		txtPasw.attr("type", "text");
	}
	else {
		txtPasw.attr("type", "password");

	}
	
}
				</script>

				</html>