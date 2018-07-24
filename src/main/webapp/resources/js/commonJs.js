function getCityNameByState(stateName) {
	$.ajax({
		type : 'POST',
		url : 'showCity.html',
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