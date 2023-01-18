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
<script src="${contextRoot}/js/taiwan_districts.js"></script>


<title>約約-請輸入信箱</title>
<style type="text/css">
* {
	font-family: 微軟正黑體;
}

b {
	color: red;
}

body {
	background-color: white;
}

#account, #password, h3, #fullname, #comfirm_password, #username,
	#password, #birth, #sex, #e-mail, #phone, #mail, .fullname {
	width: 200px;
	height: 20px;
	margin: 10px;
	color: black;
}

h5 {
	margin: 20px;
	color: #a3a2a3;
}

h5:hover {
	color: black;
}

#container1 {
	margin: 50px;
	padding: 10px;
	width: 235px;
	height: 200px;
	background-color: white;
	border-radius: 5px;
	border-top: 10px solid #31C1DD;
	box-shadow: 0 0px 70px rgba(0, 0, 0, 0.1);
	/*定位對齊*/
	position: relative;
	margin: auto;
	top: 100px;
	text-align: center;
}


.system_name {
	/*定位對齊*/
	position: relative;
	margin: auto;
	top: 100px;
	text-align: center;
}

.submit {
	color: white;
	background: #31C1DD;
	width: 200px;
	height: 30px;
	margin: 10px;
	padding: 5px;
	border-radius: 5px;
	border: 0px;
}

.submit:hover {
	background: #31C1DD;
}



#copyright {
	text-align: center;
	color: #31C1DD;
	margin: -200px 0px 0px 0px;
	font-size: 14px;
}

input, button {
	padding: 5px;
	border: none;
	border: solid 1px #ccc;
	border-radius: 5px;
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/layout/navbar.jsp" />
			<form action="${contextRoot}/sendCode2" id="form1" method="post">
		<div class="login_page">
			<div id="container1">
				<div class="login">
<!-- 					<h3>請配合以下指示以找回您的密碼</h3> -->

					<label for="mail" id="accLabel">請輸入您註冊時用的信箱</label> <input
						type="text" id="mail" name="mail" placeholder="信箱" required>

					<div class="tab"></div>
					<button id="nextBtn" class="submit" disabled
						style="background-color: gray">寄送驗證信</button>

					<button class="submit" onclick="" id="cancel">取消</button>
					<button class="btn btn-outline-info fastLogin3" style="border: none; opacity: 0;">DEMO</button>
				</div>
			</div>
		</div>

	</form>
</body>

<script type="text/javascript">
					const mail = $("#mail");
					const accLabel = $("#accLabel");
					const nextBtn = $("#nextBtn");
					const lastBtn = $("#lastBtn");
					const submitBtn= $("#submitBtn");
					const form1=$("#form1");
					
					$(".fastLogin3").click(function (e) {
						e.preventDefault();
						mail.val("ispandating6666@gmail.com");
					});
					
					let flag1 = false;

					mail.keyup(function () {

						checkAll()
					})



					function checkAll() {

						let rex = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
						let accValue = mail.val();

						if (!rex.test(accValue)) {
							accLabel.html("<font color='red' size='-1'>請輸入正確格式</font>");
							flag1 = false
						}

						if (rex.test(accValue)) {
							let formData = new FormData();
							formData.append("account", accValue)
							fetch("${contextRoot}/CheckAcc", { method: "POST", body: formData }).then(result => result.text()).then(message => {
								if (message == "帳號重複") {
									accLabel.html("<font color='green' size='-1'>有此帳號</font>");
									flag1 = true;
								}
								if (message == "此帳號可用") {
									accLabel.html("<font color='red' size='-1'>無此帳號</font>");
									flag1 = false;
								}
							})
							
						}

						checkFlag();

					}


					function checkFlag() {
						if (flag1) {
							nextBtn.removeAttr("disabled");
							nextBtn.attr("style","background-color:#31C1DD")
						} else {
							nextBtn.attr("disabled", "")
							nextBtn.attr("style","background-color:gray")
						}
					}
					
					$("#cancel").click(function(event) {
						event.preventDefault(); //取消預設行為
						location.href='http://localhost:8080/index';
// 						window.history.back(); //返回上一頁
						})

					nextBtn.click(function (event) {
						event.preventDefault();
						let accValue=mail.val();
						let formData = new FormData();
						formData.append("account", accValue)
						fetch("${contextRoot}/sendCode2", { method: "POST", body: formData }).then(result => result.text()).then(message => {
										alert(message);							
							})
						
					})

				</script>

</html>