<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
		<!DOCTYPE html>
		<html>

		<head>

			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>

		<body>

			<header>
				<jsp:include page="/WEB-INF/layout/navbar.jsp" />
			</header>
			<main>
				<div class="col-lg-8 vstack gap-4">
					<!-- Card START -->
					<div class="card">
						<div class="h-200px rounded-top"
							style="background-position: center; background-size: cover; background-repeat: no-repeat;">
						</div>
						<!-- Card body START -->
						<div class="card-body py-0">
							<div class="d-sm-flex align-items-start text-center text-sm-start">
								<div>
									<!-- Avatar -->
									<div class="avatar avatar-xxl mt-n5 mb-3">
										<img class="avatar-img rounded-circle border border-white border-3"
											src="${loginUser.avator}" alt="">
									</div>
								</div>
								<div class="ms-sm-4 mt-sm-3">
									<!-- Info -->
									<h1 class="mb-0 h5">${loginUser.name}
										<i class="bi bi-patch-check-fill text-success small"></i>
									</h1>
								</div>
								<!-- Button -->
								<div class="d-flex mt-3 justify-content-center ms-sm-auto">
									<a href="${contextRoot}/updateprofile">
										<button class="btn btn-danger-soft me-2" type="button">
											編輯資料</button>
									</a>
								</div>
							</div>
						</div>
						<!-- Card body END -->
						<div class="card-footer mt-3 pt-2 pb-0">
							<!-- Nav profile pages -->
							<ul
								class="nav nav-bottom-line align-items-center justify-content-center justify-content-md-start mb-0 border-0">
								<li class="nav-item"><a class="nav-link" onclick="getlist()" id="listbtn"> 好友列表 <span
											class="badge  bg-opacity-10 text-success small" id="friendlist">
										</span></a></li>
								<li class="nav-item"><a class="nav-link" onclick="sendinvitation()" id="sendbtn"> 已送出的邀請
										<span class="badge  bg-opacity-10 text-success small" id="sendcount">
										</span></a></li>
								<li class="nav-item"><a class="nav-link" onclick="whosend()" id="getsendbtn"> 已收到的邀請
										<span class="badge  bg-opacity-10 text-success small" id="getcount">
										</span></a></li>
								<li class="nav-item"><a class="nav-link" onclick="blocklist()" id="blockbtn"> 封鎖名單 <span
											class="badge  bg-opacity-10 text-success small" id="blockmember"></span>
									</a></li>
							</ul>
						</div>
					</div>
					<!-- Card END -->

					<!-- Card Connections START -->
					<div class="card" id="mysend">
						<!-- Card header START -->
						<!-- Card header END -->
						<!-- Card body START -->

						<!-- Connections Item -->
					</div>
					<!-- Card body END -->
				</div>
				<!-- Main content END -->
				<input id="login" value="${loginUser.id}" hidden="true" />
			</main>



			<footer>
				<jsp:include page="/WEB-INF/layout/footer.jsp" />
				<jsp:include page="/WEB-INF/layout/chat.jsp" />

			</footer>
		</body>

		<script type="text/javascript">
			var loginid = document.getElementById("login").value
			var temp = [];
			window.onload = function () {
				fetch('${contextRoot}/friendlist').then(res => res.json()).then(data => {
					temp = data;
					changeList(data)
				})
			}

			function getlist() {
				fetch('${contextRoot}/friendlist').then(res => res.json()).then(data => {
					changeList(data)
				})
			}


			function unfriendfromlist(friendid) {
				fetch('${contextRoot}/unfriendfromlist?id=' + friendid).then(res => res.json()).then(data => {
					changeList(data)
				})
			}


			function blockmemberfromlist(friendid) {
				fetch('${contextRoot}/blockmemberfromlist?id=' + friendid).then(res => res.json()).then(data => {
					changeList(data)
				})
			}


			function changeList(random) {
				document.getElementById('mysend').remove;
				let sendInvit = '';
				console.log(random);


				$.each(random, function (index, value) {
					sendInvit += ' <div class="card-body"> <div class="d-md-flex align-items-center mb-4" ><div class="avatar me-3 mb-3 mb-md-0">';
					if (value.fuid.id == loginid) {
						sendInvit += '<a href="#!"> <img class="avatar-img rounded-circle" src="' + value.userid.avator + '" alt=""> </a></div>'
						sendInvit += '<div class="w-100"> <div class="d-sm-flex align-items-start"><h3 class="mb-0"><a href="#!">' + value.userid.name + '</a></h3></div></div>';
					}
					if (value.userid.id == loginid) {
						sendInvit += '<a href="#!"> <img class="avatar-img rounded-circle" src="' + value.fuid.avator + '" alt=""> </a></div>';
						sendInvit += '<div class="w-100"> <div class="d-sm-flex align-items-start"><h6 class="mb-0"><a href="#!">' + value.fuid.name + '</a></h6></div></div>';
					}
					sendInvit += ' <div class="ms-md-auto d-flex"><button class="btn btn-danger-soft btn-sm mb-0 me-2"onclick="unfriendfromlist(' + value.friendid + ')"> 解除好友 </button>'
					sendInvit += '<button class="btn btn-primary-soft btn-sm mb-0"> 傳訊息給他 </button>'
					sendInvit += '<button class="btn btn-primary-soft btn-sm mb-0" onclick="blockmemberfromlist(' + value.friendid + ')"> 封鎖 </button>'
					sendInvit += '</div> </div></div> </div>'
				})

				console.log(sendInvit);
				document.getElementById('mysend').innerHTML = sendInvit;
				document.getElementById("listbtn").className = "nav-link active";
				document.getElementById("sendbtn").className = "nav-link";
				document.getElementById("getsendbtn").className = "nav-link";
				document.getElementById("blockbtn").className = "nav-link";
				document.getElementById('friendlist').innerHTML = random.length;
			}





			function sendinvitation() {
				fetch('${contextRoot}/sendinvitation').then(res => res.json()).then(data => {
					changeSandList(data)
				})
			}

			function unfriendfromsend(friendid) {
				fetch('${contextRoot}/unfriendfromsend?id=' + friendid).then(res => res.json()).then(data => {
					changeSandList(data)
				})
			}



			function changeSandList(random) {
				document.getElementById('mysend').remove;
				let sendInvit = '';
				console.log(random);


				$.each(random, function (index, value) {
					sendInvit += ' <div class="card-body"> <div class="d-md-flex align-items-center mb-4" ><div class="avatar me-3 mb-3 mb-md-0">';
					sendInvit += '<a href="#!"> <img class="avatar-img rounded-circle" src="' + value.fuid.avator + '" alt=""> </a></div>';
					sendInvit += '<div class="w-100"> <div class="d-sm-flex align-items-start"><h3 class="mb-0"><a href="#!">' + value.fuid.name + '</a></h3></div></div>';
					sendInvit += ' <div class="ms-md-auto d-flex"><button class="btn btn-danger-soft btn-sm mb-0 me-2" onclick="unfriendfromsend(' + value.friendid + ')">收回邀請</button>'
					sendInvit += '</div> </div></div> </div>'
				})

				console.log(sendInvit);
				document.getElementById('mysend').innerHTML = sendInvit;
				document.getElementById("sendbtn").className = "nav-link active";
				document.getElementById("getsendbtn").className = "nav-link";
				document.getElementById("listbtn").className = "nav-link";
				document.getElementById("blockbtn").className = "nav-link";
				document.getElementById('sendcount').innerHTML = random.length;
			}



			function whosend() {
				fetch('${contextRoot}/whosendinvitation').then(res => res.json()).then(data => {
					changewhosendlist(data)
				})
			}


			function unfriendfromwhosend(friendid) {
				fetch('${contextRoot}/unfriendfromwhosend?id=' + friendid).then(res => res.json()).then(data => {
					changewhosendlist(data)
				})
			}


			function agreeInvitation(fuid) {
				let formData = new FormData();
				formData.append('userId', "${loginUser.id}");
				formData.append('fuid', fuid);
				fetch("${contextRoot}/participants/friendadd", {
					method: "POST",
					body: formData

				})
				fetch('${contextRoot}/agreeInvitation?id=' + fuid).then(res => res.json()).then(data => {
					changewhosendlist(data)
				})

			}

			function changewhosendlist(random) {
				document.getElementById('mysend').remove;
				let sendInvit = '';
				console.log(random);


				$.each(random, function (index, value) {
					sendInvit += ' <div class="card-body"> <div class="d-md-flex align-items-center mb-4" ><div class="avatar me-3 mb-3 mb-md-0">';
					sendInvit += '<a href="#!"> <img class="avatar-img rounded-circle" src="' + value.userid.avator + '" alt=""> </a></div>';
					sendInvit += '<div class="w-100"> <div class="d-sm-flex align-items-start"><h3 class="mb-0"><a href="#!">' + value.userid.name + '</a></h3></div></div>';
					sendInvit += ' <div class="ms-md-auto d-flex"><button class="btn btn-danger-soft btn-sm mb-0 me-2" onclick="unfriendfromwhosend(' + value.friendid + ')"> 拒絕 </button>'
					sendInvit += '<button class="btn btn-primary-soft btn-sm mb-0" onclick="agreeInvitation(' + value.userid.id + ')"> 同意 </button>'
					sendInvit += '</div> </div></div> </div>'
				})

				console.log(sendInvit);
				document.getElementById('mysend').innerHTML = sendInvit;
				document.getElementById("getsendbtn").className = "nav-link active";
				document.getElementById("sendbtn").className = "nav-link";
				document.getElementById("listbtn").className = "nav-link";
				document.getElementById("blockbtn").className = "nav-link";
				document.getElementById('getcount').innerHTML = random.length;

			}








			function blocklist() {
				fetch('${contextRoot}/blocklist').then(res => res.json()).then(data => {
					changeblocklist(data)
				})
			}


			function unfriendfromblock(friendid) {
				fetch('${contextRoot}/unfriendfromblock?id=' + friendid).then(res => res.json()).then(data => {
					changeblocklist(data)
				})
			}

			function cancelblock(friendid) {
				fetch('${contextRoot}/cancelblock?id=' + friendid).then(res => res.json()).then(data => {
					changeblocklist(data)
				})
			}


			function changeblocklist(random) {
				document.getElementById('mysend').remove;
				let sendInvit = '';
				console.log(random);


				$.each(random, function (index, value) {
					sendInvit += ' <div class="card-body"> <div class="d-md-flex align-items-center mb-4" ><div class="avatar me-3 mb-3 mb-md-0">';
					if (value.fuid.id == loginid) {
						sendInvit += '<a href="#!"> <img class="avatar-img rounded-circle" src="' + value.userid.avator + '" alt=""> </a></div>';
						sendInvit += '<div class="w-100"> <div class="d-sm-flex align-items-start"><h3 class="mb-0"><a href="#!">' + value.userid.name + '</a></h3></div></div>';
					}
					if (value.userid.id == loginid) {
						sendInvit += '<a href="#!"> <img class="avatar-img rounded-circle" src="' + value.fuid.avator + '" alt=""> </a></div>';
						sendInvit += '<div class="w-100"> <div class="d-sm-flex align-items-start"><h6 class="mb-0"><a href="#!">' + value.fuid.name + '</a></h6></div></div>';
					}
					sendInvit += ' <div class="ms-md-auto d-flex"><button class="btn btn-danger-soft btn-sm mb-0 me-2"onclick="cancelblock(' + value.friendid + ')"> 解除封鎖 </button>'
					sendInvit += '<button class="btn btn-primary-soft btn-sm mb-0" onclick="unfriendfromblock(' + value.friendid + ')"> 刪除 </button>'
					sendInvit += '</div> </div></div> </div>'
				})

				console.log(sendInvit);
				document.getElementById('mysend').innerHTML = sendInvit;
				document.getElementById("listbtn").className = "nav-link";
				document.getElementById("sendbtn").className = "nav-link";
				document.getElementById("getsendbtn").className = "nav-link";
				document.getElementById("blockbtn").className = "nav-link active";
				document.getElementById('blockmember').innerHTML = random.length;
			}







		</script>

		</html>