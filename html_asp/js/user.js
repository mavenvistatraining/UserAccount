function login_details(form_object) {
	var user = {
		user_action : 'user_login',
		username  : form_object.uname.value,
		password  : form_object.pass.value
	};
	$.ajax({
		url:'../cgi-bin/index.cgi',
		type: 'POST',
		data: user,
		success: function(data) {
			var user_object = $.parseJSON(data);
			if (user_object[0]) {
				var user = user_object[0];
				alert("Welcome, " + user.user_first_name);
			} else {
				alert("Invalid Login");
			}
		}
	});
	return false;
}

function forgot_password() {
	var email_id = prompt("Enter Email ID for get User Details.");
	if (email_id) {
		var user = {
			user_action : 'forgot_password',
			username  : email_id
		};
		$.ajax({
			url:'../cgi-bin/index.cgi',
			type: 'POST',
			data: user,
			success: function(data) {
				var user_object = $.parseJSON(data);
				if (user_object[0]) {
					var user = user_object[0];
					alert("Username: " + user.user_email_id+"  and Password: " + user.user_password);
				} else {
					alert("Email ID not found!");
				}
			}
		}); 
	}
	return false;
}

function submit_register_details(form_object) {
	var user = {
		user_action : 'registration',
		firstname : form_object.fname.value,
		lastname  : form_object.lname.value,
		emailid   : form_object.email.value,
		password  : form_object.passwd.value
	};
	$.ajax({
		url:'../cgi-bin/index.cgi',
		type: 'POST',
		data: user,
		success: function(data) {
			alert(data);
		}
	});
	return false;
}

function submit_register_details_api() {
	var data = $('#register_data').val();
	var user = $.parseJSON(data);
	user.user_action = 'registration';
	
	$.ajax({
		url:'../cgi-bin/index.cgi',
		type: 'POST',
		data: user,
		success: function(data) {
			alert(data);
		}
	});
	return false;
}

function login_details_api() {
	var data = $('#login_data').val();
	var user = $.parseJSON(data);
	user.user_action = 'user_login';
	
	$.ajax({
		url:'../cgi-bin/index.cgi',
		type: 'POST',
		data: user,
		success: function(data) {
			var user_object = $.parseJSON(data);
			
			if (user_object[0]) {
				var user = user_object[0];
				alert("Welcome, " + user.user_first_name);
			} else {
				alert("Invalid Login");
			}
			
		}
	});
	return false;
}