function addProductDetails() {
	alert("Hillllllll");
	var projectId = $('#projectId').val();
	var productCode = $('#productCode').val();
	var productName = $("#productName").val();
	var unit = $('#unit').val();
	var quantity = $('#quantity').val();
	var count = $('#tbodyId').children('tr').length + 1;

	var newRow = "<tr><td>" + count + "</td><td>" + projectId + "</td><td>"
				+ productCode + "</td><td>" + productName + "</td><td>" + unit+"</td><td>"+quantity
				+ "</td><td><a href=# onClick=deleteRow(this)>Delete</a></tr>";
		$("#myTable tbody").append(newRow);

	return false;
}
function deleteRow(abc) {
	$(abc).closest("tr").remove();
	return false;
}

function fetchProductList(goid){
var innerHtml="";
 	$.getJSON('abcd/godownId/'+goid, function(data)
			{
 		
				 for(var i=0;i<data.length;i++)
          		{
					 var productModel=data[i];
					 innerHtml+="<option value="+productModel.productName+">"+productModel.productId+"</option>";
		
					 
				}
				 $("#product_list").html(innerHtml);	
			});

	/*$.ajax({
		type : "GET",
		contentType: "application/json",
        dataType: "json",
		url : "abcd.html",
		data : "godownId=" + godownId,
		async:false,
		cache:false,
		success : function(data) {
			
		},
		error : function(e) {
			alert(e);
		}
	});*/
}