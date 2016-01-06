package UserAction;
use User;

sub new{
	my ($class, $param) = @_;
	my $self = {
			user_object => User->new( $param )
	};
	return bless $self, $class;
}

sub registration{
	my ($self, $param) = @_;
	
	$self->{user_object}->insert_user_information();
	return;
}

sub user_login{
	my ($self, $param) = @_;
	
	$self->{user_object}->check_user_information();
	return;
}

sub forgot_password{
	my ($self, $param) = @_;
	
	$self->{user_object}->get_user_information();
	return;
}
1;