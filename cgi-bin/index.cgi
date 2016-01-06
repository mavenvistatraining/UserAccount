#!/usr/bin/perl
use CGI;
use DBIConnection;
use strict;
use warnings;
use RegistrationDetails;

my $cgi = CGI->new;
print $cgi->header();

#my $dbh = &DBIConnection::dbi_connection();
my $dbh_obj = DBIConnection->new();
my $dbh = $dbh_obj->dbi_connection();

my $action = $cgi->param("action");

if ($action eq 'register_user') {
    my $user_object = RegistrationDetails->new(
        'dbh' => $dbh,
        'cgi' => $cgi
    );
    $user_object->insert_user_details();
}
elsif ($action eq 'user_sign_in') {
    my $user_sign_in_object = RegistrationDetails->new(
        'dbh' => $dbh,
        'cgi' => $cgi
    );
    $user_sign_in_object->sign_in();
}
1;







