 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TradeView</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script src='js/GraphScript.js'></script>
<style>
.navbar-brand {
	background-color: #3c3e42;
}
li a {
  color: white;
}

#side-nav {
	height: 91.5vh;
}

#dynamic {
	background-color: lavender;
}

.btn-circle.btn-sm {
	width: 40px;
	height: 40px;
	padding: 6px 0px;
	border-radius: 20px;
	font-size: 8px;
	text-align: center;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

		<a class="navbar-brand mr-1 bg-dark" href="${contextPath}/">Forex Platform</a>

		<button class="btn btn-link btn-sm text-white order-1 order-sm-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>

		<!-- Navbar -->
		<ul class="navbar-nav ml-auto mr-0 mr-md-3 my-2 my-md-0">
      
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i>${pageContext.request.userPrincipal.name}
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="post" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

         <a class="dropdown-item" onclick="document.forms['logoutForm'].submit()">Logout</a>
    </c:if>
        </div>
      </li>
    </ul>

	</nav>
	<!-- nav bar ended here -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2 bg-dark" id="side-nav">
				<div class="row">
					<ul class="sidebar navbar-nav" id="ul">
						<li class="nav-item active"><a class="nav-link"
							href="${contextPath}/"> <i class="fas fa-home"></i>
								<span>Dashboard</span>	</a></li>
						<li class="nav-item active"><a class="nav-link"
							href="${contextPath}/converter"> <i class="fas fa-fw fa-tachometer-alt"></i>
								<span>Converter</span>	</a></li>
						<li class="nav-item active"><a class="nav-link"
							href="${contextPath}/calculator"> <i class="fas fa-calculator mdb-gallery-view-icon"></i>
								<span>Calculator</span>	</a></li>
						<li class="nav-item active"><a class="nav-link"
							href="${contextPath}/bankExchangeRate"> <i class="fas fa-university mdb-gallery-view-icon"></i>
								<span>Bank Exchange Rate</span>	</a></li>
						<li class="nav-item active"><a class="nav-link"
							href="${contextPath}/tradeView"> <i class="fas fa-chart-line mdb-gallery-view-icon"></i>
								<span>Tradeview</span>	</a></li>
						<li class="nav-item active"><a class="nav-link"
							href="${contextPath}/newsFeed"> <i class="far fa-newspaper mdb-gallery-view-icon"></i>
								<span>Newsfeed</span>	</a></li>
						
					</ul>
				</div>
			</div>
			<!-- side nav bar completed here -->
			<div class="col" id="dynamic">
				<div class="row">
					<div class="col-lg-12"><h1>TradeView</h1></div>
					<select id="select1" class="form-control col-sm-2" name="category">
<c:forEach items="${countryList}" var="cList">
<option value="${cList}">${cList}</option></c:forEach></select>
<select id="select2" class="form-control col-sm-2" name="category">
<c:forEach items="${countryList}" var="cList">
<option value="${cList}">${cList}</option></c:forEach></select>
					<div class="jumbotron overflow-auto" style=" width:960px; height: 500px; ">
						<div id="chartContainer" ></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>