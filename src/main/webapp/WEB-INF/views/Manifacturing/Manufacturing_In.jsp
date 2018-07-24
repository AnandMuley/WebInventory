<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<style>
.multithings input[type='text']
{
width:90px;
}
</style>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 <head>
    <jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
         
          <spring:url value="/addsrn"  var ="addSrnurl"/>
          <spring:url value="/addcategory" var ="categoryDeleteurl"/>
          <script>
          function validate_form()
          {
        	
        	  var flag=1;
        	  var arrAvailableQty = [];
        	  var arrQty = [];
        	  var unit=[];
        	  $("#dataTable tr").each(function() {
        		  
        		  var val=$(this).find("td:first").next().next().find('input:checkbox:checked').val();
        		  var avlQuantity=parseInt($(this).find("td:first").next().next().next().next().find('input').val());
  				  var quantity=parseInt($(this).find("td:first").next().next().next().next().find('input').val()); 
  		 		
        		  if(!isNaN(val)) 
        			  {		 
        			  			if(avlQuantity<quantity)
        			  			{
        			  				alert("Insufficient Quantity");
        				  			$(this).focus();
        				  			flag=0;
        				  			  return false;
        			  			}else{
        			  				alert($(this).find("td:first").next().next().next().find('select option:selected').text());
        			  				arrAvailableQty.push($(this).find("td:first").next().next().next().next().find('input').val());
        	        		  		arrQty.push($(this).find("td:first").next().next().next().next().next().find('input').val());
        	        		  		unit.push($(this).find("td:first").next().next().next().find('select option:selected').text());		
        			  			}
        			  	}
        		});
        	 if(flag==0){
        		 return false;
        	 }
        	  var formData = $("#myForm").serialize();
        		formData += "&arrAvailableQty=" + encodeURIComponent(arrAvailableQty);
        		formData += "&arrQty=" + encodeURIComponent(arrQty); 
        		formData +="&unit="+encodeURIComponent(unit);
        		$.ajax({
        			url : "${pageContext.request.contextPath}/addMuIn",
        			type : "POST",
        			data :formData,
        			success : function(data) {
        				alert("Successfully added");
        				location.reload(true);
        			
        			},
        			error : function(xhr, ajaxOptions, thrownError) {
        				alert("err" + thrownError + xhr.responseText);

        				return false;
        			}
        		});
        	  return true;
          }
          
          </script>
          
          </head>

<body>
   <div id="page-wrapper">
           <div class="container-fluid">
               <form:form class="mws-form" id="myForm">
            
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Manufacturing IN</h1>
                    </div>
                       <div>
                          
               	<div class="row">
				<div class="col-xs-3">
						<label>Manufacturing</label>
								 <select name="manufacturingId" id="manufacturingId" class="form-control" style="width:90%;">
														    <option>--Select Manufacturing-- </option>
													<c:forEach var="addManifacturinglist" items="${addManifacturinglist}">
													    <option value="${addManifacturinglist.manufacturingId}">${addManifacturinglist.manufacturingName} </option>
													</c:forEach>
							 </select>
					    </div>
					        <div class="col-xs-3" style="width: 50%;">
							<label style="color: #0066FF; font-size: 13px;">Manufacturing
								Date</label> <input type="text" class="form-control" placeholder="Date"
								id="datepicker" name="ManufacturingDate">
							</div>
					  <div class="col-xs-3" style="width: 50%;">
							<label style="color: #0066FF; font-size: 13px;">Specification
								</label> <input type="text" class="form-control" placeholder="specification"
								id="specification" name="specification">
							</div>
				</div>
             
						<jsp:include page="/WEB-INF/views/messagesBlock.jsp"></jsp:include>
						</div>
                   
					<div class="col-xs-12 multithings" >
					<table id="dataTable" class="display">
					<thead>
						<tr>
							<th>Sr. No.</th>
							<th>Godown</th>
							<th>Product</th>
							<th>Unit</th>
							<th>Available Qty</th>
							<th>Qty</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${productList}" var="productObj"
							varStatus="theCount">
							<tr>
								<td><c:out value="${theCount.count}"></c:out></td>
								<td><input type="text" style="width:120px;" value="${productObj.godowanModel.addgodowanName}" name="godownId[]" readonly/></td>
								<td><input type="checkbox" value="${productObj.productId}" name="productId[]" /><span class="sis_form_key">${productObj.productName}</span></td>
								<td>
								<select name="unit[]" style="width:75px;" id="unit[]" class="form-control" style="width:100%;">
													   <c:if test="${fn:containsIgnoreCase(productObj.unit,'KG')}">
													    <option value="KG"><span class="sis_form_key">KG </span></option>
													    <option value="GRAM"><span class="sis_form_key">GRAM</span></option>
														</c:if>
														 <c:if test="${fn:containsIgnoreCase(productObj.unit,'BAG')}">
													    <option value="${productObj.unit}"><span class="sis_form_key">${productObj.unit} </span></option>
														</c:if>
														<c:if test="${fn:containsIgnoreCase(productObj.unit,'PIECE')}">
													    <option value="${productObj.unit}"><span class="sis_form_key">${productObj.unit} </span></option>
														</c:if>
														<c:if test="${fn:containsIgnoreCase(productObj.unit,'Liter')}">
														<option value="Liter"><span class="sis_form_key">Liter </span></option>
													    <option value="Mililiter"><span class="sis_form_key">Mililiter</span></option>
														</c:if>
														
														
														Piece
														Job
														Meter
														     Centimeter
														     Inch
														     Feet
													   Cubic Feet
													   Square Feet
							</select>
							</td>
								<td><input type="text" value="${productObj.productQuantity}" name="productAvailQty[]" readonly /></td>
								<td><input type="text" value="0" name="productQty[]" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
					</div>
					
                 </div>
                 <br><br>
                 <div class="container">
					<button type="button" id="save" name="save" class="btn btn-primary" onclick="validate_form();">Save</button>
					</div>
				</form:form>
			</div>
		</div>
				
</body>
</html>
<script type="text/javascript">
	
	$('#dataTable').dataTable( {
	    "bJQueryUI": true,
	    "sPaginationType": "full_numbers",
	    "sDom": 'T<"clear">lfrtip<"clear spacer">T'
	   
	   } );
	$("#datepicker").datepicker({
		format : 'dd-mm-yyyy'
	}).datepicker("setValue", new Date());
	
</script>