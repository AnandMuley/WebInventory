/*function getCityFromState(state) 	
{

	$.ajax({
		type : "POST",
		url : "getCity.html",
		data : "state=" + state,
		async:false,
		cache:false,
		success : function(response) {
			$("#city").html(response);	
		},
		error : function(e) {
			alert(e);
		}
	});
return false;
}*/


function getCityNameByState(stateName) {
	$.ajax({
		type : 'POST',
		url : contextPath+'/showCity.html',
		data : {
			stateName : stateName
		},
		async:false,
		cache:false,
		success : function(data) {
			$('#city').html(data);
		},
		error : function() {
			alert("error");
		}
	});
}