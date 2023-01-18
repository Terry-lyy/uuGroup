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
<title>Insert title here</title>
   <link href="${contextRoot}/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
					rel="stylesheet" />
		<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">				
<style>

</style>
</head>


<body>
	        <header>
				<jsp:include page="/WEB-INF/layout/navbar.jsp" />
			</header>
<main>
<div class="container">
 <div class="row justify-content-center">
  <div class="col-10 col-md-12">

	    <section class="py-5 text-center container">
            <div class="row py-lg-5">
                <div class="col-lg-6 col-md-8 mx-auto">
                    <h1 class="fw-light">約約</h1>
                    <p class="lead text-muted">可以免費交友及參加聚會</p>

                </div>
            </div>
       </section>
           <nav class="navbar navbar-light bg-light">
					<div class="container-fluid">
       
                         <div class="dropdown">
							<a class="btn btn-secondary dropdown-toggle" role="button" id="dropdownMenuLink"
								data-bs-toggle="dropdown" aria-expanded="false"
								style="width: 160px; border-radius: 38px; background-color: rgb(253, 171, 116); border: none;">
								進階查詢</a>
							<!-- 排序方式 -->
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink" id="innersearch">
								<li id="inner-search-type">
									<p class="dropdown-item">
										聚會類型：
										<c:forEach var="reuniontype" items="${reuniontype}">
											
												<a type="button" class="btn btn-outline-danger" href="${contextRoot }/searchByReuniontypeId?id=${reuniontype.reutid}">${reuniontype.reutype}</a>
											
										</c:forEach>
									</p>
								</li>
								<li id="inner-search-type">
									<p class="dropdown-item">
										付款方式：
										<c:forEach var="payment" items="${payment}">
											
												<a type="button" class="btn btn-outline-warning" href="${contextRoot }/searchByPaymentId?id=${payment.payid}">${payment.paytype}</a>
											
										</c:forEach>
									</p>
								</li>
						
							</ul>
						</div>
						


      <form class="d-flex" action="${contextRoot }/blurrysearchReunion" method="post">
        <input class="form-control me-2" type="search" placeholder="請輸入欲搜尋的關鍵字" aria-label="Search" name="keywords">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
</div>
</nav>


<form action="${contextRoot}/dateRange" method="post">
     <div class="control-group">
                <label for="address" class="form-label"></label>
                <div class=" input-append date form_datetime" data-date="2022-12-16T05:25:07Z" data-date-format="yyyy MM dd- HH:ii p" data-link-field="dtp_input1">
                    <input size="16" type="text" value="" name="start" class="form-control"style="width:230px;"placeholder="起始日期"  autocomplete="off"> 
                    <span class="add-on"><i class="icon-remove"></i></span>
					<span class="add-on"><i class="icon-th"></i></span>
                </div>
				<input type="hidden" id="dtp_input1" value="" /><br/>
            </div>
						

       <div class="control-group">
                <label for="address" class="form-label"></label>
                <div class=" input-append date form_datetime" data-date="2023-01-13T05:25:07Z" data-date-format="yyyy MM dd- HH:ii p" data-link-field="dtp_input1">
                    <input size="16" type="text" value="" name="end" class="form-control"style="width:230px;"placeholder="到期日期"  autocomplete="off">
                    <span class="add-on"><i class="icon-remove"></i></span>
					<span class="add-on"><i class="icon-th"></i></span>
                </div>
				<input type="hidden" id="dtp_input1" value="" /><br/>
            </div>
           
           <button type="submit" class="btn btn-outline-warning">確定</button><c:if test="${compara==0}"><span style="margin-left:20px ;font-size:20px; color:red;">起始日不能大於到期日</span ></c:if>
</form>




	<div class="container">


		</div>
		<div class="container">

			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

<!-- 				<div class="col"> -->
<!-- 					<div class="card shadow-sm"> -->
<!-- 						<img -->
<!-- 							src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHu07nG6F3K81EjL5yAZ69_oZjOPj122YRYg&usqp=CAU"  -->
<!-- 							style="max-width: 100%;  height: 400px;  "> -->

<!-- 						<div class="card-body"> -->
<!-- 							<p class="card-text">不能去泰國 就來吃泰式料理</p> -->
<!-- 							<div class="d-flex justify-content-between align-items-center"> -->
<!-- 								<div class="content" style="margin-left: 3px;"> -->
<!-- 									<div class="flex-parent"> -->
<!-- 										<p class="title is-5 is-size-6-mobile long-and-truncated" -->
<!-- 											style="width: 100%;">12/18玩了～玩了～芭比Q了#新手友善#聖誕</p> -->
<!-- 									</div> -->
<!-- 									<div class="flex-parent" style="margin-top: 4px;"> -->
<!-- 										<div class=" long-and-truncated"> -->
<!-- 											<span class="subtitle is-6 is-size-7-mobile">147漆彈主題樂園</span> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="flex-parent" style="margin-top: 4px;"> -->
<!-- 										<div class=" long-and-truncated"> -->
<!-- 											<span class="subtitle is-6 is-size-7-mobile">星期日,十二月 -->
<!-- 												18日 10:30</span> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="is-hidden-tablet" style="margin-top: 9px;"> -->
<!-- 										<div class="columns is-variable is-1 is-mobile"> -->
<!-- 											<div class="column is-3 has-text-left"> -->
<!-- 												<img loading="lazy" -->
<!-- 													src="https://cdn.eatgether.com/member/60cd09c0-af2b-4376-bbd3-7a8faf753617/avatar/8e15ac4c-85bb-437f-bc7f-7cd90277286d.jpg" -->
<!-- 													width="30" heigh="30" style="border-radius: 50px;"> -->
<!-- 											</div> -->
<!-- 											<div class="column is-9 has-text-left"> -->
<!-- 												<div class="columns is-mobile"> -->
<!-- 													<div class="column is-6"> -->
<!-- 														<div class="long-and-truncated" style="width: 80px;"> -->
<!-- 															<span class="" style=>龍</span> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 													<div class="column is-8"> -->
<!-- 														<div class="long-and-truncated" style="width: 70px;"> -->
<!-- 															<span><span class="icon"><img -->
<!-- 																	src="/static/media/popularity.d5eeb51c.svg" alt=""></span>1086</span> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->

<!-- 								</div> -->

<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
				<c:if test="${reunion!=null}">
				<c:forEach var="reunion" items="${reunion}">
				
					<div class="col">
						<div class="card shadow-sm">
						<a href="${contextRoot}/detailedreunion?id=${reunion.reunionid}">
							<img class="avatar-img" src="${reunion.picture}" style="max-width: 100% ;max-height: 100%;  height: 350px;  width:450px ">
							</a>
							<div class="card-body" >
								<p class="card-text"style="font-size:24px ;height:60px;">${reunion.topic}</p>
								<div class="">
									<div class="content" style="margin-left: 3px;">
										<div class="flex-parent">
											<p class="title is-5 is-size-6-mobile long-and-truncated"
												style="width: 100%;"></p>
										</div>
										<div class="flex-parent" style="margin-top: 4px; ">
											<div class=" long-and-truncated" style="height:50px;">
												<span class="subtitle is-6 is-size-7-mobile" >${reunion.place}</span>
											</div>
										</div>
										<div class="flex-parent" style="margin-top: 4px;">
											<div class=" long-and-truncated">
											<span class="subtitle is-6 is-size-7-mobile">${reunion.holdTime}</span>
<%-- 												<span class="subtitle is-6 is-size-7-mobile"><fmt:formatDate --%>
<%-- 														pattern="yyyy/MM/dd HH:mm EEEE" --%>
<%-- 														value="${reunion.holdTime}" /></span> --%>
											</div>

										</div>
										<div class="" style="margin-top: 9px;">
											<div class="">
												<div class="" >
													<img loading="lazy"class=""
														src="${reunion.memberTest.avator}"
														 style="width:30px ;height:30px; border-radius: 50px;"><span class="" style="margin-left:20px">${reunion.memberTest.name}</span>
												                                                                                                        
												
												
												
																<span style="float:right"><span class="icon"><img
																		src="data:image/png;base64,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" alt=""width="20" height="20"></span ><span style="margin-left:10px">${reunion.number}</span></span>
													</div>	
														
												<div class="column is-9 has-text-left">
													<div class="columns is-mobile">
<!-- 														<div class="column is-6"> -->
<!-- 															<div class="long-and-truncated" style="width: 80px;"> -->
<%-- 																<span class="" style=>${reunion.memberTest.name}</span> --%>
<!-- 															</div> -->
<!-- 														</div> -->
														<div class="column is-8">
<!-- 															<div class="long-and-truncated" style="width: 70px;"> -->
<!-- 																<span><span class="icon"><img -->
<%-- 																		src="data:image/png;base64,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" alt=""width="20" height="20"></span >${reunion.number}</span> --%>
<!-- 															</div> -->
														</div>
													</div>
												</div>
											</div>
										</div>

									</div>

								</div>
							</div>
						</div>
					</div>
					
				</c:forEach>
				</c:if>
							
</div>
</div>
</div>
</div>
</div>
</main>
		<!-- Bootstrap core JS-->
<script type="text/javascript" src="${contextRoot}/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${contextRoot}/js/locales/bootstrap-datetimepicker.zh-TW.js" charset="UTF-8"></script>
 <script type="text/javascript"> -->
    $('.form_datetime').datetimepicker({
    	language:  'zh-TW',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });
	$('.form_date').datetimepicker({
        language:  'zh-TW',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
	$('.form_time').datetimepicker({
        language:  'zh-TW',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 1,
		minView: 0,
		maxView: 1,
		forceParse: 0
    });
</script>
	<footer>
		<jsp:include page="/WEB-INF/layout/footer.jsp" />
	</footer>
	
	
</body>
</html>