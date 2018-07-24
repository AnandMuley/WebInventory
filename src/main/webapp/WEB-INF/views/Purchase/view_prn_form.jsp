<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <head>

    <jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
   <script>
   
   function viewPRN(prnNo) {
	   
		$.ajax({
		url : "${pageContext.request.contextPath}/addprn/viewPrnByNO",
		type : "POST",
		data : "prnNo=" + prnNo,
		success : function(data) {
			document.getElementById('light').style.display = 'block';
			document.getElementById('fade').style.display = 'block';
			$("#light").html(data);

		},
		error : function(errorThrown) {
			alert("Error: " + errorThrown);
		}
	});
}
  
   function closePopUp() {
		document.getElementById('light').style.display = 'none';
		document.getElementById('fade').style.display = 'none';
		return false;
	}
	window.onkeyup = function(e) {

		var key = e.keyCode ? e.keyCode : e.which;

		if (key == 27) {
			closePopUp();
		}
	};
   </script>   
  </head>

<body>
   <div id="page-wrapper">
           <div class="container-fluid">
               <form:form class="mws-form" id="myForm">
               
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">View PRN</h1>
                    </div>
                       <div>
						<jsp:include page="/WEB-INF/views/messagesBlock.jsp"></jsp:include>
						</div>
						
					<div class="col-xs-12">
					<table id="dataTable" class="display">
					<thead>
						<tr>
							<th>Sr. No.</th>
							<th>Project Name</th>
							<th>PRN Number</th>
							
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${prnList}" var="prnObj"
							varStatus="theCount">
							<tr>
								<td><c:out value="${theCount.count}"></c:out></td>
								<td>${prnObj.projectobj.projectname}</td>
								<td><a href="#" onClick="viewPRN('${prnObj.prnNumber}')">${prnObj.prnNumber}</a></td>
							
							</tr>
						</c:forEach>
					</tbody>
				</table>
					</div>
					
                 </div>
               
				</form:form>
			</div>
		</div>

<div id="light" class="white_content"></div>
	<div id="fade" class="black_overlay"></div>		
</body>
</html>
<script type="text/javascript">
	
	$('#dataTable').dataTable( {
	    "bJQueryUI": true,
	    "sPaginationType": "full_numbers",
	    "sDom": 'T<"clear">lfrtip<"clear spacer">T'
	   
	   } );
	
</script>

