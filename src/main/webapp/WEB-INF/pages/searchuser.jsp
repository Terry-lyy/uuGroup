<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%-- <link href="${contextRoot}/js/jquery-3.6.1.min.js" rel="stylesheet" /> --%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<script src="${contextRoot}/js/taiwan_districts.js"></script>
<title>約約－搜尋會員</title>
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
	<jsp:include page="/WEB-INF/layout/navbar.jsp" />
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">搜尋會員</h1>
				<div class="card mb-4">
					<class class="card-body">
					<div class="row">

						<div class="col">
							<div id="search-search">
								找帳號:<input type="text" id="account" onchange="findMember()"><br>
								找暱稱:<input type="text" id="name" onchange="findMember()">
							</div>
						</div>

						<div class="col">
						
							<div id="search-search">
							<label for="taiwan">縣/市：</label> <select name="taiwan" id="taiwan" onchange="findMember2()">
						<option value="">請選擇</option>
					</select>
							</div>
						</div>
						<div class="col">
						
							<div id="search-search">
								<label for="coun">區/鎮/鄉：</label> <select name="coun" id="coun" onchange="findMember()">
						<option value="">請選擇</option>
					</select>
							</div>
						</div>
						<div class="col">
							性別
							<div id="status-status">
								<input type="checkbox" name="male" id="male" value="1" onchange="findMember()">男<br> 
								<input type="checkbox" name="female" id="female" value="2" onchange="findMember()">女<br>
							</div>
						</div>

					</div>
					</class>
				</div>

				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 會員列表
					</div>
					<div class="card-body container-fluid">
						<table class="table table-striped table-sm">
							<thead>
								<tr style="text-align: center;">
									<th>id</th>
									<th>帳號</th>
									<th>暱稱</th>
<!-- 									<th>出生日期</th> -->
<!-- 									<th>聯絡方式</th> -->
									<th>所在地</th>
									<th>頭像</th>
									<th>性別</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="table">
								<c:forEach var="memberContent" items="${members}">
									<tr>
										<td rowspan="1" valign="middle">${memberContent.id }</td>
										<td rowspan="1" valign="middle">${memberContent.account}</td>
										<td rowspan="1" valign="middle">${memberContent.name}</td>
<%-- 										<td rowspan="2" valign="middle"><fmt:formatDate pattern="yyyy/MM/dd" --%>
<%-- 												value="${memberContent.birth}" /></td> --%>
<%-- 										<td rowspan="1" valign="middle">手機: ${memberContent.phone }</td> --%>
										<td rowspan="1" valign="middle">${memberContent.address }</td>
										<td rowspan="1" ><img alt="" src="${memberContent.avator }"
											style="width: 130px; height: 100px;"></td>
										<c:choose>
											<c:when test="${memberContent.gender == 1}">
												<td rowspan="1" valign="middle">男</td>
											</c:when>
											<c:otherwise>
												<td rowspan="1" valign="middle">女</td>
											</c:otherwise>
										</c:choose>
										<td rowspan="1" valign="middle">
										<button onclick="window.open('http://localhost:8080/${memberContent.account}', '_blank')">看看他/她的頁面</button><br><br>
										<button >加他/她朋友</button></td>
									</tr>
<!-- 									<tr> -->
<%-- 									<td valign="middle">信箱: ${memberContent.email}</td> --%>
<!-- 									</tr> -->
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</main>
	</div>

	<script type="text/javascript">
	
		function findMember(){
			var account= $('#account').val();
			var name=$('#name').val();
			var taiwan=$('#taiwan');
			var address=taiwan.val()+$('#coun').val();
			
			
			var m= $('#male').is(':checked');
			var f= $('#female').is(':checked');
			var male=1;
			var female=2;
			if (!m){
				male=0;
			}
			if(!f){
				female=0;
			}
			if(!f&&!m){
				var male=1;
				var female=2;
			}
			console.log(address);
			let formData = new FormData();
			formData.append("male", male);
			formData.append("female", female);
			formData.append("account", account.trim());
			formData.append("name", name);
			formData.append("address", address);
			fetch("${contextRoot}/findMem", {method:"POST", body:formData}).then(result=>result.json()).then(members2=>{
				console.log(members2.length);
				var table=$('#table');
				var gender="";
				var birth="";
				var member2='';
				for(i=0;i<members2.length;i++){	
					birth = new Date(members2[i].birth).toLocaleDateString();
					if(members2[i].gender==1){
					gender='男';
				}else{
					gender='女';
				}
				member2+='<tr><td rowspan="1" valign="middle">';
				member2+=members2[i].id;
				member2+='</td><td rowspan="1" valign="middle">帳號: ';
				member2+=members2[i].account;
				member2+='</td><td rowspan="1" valign="middle">';
				member2+=members2[i].name;
				member2+='</td><td rowspan="1" valign="middle">';
				member2+=members2[i].address;
				member2+='</td><td rowspan="1" ><img alt="" src="';
				member2+=members2[i].avator;
				member2+='" style="width: 130px; height: 100px;"></td>';
				member2+='<td rowspan="1" valign="middle">';
				member2+=gender;
				member2+='</td><td rowspan="1" valign="middle"><button onclick="window.open(\'http://localhost:8080/lookCode/';
				member2+=members2[i].account;
				member2+='\', \'_blank\')">看看他/她的頁面</button><br><br><button >加他/她朋友</button></td></tr>';
				}
				table.html(member2);
			})
		}
		
		
	    data.forEach(function(value, index) {
let country = value.name
$("#taiwan").append("<option value='"+country+"'>"+country+"</option>")
});
$("#taiwan").change(function () {
let val = $(this).val();
let districts=data.find(function(item){
return item.name==val;
})
$("#coun>option").remove()

districts['districts'].forEach(function(value, index){
let area= value.name
let map = "<option value='" + area + "'>" + area + "</option>" 
$("#coun").append(map)
})
})

function findMember2() {
						var account = $('#account').val();
						var name = $('#name').val();
						var taiwan = $('#taiwan');
						var address = taiwan.val();

						var m = $('#male').is(':checked');
						var f = $('#female').is(':checked');
						var male = 1;
						var female = 2;
						if (!m) {
							male = 0;
						}
						if (!f) {
							female = 0;
						}
						if (!f && !m) {
							var male = 1;
							var female = 2;
						}
						console.log(male + "," + female)
						let formData = new FormData();
						formData.append("male", male);
						formData.append("female", female);
						formData.append("account", account.trim());
						formData.append("name", name);
						formData.append("address", address);
						fetch("${contextRoot}/findMem", { method: "POST", body: formData }).then(result => result.json()).then(members2 => {
							console.log(members2.length);
							var table = $('#table');
							var gender = "";
							var birth = "";
							var banned = "";
							var member2 = '';
							for (i = 0; i < members2.length; i++) {
								birth = new Date(members2[i].birth).toLocaleDateString();
								if (members2[i].gender == 1) {
									gender = '男';
								} else {
									gender = '女';
								}
								member2+='<tr><td rowspan="1" valign="middle">';
								member2+=members2[i].id;
								member2+='</td><td rowspan="1" valign="middle">帳號: ';
								member2+=members2[i].account;
								member2+='</td><td rowspan="1" valign="middle">';
								member2+=members2[i].name;
								member2+='</td><td rowspan="1" valign="middle">';
								member2+=members2[i].address;
								member2+='</td><td rowspan="1" ><img alt="" src="';
								member2+=members2[i].avator;
								member2+='" style="width: 130px; height: 100px;"></td>';
								member2+='<td rowspan="1" valign="middle">';
								member2+=gender;
								member2+='</td><td rowspan="1" valign="middle"><button onclick="window.open(\'http://localhost:8080/lookCode/';
								member2+=members2[i].account;
								member2+='\', \'_blank\')">看看他/她的頁面</button><br><br><button >加他/她朋友</button></td></tr>';
							}
							table.html(member2);
						})
					}
	</script>
</body>

</html>