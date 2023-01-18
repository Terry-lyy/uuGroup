${contextRoot}<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
		<link href="${contextRoot}/js/jquery-3.6.1.min.js" rel="stylesheet" />
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<script src="https://cdn.ckeditor.com/4.20.1/standard/ckeditor.js"></script>
			<title>Insert title here</title>


			<style>
				#labelDiv {
					height: 25px;
					background-color: red;
					color: white;
					width: fit-content;
					line-height: 20px;
					border-radius: 2px;
					font-size: 14px;
					margin-bottom: 20px;
				}

				#typeDiv {
					height: 25px;
					width: fit-content;
					line-height: 20px;
					border-radius: 2px;
					font-size: 14px;
					margin-bottom: 20px;
				}

				#quantityInput {
					height: 40px;
					width: 90px;
					text-align: center;
				}

				#countTitle,
				#descTitle,
				#tipsTitle,
				#nameTitle,
				#labelTitle,
				#priceTitle,
				#typeTitle,
				#statusTitle {
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

				#smbtn {
					margin-top: 30px;
					width: 250px;
					height: 40px;
				}

				#inputimgbtn {
					width: 60%;
					height: 285.82px;

				}

				#file-input {
					height: 286px;
					width: 286px;
					position: relative;
					z-index: 1;
					opacity: 0;
				}

				#preview {
					position: absolute;
					width: 286px;
					height: 286px;
					top: 41px;
					left: 431px;
				}
			</style>
		</head>


		<body>
			<!-- Navigation-->
			<jsp:include page="/WEB-INF/layout/backendnav.jsp"></jsp:include>

			<div id="layoutSidenav_content">
				<form method="post" enctype="multipart/form-data" action="${contextRoot}/saveProduct">
					<div class="row" style="width: 85%;margin: 25px auto 0;">
							<input type="hidden" name="id" value="">
							<input type="hidden" name="sales" value="0">
							<div class="col-6" style="padding: 20px;">
								<div style="text-align: center;">
									<div>
										<input class="btn btn-light" type="file" id="file-input" accept="image/*">
										<input type="hidden" value="" name="img" id="p_img">
										<img id="preview" src="">
									</div>
									<div><input id="smbtn" class="btn btn-primary" type="submit" value="送出商品"></div>
								</div>
							</div>
							<div class="col-6" style="padding: 20px;">
								<div id="nameTitle">名稱</div>
								<h4 style="margin-bottom: 10px;"><input type="text" name="name" value=""
										style="width: 100%;"></h4>
								<div id="labelTitle">標籤</div>
								<select name="label" id="labelDiv">
									<option value="1" selected>New</option>
									<option value="2">Discount</option>
									<option value="3">Hot</option>
									<option value="4">Sale</option>
								</select>
								<div id="typeTitle">類型</div>
								<select name="type" id="typeDiv">
									<option value="1">派對道具</option>
									<option value="2">桌遊</option>
									<option value="3">裝飾用品</option>
									<option value="4">票券</option>
								</select>
								<div id="priceTitle">價格</div>
								<h4 class="name title" style="color: red;">NT$
									<input type="text" name="price" value=""
										style="width: 100px;color: red;text-align: center;">
								</h4>
								<div id="countTitle">庫存</div>
								<div class="quantityBox title" style="display: flex;">
									<input id="quantityInput" type="text" name="inventory" value="">
								</div>
								<div id="statusTitle">新建後狀態</div>
								<select name="status" id="typeDiv">
									<option value="0">上架</option>
									<option value="1">下架</option>
								</select>
								<div id="descTitle">商品描述</div>
								<div class="desc title" style="margin-bottom: 20px;">
									<textarea name="desc" id="editor1" cols="54" rows="5"></textarea>
								</div>
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
								●訂購後若大量退換貨，由於已造成作業上之困擾，可能會視情況對該用戶採取拒絕交易或永久取消其資格辦理。</div>
						</div>
					</div>
				</form>
			</div>
			<!-- Footer-->

			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
				crossorigin="anonymous"></script>
			<script src="${contextRoot}/js/scripts-backend.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
			<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
			<script src="${contextRoot}/js/jquery-3.6.1.min.js"></script>
			<!-- 結帳單裡面的js元素 -->
			<script>
				CKEDITOR.replace('editor1');

				// 新增商品時轉換圖片的方式
				let img = document.getElementById('file-input');
				img.addEventListener('change', function (e) {
					let file = this.files[0]
					let reader = new FileReader()
					// 轉換成 DataURL
					reader.readAsDataURL(file)
					let pimg = document.getElementById('p_img');
					let preview = document.getElementById('preview');
					reader.onload = function (e) {
						preview.src = this.result;
						pimg.value = this.result
					}
				})

			</script>
		</body>

		</html>