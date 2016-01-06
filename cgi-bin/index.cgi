#!/usr/bin/perl

use CGI;
use JSON;
use UserAction;

my $cgi           = CGI->new();
my $param         = $cgi->Vars;
my $user_action   = $param->{'user_action'};
my $action_object = UserAction->new($param);

print $cgi->header();

$action_object->$user_action();