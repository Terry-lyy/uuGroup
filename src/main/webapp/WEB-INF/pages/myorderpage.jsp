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
				<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
				<!-- Bootstrap icons-->
				<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
					rel="stylesheet" />
				<!-- Core theme CSS (includes Bootstrap)-->
				<style>
					#table tr td {
						height: 40px;
						line-height: 40px;
					}
				</style>
			</head>

			<body>
				<jsp:include page="/WEB-INF/layout/navbar.jsp"></jsp:include>
				<div class="container=fluid">
					<!-- 訂單確認標題 -->
					<div style="margin-top: 80px; display: flex; justify-content: center;">
						<h2>我的訂單</h2>
					</div>
					<!-- 商品陳列 -->
					<div class="card mb-4" style="width: 70%; margin: 0 auto;">
						<!-- 商品成列之標題 -->
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 商品列表
							<span style="color: red;margin-left: 10px;">當前匯率${ fx}</span>
						</div>
						<!-- 商品成列之table -->
						<div class="card-body container-fluid">
							<table class="table table-striped table-sm">
								<thead>
									<tr>
										<th>編號</th>
										<th>下單日期</th>
										<th>數量</th>
										<th>總金額</th>
										<th>收件人</th>
										<th>電話</th>
										<th>地址</th>
										<th>狀態</th>
										<th>詳情</th>
									</tr>
								</thead>
								<tbody id="table">
							</table>
						</div>

					</div>

					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">訂單詳情</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body" id="detailBody">
									<table class="table table-striped table-sm">
										<thead>
											<tr>
												<th>名稱</th>
												<th>圖片</th>
												<th>數量</th>
												<th>單價</th>
												<th>金額</th>
											</tr>
										</thead>
										<tbody id="detailTable">
									</table>
								</div>
								
							</div>
						</div>
					</div>
				</div>
				<div>付款帳號 ktvnfl4706@sandbox.com</div>
				<jsp:include page="/WEB-INF/layout/footer.jsp"></jsp:include>
				<script>
					window.onload = function () {
						fetch("${contextRoot}/openMyOrder").then(res => res.json()).then(data => changeItem(data))
					}

					function changeItem(data) {
						let itemData = '';
						$.each(data, function (index, value) {
							itemData += '<tr>'
							itemData += '<td>' + value.id + '</td>';
							itemData += '<td>' + value.date + '</td>'
							itemData += '<td>' + value.count + '</td>'
							itemData += '<td>' + value.price + '</td>'
							itemData += '<td>' + value.name + '</td>'
							itemData += '<td>' + value.tel + '</td>'
							itemData += '<td>' + value.addr + '</td>'
							switch (value.status) {
								case 0:
									itemData += '<td><a onclick=goPay(' + value.id + ') style="color:blue;text-decoration:none; cursor:pointer">未付款</td>'
									break;
								case 1:
									itemData += '<td>待發貨</td>'
									break;
								case 2:
									itemData += '<td>已發貨</td>'
									break;
								case 3:
									itemData += '<td>已簽收</td>'
									break;
								default:
									itemData += '<td></td>'
									break;
							}
							itemData += '<td>'
							itemData += '<button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal" style="color: red;border: 0px;" onclick="openOrderDetail(' + value.id + ')">詳情</button>'
							itemData += '</td></tr>'
						})
						itemData += '</tbody>'
						let table = document.getElementById('table');
						table.innerHTML = itemData;
					}

					function openOrderDetail(orderId) {
						fetch("${contextRoot}/openMyOrderDetail?orderId=" + orderId).then(res => res.json()).then(data => changeDetailItem(data))
					}

					function changeDetailItem(data) {
						let itemData = '';
						$.each(data, function (index, value) {
							itemData += '<tr>'
							itemData += '<td>' + value.product.name + '</td>';
							itemData += '<td><img src="' + value.product.img + '" style="width: 100px; height: 100px;"></td>'
							itemData += '<td>' + value.count + '</td>'
							itemData += '<td>' + value.product.price + '</td>'
							itemData += '<td>' + value.totalPrice + '</td>'
						})
						itemData += '</tbody>'
						let table = document.getElementById('detailTable');
						table.innerHTML = itemData;
					}

					function goPay(id) {
						fetch("${contextRoot}/alipay", {
							method: "POST",
							headers: {
								"Content-Type": "application/x-www-form-urlencoded",
							},
							body: "orderId=" + id,
						})
							.then((response) => response.text())
							.then((text) => {
								document.write(text)
							})
							.catch((error) => {
								console.error(error);
							});
					}
				</script>
			</body>

			</html>