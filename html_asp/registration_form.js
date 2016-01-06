function registeration_details() {
    var fname = $('#fname').val();
	var lname = $('#lname').val();
	var user_id = $('#user_id').val();
	var password = $('#password').val();
   
	$.ajax({
		url  : "/cgi-bin/index.cgi",
		type : 'POST',
		data : {
			'action'   : 'register_user',
			'fname'	   : fname,
			'lname'    : lname,
			'user_id'  : user_id,
			'password' : password
		},
		success : function(data){
			alert(data);
		}
	});	
}

function sign_in() {
	var user_id = $('#username').val();
	var password = $('#password').val();
   
	$.ajax({
		url  : "/cgi-bin/index.cgi",
		type : 'POST',
		data : {
			'action'   : 'user_sign_in',
			'user_id'  : user_id,
			'password' : password
		},
		success : function(data){
			alert(data);
		}
	});	
}