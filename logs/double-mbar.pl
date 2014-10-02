#!/usr/bin/perl

use strict 'vars';

foreach my $infile (@ARGV) {
    my ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,
        $atime,$mtime,$ctime,$blksize,$blocks)
	    = stat($infile);
    my $outfile = "out/$infile";
    open(INFILE, '<', $infile) || die ("Can't open $infile");
    open(OUTFILE, '>', $outfile) || die ("Can't open $outfile");
    my @is;
    my $last=0;
    while(<INFILE>) {
	my $l=$_;

	my @line=split(',',$l);
	if ($_ =~m/m[Bb]ar/) {
	    my $i=0;
	    foreach my $cell (@line) {
		if ($cell=~/m[Bb]ar/) {
		    push (@is, $i);
		    $last=$i;
		}
		$i++;
	    }
	} elsif ($last>1 && scalar(@line)>$last) {
	    foreach my $i (@is) {
		$line[$i]*=2 if ($line[$i]=~m/\s*-?[0-9.]+\s*$/);
	    }
	    $l=join(',', @line);
	}

	print OUTFILE ($l);
    }
    close INFILE;
    close OUTFILE;
    utime $atime, $mtime, $outfile;
}
