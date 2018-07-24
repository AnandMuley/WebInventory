<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<jsp:include page="body.jsp"></jsp:include>

<html>


<head>

<style type="text/css">
body {
	background: #eee !important;	
}

.wrapper {	
	margin-top: 80px;
  margin-bottom: 80px;
}

.form-signin {
  max-width: 380px;
  padding: 15px 35px 45px;
  margin: 0 auto;
  background-color: #fff;
  border: 1px solid rgba(0,0,0,0.1);  

  .form-signin-heading,
	.checkbox {
	  margin-bottom: 30px;
	}

	.checkbox {
	  font-weight: normal;
	}

	.form-control {
	  position: relative;
	  font-size: 16px;
	  height: auto;
	  padding: 10px;
		@include box-sizing(border-box);

		&:focus {
		  z-index: 2;
		}
	}

	input[type="text"] {
	  margin-bottom: -1px;
	  border-bottom-left-radius: 0;
	  border-bottom-right-radius: 0;
	}

	input[type="password"] {
	  margin-bottom: 20px;
	  border-top-left-radius: 0;
	  border-top-right-radius: 0;
	}
}

</style>
</head>
	<body>
 <div class="wrapper">
    <form class="form-signin" name="f" action="<c:url value='j_spring_security_check'/>"
					method="POST">       
      <h2 class="form-signin-heading"> <strong><spring:message code="label.Login.title" /></strong></h2>
      <input type="text" class="form-control" name='j_username' placeholder=<spring:message code="label.Login.userName" /> required="required" autofocus="" /></br>
      <input type="password" class="form-control" name='j_password' placeholder=<spring:message code="label.Login.password" /> required="required"/>      
      <label class="checkbox">
        <input type="checkbox" value="remember-me" id="rememberMe" name="rememberMe"> <spring:message code="label.Login.remember"/>
      </label>
      <button class="btn btn-lg btn-primary btn-block" type="submit"><spring:message code="label.Login.button"/></button>   
    </form>
  </div>
	</body>
</html>