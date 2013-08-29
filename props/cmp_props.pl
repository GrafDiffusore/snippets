#!/usr/bin/perl -w

use strict;

sub print_arr;
my %m;
my %p;
my @keys;
my ($k, $v);

while (<>) {
    if (/^([-+])(\S[^=]*)=(.*)$/) {
	$k = $2;

	$v = $3;
	chomp($v);
	
	if ($1 eq '-') {
	    $m{$k} = $v;
	} else {
	    $p{$k} = $v;
	}

	push @keys, $k;
    }    
}

my @only_m;
my @only_p;
my @both;
my ($has_m, $has_p);

foreach (@keys) {
    $k = $_;

    $has_m = defined($m{$k});
    $has_p = defined($p{$k});
    
    if ($has_m) { if ($has_p) { push @both, $k; } else { push @only_m, $k; } }
    elsif ($has_p) { push @only_p, $k; }
}

print_arr ("Only in minus", \@only_m, ["-", \%m]);
print_arr ("Only in plus", \@only_p, ["+", \%p]);
print_arr ("In both", \@both, ["-", \%m], ["+", \%p]);

sub print_arr {
    my ($banner, $aref, $first, $second) = @_;

    my ($fp, $fv, $sp, $sv, $same);

    print "========== $banner ==========\n";   

    foreach (@$aref) {
	$same = 0;

	$fp = $first->[0];
	$fv = $first->[1]->{$_};	

	if (defined($second)) {
	    $sp = $second->[0];
	    $sv = $second->[1]->{$_};
	    if ($fv eq $sv) { $same = 1; }
	}

	if ($same) { next; }

	print $fp, $_, "=", $fv, "\n";
	if (defined($second)) { print $sp, $_, "=", $sv, "\n"; }
    }
}
