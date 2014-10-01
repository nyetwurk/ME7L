#!/usr/bin/perl

use strict 'vars';

# use Getopt::Std;
use File::Basename;

foreach my $file (@ARGV) {
    open(ECU, '<', $file) || die ("Can't open $file");
    while(<ECU>) {
	my @line=split(',',$_);
	if ($line[5]=~m/{m[Bb]ar}/) {
	    my $len = length($line[8]);
	    $line[8]=sprintf("%*s", $len, $line[8]*2);
	}
	print(join(',',@line));
    }
}
