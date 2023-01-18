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
				<title>Shop Homepage - Start Bootstrap Template</title>
				<!-- Favicon-->
				<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
				<!-- Bootstrap icons-->
				<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
					rel="stylesheet" />
				<!-- Core theme CSS (includes Bootstrap)-->
				<link href="${contextRoot }/css/bootstrap.min.css" rel="stylesheet" />
				<style>
					#labelDiv {
						height: 20px;
						background-color: red;
						color: white;
						width: fit-content;
						line-height: 20px;
						border-radius: 2px;
						font-size: 14px;
						margin-bottom: 20px;
					}

					#minusDiv,
					#plusDiv {
						height: 40px;
						width: 40px;
						background-color: #f9f9f9;
						display: flex;
						justify-content: center;
						align-items: center;
						cursor: pointer;
					}

					#quantityInput {
						height: 40px;
						width: 90px;
						border: none;
						text-align: center;
					}

					#countTitle,
					#descTitle,
					#tipsTitle {
						color: grey;
						font-size: 14px;
						margin-bottom: 10px;
					}

					.title {
						margin-bottom: 20px;
					}

					#addCart {
						margin-left: 40px;
						width: 150px;
						border-radius: 2px;
					}
				</style>
			</head>


			<body>
				<!-- Navigation-->
				<jsp:include page="/WEB-INF/layout/navbar.jsp"></jsp:include>
				<!-- navbar覆蓋的部分 -->
				<div class="top-div" style="margin-top: 72px;"></div>

				<main>
					<div class="container-fluid" style="width: 70%;">
						<div class="row">
							<c:forEach var="p" items="${product}">
								<div class="col-6" style="padding: 20px;">
									<div><img src="${p.img}" alt=""></div>
									<div class="row" style="height: 120px;"></div>

									<div class="line-it-button" data-lang="zh_Hant" data-type="share-a" data-env="REAL"
										data-url="http://localhost:8080/openProductDetail?productId=${p.id}"
										data-color="default" data-size="large" data-count="false" data-ver="3"
										style="display: none;"></div>
									<script
										src="https://www.line-website.com/social-plugins/js/thirdparty/loader.min.js"
										async="async" defer="defer"></script>

								</div>
								<div class="col-6" style="padding: 20px;">
									<h4 style="margin-bottom: 10px;">${p.name}</h4>

									<c:choose>
										<c:when test="${p.label ==1 }">
											<div id="labelDiv">New</div>
										</c:when>
										<c:when test="${p.label == 2}">
											<div id="labelDiv">Discount</div>
										</c:when>
										<c:when test="${p.label == 3 }">
											<div id="labelDiv">Hot</div>
										</c:when>
									</c:choose>
									<h4 class="name title" style="color: red;">NT$ ${p.price }</h4>
									<div id="countTitle">數量</div>
									<div class="quantityBox title" style="display: flex;">
										<div id="minusDiv" onclick="quantityMinus()">
											<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="grey"
												class="bi bi-dash" viewBox="0 0 16 16">
												<path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z" />
											</svg>
										</div>
										<input id="quantityInput" type="text" value="1"
											onchange="quantityJudge(${p.inventory})">
										<div id="plusDiv" onclick="quantityPlus(${p.inventory })">
											<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="grey"
												class="bi bi-plus" viewBox="0 0 16 16">
												<path
													d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
											</svg>
										</div>
										<div id="addShoppingCart">
											<a class="btn btn-warning" id="addCart"
												onclick="addCart(${p.id},quantityInput.value)">加入購物車</a>
										</div>
									</div>

									<div id="descTitle">商品描述</div>
									<div class="desc title" style="margin-bottom: 20px;">
										${p.desc }
									</div>
							</c:forEach>
							<div id="tipsTitle">溫馨提醒</div>
							<div style="font-size: 14px; color: rgb(33, 33, 33);">
								<div style="margin-bottom: 7px;">
									●當您收到商品後，記得確認您所訂購的商品，如有非人為因素所致之商品損毀、刮傷、或運輸過程造成包裝破損不完整的情形，請您儘速通知本公司客服人員。
								</div>
								<div style="margin-bottom: 7px;">
									●您所退回的商品必須保持商品本體、附件、內外包裝、配件、贈品、原廠包裝及所有隨附文件或資料的完整性，切勿缺漏任何配件或損毀原廠外盒。
								</div>
								<div style="margin-bottom: 7px;">
									●請您以送貨使用之原包裝紙箱將退貨商品包裝妥當，若原紙箱已遺失，請另使用其他紙箱包覆於商品原廠包裝之外，切勿直接於原廠包裝上黏貼紙張或書寫文字。
								</div>
								<div style="margin-bottom: 7px;">
									●訂購後若大量退換貨，由於已造成作業上之困擾，可能會視情況對該用戶採取拒絕交易或永久取消其資格辦理。
								</div>
							</div>
						</div>
					</div>
				</main>

				<!-- Footer-->
				<jsp:include page="/WEB-INF/layout/footer.jsp"></jsp:include>

				<!-- Bootstrap core JS-->
				<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
				<script src="${contextRoot}/js/jquery-3.6.1.min.js"></script>

				<!-- 結帳單裡面的js元素 -->
				<script>
					let quantityInput = document.getElementById('quantityInput');
					function quantityJudge(inventory) {
						if (quantityInput.value >= inventory) {
							quantityInput.value = inventory
						}
						if (quantityInput.value == '') {
							quantityInput.value = 1;
						}
					}
					function quantityMinus() {
						if (quantityInput.value == 1) {
							quantityInput.value = 1;
						} else {
							quantityInput.value -= 1;
						}
					}
					function quantityPlus(inventory) {
						if (quantityInput.value < inventory) {
							quantityInput.value = parseInt(quantityInput.value) + 1;
						} else {
							quantityInput.value = inventory;
						}
					}
					function addCart(id, quantity) {
						fetch('${contextRoot}/addToCart?id=' + id + '&quantity=' + quantity).then(res => res.text()).then(text => judge(text))
					}
					function judge(text) {
						alert(text)
						if (text == "請先登入") {
							document.location.href = "${contextRoot}/login";
						} else {
							document.location.href = "${contextRoot}/product";
						}
					}

				</script>
			</body>

			</html>