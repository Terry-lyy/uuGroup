<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>


			<style>
				#table tr {
					text-align: center;
					vertical-align: middle;
				}

				#table tr td a {
					text-decoration: none;
				}

				#pagenav ul div {
					margin: 0 auto;
				}

				#pagenav ul div li {
					float: left;
				}

				#editor,
				#cancel {
					padding: 0px 0px;
					height: 30px;
					width: 90px;
					font-size: 16px;
					line-height: 30px;
				}
			</style>
		</head>

		<body>
			<jsp:include page="/WEB-INF/layout/backendnav.jsp"></jsp:include>
			<div id="layoutSidenav_content">
				<main>
					<div class="container-fluid px-4">
						<div class="card mb-4" style="margin-top: 20px;">
							<div class="card-header">
								<i class='fas fa-wrench'></i> 功能區
							</div>
							<class class="card-body">
								<div class="row">
									<button class="btn btn-primary" onclick="changeStatus()">一鍵發貨</button>
								</div>
							</class>
						</div>
						<div class="card mb-4" style="margin-top: 20px;">
							<div class="card-header">
								<i class='fas fa-eraser'></i> 編輯區
							</div>
							<class class="card-body">
								<div class="row">

								</div>
								<div class="row">
									<div id="orderId">
									</div>
									<table>
										<thead>
											<tr>
												<th>總金額</th>
												<th>收件人</th>
												<th>電話</th>
												<th>地址</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody id="editorArea">

										</tbody>
									</table>
								</div>
							</class>
						</div>


						<div class="card mb-4">
							<div class="card-header">
								<i style="font-size:16px;cursor:pointer" class="fa" onclick="render()">&#xf021;</i> 訂單列表
							</div>
							<div class="card-body container-fluid">
								<table class="table table-striped table-sm">
									<thead>
										<tr style="text-align: center;vertical-align: middle;">
											<th><input type="checkbox" name="checkHead" id=""></th>
											<th>編號</th>
											<th style="cursor: pointer;" onclick="sortByDate()">下單日期<i
													style="margin-bottom: 3px;" class='fas fa-sort-down middle'></i>
											</th>
											<th>數量</th>
											<th>總金額</th>
											<th style="cursor: pointer;" onclick="sortByName()">收件人<i
													style="margin-bottom: 3px;" class='fas fa-sort-down middle'></i>
											</th>
											<th>電話</th>
											<th>地址</th>
											<th style="cursor: pointer;" onclick="sortByStatus()">狀態<i
													style="margin-bottom: 3px;" class='fas fa-sort-down middle'></th>
											<th>詳情</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody id="table">
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</main>
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

			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
				crossorigin="anonymous"></script>
			<script src="${contextRoot}/js/scripts-backend.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
			<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
			<script src="${contextRoot}/js/jquery-3.6.1.min.js"></script>
			<script type="text/javascript">

				window.onload = render()

				function render() {
					fetch("${contextRoot}/openBackendOrder").then(res => res.json()).then(data => changeItem(data))
				}

				function changeItem(data) {
					let itemData = '';
					$.each(data, function (index, value) {
						itemData += '<tr><td><input type="checkbox" name="checkBody" value="' + value.id + '"></td>'
						itemData += '<td>' + value.id + '</td>';
						itemData += '<td>' + value.date + '</td>'
						itemData += '<td>' + value.count + '</td>'
						itemData += '<td>' + value.price + '</td>'
						itemData += '<td>' + value.name + '</td>'
						itemData += '<td>' + value.tel + '</td>'
						itemData += '<td>' + value.addr + '</td>'
						switch (value.status) {
							case 0:
								itemData += '<td>未付款</td>'
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
						itemData += '<button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal" style="color:red;border:0px;" onclick="openOrderDetail(' + value.id + ')">詳情</button>'
						itemData += '</td>'
						itemData += '<td>'
						itemData += '<button type="button" class="btn" style="color:blue;border:0px;" onclick="check(' + value.id + ')">編輯</button>'
						itemData += '</td></tr>'
					})
					itemData += '</tbody>'
					let table = document.getElementById('table');
					table.innerHTML = itemData;
					giveEvent()
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

				function check(id) {
					if (confirm('是否確定編輯編號：' + id + '的訂單')) {
						fetch("${contextRoot}/searchOrderById?orderId=" + id).then(res => res.json()).then(data => renderEditor(data))
					}
				}

				function renderEditor(data) {
					let itemData = '';
					let orderId = ''

					orderId = '<h5>訂單編號' + data.id + '</h5>'
					itemData += '<tr>'
					itemData += '<input type="hidden" id="updateOrderId" value="' + data.id + '">';
					itemData += '<td class="col-2"><input type="text" id="price" value="' + data.price + '"></td>';
					itemData += '<td class="col-2"><input type="text" id="name" value="' + data.name + '"></td>';
					itemData += '<td class="col-2"><input type="text" id="tel" value="' + data.tel + '"></td>';
					itemData += '<td class="col-2"><input type="text" id="addr" value="' + data.addr + '"></td>';
					itemData += '<td class="col-1"><button class="btn btn-primary" id="editor" onclick="updateChecked()">確定編輯</button></td>'
					itemData += '<td class="col-1"><button class="btn btn-primary" id="cancel" onclick="cancelOrder()">取消訂單</button></td>'

					itemData += '</tr></tbody>'
					let table = document.getElementById('editorArea');
					table.innerHTML = itemData;
					document.getElementById('orderId').innerHTML = orderId;
				}

				function updateChecked() {
					let id = $('#updateOrderId').val();
					let price = $('#price').val();
					let name = $('#name').val();
					let tel = $('#tel').val();
					let addr = $('#addr').val();
					fetch("${contextRoot}/updateOrder?id=" + id + "&price=" + price + "&name=" + name + "&tel=" + tel + "&addr=" + addr).then(res => res.text()).then(text => render())
					alert('修改成功')
				}

				//全選功能與選中
				let checkHead = document.getElementsByName('checkHead');
				let checkBody = document.getElementsByName('checkBody');
				var orderArr = []
				checkHead[0].onclick = function () {
					for (let i = 0; i < checkBody.length; i++) {
						checkBody[i].checked = this.checked;
					}
					orderArr = []
					if (checkHead[0].checked) {
						for (let i = 0; i < checkBody.length; i++) {
							orderArr.push(checkBody[i].value)
						}
					}
				}

				function giveEvent() {
					for (let i = 0; i < checkBody.length; i++) {
						checkBody[i].onchange = function (e) {
							let flag = true;
							orderArr = []
							for (let i = 0; i < checkBody.length; i++) {
								if (!checkBody[i].checked) {
									flag = false;
								} else {
									orderArr.push(checkBody[i].value)
								}
							}
							checkHead[0].checked = flag;
						}
					}
				}


				function cancelOrder() {
					let id = $('#updateOrderId').val();
					if (confirm('是否確定取消訂單' + id)) {
						fetch("${contextRoot}/deleteOrder?id=" + id).then(res => res.text()).then(text => render())
					}
					aler('取消成功')
				}

				//調整點擊後desc asc 用前端排序做

				function sortByDate() {
					fetch("${contextRoot}/sortByDate").then(res => res.json()).then(json => changeItem(json))
				}

				function sortByName() {
					fetch("${contextRoot}/sortByName").then(res => res.json()).then(json => changeItem(json))
				}

				function sortByStatus() {
					fetch("${contextRoot}/sortByStatus").then(res => res.json()).then(json => changeItem(json))
				}

				function changeStatus() {
					if (orderArr.length == 0) {
						alert('請先選中商品')
						return;
					}
					if (confirm('是否確定' + orderArr + '已發貨'))
						fetch("${contextRoot}/changeOrderStatus?targets=" + orderArr).then(res => res.json()).then(json => changeItem(json))
					orderArr = []
				}


			</script>
		</body>

		</html>