<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="utf-8" />
				<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
				<meta name="description" content="" />
				<meta name="author" content="" />
				<title>訂單確認</title>
				<!-- Favicon-->
				<link rel="icon" type="image/x-icon" href="${contextRoot}/assets/favicon.ico" />
				<!-- Bootstrap icons-->
				<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
					rel="stylesheet" />
				<!-- Core theme CSS (includes Bootstrap)-->

			</head>

			<body>
				<jsp:include page="/WEB-INF/layout/navbar.jsp"></jsp:include>
				<div class="container=fluid">
					<!-- 訂單確認標題 -->
					<div style="margin-top: 80px; display: flex; justify-content: center;">
						<h2>訂單確認</h2>
					</div>
					<!-- 商品陳列 -->
					<div class="card mb-4" style="width: 70%; margin: 0 auto;">
						<!-- 商品成列之標題 -->
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 商品列表
						</div>
						<!-- 商品成列之table -->
						<div class="card-body container-fluid">
							<table class="table table-striped table-sm">
								<thead>
									<tr>
										<th>名稱</th>
										<th>圖片</th>
										<th>價格</th>
										<th>數量</th>
										<th>總價</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody id="table">
							</table>
						</div>

					</div>
					<!-- 總金額位置 -->
					<div style="display: flex; justify-content: center;">
						<div id="totalPrice"></div>
					</div>
					<form action="${contextRoot}/checkedOrder" method="post">
						<!-- 收件人信息 -->
						<div class="card mb-4" style="width: 70%; margin: 16px auto 0px;">
							<!-- 收件人信息之標題 -->
							<div class="card-header">
								<i class="fas fa-table me-1"></i> 收件人信息
							</div>
							<!-- 收件人信息 -->
							<div class="card-body container-fluid">
								<div class="row g-3">
									<div class="col-md-3">
										<label for="validationServer01" class="form-label">收件人姓名</label>
										<input type="text" class="form-control" id="validationServer01" name="mname"
											required>
									</div>
									<div class="col-md-3">
										<label for="validationServer02" class="form-label">收件人電話</label>
										<input type="tel" class="form-control" id="validationServer02" name="mtel"
											required>
										<div id="tel-feedback"></div>
									</div>
									<div class="col-md-6">
										<label for="validationServer3" class="form-label">E-mail</label>
										<input type="text" class="form-control" id="validationServer3" name="memail"
											required onblur="checkEmail(value)" onfocus="cleanMailFeeback()">
										<div id="mail-feedback"></div>
									</div>

									<div class="col-md-2">
										<label for="city" class="form-label">縣市</label> <select class="form-select"
											class="form-select" id="city" name="city" required>
											<option selected disabled>請選擇</option>
										</select>
									</div>

									<div class="col-md-2">
										<label for="area" class="form-label">地區</label> <select class="form-select" \
											id="area" name="area" required>
											<option selected disabled>請選擇</option>
										</select>
									</div>
									<div class="col-md-8">
										<label for="validationServer05" class="form-label">詳細地址</label> <input
											type="text" class="form-control" id="addrDetail" name="addrDetail"
											aria-describedby="validationServer05Feedback" required>
									</div>
								</div>
							</div>
						</div>
						<!-- 確認結帳 -->
						<div style="display: flex; justify-content: center;">
							
							<button class="btn btn-primary col-md-2" type="submit">確認結帳</button>
						</div>
					</form>
					<div style="margin: 0 auto;">
						<button  class="btn btn-outline fastLogin3">快速輸入</button>
					</div>
				</div>




				<jsp:include page="/WEB-INF/layout/footer.jsp"></jsp:include>
			</body>
			<script>
				window.onload = function () {
					fetch("${contextRoot}/checkCartItem").then(res => res.json()).then(data => changeItem(data))
				}

				// 購物車系統
				function changeItem(data) {
					let itemData = '';
					let totalCount = 0;
					let totalP = 0;
					$.each(data, function (index, value) {
						itemData += '<tr>'
						itemData += '<td>' + value.product.name + '</td>';
						itemData += '<td><img src="' + value.product.img + '" style="width: 100px; height: 100px;"></td>'
						itemData += '<td>' + value.product.price + '</td>'
						totalCount += value.count;
						itemData += '<td><input type="tel" value="' + value.count + '" style="width:40px;text-align:center"'
						itemData += ';width:40px;text-align:center" onchange="sciCountChange(value,' + value.product.id + ')"></td>'
						totalP += value.product.price * value.count;
						itemData += '<td id="sumPrice">' + value.product.price * value.count + '</td>'
						itemData += '<td>'
						itemData += '<a  onclick="deleteShoppingCart(' + value.id + ')"style="color: red; text-decoration:none;cursor: pointer;">刪除</a>'
						itemData += '</td></tr>'
					})
					itemData += '</tbody>'
					let table = document.getElementById('table');
					table.innerHTML = itemData;
					let totalPrice = document.getElementById('totalPrice');
					totalPrice.innerHTML = '共 <strong style="color:red;font-size:20px">' + totalCount + '</strong> 件商品， <strong style="color:red;font-size:20px">' + totalP + '</strong> 元';
				}

				function deleteShoppingCart(sciId) {
					fetch('${contextRoot}/deleteShoppingCart?sciId=' + sciId).then(res => res.json()).then(json => changeItem(json))
				}

				function sciCountChange(count, id) {
					fetch('${contextRoot}/changeCartItem?count=' + count + '&id=' + id).then(res => res.json()).then(json => changeItem(json))
				}

				// 驗證email
				function checkEmail(email) {
					let emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
					if (email.search(emailRule) != -1) {
						document.getElementById('mail-feedback').innerHTML = '<span style="color:green;">email ok</span>';
					} else {
						document.getElementById('mail-feedback').innerHTML = '<span style="color:red;">email error</span>';
					}
				}

				function cleanMailFeeback() {
					document.getElementById('mail-feedback').innerHTML = "";
				}

				$(document).ready(function () {

					let address = '';
					//第一層選單
					$.ajax({
						url: 'https://raw.githubusercontent.com/donma/TaiwanAddressCityAreaRoadChineseEnglishJSON/master/CityCountyData.json',
						type: "get",
						dataType: "json",
						success: function (data) {
							$.each(data, function (key, value) {
								$('#city').append('<option value="' + data[key].CityName + '">' + data[key].CityName + '</option>')
								address += data[key].CityName
							})
						},
						error: function (data) {
							alert("fail");
						}
					});

					//第二層選單
					$("#city").change(function () {
						let cityvalue = 0;
						let target = $("#city").val();
						let cityArr = ['臺北市', '基隆市', '新北市', '連江縣', '宜蘭縣', '釣魚臺', '新竹市', '新竹縣', '桃園市', '苗栗縣', '臺中市', '彰化縣', '南投縣', '嘉義市', '嘉義縣', '雲林縣', '臺南市', '高雄市', '南海島', '澎湖縣', '金門縣', '屏東縣', '臺東縣', '花蓮縣']
						for (let i = 0; i < cityArr.length; i++) {
							if (target == cityArr[i]) {
								cityvalue = i;
							}
						}
						$("#area").empty(); //清空上次的值
						$("#area").css("display", "inline"); //顯現
						$.ajax({
							url: 'https://raw.githubusercontent.com/donma/TaiwanAddressCityAreaRoadChineseEnglishJSON/master/CityCountyData.json',
							type: "get",
							dataType: "json",
							success: function (data) {

								eachval = data[cityvalue].AreaList; //鄉鎮

								$.each(eachval, function (key, value) {
									$('#area').append('<option value="' + eachval[key].AreaName + '">' + eachval[key].AreaName + '</option>')
								});
							},
							error: function () {
								alert("fail");
							}

						});
					});
				});
				$(".fastLogin3").click(function () {
				$("#validationServer01").val("小朱");
				$("#validationServer02").val("0912345678");
				$("#validationServer3").val("0912345678@gmail.com");
				$("#addrDetail").val("復興南路100號1樓");
			
			
			
		});


			</script>


			</html>