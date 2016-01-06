package RegistrationDetails;

use strict;
use warnings;
use UserConstant;

sub new {
    my ( $class ) = shift @_;
    my %args      = (ref($_[0]) eq 'HASH' )? %{$_[0]} : @_ ;
    
    my $self = {
		_dbh => $args{dbh},
		_cgi => $args{cgi}
	};
	
	bless $self, $class;
	return $self;
}

sub cgi {
    my ($self, $val) = @_;
    if ($val) {
        $self->{_cgi} = $val;
    }
    return $self->{_cgi};
}

sub dbh {
    my ($self, $val) = @_;
    if ($val) {
        $self->{_dbh} = $val;
    }
    return $self->{_dbh};
}

sub insert_user_details{
	my ($self) = @_;
	my $dbh = $self->dbh;
	my $cgi = $self->cgi;
	
#	my $cgi = CGI->new;
	my $fname    = $cgi->param("fname");
    my $lname    = $cgi->param("lname");
    my $user_id  = $cgi->param("user_id");
    my $password = $cgi->param("password");
	
	my $insert_registration_detail_sql =
		UserConstant::insert_registration_detail_sql;
	
	$dbh->do(
		$insert_registration_detail_sql, undef, $fname,
		$lname, $user_id, $password
	);
	
	my $message = qq{Record Inserted Succesfully};
	return print $message;
}

sub sign_in{
	my ($self) = @_;
	my $dbh = $self->dbh;
	my $cgi = $self->cgi;

    my $user_id  = $cgi->param("user_id");
    my $password = $cgi->param("password");
	my $err_msg  = '';
	
	my $get_user_detail_sql = UserConstant::get_user_detail_sql;
	my ($user_login_id, $user_password)  = $dbh->selectrow_array(
											$get_user_detail_sql,
											undef,
											$user_id
										);
	print STDERR "\n\n =============== $user_login_id ======= $user_id ========= $user_password ============= $password =============== \n\n";
	if ("$user_login_id" eq "$user_id" && "$user_password" eq "$password") {
		$err_msg = qq{Login Successfully};
	}
	else{
		$err_msg = qq{User Id and Password is Incorrect};
	}
	
	print STDERR "\n\n ============== $user_id -------- $password --------------\n\n ";
	return print $err_msg;
}

1;