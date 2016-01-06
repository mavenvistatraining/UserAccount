package DBIConnection;

use strict;
use warnings;
use DBI;

sub new {
    my ( $class ) = shift @_;
    my $self = {};
	bless $self, $class;
	return $self;
}

sub dbi_connection{
	my ($self)  = @_;
	
	my $dsn = 'dbi:mysql:chandani_details:192.168.1.225:3306';
	my $user = 'root';
	my $password= 'be4us$';
	my $dbh = DBI->connect($dsn, $user, $password,{ RaiseError => 1, AutoCommit => 1 });
	return $dbh;
}

1;