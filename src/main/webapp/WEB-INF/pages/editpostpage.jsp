<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

				<!DOCTYPE html>

				<html>

				<head>
					<link id="style-switch" rel="stylesheet" type="text/css"
						href="${pageContext.request.contextPath}/css/style.css">
					<meta charset="UTF-8">
					<title>更新貼文</title>
					<base href="/webapp/">

				</head>

				<body>
					<header class="navbar-light fixed-top header-static bg-mode" style="height:70px;">
						<!-- 					<a class="navbar-brand" href="/index"> -->
						<!-- 						<img class="light-mode-item navbar-brand-item" src="/assets/favicon.ico" alt="Logo"> -->
						<jsp:include page="/WEB-INF/layout/navbar.jsp" />
						</a>
					</header>


					<!-- 	<a class="navbar-brand" href="/index"> -->
					<!--               logo圖片位置 -->
					<!--               <img class="light-mode-item navbar-brand-item" src="assets/favicon.ico"> -->
					<!--             </a> -->

					<main>

						<div class="container">

							<div class="row g-4 d-flex justify-content-center align-items-center">
								<div class="col-lg-9" style="margin-top: 60px">

									<!-- Post input -->


									<form:form modelAttribute="postBean" class="form-control"
										action="${contextRoot}/editpost" method="post" enctype="multipart/form-data">
										<form:input type="hidden" path="postid" />
										<form:input type="hidden" path="posttime" />
										<form class="w-100">
											<div class="form-group">
												<div class="form-row">
													<div class="col">

													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="form-row">
													<div class="col-sm-12">
														<form action="${contextRoot}/editpost" method="post">
															<textarea name="content" class="form-control" rows="5"
																cols="80">${postBean.content}</textarea>
															<input style="color:white;" 
												             type="file" id="imgFile" name="photo" accept="image/*" />
															<img id="theImg" src="${contextRoot }/assets/preview.png" style="width: 10px; float: right;" alt="Image preview" />
															<input class="form-control bi bi-three-dots" type="submit"
																value="貼文"
																style="float:right; font-size:8px; background-color:AliceBlue;" />
														</form>
														
										</form>
									</form:form>

								</div>
							</div>
						</div>



						<div class="card card-body">
							<div class="d-flex mb-3">
								<!-- Avatar -->

								<div class="container">
									<c:forEach var="message" items="${page.content}">
										<div class="card">

											<!-- Card header START -->
											<div class="card-header border-0 pb-0">
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
																<h6 class="nav-item card-title mb-0">
																	<a
																		href="#!">&nbsp;${message.memberId.name}&nbsp;</a>
																	<div>&nbsp;&nbsp;&nbsp;
																	</div><br>
																																						</div> -->


																</h6>

															</div>
														</div>
													</div>
												</div>

											</div>
									</c:forEach>
									</div>
									</div>
									<!-- Card header END -->
									<!-- 页面HTML代码 -->

									<!-- Card body START -->
									<div class="container">

										<div class="card-body">
											${postBean.content}
											<br><br>
											<!-- Card img -->
										 
											<img alt="" src="${contextRoot}/showPicture?postId=${postBean.postid}"style="width: 100%; height: auto;">

									<%-- </c:forEach> --%>
								</div>
								<!-- Card feed item END -->
							</div>
							<!-- Card feed item START -->


							<!-- Card body END -->
						</div>
		
						<!-- Card follow START -->


					</main>

					<footer>
						<jsp:include page="/WEB-INF/layout/footer.jsp" />
					</footer>

             <script type="text/javascript">
				
				document.getElementById('imgFile').addEventListener('change', function() {
					  var reader = new FileReader();
					  reader.onload = function(e) {
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
				</script>

				</body>

				</html>