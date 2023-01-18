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
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>


<title>約約-修改密碼頁面</title>
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
	#password, #birth, #sex, #e-mail, #phone, #address, .fullname {
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
	height: 250px;
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
<%-- 	<form action="/insertMember" id="form1" method="post"> --%>
			<form action="${contextRoot}/updatePwd" id="form1" method="post">
		<div class="login_page">
			<div id="container1">
				<div class="login">


					<label for="password" id="pwdLabel">請輸入新密碼</label> <i id="checkEye" class="fas fa-eye"></i><input
						type="password" id="password" name="password" placeholder="密碼"
						required> <label for="comfirm_password"
						id="comfirmPwdLabel">請再次輸入新密碼</label> <input type="password"
						id="comfirm_password" name="comfirm_password" placeholder="確認密碼"
						required>
					<div class="tab"></div>
					<button id="nextBtn" class="submit" disabled
						style="background-color: gray">送出</button>

					<button class="submit" onclick="" id="cancel">取消</button>

				</div>
			</div>
		</div>

	</form>
</body>

<script type="text/javascript">
					const password = $("#password");
					const comfirm_password = $("#comfirm_password");
					const pwdLabel = $("#pwdLabel");
					const comfirmPwdLabel = $("#comfirmPwdLabel");
					const nextBtn = $("#nextBtn");
					const form1=$("#form1");
					
					
					let flag2 = false;
					let flag3 = false;

				


					password.keyup(function () {

						checkAll()
					})

					comfirm_password.keyup(function () {

						checkAll()
					})
					
				


					function checkAll() {

			

						let rex2 = /^[a-zA-Z0-9]{6,}$/;
						let pwdValue = password.val();
						if (!rex2.test(pwdValue)) {
							pwdLabel.html("<font color='red' size='-1'>密碼需至少6位英數</font>");
							flag2 = false
						}

						if (rex2.test(pwdValue)) {
							pwdLabel.html("<font color='green' size='-1'>密碼格式正確</font>");
							flag2 = true
						}
						let comfirmVal=comfirm_password.val();
						console.log("確認密碼長度:"+comfirmVal.length);
						if(comfirmVal.length!=0){
						if (password.val() !== comfirm_password.val()) {
							comfirmPwdLabel.html("<font color='red' size='-1'>兩次密碼不相符</font>");
							flag3 = false
						}

						if (password.val() == comfirm_password.val()) {
							comfirmPwdLabel.html("<font color='green' size='-1'>二次驗證正確</font>");
							flag3 = true
						}
						}
						checkFlag();

					}


					function checkFlag() {
						if (flag2 && flag3) {
							nextBtn.removeAttr("disabled");
							nextBtn.attr("style","background-color:#31C1DD")
						} else {
							nextBtn.attr("disabled", "")
							nextBtn.attr("style","background-color:gray")
						}
					}
					

// 					nextBtn.click(function (event) {
// 						event.preventDefault();
						
// 					})
					
// 					submitBoth.click(function (event){
// 						event.preventDefault();
// 						var from1=document.getElementById("from1");
// 						var from2=document.getElementById("from2");
// 						form1.submit();
// 						form2.submit();
// 						var gender= $('[name=gender]:checked').val();
// 						console.log(gender);
// 					})
	

					$("#cancel").click(function(event) {
						event.preventDefault(); //取消預設行為
						location.href='http://localhost:8080/index';
						})
					
										$("#checkEye").click(function() {
		if ($(this).hasClass('fa-eye')) {
			password.attr('type', 'text');
		} else {
		password.attr('type', 'password');
		}
		$(this).toggleClass('fa-eye').toggleClass('fa-eye-slash');
	});
				</script>

</html>