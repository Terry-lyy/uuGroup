<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>navbar</title>
      <link href="${contextRoot}/css/bootstrap-icons.css" rel="stylesheet" />
      <link href="${contextRoot}/css/style.css" rel="stylesheet" />
      <style type="text/css"></style>

    </head>

    <body>
      <!-- ======================= Header START -->
      <header class="navbar-light fixed-top header-static bg-mode" style="height:70px;">

        <!-- Logo Nav START -->
        <nav class="navbar navbar-expand-lg">
          <div class="container">
            <!-- Logo START 點擊logo返回首頁-->
            <a class="navbar-brand" href="${contextRoot}/index">
              <!-- logo圖片位置 -->
              <img class="light-mode-item navbar-brand-item" src="${contextRoot}/images/uuu.jpeg">
            </a>
            <!-- Logo END -->

            <!-- Main navbar START -->
            <div class="collapse navbar-collapse" id="navbarCollapse">

              <!-- Nav Search START -->
              <div class="nav mt-3 mt-lg-0 flex-nowrap align-items-center px-4 px-lg-0">
                <div class="nav-item w-100">
                  <form class="rounded position-relative">
                    <input class="form-control ps-5 bg-light" type="search" placeholder="Search..." aria-label="Search">
                    <button class="btn bg-transparent px-2 py-0 position-absolute top-50 start-0 translate-middle-y"
                      type="submit"><i class="bi bi-search fs-5"> </i></button>
                  </form>
                </div>
              </div>
              <!-- Nav Search END -->

              <ul class="navbar-nav navbar-nav-scroll ms-auto">
                <!-- 揪團 -->
                <li class="nav-item " style="margin-right: 20px;">
                  <a class="nav-link " href="${contextRoot}/page" id="homeMenu" aria-haspopup="true"
                    aria-expanded="false">揪團</a>
                </li>
                <!-- 商城 -->
                <li class="nav-item " style="margin-right: 20px;">
                  <a class="nav-link " href="${contextRoot}/product" id="homeMenu" aria-haspopup="true"
                    aria-expanded="false">商城</a>
                </li>

              </ul>
            </div>
            <!-- Main navbar END -->

            <!-- Nav right START -->
            <ul class="nav flex-nowrap align-items-center ms-sm-3 list-unstyled">
              <li class="nav-item ms-2">

                <!-- 聊天室連結位置 -->
                <c:if test="${loginUser==null}">       
                <li class="nav-item ms-2 dropdown">
                <a class="nav-link btn icon-md p-0" id="profileDropdown" role="button" data-bs-auto-close="outside"
                  data-bs-display="static"  aria-expanded="false" href="${contextRoot}/login">
                  <!-- 預設是灰頭像，登入後改成用戶頭像 -->
                  <img class="avatar-img rounded-2" src="${contextRoot}/assets/human.png" alt=""  />
                </a>
              </li>
              </c:if>
              <c:if test="${loginUser!=null }">
                <li class="nav-item ms-2 dropdown">
                <a class="nav-link btn icon-md p-0" id="profileDropdown" role="button" data-bs-auto-close="outside"
                  data-bs-display="static"  aria-expanded="false" href="${contextRoot}/getFriendNotice">
                <span class="badge-notif animation-blink"></span>
                  
                  <!-- 預設是灰頭像，登入後改成用戶頭像 -->
                  <img class="avatar-img rounded-2" src="${contextRoot}/assets/human.png" alt="" />
                </a>
              </c:if>
                

              <!-- 登入位置 -->
					<!-- 未登入 -->
					
					<c:if test="${loginUser==null}">
              <li class="nav-item ms-2 dropdown">
                <a class="nav-link btn icon-md p-0" id="profileDropdown" role="button" data-bs-auto-close="outside"
                  data-bs-display="static" data-bs-toggle="dropdown" aria-expanded="false">
                  <!-- 預設是灰頭像，登入後改成用戶頭像 -->
                  <img class="avatar-img rounded-2" src="${contextRoot}/assets/avatar-placeholder.jpg" alt="">
                </a>
                <ul class="dropdown-menu dropdown-animation dropdown-menu-end pt-3 small me-md-n3"
                  aria-labelledby="profileDropdown">
           
                  <!-- Links -->
                  <li><a class="dropdown-item" href="${contextRoot}/signup"><i class="bi bi-gear fa-fw me-2"></i>Sign up</a></li>

              <li><a class="dropdown-item" href="${contextRoot}/login"><i class="bi bi-gear fa-fw me-2"></i>Login</a></li>

                  <li>
                    <hr class="dropdown-divider">
                  </li>

                </ul>
              </li>
              	</c:if>
              	
              			<!-- 已登入 -->
              	<c:if test="${loginUser!=null }">
              <li class="nav-item ms-2 dropdown">
                <a class="nav-link btn icon-md p-0" id="profileDropdown" role="button" data-bs-auto-close="outside"
                  data-bs-display="static" data-bs-toggle="dropdown" aria-expanded="false">
                  <!-- 預設是灰頭像，登入後改成用戶頭像 -->
                  <img class="avatar-img rounded-2" src="${loginUser.getAvator()}" alt="">
                </a>
                <ul class="dropdown-menu dropdown-animation dropdown-menu-end pt-3 small me-md-n3"
                  aria-labelledby="profileDropdown">

                  <!-- Profile info -->
                  <li class="px-3">
                    <div class="d-flex align-items-center position-relative">
                      <!-- Avatar -->
                      <div class="avatar me-3">
                        <!-- 用戶頭像 -->

                        <img class="avatar-img rounded-circle" src="${loginUser.getAvator()}" alt="avatar">
                      </div>
                      <div>
                        <!-- 用戶名稱 -->
						<a class="dropdown-item" href="${contextRoot}/showprofile">
                           <h3 class="mb-0">
                        ${loginUser.getName() }
                    </h3></a>
                      </div>
                    </div>
                  </li>
                  <!-- Links -->
                  <li>
                    <a class="dropdown-item" href="${contextRoot}/updateprofile">
                      <i class="fa-fw bi bi-card-text me-2"></i>修改我的資訊
                    </a>
                  </li>    
                      <li>
                  </li> 
                  <li> 
                    <a class="dropdown-item" href="${contextRoot}/toMyOrderPage">
                      <i class="fa-fw bi bi-card-text me-2"></i>我的訂單
                    </a>
                  </li>

                    <li>
                    <a class="dropdown-item" href="${contextRoot}/myreunion">
                      <i class="fa-fw bi bi-card-text me-2"></i>我的聚會
                    </a>
                  </li>
                  
                  <li>
                    <a class="dropdown-item" href="${contextRoot}/insertreunion">
                      <i class="fa-fw bi bi-card-text me-2"></i>新增聚會
                    </a>
                  </li>
					<c:if test="${loginUser.getAccount()=='admin' }">
					   <li>
                    <a class="dropdown-item" href="${contextRoot}/memberBackendSet">
                      <i class="fa-fw bi bi-card-text me-2"></i>前往後台
                    </a>
                  </li></c:if>
                  <!-- 登出位置，連接要放登入 -->

                  <li><a class="dropdown-item bg-danger-soft-hover" href="${contextRoot}/logout" onclick="closeWebSocket()"><i
                        class="bi bi-power fa-fw me-2"></i>登出</a></li>
                  <li>
                    <hr class="dropdown-divider">
                  </li>

                </ul>
              </li>
              	</c:if>
              	
              <!-- Profile START -->

            </ul>
            <!-- Nav right END -->
          </div>
        </nav>
        <!-- Logo Nav END -->
      </header>
      <!-- ======================= Header END -->
      <script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
      <script src="${contextRoot}/js/jquery-3.6.1.min.js"></script>
    </body>


    </html>