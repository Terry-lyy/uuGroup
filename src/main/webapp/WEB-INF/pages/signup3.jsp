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

<title>約約-註冊頁面</title>
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
	height: 400px;
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

#container2 {
	margin: 50px;
	padding: 10px;
	width: 230px;
	height: 350px;
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

#container2 {
	visibility: hidden;
	/*剛開始消失*/
	height: 600px;
	width:235px;
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
			<form action="${contextRoot}/sendCode" id="form1" method="post">
		<div class="login_page">
			<div id="container1">
				<div class="login">
					<h3>註冊</h3>

					<label for="account" id="accLabel">請輸入您的信箱</label> <input
						type="text" id="account" name="account" placeholder="信箱" required>
					<label for="password" id="pwdLabel">請輸入密碼  </label><i id="checkEye" class="fas fa-eye"></i><input
						type="password" id="password" name="password" placeholder="密碼"
						required> 
						<label for="comfirm_password"
						id="comfirmPwdLabel">請再次輸入密碼</label> <input type="password"
						id="comfirm_password" name="comfirm_password" placeholder="確認密碼"
						required>
					<div class="tab"></div>
					<button id="nextBtn" class="submit" disabled
						style="background-color: gray">下一步</button>

					<button class="submit" onclick="" id="cancel">取消</button>
					<input type="button" class="submit"
						onclick="location.href='https://accounts.google.com/o/oauth2/auth?scope=email+profile&redirect_uri=http://localhost:8080/LoginGoogleHandler&response_type=code&client_id=378093448501-ebvinmo23u9l8lmljs9souqd3953nbqg.apps.googleusercontent.com&approval_prompt=force';"
						value="Google登入" style="background-color: #31C1DD" />
					<%-- 				</form> --%>
				</div>
			</div>
		</div>

		<div class="signup_page">
			<div id="container2">

				<div class="signup">

					<h3>請輸入個人資料</h3>

					<input type="text" id="name" class="fullname" name="name"
						placeholder="暱稱" required>
					<div class="tab"></div>
					<input type="date" id="birth" name="birth" placeholder="出生日期"
						required>
					<div class="tab"></div>
					<input type="tel" id="phone" name="phone" placeholder="電話" required>
					<div class="tab"></div>
					<div style="text-align: left; margin-left: 22px" id="gen">
						<label id="gen">性別:</label> <input type="radio" id="gender1"
							name="gender" value="1" checked>男 <input type="radio"
							id="gender2" name="gender" value="2">女
					</div>
<!-- 					<input type="text" id="address" name="address" placeholder="地址" required> -->
<!-- 					<div class="tab"></div> -->
					<div class="tab"></div>
					<br>
					<h4>您的居住地</h4>
					<label for="taiwan">縣/市：</label> <select name="taiwan" id="taiwan">
						<option value="">請選擇</option>
					</select>
					<div class="tab"></div>
					<label for="coun">區/鎮/鄉：</label> <select name="coun" id="coun">
						<option value="">請選擇</option>
					</select>
					<script>
    data.forEach(function(value, index) {
        let country = value.name
        $("#taiwan").append("<option value='"+country+"'>"+country+"</option>")
});
    $("#taiwan").change(function () {
        let val = $(this).val();
        let districts=data.find(function(item){
            return item.name==val;
        })
        $("#coun>option").remove()

        districts['districts'].forEach(function(value, index){
            let area= value.name
            let map = "<option value='" + area + "'>" + area + "</option>" 
            $("#coun").append(map)
        })
    })
    </script>

					<br><br>
					<h4>您有什麼興趣:</h4>
					<div class="tab"></div>
					<div class="form-check form-check-inline">
						<label class="form-check-label"><input
							class="form-check-input" type="checkbox" id="hobbit1"
							name="hobbit" value="1"> 唱歌</label>
					</div>
					<div class="form-check form-check-inline">
						<label class="form-check-label"><input
							class="form-check-input" type="checkbox" id="hobbit2"
							name="hobbit" value="2"> 爬山</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox"
							id="inlineCheckbox3" name="hobbit" value="3"> <label
							class="form-check-label" for="inlineCheckbox3">健身</label>
					</div>
					<!-- 					<div class="tab"></div> -->
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox"
							id="inlineCheckbox4" name="hobbit" value="4"> <label
							class="form-check-label" for="inlineCheckbox4">看電影</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox"
							id="inlineCheckbox5" name="hobbit" value="5"> <label
							class="form-check-label" for="inlineCheckbox5">逛街</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox"
							id="inlineCheckbox6" name="hobbit" value="6"> <label
							class="form-check-label" for="inlineCheckbox6">露營</label>
					</div>
					<button type="submit" class="submit" id="submitBtn">註冊</button>
					<button class="submit" id="lastBtn">上一步</button>
					<button class="submit" id="cancel2">回首頁</button>

				</div>
			</div>
		</div>
	</form>
</body>

<script type="text/javascript">
					const account = $("#account");
					const password = $("#password");
					const comfirm_password = $("#comfirm_password");
					const accLabel = $("#accLabel");
					const pwdLabel = $("#pwdLabel");
					const comfirmPwdLabel = $("#comfirmPwdLabel");
					const nextBtn = $("#nextBtn");
					const lastBtn = $("#lastBtn");
					const submitBtn= $("#submitBtn");
					const form1=$("#form1");
					
					
					
					submitBtn.click(function(e){
						e.preventDefault();
						let hobbit=$("input[name=hobbit]:checked");
						if(hobbit.length==0){
							alert("請至少選一項興趣!!")
							return;
						}
						form1.submit();
					})
					
					let flag1 = false;
					let flag2 = false;
					let flag3 = false;

					account.keyup(function () {

						checkAll()
					})

					password.keyup(function () {

						checkAll()
					})

					comfirm_password.keyup(function () {

						checkAll()
					})
					
				


					function checkAll() {

						let rex = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
						let accValue = account.val();

						if (!rex.test(accValue)) {
							accLabel.html("<font color='red' size='-1'>請輸入正確格式</font>");
							flag1 = false
						}

						if (rex.test(accValue)) {
							let formData = new FormData();
							formData.append("account", accValue)
// 							console.log(formData)
							fetch("${contextRoot}/CheckAcc", { method: "POST", body: formData }).then(result => result.text()).then(message => {
								if (message == "帳號重複") {
									accLabel.html("<font color='red' size='-1'>帳號重複</font>");
									flag1 = false
								}
								if (message == "此帳號可用") {
									accLabel.html("<font color='green' size='-1'>此帳號可用</font>");
									flag1 = true
								}
							})
						}

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
						if (flag1 && flag2 && flag3) {
							nextBtn.removeAttr("disabled");
							nextBtn.attr("style","background-color:#31C1DD")
							console.log("disabled"+flag1+","+flag2+","+flag3)
						} else {
							nextBtn.attr("disabled", "")
							nextBtn.attr("style","background-color:gray")
							console.log("undisabled"+flag1+","+flag2+","+flag3)
						}
					}
					

					nextBtn.click(function (event) {
						event.preventDefault();
						var login = document.getElementById("container1");
						var signup = document.getElementById("container2");
						var copyright = document.getElementById("copyright");

						if (login.style.display === "none") {
							login.style.display = "block"; //lonin出現
							// 			document.getElementById("username").value = "";
							// 			document.getElementById("password").value = "";
							signup.style.display = "none"; //signup消失
							// 			copyright.style.margin = "200px 0px 0px 0px";
						} else {
							login.style.display = "none"; //login消失
							signup.style.display = "block"; //signup出現
							signup.style.visibility = "visible";
							// 			copyright.style.margin = "200px 0px 0px 0px";

							// 			document.getElementById("fullname").value = "";
							// 			document.getElementById("username2").value = "";
							// 			document.getElementById("password2").value = "";
							// 			document.getElementById("comfirm_password").value = "";
						}
					})
					
// 					submitBoth.click(function (event){
// 						event.preventDefault();
// 						var from1=document.getElementById("from1");
// 						var from2=document.getElementById("from2");
// 						form1.submit();
// 						form2.submit();
// 						var gender= $('[name=gender]:checked').val();
// 						console.log(gender);
// 					})
					
					lastBtn.click(function (event) {
						event.preventDefault();
						var login = document.getElementById("container1");
						var signup = document.getElementById("container2");
						var copyright = document.getElementById("copyright");

						if (login.style.display === "none") {
							login.style.display = "block"; //lonin出現
							// 			document.getElementById("username").value = "";
							// 			document.getElementById("password").value = "";
							signup.style.display = "none"; //signup消失
							// 			copyright.style.margin = "200px 0px 0px 0px";
						} else {
							login.style.display = "none"; //login消失
							signup.style.display = "block"; //signup出現
							signup.style.visibility = "visible";
							// 			copyright.style.margin = "200px 0px 0px 0px";

							// 			document.getElementById("fullname").value = "";
							// 			document.getElementById("username2").value = "";
							// 			document.getElementById("password2").value = "";
							// 			document.getElementById("comfirm_password").value = "";
						}
					})


					$("#cancel").click(function(event) {
						event.preventDefault(); //取消預設行為
						location.href='http://localhost:8080/index';
// 						window.history.back(); //返回上一頁
						})
						
						$("#cancel2").click(function(event) {
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