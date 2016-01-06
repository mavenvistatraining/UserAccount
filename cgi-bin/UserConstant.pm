package UserConstant;

use strict;
use warnings;


use constant insert_registration_detail_sql => qq{
	INSERT INTO
		registration_detail(
			fname, lname, user_id, password
		)
	VALUES (
		?, ?, ?, ?
	)
};

use constant get_user_detail_sql => qq{
	SELECT
		user_id, password
	FROM
		registration_detail
	WHERE
		user_id = ?
};
1;