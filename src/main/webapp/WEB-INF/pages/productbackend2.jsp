<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
		<link href="${contextRoot}/js/jquery-3.6.1.min.js" rel="stylesheet" />
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>


			<style>
				#table tr {
					text-align: center;
					line-height: 100px;
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

				#insertProductForm input {
					margin-bottom: 10px;
				}

				.fatherDiv {
					display: flex;
				}

				.fatherDiv div {
					margin-right: 30px;
				}

				#search-input {
					border-radius: 3px;
					border: 1px solid grey;
					margin-left: 30px;
				}

				#preview {
					margin-top: 20px;
				}

				#preview table tr td {
					border: 1px solid black;
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
								<i class="fas fa-table me-1"></i> 功能區
							</div>
							<class class="card-body">
								<div class="row">
									<div class="col-5" style="border-right: 3px dashed grey;">
										<div>
											<div>
												<form action="">
													搜尋: <input type="text" name="" id="search-input"
														placeholder="key word"> <input type="submit" class="btn"
														value="送出">
												</form>
											</div>
										</div>
										<div class="fatherDiv" style="margin-bottom: 20px;"
											onchange="searchCondition()">
											<div>類型:</div>
											<div>
												<input type="checkbox" id="1" value="1" name="type"><label
													for="1">派對道具</label>
											</div>
											<div>
												<input type="checkbox" id="2" value="2" name="type"><label
													for="2">桌遊</label>
											</div>
											<div>
												<input type="checkbox" id="3" value="3" name="type"><label
													for="3">裝飾用品</label>
											</div>
											<div>
												<input type="checkbox" id="4" value="4" name="type"><label
													for="4">票券</label>
											</div>
										</div>
										<div class="fatherDiv" onchange="searchCondition()">
											<div>標籤:</div>
											<div>
												<input type="checkbox" id="5" value="1" name="label"><label
													for="5">New</label>
											</div>
											<div>
												<input type="checkbox" id="6" value="2" name="label"><label
													for="6">Discount</label>
											</div>
											<div>
												<input type="checkbox" id="7" value="3" name="label"><label
													for="7">Hot</label>
											</div>
											<div>
												<input type="checkbox" id="8" value="4" name="label"><label
													for="8">Sales</label>
											</div>
										</div>
									</div>
									<div class="col-5" style="border-right: 3px dashed grey;">
										<form action="/" method="post" id="functionForm">
											<div class="row">
												<div class="col-8">
													<div>
														更換類型: <select name="type" id="type"
															style="width: 90px; height: 30px; margin: 0px 20px 10px;">
															<option selected>請選擇</option>
															<option value="1">派對道具</option>
															<option value="2">桌遊</option>
															<option value="3">裝飾用品</option>
															<option value="4">票券</option>
														</select>
													</div>
													<div>
														更換標籤: <select name="label" id="label"
															style="width: 90px; height: 30px; margin: 10px 20px;">
															<option selected>請選擇</option>
															<option value="1">New</option>
															<option value="2">Discount</option>
															<option value="3">Hot</option>
															<option value="4">Sales</option>
														</select> <select name="discountNumer" id="discountNumer"
															style="display: none; width: 80px; height: 30px;">
															<option selected>請選擇</option>
															<option value="0.9">9折</option>
															<option value="0.8">8折</option>
															<option value="0.7">7折</option>
															<option value="0.6">6折</option>
														</select>
													</div>
													<div>
														更換狀態: <select name="status" id="status"
															style="width: 90px; height: 30px; margin: 10px 20px 0px;">
															<option selected>請選擇</option>
															<option value="0">上架</option>
															<option value="1">下架</option>
														</select>

													</div>
												</div>
												<div class="col-4" style="text-align: center;">
													<input class="btn btn-primary" type="submit" value="確認送出"
														id="smform"></input>
												</div>
											</div>
										</form>
									</div>
									<div class="col-2">
										<div style="margin-bottom: 20px;">
											<button class="btn btn-primary" onclick="insertProduct()">新增商品</button>
										</div>
										<div>
											<button type="button" class="btn btn-primary" data-bs-toggle="modal"
												data-bs-target="#exampleModal">
												批量新增
											</button>
										</div>
									</div>
								</div>
							</class>
						</div>

						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<form action="${contextRoot}/CSVReader" id="csv-form" method="post" enctype="multipart/form-data">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Upload File</h5>
										</div>
										<div class="modal-body">
											<div class="input-group">
												<input type="file" name="file" id="csv-file" accept=".csv"
													class="form-control" aria-describedby="csv-file"
													aria-label="Upload">
											</div>
											<div id="preview"></div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">cancel</button>
											<button type="submit" class="btn btn-primary">upload</button>
										</div>
									</form>
								</div>
							</div>
						</div>


						<div class="card mb-4">
							<div class="card-header">
								<i style="font-size: 16px; cursor: pointer" class="fa" onclick="render()">&#xf021;</i>
								商品列表
							</div>
							<div class="card-body container-fluid">
								<table class="table table-striped table-sm">
									<thead>
										<tr style="text-align: center;">
											<th><input type="checkbox" name="checkHead"></th>
											<th>id</th>
											<th>名稱</th>
											<th>圖片</th>
											<th>價格</th>
											<th>銷量</th>
											<th>庫存</th>
											<th>類型</th>
											<th>標籤</th>
											<th>狀態</th>
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
			</div>

			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
				crossorigin="anonymous"></script>
			<script src="${contextRoot}/js/scripts-backend.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
			<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
			<script src="${contextRoot}/js/jquery-3.6.1.min.js"></script>
			<script type="text/javascript">

				window.onload = render();

				function render() {
					fetch("${contextRoot}/backendProduct").then(res => res.json()).then(data => showProductItem(data))
				}

				function showProductItem(data) {
					let productData = '';
					$.each(data, function (index, value) {
						productData += '<tr><td style="vertical-align:middle;"><input type="checkbox" name="checkBody" value="' + value.id + '"></td>'
						productData += '<td>' + value.id + '</td>'
						productData += '<td style="width:300px;">' + value.name + '</td>';
						productData += '<td><img src="' + value.img + '"style="width:100px;height:100px;cursor:pointer;" onclick=updateProduct(' + value.id + ') ></td>';
						productData += '<td>' + value.price + '</td>';
						productData += '<td>' + value.sales + '</td>';
						productData += '<td>' + value.inventory + '</td>';
						// type
						switch (value.type) {
							case 1:
								productData += '<td>派對道具</td>';
								break;
							case 2:
								productData += '<td>桌遊</td>';
								break;
							case 3:
								productData += '<td>裝飾用品</td>';
								break;
							case 4:
								productData += '<td>票券</td>';
								break;
						}
						//label
						switch (value.label) {
							case 1:
								productData += '<td>New</td>';
								break;
							case 2:
								productData += '<td>Discount</td>';
								break;
							case 3:
								productData += '<td>Hot</td>';
								break;
							case 4:
								productData += '<td>Sale</td>';
								break;
						}
						//status
						switch (value.status) {
							case 0:
								productData += '<td style="cursor:pointer;" onclick=changeStatus(' + value.id + ')>上架</td>';
								break;
							case 1:
								productData += '<td style="cursor:pointer;" onclick=changeStatus(' + value.id + ')>下架</td>';
								break;
						}
						productData += '<td><a style="color:blue;cursor:pointer;margin-right:5px" onclick="updateProduct(' + value.id + ')">編輯</a>';
						productData += '<a style="color:red;cursor:pointer;" onclick="deleteProduct(' + value.id + ')">刪除</a></td></tr>';
					})
					document.getElementById('table').innerHTML = productData;
					giveEvent()
				}

				function deleteProduct(id) {
					if (confirm('是否刪除' + id + '號商品')) {
						fetch('${contextRoot}/deleteProduct?id=' + id).then(res => res.text()).then(data => alert(data)).then(data => render())
					}
				}
				function updateProduct(id) {
					location.href = '${contextRoot}/updataProduct?id=' + id
				}

				function changeStatus(id) {
					fetch('${contextRoot}/changeStatus?id=' + id).then(res => res.json()).then(data => showProductItem(data))
				}

				function insertProduct() {
					location.href = '${contextRoot}/insertproduct';
				}

				function searchCondition() {
					let types = document.getElementsByName('type');
					let typeArr = []
					for (let i = 0; i < types.length; i++) {
						if (types[i].checked) {
							typeArr.push(types[i].value)
						}
					}
					let labels = document.getElementsByName('label');
					let labelArr = []
					for (let i = 0; i < labels.length; i++) {
						if (labels[i].checked) {
							labelArr.push(labels[i].value)
						}
					}
					console.log(typeArr);
					console.log(labelArr);
					fetch('${contextRoot}/mutipleConditionsQuery?typeCondi=' + typeArr + '&labelCondi=' + labelArr).then(res => res.json()).then(json => showProductItem(json))
				}

				//全選功能與選中
				let checkHead = document.getElementsByName('checkHead');
				let checkBody = document.getElementsByName('checkBody');
				let scbtn = document.getElementsByName('selectedChange');
				var productArr = []
				checkHead[0].onclick = function () {
					for (let i = 0; i < checkBody.length; i++) {
						checkBody[i].checked = this.checked;
					}
					productArr = []
					if (checkHead[0].checked) {
						for (let i = 0; i < checkBody.length; i++) {
							productArr.push(checkBody[i].value)
						}
						// console.log(productArr);
					}
				}

				function giveEvent() {
					for (let i = 0; i < checkBody.length; i++) {
						checkBody[i].onchange = function (e) {
							let flag = true;
							productArr = []
							for (let i = 0; i < checkBody.length; i++) {
								if (!checkBody[i].checked) {
									flag = false;
								} else {
									productArr.push(checkBody[i].value)
								}
							}
							checkHead[0].checked = flag;
						}
					}
				}

				$('#smform').click(function (e) {
					e.preventDefault();
					let type = $('#type').val();
					if (type == '請選擇') {
						type = 0
					}
					let label = $('#label').val();
					if (label == '請選擇') {
						label = 0
					}
					let status = $('#status').val();
					if (status == '請選擇') {
						status = 3
					}
					let discountNumber = $('#discountNumer').val();
					if (discountNumber == '請選擇') {
						discountNumber = 0;
					}
					if (confirm('是否確定編輯？')) {
						fetch('${contextRoot}/mutipleUpdate?type=' + type + '&label=' + label + '&status=' + status + '&discountNumber=' + discountNumber + '&target=' + productArr).then(res => res.json()).then(json => showProductItem(json))
					}
				})

				$('#label').change(function () {
					if ($('#label').val() == 2) {
						$('#discountNumer').css('display', 'inline')
					}
				})


				//讀取並預覽檔案
				document.getElementById('csv-form').addEventListener('change', function () {

					var fileInput = document.getElementById('csv-file');
					var file = fileInput.files[0];

					var reader = new FileReader();

					reader.readAsText(file);
					reader.onload = function () {
						var csvString = reader.result;
						var lines = csvString.split('\n');
						var table = document.createElement('table');
						for (var i = 0; i < lines.length; i++) {
							var fields = lines[i].split(',');
							var row = document.createElement('tr');
							for (var j = 0; j < fields.length; j++) {
								var cell = document.createElement('td');
								cell.textContent = fields[j];
								row.appendChild(cell);
							}
							table.appendChild(row);
						}

						document.getElementById('preview').appendChild(table);
					}
				});


			</script>
		</body>

		</html>