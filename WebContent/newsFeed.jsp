<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NewsFeed</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>
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
			<div class="row"><div class="col-sm-1"></div><h1>News Feed</h1></div>
			<div class="jumbotron overflow-auto" style=" width:1060px; height: 525px; ">
				<div class="card" style="width: 60rem;"><div class="card-body">
					<h3 class="card-title">Indian rupee falls 31 paise after Moody's lowers India’s outlook to ‘Negative’</h3>
<h5>At the interbank foreign exchange, the Indian currency opened lower at 71.26 and fell further to 71.33 to 
the US dollar. It finally settled at 71.28 a dollar, a dip of 31 paise over its previous close.</h5>
			The rupee on Friday tumbled by 31 paise to hit an over three-week low of 71.28 against the US dollar after Moody's Investors Services cut India's rating outlook to negative citing growth concerns.

Moody's has changed the outlook on the country's ratings to 'negative' from 'stable', saying there was increasing risks that economic growth will remain materially lower than the past.

At the interbank foreign exchange, the Indian currency opened lower at 71.26 and fell further to 71.33 to the US dollar. It finally settled at 71.28 a dollar, a dip of 31 paise over its previous close.

This was the lowest closing level for the Indian unit since October 16.
<a href="http://bit.ly/2Q3qxy5" class="btn btn-primary">Load More</a>
				</div></div>
				<div class="card" style="width: 60rem;"><div class="card-body">
					<h3 class="card-title">EURINR is expected to trade appreciate: Angel Broking</h3>
<h5>According to Angel Broking, EURUSD depreciated by 0.35 percent yesterday while EURINR depreciated by 0.13 percent the same time frame.</h5>
EURUSD depreciated by 0.35 percent yesterday while EURINR depreciated by 0.13 percent the same time frame. German economic sentiment 
came in at -22.8 for Sep’19 against market expectations of -27. CPI data from EU came in line with market expectations at 0.7 percent
for Oct’19. EU GDP data came in at 0.2 percent against market expectations of 0.1 percent.
<a href="http://bit.ly/2NUWm9L" class="btn btn-primary">Load More</a>
				</div></div>
			</div>
		</div>
		</div>
</div>
</body>
</html>