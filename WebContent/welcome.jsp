<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">

<html>
<head>
<title>welcome</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>
		<script src='js/DashboardScript.js'></script>
		<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
		<script src='js/GraphScript.js'></script>
<style>
.navbar-brand:hover {
  background-color: #37a1ed;
}
li a {
  color: white;
}
.td{
height: 10%;
}
.navbar-brand{
  background-color: #3c3e42;
}
#Jumbo{
  padding: 10px;
  height:250px;
  background-color:white;
}
#chartContainer{
height: 200px;
}
#side-nav{
height: 91.5vh;
}
td,th{
height:5px;
}
#dynamic{
  background-color: lavender;
}
#calFr{
height: 50px;
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

    <!-- Navbar Search -->
    <!-- <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary" type="button">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form> -->

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
			<div class="row"><div class="col-lg-10"><h2>Dashboard</h2></div><div class="col-sm-2">
				<select id="date" class="form-control" name="category">
					<c:forEach items="${uniqueDates}" var="cList"><option>${cList} </option></c:forEach>
	  			</select>
			</div></div>
			<div class="row">
			<div class="col-md-3">
			<div class="jumbotron" id="Jumbo">
  					<h4>Converter</h4>
  					<div class="row">
  					<div class="col-md-6"><select id="cons1" class="form-control" name="category"> 
      							<c:forEach items="${countryList}" var="cList">
										<option value="${cList}">${cList}</option>
									</c:forEach>
      				</select> </div>
      				<div class="col-md-6"> <select id="cons2" class="form-control" name="category"> 
      							<c:forEach items="${countryList}" var="cList">
										<option value="${cList}">${cList}</option>
									</c:forEach>
      				</select> </div>
      				</div>
      				Amount:
      				<div class="row">
      					<div class="col-lg-12"> <input id="conin1" class="col-lg-12" type="text"/> </div>
      				</div>
      				Converted to:
      				<div class="row">
      					<div class="col-lg-12"> <input id="conin2" class="col-lg-12" type="text"/> </div>
      				</div>
      				<br /><br />
			</div>
			</div>
			<div class="col-md-3">
			<div class="jumbotron" id="Jumbo">
  					<h5>Calculator</h5>
  					
  					<div class="row" id="calFr">
  						<div class="col-sm-4"><select id="cals1" class="form-control" name="category"> 
      							<c:forEach items="${countryList}" var="cList">
										<option value="${cList}">${cList}</option>
									</c:forEach>
      							</select>
      					</div><div class="col-sm-1"><div class="row"><input type="radio" name="state" value="plus" id="check1p" >+</div><div class="row"><input type="radio" name="state" id="check1m" value="minus">-</div></div>
      					<div class="col-md-6"><input id="calin1" class="col-lg-12" type="text"/></div>
  						
  					</div>
  					
  					<div class="row" id="calFr">
  						<div class="col-sm-4"><select id="cals2" class="form-control" name="category"> 
      							<c:forEach items="${countryList}" var="cList">
										<option value="${cList}">${cList}</option>
									</c:forEach>
      							</select>
      					</div><div class="col-sm-1"><div class="row"><input type="radio" name="state" value="plus" id="check2p" >+</div><div class="row"><input type="radio" name="state" id="check2m" value="minus">-</div></div>
      					<div class="col-md-6"><input id="calin2" class="col-lg-12" type="text"/></div>
  					</div>
  					equal
  					<div class="row">
  						<div class="col-sm-4"><select id="cals3" class="form-control" name="category">
      							<c:forEach items="${countryList}" var="cList">
										<option value="${cList}">${cList}</option>
									</c:forEach>
      							</select>
      					</div>=
      					<div class="col-md-7"><input id="calin3" class="col-lg-12" type="text"/></div>
  					</div>
			</div>
			</div>
				<div class="col-md-6">
				<div class="jumbotron overflow-auto" id="Jumbo">
  					<b>Bank Exchange Rate</b>
  					<div class="row">
					<div class="col-sm-3">
					<select id="select" class="form-control" name="category">
									<c:forEach items="${countryList}" var="cList">
										<option value="${cList}">${cList}</option>
									</c:forEach>
								</select>
								</div>
								</div>
					<table id="table1" class="table table-hover" style=" width:400px; " border='2px'>
						<thead>
							<tr>

								<th>Name</th>
								<th>Buy</th>
								<th>Sell</th>
								<th>Buy(Non cash)</th>
								<th>Sell(Non cash)</th>

							</tr>
						</thead>

						<tbody>
							<tr>
								<td>Amrah Bank</td>
								<td>17000</td>
								<td>17015</td>
								<td>16990</td>
								<td>17015</td>
							</tr>
						</tbody>

					</table>
				</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
				<div class="jumbotron" id="Jumbo">
  					TradeView
  					<div id="chartContainer" ></div>
 						
				</div>
				</div>
				<div class="col-md-6">
				<div class="jumbotron" id="Jumbo">
  					<h3>NewsFeed</h3>
  					<div class="jumbotron overflow-auto" id="Jumbo" style=" width:500px; height: 200px; ">
			<div class="card" style="width: 28rem;"><div class="card-body">
					<h5 class="card-title">Indian rupee falls 31 paise after Moody's lowers India’s outlook to ‘Negative’</h5>
			The rupee on Friday tumbled by 31 paise to hit an over three-week low of 71.28 against the US dollar after Moody's Investors Services cut India's rating outlook to negative citing growth concerns.
<a href="http://bit.ly/2Q3qxy5" class="btn btn-primary">Load More</a>
				</div></div>
			</div>
				</div>
				</div>
			</div>
		</div>
		</div>
</div>

</body>


</html>