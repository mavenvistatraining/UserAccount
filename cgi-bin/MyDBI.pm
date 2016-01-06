package MyDBI;

use strict;
use 5.010;
use DBI;

sub Database {
	my $dsn = 'DBI:mysql:nirav_demo:192.168.1.225:3306';
	my $uname = 'root';
	my $pass = 'be4us$';
	my $dbh = DBI->connect($dsn,$uname,$pass,{RaiseError=>1 , AutoCommit=>1}) or die('Not Connected');
	return $dbh;
}
1;