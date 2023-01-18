<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">


<<<<<<< HEAD
      <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
					rel="stylesheet" />
						<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">		
					
				</head>
=======
</head>
>>>>>>> origin/master

<title>約約</title>
<style type="text/css">
.box {
	width: 100px;
	height: 50px;
	margin: auto;
	/*區塊置中*/
}

p {
	text-align: center;
	line-height: 50px;
	/*與包著的區塊設定同高度即可*/
}

a {
	text-align: center;
	line-height: 50px;
	/*與包著的區塊設定同高度即可*/
}
</style>


<body>
	<header>
		<jsp:include page="/WEB-INF/layout/navbar.jsp" />
	</header>
	<main>
		<div class="container">
			<div class="row g-4">
				<div class="col-lg-9" style="margin-top: 60px">
					<div class="card card-body">
						<div class="d-flex mb-3">
							<!-- Avatar -->
							<c:if test="${message.memberId.id ==loginUser.id}">
								<div class="avatar avatar-xs me-2">

									<a href="#"> <img class="avatar-img rounded-circle"
										src="${contextRoot}/assets/avatar-placeholder.jpg" alt="">
									</a>
								</div>
							</c:if>
							<c:if test="${message.memberId.id !=loginUser.id}">
								<div class="avatar avatar-xs me-2">

									<a href="#"> <img class="avatar-img rounded-circle"
										src="${loginUser.avator}" alt="">
									</a>
								</div>
							</c:if>


							<!-- Post input -->
							<form:form modelAttribute="postBean" action="${contextRoot}/post"
								method="post" enctype="multipart/form-data">
								<textarea name="content" class="form-control pe-4 border-0"
									rows="3" cols="100" data-autoresize placeholder="你在想什麼"></textarea>
								<c:if test="${message.memberId.id ==loginUser.id}">

								</c:if>
								<c:if test="${message.memberId.id !=loginUser.id}">
									<img src="${contextRoot}/assets/preview.png"
										style="width: 30px;" id="file-img" alt="Image preview" />
									<input style="display: none;" type="file" id="imgFile"
										name="photo" accept="image/*" />
								</c:if>

								<c:if test="${loginUser !=null}">
									<img id="theImg" src="assets/gallery.png"
										style="width: 10px; color: white;" alt="Image preview" />
									<input type="submit" class="bi bi-three-dots" value="貼文"
										style="float: right; border: 2px blue none; background-color: AliceBlue;" />
								</c:if>

								<c:if test="${loginUser ==null}">

									<a type="submit"
										style="float: right; border: 2px blue none; background-color: AliceBlue;"
										href="/login">請先登入</a>
								</c:if>

							</form:form>
						</div>
						<!-- Share feed toolbar START -->

						<!-- Share feed toolbar END -->
					</div>
					<!-- Share feed END -->
					<!-- Card feed item START -->
					<div class="container">
						<c:forEach var="message" items="${page.content}">
							<div class="card">
								<!-- Card header START -->

								<div class="card-header border-0 pb-0 ">
									<c:if test="${message.memberId.id ==loginUser.id}">
										<div style="text-align: right;">
											<a onclick="return confirm('確認刪除嗎?')"
												href="${contextRoot}/deletepost?postid=${message.postid}"
												style="width: 50px; float: right; border: 2px blue none;">刪除</a>
											<a href="${contextRoot}/edit/${message.postid}"
												style="width: 50px; float: right; border: 2px blue none;">編輯</a>

										</div>
									</c:if>

									<c:if test="${message.memberId.id !=loginUser.id}">
										<div
											style="text-align: right; width: 50px; float: right; border: 2px">

											<font face="fantasy">GREAT POST</font>

										</div>
									</c:if>
									<div class="d-flex align-items-center justify-content-between">
										<div class="d-flex align-items-center">
											<!-- Avatar -->
											<div class="avatar">
												<a href="#!"> <img class="avatar-img rounded-circle"
													src="${ message.memberId.avator}" alt="">
												</a>
											</div>
											<!-- Info -->
											<div>
												<div class="nav nav-divider">
													<div class="nav-item card-title mb-0">
														<a href="#!">&nbsp;${message.memberId.name} &nbsp;</a>
														<div>&nbsp;&nbsp;&nbsp;</div>
														<br>
														<div
															style="font-size: 12px; text-align: right; background: AliceBlue;">
															Time
															<fmt:formatDate pattern="yyy/MM/dd HH:mm:ss EEEE"
																value="${message.posttime}" />

														</div>

													</div>

												</div>
											</div>
										</div>

									</div>

								</div>
								<!-- Card header END -->
								<!-- Card body START -->


								<div class="card card-body mb-4 "
									style="background-color: AliceBlue;">
									<!-- 發文的內容 -->
									<!-- ${postHtml} -->
									${message.content} <br> <br>
									<!-- Card img -->

									<img class="card-img" style="width: 100%; height: auto;"
										src="${contextRoot}/showPicture?postId=${message.postid}"
										alt="貼照片的地方">

									<!--FEED REACT START -->
									<ul class="nav nav-stack py-3 small" style="padding: 1px 1px">
										<c:if test="${loginUser ==null}">
											<li class="nav-item">
												<button class="btn btn-primary like-button"
													style="background-color: transparent; width: 50%; border: none"
													data-post-id="123">
													<img
														src="https://img.icons8.com/arcade/64/null/filled-like.png" />
												</button> <span id="likeCount${message.postid}">${message.likepostList[0].count}
											</span>
											</li>
										</c:if>

										<c:if test="${loginUser !=null}">
											<li class="nav-item">
												<button id="likeButton${message.postid}"
													onclick="sendAjaxRequest(${message.postid})"
													class="btn btn-primary like-button"
													style="background-color: transparent; width: 50%; border: none"
													data-post-id="123">
													<img
														src="https://img.icons8.com/arcade/64/null/filled-like.png" />
												</button> <span id="likeCount${message.postid}">${message.likepostList[0].count}
											</span>
											</li>
										</c:if>
									</ul>
									<!-- Feed react END -->

									<!-- Add comment -->
									<div class="d-flex mb-3">
										<!-- Avatar -->
										<c:if test="${loginUser ==null}">
											<div class="avatar avatar-xs me-2">
												<a href="#!"> <img class="avatar-img rounded-circle"
													src="${contextRoot}/assets/avatar-placeholder.jpg" alt="">
												</a>
											</div>
										</c:if>

										<c:if test="${loginUser !=null}">
											<div class="avatar avatar-xs me-2">
												<a href="#!"> <img class="avatar-img rounded-circle"
													src="${loginUser.avator}" alt="">
												</a>
											</div>
										</c:if>
										<!-- Comment box  -->
										<form class="w-100" action="${contextRoot}/addComment"
											method="post">
											<textarea name="comment" data-autoresize
												class="form-control pe-4 bg-light" rows="1"
												placeholder="留言區"></textarea>


											<c:if test="${loginUser ==null}">
												<input type="hidden" name="postId" value="${message.postid}">
												<a type="submit" style="float: left"
													;
																	class="btn btn-primary mt-2"
													href="/login">請先登入</a>
											</c:if>

											<c:if test="${loginUser !=null}">
												<input type="hidden" name="postId" value="${message.postid}">
												<button type="submit" class="btn btn-primary mt-2">送出留言</button>
											</c:if>


										</form>
									</div>


									<!-- Comment wrap START -->


									<ul class="comment-wrap list-unstyled">
										<!-- Comment item START -->
										<c:forEach var="comment" items="${message.commentList}">

											<li class="comment-item" id="comment-${comment.commentid}">
												<div class="d-flex position-relative"
													id='commentuser${comment.commentid}'>
													<!-- Avatar -->
													<div class="avatar avatar-xs">
														<a href="#!"><img class="avatar-img rounded-circle"
															src="${comment.memberId.avator}" alt=""></a>
													</div>
													<div class="d-flex mb-3">



														<!-- Comment by -->
														<c:if test="${comment.memberId.id ==loginUser.id}">
															<div class="bg-light rounded-start-top-0 p-1 rounded">

																<div class="mb-1" style="vertical-align: top;">
																	<a href="#!"> ${comment.memberId.name} </a> <small
																		class="ms-2"> ${comment.commenttime}</small> <img
																		src="${contextRoot}/assets/delete.png"
																		class="delete-comment" data-id="" alt="delete"
																		style="cursor: pointer; width: 3%;"
																		onclick="deletecomment(${comment.commentid})"> <br>
																	${comment.comments}
																	<!-- <p class="small mb-0"
			style="text-align: left;">
			${comment.comments }
		   </p> -->
																</div>
															</div>
															<!-- Comment react -->
														</c:if>

														<c:if test="${comment.memberId.id !=loginUser.id}">
															<div class="bg-light rounded-start-top-0 p-1 rounded">

																<div class="mb-1" style="vertical-align: top;">
																	<a href="#!"> ${comment.memberId.name} </a> <small
																		class="ms-2"> ${comment.commenttime}</small><br>
																	${comment.comments}
																	<!-- <p class="small mb-0"
			style="text-align: left;">
			${comment.comments}
		   </p> -->
																</div>
															</div>
															<!-- Comment react -->
														</c:if>

													</div>
												</div> <!-- Comment item nested START -->
											</li>

										</c:forEach>
									</ul>
								</div>

							</div>
						</c:forEach>
					</div>
					<!-- Card feed item END -->
				</div>


				<!-- Right sidebar START -->
				<div class="col-lg-3">
					<div class="row g-4">
						<!-- Card follow START -->
						<div class="col-sm-6 col-lg-12" style="margin-top: 60px">
							<div class="card">
								<!-- Card header START -->
								<div class="card-header pb-0 border-0">
									<h5 class="card-title mb-0">推薦好友</h5>
								</div>
								<!-- Card header END -->
								<!-- Card body START -->
								<div class="card-body" id="onefriend">
									<div>
										<a role="button" data-bs-auto-close="outside"> <img
											class="avatar-img" src="${random.avator}"
											style="height: 280px; width: 280px; margin: auto;">
										</a>
									</div>
									<c:if test="${random.gender==1 }">
										<a>${random.address},男</a>
									</c:if>
									<c:if test="${random.gender==2 }">
										<a>${random.address},女</a>
									</c:if>

									<div class="box">
										<p style="font-size: 30px;">${random.name }</p>
									</div>
									<div style="text-align: center;">
										<a class="btn btn-outline-dark" onclick="changeone()">換一個</a>
										<c:if test="${loginUser ==null}">
											<a class="btn btn-outline-dark" href="${contextRoot}/login"
												id="addBtn">請先登入</a>
										</c:if>
										<c:if test="${loginUser !=null}">
											<a class="btn btn-outline-dark" id="addBtn"
												onclick="addNewFriend(${random.id})"> 送出邀請</a>
										</c:if>

									</div>
								</div>

								<!-- Connection item END -->
								<c:if test="${loginUser ==null}">
									<div class="d-grid mt-3">	
									<a class="btn btn-sm btn-primary-soft"
											href="${contextRoot}/login" style="font-size: 20px;">更多推薦</a>
									</div>
								</c:if>
								<c:if test="${loginUser !=null}">
									<div class="d-grid mt-3">
										<a class="btn btn-sm btn-primary-soft"
											href="${contextRoot}/addfriend" style="font-size: 20px;">更多推薦</a>
									</div>
								</c:if>
							</div>
							<!-- Card body END -->
						</div>
					</div>
					<!-- Card follow START -->

				</div>
			</div>
		</div>
	</main>




	<footer>
		<jsp:include page="/WEB-INF/layout/footer.jsp" />
		<jsp:include page="/WEB-INF/layout/chat.jsp" />
		<jsp:include page="/WEB-INF/pages/game.jsp" />

	</footer>
</body>
<script type="text/javascript">


					function deletecomment(postid) {
						fetch('${contextRoot}/deleteComment?id=' + postid).then(res => res.text()).then(text => {
							alert(text);
							document.getElementById('commentuser' + postid).innerHTML = '';
						})
					}


					$(document).ready(function () {
						$('#file-img').click(function () {
							$('#imgFile').click();
						});

					});


					// $(document).ready(function () {
					// 	// 為按讚按鈕綁定 click 事件
					// 	// $('.like-button' + ).on('click', function () {
					// 	// 	// 取得按讚按鈕的 postId
					// 	// 	var postId = $(this).data('post-id');
					// 	// 	// 送出 AJAX 請求
					// 	// 	sendAjaxRequest(postId);
					// 	// });
					// 	// 在頁面載入時讀取儲存的按讚數
					// 	// var likeCount = localStorage.getItem("likeCount");
					// 	// if (likeCount) {
					// 	// 	$('#likeCount').text(likeCount);
					// 	// }

					// 	// 在頁面載入時判斷當前的 postId 是否有按讚數，若有則更新按讚按鈕的顯示
					// 	// var postId = $('#likeButton').data('post-id');
					// 	// if (localStorage.getItem("postId_" + postId)) {
					// 	// 	var count = localStorage.getItem("postId_" + postId);
					// 	// 	$('#likeButton').text(count + ' 按讚');
					// 	// }

					// 	function sendAjaxRequest(postId) {
					// 		// 送出請求的 URL
					// 		var url = "${contextRoot}/plusLike";
					// 		// 請求的參數，這裡是 postId
					// 		var data = {
					// 			postId: postId
					// 		};
					// 		// 使用 $.ajax() 方法發送請求
					// 		$.ajax({
					// 			type: "POST",
					// 			url: url,
					// 			data: data,
					// 			success: function (response) {
					// 				// 請求成功後的回應
					// 				// 在這裡你可以使用 JavaScript 更新頁面上的按讚數
					// 				console.log(response);
					// 				// 使用 response.count 更新按讚數

					// 				$('#likeCount').text(response.count + '個喜翻');

					// 				// // 使用 localStorage.setItem() 方法將按讚數值儲存到本地
					// 				// localStorage.setItem("likeCount", response.count);

					// 				// // 將 postId 和按讚數值儲存到本地
					// 				// localStorage.setItem("postId_" + postId, response.count);


					// 			}
					// 		});
					// 	}
					// });
					function sendAjaxRequest(postId) {
						// 送出請求的 URL
						var url = "${contextRoot}/plusLike";
						// 請求的參數，這裡是 postId
						var data = {
							postId: postId
						};
						// 使用 $.ajax() 方法發送請求
						$.ajax({
							type: "POST",
							url: url,
							data: data,
							success: function (response) {
								// 請求成功後的回應
								// 在這裡你可以使用 JavaScript 更新頁面上的按讚數
								console.log(response);
								// 使用 response.count 更新按讚數


								$('#likeCount' + postId).text(response.count + '個喜翻');



								// // 使用 localStorage.setItem() 方法將按讚數值儲存到本地
								// localStorage.setItem("likeCount", response.count);

								// // 將 postId 和按讚數值儲存到本地
								// localStorage.setItem("postId_" + postId, response.count);

							}
						});

						var likeCount = localStorage.getItem("likeCount" + postId);
						if (likeCount) {
							$('#likeCount').text(likeCount);
						}
					}


					document.getElementById('imgFile').addEventListener('change', function () {
						var reader = new FileReader();
						reader.onload = function (e) {
							document.getElementById('theImg').src = e.target.result;
							document.getElementById('theImg').style.width = "300px";

						}
						reader.readAsDataURL(this.files[0]);
					});


					const imgFile = document.getElementById("imgFile");
					const theImg = document.getElementById("theImg");

					imgFile.addEventListener("change", function () {

						let previewSRC = URL.createObjectURL(this.files[0]);
						theImg.src = previewSRC;

					})

					function changeone() {
						fetch('${contextRoot}/newfriend')
							.then(function (response) {
								return response.json();
							})
							.then(
								function (random) {
									document.getElementById('onefriend').remove;
									let changefriend = '';
									changefriend += '<div> <a role="button" data-bs-auto-close="outside"><img class="avatar-img" src="' + random.avator + '"'
									changefriend += 'style="height: 280px; width: 280px; margin: auto;"></a></div>'
									if (random.gender == 1) {
										changefriend += '<a>' + random.address
											+ ',男</a>'
									}
									if (random.gender == 2) {
										changefriend += '<a>' + random.address
											+ ',女</a>'
									}
									changefriend += '<div class="box"><p style="font-size: 30px;">'
										+ random.name + '</p></div>'
									changefriend += '<div style="text-align: center;"><a class="btn btn-outline-dark" onclick="changeone()">換一個'
									changefriend += '</a><a class="btn btn-outline-dark" id="addBtn" onclick="addNewFriend(' + random.id + ')">送出邀請</a></div></div>'
									document.getElementById('onefriend').innerHTML = changefriend;

								})
					}

					function addNewFriend(fuid) {
						fetch('${contextRoot}/addNewFriend?id=' + fuid).then(res => res.text()).then(text => {
							alert(text);
							if (text == '送出邀請成功') {
								document.getElementById('addBtn').innerHTML = '已送出邀請';
								document.getElementById("addBtn").disabled = true;
							}
							if (text == '您已送出邀請，等待對方回覆') {
								document.getElementById('addBtn').innerHTML = '等待回覆中';
								$("#addBtn").attr("disabled", true).css("pointer-events", "none");
							}
						})
					}
				</script>

</html>