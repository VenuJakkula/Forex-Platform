<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>

      <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
      <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
      
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-show-password/1.0.3/bootstrap-show-password.min.js"></script>
  <script type="text/javascript">
     $("#password").password('toggle');
   </script>
   <style>
.fa {
  padding: 15px;
  font-size: 20px;
  width: 50px;
  text-align: center;
  text-decoration: none;
  margin: 5px 2px;
  border-radius: 100%;
}
.fa:hover {
    opacity: 0.7;
}

.fa-facebook {
  background: #3B5998;
  color: white;
}

.fa-twitter {
  background: #55ACEE;
  color: white;
}

.fa-google-plus {
  background: #dd4b39;
  color: white;
}
.vl {
  border-left: 2px solid black;
  height: 670px;
}
</style>
</head>
<body>

<div class="container">
    <div class="row">

      <div class="col-md-6">
			<br><br><br><br><br><br><br><br><br><br><br>
		<h2>Forex Platform</h2>
      </div>

      <div class="col-md-6 vl"> <br>
	<form method="post" action="${contextPath}/login" class="form-signin">
      <center><a href="${contextPath}/registration">Don't have an account</a></center>
       <br><br><br><br><br><br><br>
       <h3 align="center">Sign in to on point</h3>
       <div class="form-group ${error != null ? 'has-error' : ''}">
            <c:if test="${message!=null}"><div class="alert alert-success" role="alert"><span>${message}</span></div></c:if>
            <input name="username" type="text" class="form-control" placeholder="Username"
                   autofocus="true"/>
            <input name="password" type="password" class="form-control" placeholder="Password"/>
            <span>${error}</span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>
        </div>
		<div class="row">
		
		<a class="col-sm-6" href="#">Forgot Password?</a>
		</form>
		</div>
		<br><br><br><br>
    <center><font color="green">Sign Up or Login using social media</font></center>
    <br>
		<div class="text-center">
		<a href="#" class="fb btn">
          <i class="fa fa-facebook fa-fw"></i>
        </a>
        <a href="#" class="twitter btn">
          <i class="fa fa-twitter fa-fw"></i>
        </a>
        <a href="#" class="google btn">
          <i class="fa fa-google-plus fa-fw"></i>
        </a>
        </div>
      </div>

    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>
