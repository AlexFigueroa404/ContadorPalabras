#!/usr/bin/perl
use strict;
use warnings;

my $line;
my $count = 0;
my @newline;

open (FILE, "<","BIBLIA COMPLETA.txt") or die "can't open file or does not exist'";

while ($line = <FILE>){

	if ($line =~m/\bDios\b/g){
		@newline = split(/\s+/, $line);
		foreach (@newline){
			if ($_ =~m/\bDios\b/g){
				$count++;
			}
		}
	}

}
close (FILE);
print "$count \n";

