package UserConstant;

use constant insert_user_details => qq{
    INSERT
		INTO user_details
		(
			user_first_name, user_last_name, 
			user_email_id, user_password
		)
	VALUES
	(
		?, ?,
		?, ?
	)
};

use constant check_user_details => qq{
    SELECT 	
		user_id
	FROM 
		user_details
	WHERE
		user_email_id = ?
	AND
		user_password = ?
};

use constant get_user_details_by_email => qq{
    SELECT 	
		*
	FROM 
		user_details
	WHERE
		user_email_id = ?
};
1;