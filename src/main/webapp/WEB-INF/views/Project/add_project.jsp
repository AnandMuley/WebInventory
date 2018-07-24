
<html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<head>
     <jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
         
         <spring:url value="/addproject"  var ="addprojecturl"/>
         <spring:url value="/addvat"  var ="vatDeleteurl"/></head>

</head>
<body>
  <div id="wrapper">

        <!-- Navigation -->
     

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
               <form:form class="mws-form" Commandname="addProject" name="addProjectForm" id="myForm"
						modelAttribute="addProject" action="${addprojecturl}" method="post">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Add Project</h1>
                    </div>
                    <div>
						      <jsp:include page="/WEB-INF/views/messagesBlock.jsp"></jsp:include>
						   </div>
                    <!-- /.col-lg-12 -->
					<div class="col-xs-3">
								<label>Project Name</label><input type="text"  id="projectname" name="projectname"  value="${projectlist.projectname}"  class="form-control" placeholder="Project Name">
							  </div>
							  
							<div class="col-xs-3">
										<label>Address Line1</label><input type="text"  id="addressLine1" name="addressLine1" value="${projectlist.addressLine1}"   class="form-control" placeholder="Address Line1">
										<!--<textarea rows="1" class="form-control"></textarea>-->
							</div>
							<div class="col-xs-3">
										<label>Address Line2</label><input type="text" id="addressLine2" name="addressLine2"  class="form-control" value="${projectlist.addressLine2}"   placeholder="Address Line2">
										<!--<textarea rows="1" class="form-control"></textarea>-->
							</div>
							<div class="col-xs-3">
								<label>State</label> <select id="state" name="state"
									class="form-control" onchange="getCityFromState(this.value);">
									<option value="0">---Select State---</option>
									<c:forEach items="${stateList}" var="state"
										varStatus="theCount">
										<option value="${state}">${state}</option>
									</c:forEach>
								</select>

							</div>
				<div class="col-xs-3" >
						<label>City</label>
							<select id="city" name="city"  value="${projectlist.city}"  class="form-control">
							<option value="0">---Select City---</option>
									<%-- <c:forEach items="${stateCityList}" var="stateCityList"
										varStatus="theCount">
										<option value="${cityList.cityName}">${cityList.cityName}</option>
									</c:forEach> --%>
							</select>
                </div>
					
					<div class="col-xs-3" >
								<label>Pin No.</label><input type="text" id="pinno" name="pinno" class="form-control" value="${projectlist.pinno}" placeholder="Pin No.">
				    </div>
					<div class="col-xs-3">
								<label>Phone No.</label><input type="text" id="phoneno" name="phoneno" class="form-control" value="${projectlist.phoneno}" placeholder="Phone No.">
				    </div>
					<div class="col-xs-3">
								<label>Incharge</label><input type="text"  id="Incharge" name="Incharge" class="form-control"  value="" placeholder="Incharge">
				    </div>
					<div class="col-xs-3">
								<label>Project In</label><input type="text"  id="projectIn" name="projectIn " class="form-control" value="${projectlist.projectIn}"  placeholder="Project In">
				    </div>
					<div class="col-xs-3">
								<label>Project Out</label><input type="text"  id="projectOut" name="projectOut"  class="form-control"  value="${projectlist.projectOut}" placeholder="Project Out">
				    </div>
                </div>
                <!-- /.row -->
				<br><br>

					<div class="container">
								<button type="sumbit" class="btn btn-primary">Save</button>
								<button type="sumbit" class="btn btn-info">Update</button>
					</div>
					<input type="text" id="projectId" name ="projectId" class="form-control" value="${projectlist. projectId}" style="visibility: hidden"  >
					<br><br>
					
		</form:form>
					<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Projects
                        </div>
                        <!-- /.panel-heading -->
                        <div class="col-xs-12">
					<table id="dataTable" class="display">
					<thead>
						<tr>
							<th>Sr. No.</th>
							<th>Project Name</th>
							<th>ProjectIn</th>
							<th>Project Out </th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					      <tbody>
										<%
									     int cnt = 1;
								         %>
										<c:forEach var="addprojectlist" items="${addprojectlist}">
										
										<tr class="gradeA odd" role="row">
												<td class="sorting_1"><%=cnt++ %></td>
												<td>${addprojectlist.projectname }</td>
												<td >${addprojectlist.projectIn}</td>
												<td >${addprojectlist.projectOut }</td>
													<td class="center"><a href="${addprojecturl}/${addprojectlist.projectId}?Updateproject"><img src="<%=request.getContextPath()%>/resources/images/edit-notes.png"></a></td>
												    <td class="center"> <a href="${addprojecturl}/${addprojectlist.projectId}?Deleteproject"><img src="<%=request.getContextPath()%>/resources/images/DeleteRed.png"></a></td>
											</tr>
											</c:forEach>
                                  </tbody>
				</table>
				<!-- /.panel-body -->
					</div>
							
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            </div>
			
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

</body>

</html>
<script type="text/javascript">
	
	$('#dataTable').dataTable( {
	    "bJQueryUI": true,
	    "sPaginationType": "full_numbers",
	    "sDom": 'T<"clear">lfrtip<"clear spacer">T'
	   
	   } );
	
</script>


