package User;

use MyDBI;
use UserConstant;
use JSON;
use Try::Tiny;

sub new{
	my ($class, $param) = @_;
	
	my $self = {
				param => $param,
				dbh   => MyDBI->Database()
	};
	return bless $self, $class;
}

sub insert_user_information {
	my ($self) = @_;
	
	my $param      = $self->{'param'};
	my $dbh        = $self->{'dbh'};
	my $first_name = $param->{'firstname'};
	my $last_name  = $param->{'lastname'};
	my $email_id   = $param->{'emailid'};
	my $password   = $param->{'password'};
		
	my $insert_user_sql = UserConstant::insert_user_details;
	
	try {
		$dbh->do(
			$insert_user_sql, undef, $first_name,
			$last_name, $email_id, $password
		);
		return print 'Successfully Inserted';
	} catch {
		return print 'Not Inserted';
	};
}

sub check_user_information {
	my ($self) = @_;
	
	my $param        = $self->{'param'};
	my $dbh          = $self->{'dbh'};
	my $username     = $param->{'username'};
	my $password     = $param->{'password'};
	my $user_hashref = {};
	
	my ($exists_user) = $self->_is_valid_user($username, $password);
	if ($exists_user) {
		$user_hashref = $self->_get_user_details($username);
	}
	return print encode_json $user_hashref;
}

sub get_user_information {
	my ($self) = @_;
	
	my $param      = $self->{'param'};
	my $dbh        = $self->{'dbh'};
	my $username   = $param->{'username'};

	my $user_hashref = $self->_get_user_details($username);
	return print encode_json $user_hashref;
}

sub _is_valid_user {
	my ($self, $username, $password) = @_;
	
	my $dbh            = $self->{'dbh'};
	my $check_user_sql = UserConstant::check_user_details;
	my ($exists_user)  = $dbh->selectrow_array( $check_user_sql, undef, $username, $password);
	
	return $exists_user;
}

sub _get_user_details {
	my ($self, $username) = @_;
	
	my $dbh          = $self->{'dbh'};
	my $get_user_sql = UserConstant::get_user_details_by_email;
	my $user_hashref = {};
	$user_hashref    = $dbh->selectall_arrayref( $get_user_sql,{ Slice => {} }, $username );
	
	return $user_hashref;
}
1;