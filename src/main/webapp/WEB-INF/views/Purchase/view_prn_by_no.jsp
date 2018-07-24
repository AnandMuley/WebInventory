

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


	<div id="page-wrapper">
		<div class="container-fluid">
			<form:form class="mws-form" id="myForm">

				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">PRN</h1>
					</div>
					<div class="col-xs-3" style="width: 50%;">
						<label>PRN No.: ${prnList[0].prnNumber}<br>
						 Project Name : ${prnList[0].projectobj.projectname}<br> 
						Date : ${prnList[0].prnDate}</label><br> 
					</div>
					<div class="col-xs-12">
						<table id="dataTable1" class="display">
							<thead>
								<tr>
									<th>Sr. No.</th>
									<th>Godown</th>
									<th>Product</th>
									<th>Quantity</th>
									<th>Unit</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${prnList}" var="prnObj"
									varStatus="theCount">
									<tr>
										<td><c:out value="${theCount.count}"></c:out></td>
										<td>${prnObj.productModel.godowanModel.addgodowanName}</td>
										<td>${prnObj.productModel.productName}</td>
										<td>${prnObj.quantity}</td>
										<td>${prnObj.unit}</td>
									</tr>
								</c:forEach>
									<!-- <tr>
						<td colspan="4"><input type="button" onClick="closePopUp();"
							value="Cancel" class="btn btn_danger" /></td>
					</tr> -->
							</tbody>
						</table>
					</div>

				</div>
				<br><br>
                 <div class="col-xs-12">
					<button type="button" id="save" name="save" class="btn btn-primary" onClick="closePopUp();">Cancel</button>
				</div>
			
			</form:form>
		</div>
	</div>
	 

<script type="text/javascript">
	$('#dataTable1').dataTable({
		"bJQueryUI" : true,
		"sPaginationType" : "full_numbers",
		"sDom" : 'T<"clear">lfrtip<"clear spacer">T'

	});
</script>

