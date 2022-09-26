<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>converter</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>
		<script src="js/converterScript.js"></script>
<style>
.navbar-brand:hover {
  background-color: #37a1ed;
}

li a {
  color: white;
}
.navbar-brand{
  background-color: #3c3e42;
}
#side-nav{
height: 91.5vh;
}
#dynamic{
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

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
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
 <!-- header completed here -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2 bg-dark" id="side-nav">
				<div class="row">
					<ul class="navbar-nav" id="ul">
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
					<div class="container jumbotron">
					<h2 id="h2">Converter</h2>
					<select id="date" class="form-control" name="category">
									<c:forEach items="${uniqueDates}" var="cList">
										<option>${cList} </option>
									</c:forEach>
								</select>
						<div class="row">
							<div class="col-sm-2">
								<b>From :</b> <select id="from" class="form-control selectpicker" name="category">
									<c:forEach items="${countryList}" var="cList">
										<option>${cList} </option>
									</c:forEach>
								</select>
							</div>
							<div class="col-md-6">
								<b>Amount :</b><br>
								<input class="col-md-6" type="text" id="fromamt"/>
							</div>
							<div class="col-sm-2"></div>
						</div>

						<div class="row">
							<div class="col-sm-2">
								<b>To :</b> <select id="to1" class="form-control" name="category">
									<c:forEach items="${countryList}" var="cList">
										<option value="${cList}">${cList}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-md-6">
								<b>Amount :</b><br>
								<input id="to1amt" class="col-md-6" id="toOut" type="text" />
							</div>
							<div class="col-sm-2"></div>
						</div>

						<div class="row">
							<div class="col-sm-2">
								<b>To :</b> <select id="to2" class="form-control" name="category">
									<c:forEach items="${countryList}" var="cList">
										<option value="${cList}">${cList}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-md-6">
								<b>Amount :</b><br>
								<input id="to2amt" class="col-md-6" type="text" />
							</div>
							<div class="col-sm-2"></div>
						</div>

						<div class="row">
							<div class="col-sm-2">
								<b>To :</b> <select id="to3" class="form-control" name="category">
									<c:forEach items="${countryList}" var="cList">
										<option value="${cList}">${cList}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-md-6">
								<b>Amount :</b><br>
								<input id="to3amt" class="col-md-6" type="text" />
							</div>
							<div class="col-sm-2"></div>
						</div>

					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>