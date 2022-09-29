#!/usr/bin/perl
use strict;
use warnings;
use List::Compare;

open (my $log, "<", "log") or die $!;
open (my $master, "<", "master") or die $!;
my @content_log=<$log>;
my @content_master=<$master>;

my $lc = List::Compare->new(\@content_log, \@content_master);    
my @intersection = $lc->get_intersection;
my @firstonly = $lc->get_unique;
my @secondonly = $lc->get_complement;

print "Common Items:\n"."@intersection"."\n";
print "Items Only in First List:\n"."@firstonly"."\n";
print "Items Only in Second List:\n"."@secondonly"."\n";

print "log\n", $lc->get_unique,"\n"; 
print "master\n", $lc->get_complement,"\n"; 

close $log;
close $master;