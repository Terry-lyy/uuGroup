<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<html>

<head>
  <!--   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script> -->
    <meta charset="UTF-8">
    <title></title>
   			<style>
#table tr {
	text-align: center;
/* 	line-height: 100px; */
}

#table tr td {
 	align:center;  
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
</style>
</head>


<body>
 <header>
		<jsp:include page="/WEB-INF/layout/navbar.jsp" />
	</header>
	<div style="width:300px;height:60px;"></div>
		
			
			
    
<div id="layoutSidenav_content">
		<main>
			<div class="card mb-4">
					<div class="card-header">
						<h1 class="text-center">審核報名</h1> 
					</div>
					<c:if test="${reunion.getPeople()<=count}">
					<span style="margin-left:20px ;font-size:20px; color:red;">報名已額滿</span >
					</c:if>
					<div class="card-body container-fluid">
						<table class="table table-striped table-sm">
							<thead>
								<tr style="text-align: center;">									
									<th>暱稱</th>
									<th>出生日期</th>
									<th>聯絡方式</th>
									<th>所在地</th>
									<th>頭像</th>
									<th>性別</th>
									<th>報名</th>
								</tr>
							</thead>
							
							<tbody id="table">
								<c:forEach var="memberContent" items="${register}">
									<tr>				
										<td rowspan="2" valign="middle">${memberContent.memberTest.name}</td>
										<td rowspan="2" valign="middle"><fmt:formatDate pattern="yyyy/MM/dd"
												value="${memberContent.memberTest.birth}" /></td>
										<td rowspan="1" valign="middle">手機: ${memberContent.memberTest.phone }</td>
										<td rowspan="2" valign="middle">${memberContent.memberTest.address }</td>
										<td rowspan="2" ><img alt="" src="${memberContent.memberTest.avator }"
											style="width: 130px; height: 100px;"></td>
										<c:choose>
											<c:when test="${memberContent.memberTest.gender == 1}">
												<td rowspan="2" valign="middle">男</td>
											</c:when>
											<c:otherwise>
												<td rowspan="2" valign="middle">女</td>
											</c:otherwise>
										</c:choose>
<!-- 										<td rowspan="2" valign="middle"> <a class="btn" -->
<%-- 										onclick="return confirm('確定同意${memberContent.memberTest.name}加入? ')" --%>
<%-- 										href="/deleteReunionreport?id=${ }" --%>
<!-- 										style="color: red;">確定</a> </td> -->
										
										
<td rowspan="2" valign="middle">
<c:if test="${memberContent.review==0}">

<c:if test="${reunion.getPeople()<=count}">
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="">
  未審核
</button>
</c:if>
<c:if test="${reunion.getPeople()>count}">								<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal${memberContent.memberid}">
  審核
</button>
</c:if>
</c:if>

<c:if test="${memberContent.review==1}">										<!-- Button trigger modal -->
<button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="" id="${memberContent.memberid}">
  已同意
</button>
</c:if>

<c:if test="${memberContent.review==2}">										<!-- Button trigger modal -->
<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target=""id="${memberContent.memberid }">
  不同意
</button>
</c:if>
</td>
<!-- Modal -->
<div class="modal fade" id="exampleModal${memberContent.memberid}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        是否同意${memberContent.memberTest.name}參加聚會
      </div>
      <div class="modal-footer">
      
        <a href="${contextRoot}/notagreeRegister?id=${memberContent.reunionid}&memberid=${memberContent.memberid}"><button type="button" class="btn btn-secondary" data-bs-dismiss="modal">不同意</button></a>
        <a href="${contextRoot}/agreeRegister?id=${memberContent.reunionid}&memberid=${memberContent.memberid}"><button type="button" class="btn btn-primary">同意</button></a>
      </div>
      
     
    </div>
  </div>
</div>
																				
									</tr>
									<tr>
									
									<td valign="middle">信箱: ${memberContent.memberTest.email}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			
		</main>
	</div>
	<script>
		
	</script>
</body>
    <footer>
		<jsp:include page="/WEB-INF/layout/footer.jsp" />
	</footer>

</html>