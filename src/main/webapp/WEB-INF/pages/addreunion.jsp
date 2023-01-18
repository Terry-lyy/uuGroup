<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <meta name="description" content=""> -->
<!-- <meta name="author" -->
<!-- 	content="Mark Otto, Jacob Thornton, and Bootstrap contributors"> -->
<!-- <meta name="generator" content="Hugo 0.88.1"> -->
<title>新增聚會</title>


<%--     <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" media="screen"> --%>
<link href="${contextRoot}/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<link id="style-switch" rel="stylesheet" type="text/css"
	href="${contextRoot}/css/style.css">
</head>


<!-- CSS only -->
<!-- <link -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" -->
<!-- 	rel="stylesheet" -->
<!-- 	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" -->
<!-- 	crossorigin="anonymous"> -->
<!-- <link rel="canonical" -->
<!-- 	href="https://bootstrap5.hexschool.com/docs/5.1/examples/checkout/"> -->



<!-- Bootstrap core CSS -->
<!-- <link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" -->
<!-- 	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" -->
<!-- 	crossorigin="anonymous"> -->

<!-- <!-- Favicons -->
-->
<!-- <link rel="apple-touch-icon" -->
<!-- 	/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180"> -->
<!-- <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" -->
<!-- 	sizes="32x32" type="image/png"> -->
<!-- <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" -->
<!-- 	sizes="16x16" type="image/png"> -->
<!-- <link rel="manifest" href=" href="/docs/5.1/assets/img/favicons/manifest.json"> -->
<!-- <link rel="mask-icon" -->
<!-- 	href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" -->
<!-- 	color="#7952b3"> -->
<!-- <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico"> -->
<!-- <meta name="theme-color" content="#7952b3"> -->


<!-- <style> -->
/* .bd-placeholder-img { */ /* font-size: 1.125rem; */ /* text-anchor:
middle; */ /* -webkit-user-select: none; */ /* -moz-user-select: none;
*/ /* user-select: none; */ /* } */ /* @media ( min-width : 768px) { */
/* .bd-placeholder-img-lg { */ /* font-size: 3.5rem; */ /* } */ /* } */
<!-- </style> -->


Custom styles for this template
<link href="form-validation.css" rel="stylesheet">


<body>
	<header>
		<jsp:include page="/WEB-INF/layout/navbar.jsp" />
	</header>

	<main>
		<div class="container text-center">

			<div class="row g-5 text-center">

				<div class="col-md-7 col-lg-8 ">
					<div class="py-5 text-center">
						<img class="d-block mx-auto mb-4" src="" alt="" width="" height="">
						<h2>新增聚會</h2>

					</div>
					<button  class="btn btn-outline-light fastLogin3" type="submit">快速輸入</button>
					<form action="${contextRoot}/insertReunion" method="post"
						class="needs-validation " novalidate>
						
						
						
						<div class="row g-3">



							<div class="input-group mb-3 ">
								<input type="file" class="form-control " id="inputGroupFile02">

								<label class="input-group-text" for="inputGroupFile02">Upload</label>
								<br> <input type="hidden" value="" name="picture"
									id="p_img">
							</div>

							<div class="col-12">
								<label for="address" class="form-label"style="float:left">聚會主題</label> <input
									type="text" class="form-control" id="topic" name="topic"
									placeholder="請填寫聚會主題" required>
								<div class="invalid-feedback">請輸入主題</div>
							</div>




							<div class="col-12">
								<label for="address" class="form-label" style="float:left">聚會內容</label>
								<div class="control ">
									<textarea class="textarea form-control" placeholder="請填寫聚會描述"
									id="content"	name="content"></textarea>
								</div>

								<div class="invalid-feedback">請輸入內容</div>
							</div>



							<div class="col-12">
								<label for="address" class="form-label" style="float:left">聚會地點</label> <input
									type="text" class="form-control" id="place"
									placeholder="搜尋聚會地點" required name="place">
								<div class="invalid-feedback">請輸入地點</div>
							</div>



							<div class="control-group">
								<label for="address" class="form-label" style="float:left">聚會時間</label>
								<div class="controls  date form_datetime"
									data-date="2023-01-13T05:25:07Z"
									data-date-format="yyyy MM dd- HH:ii p"
									data-link-field="dtp_input1">
									<input size="16" type="text" value="" name="holdTime" id="holdTime"
										class="form-control"> <span class="add-on"><i
										class="icon-remove"></i></span> <span class="add-on"><i
										class="icon-th"></i></span>
								</div>
								<input type="hidden" id="dtp_input1" value="" /><br />
							</div>


						



							<div class="v">
								<label for="address" class="form-label" style="float:left">報名人數</label> <input
									type="text" class="form-control" id="people"
									placeholder="請輸入人數" required name="people">
								<div class="invalid-feedback">請輸入報名人數</div>
							</div>


							<div class="col-12">
								<label for="address" class="form-label" style="float:left">聚會類型</label> <select
									type="text" class="form-control" id="activity" autocomplete="off"
									name="activity">

									<option value="none" selected disabled hidden>請選擇選項</option>
									<option value="1">影音展演</option>
									<option value="2">遊戲卡牌</option>
									<option value="3">旅行出遊</option>
									<option value="4">運動健身</option>
									<option value="5">美食美酒</option>
									<option value="6">唱歌派對</option>
									<option value="7">其他</option>
								</select>
								<div class="invalid-feedback" >請輸入類型</div>
							</div>





							<div class="col-12">
								<label for="address" class="form-label" style="float:left">付款方式</label> <select
									type="text" class="form-control" id="payment" autocomplete="off"
									name="payment">

									<option value="none" selected disabled hidden>請選擇付款方式</option>
									<option value="1">各付各的</option>
									<option value="2">我請客</option>
									<option value="3">你買單</option>
								</select>
								<div class="invalid-feedback">請選擇付款方式</div>
							</div>



							<div class="col-12">
								<label for="address" class="form-label" style="float:left">用餐預算</label> <input
									type="text" class="form-control" id="budget" placeholder=""
									required name="budget">
								<div class="invalid-feedback">請輸入預算</div>
							</div>

               <div class="col-12">              

							<button
								class="btn btn-outline-secondary " style="width:100% "
								type="submit" onclick="return confirm('確定')">確定</button>

</div>
						</div>
					</form>

				</div>
			</div>
		</div>
	</main>




	<!-- Bootstrap core JS-->

	<script type="text/javascript"
		src="${contextRoot}/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript"
		src="${contextRoot}/js/locales/bootstrap-datetimepicker.zh-TW.js"
		charset="UTF-8"></script>
	<script type="text/javascript">
		-->
		$('.form_datetime').datetimepicker({
			language : 'zh-TW',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			forceParse : 0,
			showMeridian : 1
		});
		$('.form_date').datetimepicker({
			language : 'zh-TW',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0
		});
		$('.form_time').datetimepicker({
			language : 'zh-TW',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 1,
			minView : 0,
			maxView : 1,
			forceParse : 0
		});
		
		$(".fastLogin3").click(function () {
			$("#topic").val("看電影");
			$("#content").val("教練，我想打籃球！");
			$("#place").val("新莊晶冠國賓影城");
			$("#holdTime").val("2023 一月 13- 07:00 下午");
			$("#people").val("2");
			$("#activity").val("1");
			$("#payment").val("1");
			$("#budget").val("300");
			
		});
	</script>

	<script type="text/javascript">
		// 新增商品時轉換圖片的方式
		let img = document.getElementById('inputGroupFile02');
		img.addEventListener('change', function(e) {
			let file = this.files[0]
			let reader = new FileReader()
			// 轉換成 DataURL
			reader.readAsDataURL(file)
			let pimg = document.getElementById('p_img');
			reader.onload = function(e) {
				console.log(e);
				pimg.value = this.result
			}
		})
		
		
		
		
	</script>
	<footer>
		<jsp:include page="/WEB-INF/layout/footer.jsp" />
	</footer>

</body>

</html>