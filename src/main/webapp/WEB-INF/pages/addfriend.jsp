<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Homepage - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->

</head>

<style>
/* 搜索欄格式重置 */
#img-btn, #search-btn, #text-btn {
	padding-left: 10px;
	text-decoration: none;
	border: none;
	background: transparent;
}

/* 搜索欄大小 */
#text-btn {
	width: 325px;
	outline: none;
}

/* 搜索欄位置固定 */
#search-form {
	width: 370px;
	height: 38px;
	border: 1px solid grey;
	border-radius: 5px;
	background-color: white;
	margin-bottom: 20px;
}

#search-div {
	position: relative;
}

#img-form {
	position: absolute;
	right: 285px;
	top: 7px;
}

/* 購物車位置固定 */
#shopping-cart {
	border: none;
	text-decoration: none;
	background-color: transparent;
	position: fixed;
	top: 80%;
	right: 5%;
}

/* 訂單欄位的尺寸 */
#order-list-table {
	width: 750px;
	height: 100px;
	text-align: center;
	border-collapse: collapse;
}

/* 訂單th顏色 */
#order-list-table th {
	background-color: skyblue;
}

/* 訂單圖片欄位置中 */
.modal-body #imgbox {
	display: flex;
	justify-content: center;
	margin: auto;
	width: 135px;
	height: 135px;
}

/* 訂單的圖片適應框 */
.modal-body #imgbox img {
	aspect-ratio: 4/3;
	object-fit: cover;
	width: 100%;
}

/* 去除進階搜尋底線 */
#inner-search-type #search-btn a {
	text-decoration: none;
}

#price-search-form {
	display: inline;
}

#innersearch p:focus {
	color: black;
	background-color: transparent;
}

#innersearch p:hover {
	color: black;
	background-color: transparent;
}

#innersearch button a {
	color: #212529;
}

#innersearch button a:hover {
	color: black;
	background-color: skyblue;
}

#dailyrecommand, #query {
	box-shadow: #212529 0 0 3px;
	padding: 20px;
	margin-bottom: 20px;
}

#fixLabel {
	top: 0.5rem;
	right: 0.5rem;
	box-shadow: #212529 0 0 0px;
	color: white;
	background-color: palevioletred;
	float: left;
	margin-right: 2px;
	margin-left: 2px;
	border-radius: 10px;
}
</style>

<body>
	<!-- Navigation-->
	<jsp:include page="/WEB-INF/layout/navbar.jsp"></jsp:include>
	<!-- navbar覆蓋的部分 -->
	<div class="top-div" style="margin-top: 72px;"></div>

	<main>
		<div class="container-fluid" style="width: 85%;">
			<div class="row">
				<div class="col-12"
					style="height: 400px; margin-bottom: 5px; padding: 10px;">
					<div style="height: 30px;">
						<img src="${contextRoot }/assets/matchpage.webp"
							style="height: 360px; width: 1600px;">
					</div>
				</div>
			</div>
			<div class="row">
				<!-- 左側邊欄 -->
				<div class="col-3">

					<div id="query" style="background-color: white;">
						<form id="conditions" onchange="check()">
							<h6>性別</h6>
							<div class="row" style="margin-bottom: 10px;">
								<div class="col-4">
									<input type="checkbox" name="typeCondi" value="1">男
								</div>
								<div class="col-4">
									<input type="checkbox" name="typeCondi" value="2">女
								</div>
							</div>
							<h6>興趣</h6>
							<div class="row">
								<div class="col-4">
									<input type="checkbox" name="label" value="1">唱歌
								</div>
								<div class="col-4">
									<input type="checkbox" name="label" value="2">爬山
								</div>
								<div class="col-4">
									<input type="checkbox" name="label" value="3">健身
								</div>
							</div>
							<div class="row" style="margin-bottom: 10px;">
								<div class="col-4">
									<input type="checkbox" name="label" value="4">看電影
								</div>
								<div class="col-4">
									<input type="checkbox" name="label" value="5">逛街
								</div>
								<div class="col-4">
									<input type="checkbox" name="label" value="6">露營
								</div>
							</div>
						</form>
					</div>

				</div>
				<!-- 右側商品欄 -->
				<div class="col-9">
					<div class="row">
						<div id="search-div" class="col-9">
							<!-- 搜尋表單 -->

							<!-- 以圖搜尋 -->
							<!-- <form action="" id="img-form">
											<button id="img-btn">
												<i class="bi bi-card-image"></i>
											</button>
										</form> -->
						</div>
					</div>
					<div class="col"
						style="margin-bottom: 10px; font-size: 10px; color: blue;"
						id="showCondition"></div>
					<!-- 商品欄位 -->
					<div class="row row-cols-md-3 justify-content-center" id="userDiv">


					</div>
				</div>
			</div>

		</div>

	</main>






	<!-- Footer-->
	<jsp:include page="/WEB-INF/layout/footer.jsp"></jsp:include>

	<!-- Button-trigger-modal -->


	<!-- Bootstrap core JS-->

	<!-- 結帳單裡面的js元素 -->
	<script>
					//資料暫存區
					var temp = [];


					window.onload = function () {
						fetch("${contextRoot}/getMatch").then(res => res.json()).then(data => {
							temp=data;
							changeUserItem(data)
						})}

						
					function changeUserItem(json) {
						let userData = '';
						$.each(json, function (index, value) {
							console.log(value)
							if(value.gender==1){
								userData += '<div class="col mb-5" ><div class="card h-100"  style="background-color: #97CBFF">';
							}
							if(value.gender==2){
								userData += '<div class="col mb-5"><div class="card h-100" style="background-color:#FFC9C9">';
							}
							userData += '<img class="avatar-img" src="' + value.avator+ '"style="height: 280px; width: 280px; margin: auto;">';
							userData += '<div class="card-body p-4"><div class="text-center">';
							userData += '<h5 class="fw-bolder">' + value.name + '</h5>';
							for(var i=0; i<value.userhid.length ; i++){
								userData += '<span style="font-family:Microsoft JhengHei;" id="fixLabel">'+value.userhid[i].hobbitid.type+'</span>';
							}
							userData += '</div></div> <div class="card-footer p-4 pt-0 border-top-0 bg-transparent"><div class="text-center">'
							userData += '<a class="btn btn-outline-dark" id="addBtn'+value.id+'" onclick="addNewFriend(' + value.id + ')">送出邀請</a>'
							userData += '</div></div></div ></div >'
						})
						document.getElementById('userDiv').innerHTML = userData;
					} 


					
					
				    function addNewFriend(fuid) {
				        fetch('${contextRoot}/addNewFriend?id=' + fuid).then(res => res.text()).then(text => {
				          alert(text);
				          if (text == '送出邀請成功') {
				            document.getElementById('addBtn'+fuid).innerHTML = '已送出邀請';
							$("#addBtn"+fuid).attr("disabled",true).css("pointer-events","none");
				          }

				          if (text == '您已送出邀請，等待對方回覆') {
					            document.getElementById('addBtn'+fuid).innerHTML = '等待回覆中';
					            $("#addBtn"+fuid).attr("disabled",true).css("pointer-events","none");
					          }
				          
				        })
					}
				    
				    
					function check() {
						let types = document.getElementsByName('typeCondi');
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
						fetch('${contextRoot}/findByHobbitAndGender?typeCondi=' + labelArr + '&labelCondi=' + typeArr ).then(res => res.json()).then(json => changeUserItem(json))

					}
				</script>
</body>

</html>