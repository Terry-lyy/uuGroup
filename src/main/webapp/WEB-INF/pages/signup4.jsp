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
<title>約約-註冊頁面</title>
<!-- <link rel="stylesheet" href="/join666/css/signup2.css"> -->
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
	width: 230px;
	height: 610px;
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
	<form action="${contextRoot}/googleSignIn" id="form1" method="post">
		<div class="signup_page">
			<div id="container1">
				<div class="signup">
					<h2>您尚未註冊</h2>
					<h3>請輸入個人資料</h3>
					<h3>以完成註冊</h3>
					<input type="text" id="name" class="fullname" name="name"
						placeholder="暱稱" required value="${memberG.getName() }">
					<div class="tab"></div>
					<input type="date" id="birth" name="birth" placeholder="出生日期"
						required>
					<div class="tab"></div>
					<input type="tel" id="phone" name="phone" placeholder="電話" required>
					<div class="tab"></div>
										<div style="text-align: left; margin-left: 15px" id="gen">
						<label id="gen">性別:</label> <input type="radio" id="gender"
							name="gender" value="1" checked>男 <input type="radio"
							id="gender" name="gender" value="2">女
					</div>
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
					<div class="tab"></div>
							<br>
					<h4>您有什麼興趣:</h4>
										<div class="form-check form-check-inline">
						<label class="form-check-label"><input
							class="form-check-input" type="checkbox" id="hobbit1" name="hobbit" value="1">
							唱歌</label>
					</div>
					<div class="form-check form-check-inline">
						<label class="form-check-label"><input
							class="form-check-input" type="checkbox" id="hobbit2" name="hobbit" value="2">
							爬山</label>
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
					<div class="tab"></div>
					<button type="submit" class="submit" id="submitBtn">註冊</button>
					<button class="submit" id="cancel">取消回首頁</button>

				</div>
			</div>
		</div>
	</form>
</body>

<script type="text/javascript">
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
					$("#cancel").click(function(event) {
						event.preventDefault(); //取消預設行為
						location.href='http://localhost:8080/index';
// 						window.history.back(); //返回上一頁
						})

				</script>

</html>