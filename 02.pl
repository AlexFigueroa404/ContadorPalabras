#!/usr/bin/perl
use strict;
use warnings;

my $line;
my $second;
my @words;
my %hash;
my $count = 1;
my $frecuency = 10;

open (FILE, "<","BIBLIA COMPLETA.txt") or die "can't open file or does not exist'";

while ($line = <FILE>){

	$line =~s/[\#$@~!¡&*()\[\];.,:?^`\n\d\\\/]+//g;
	
	$line =~s/\h+/ /g; 

	@words = split(" ", $line);

	foreach (@words){
	if(exists($hash{$_})){
		$hash{$_} = $hash{$_} + 1;
	}else{
		$hash{$_} = 1;
	}
}

}

close (FILE);

foreach (sort{$hash{$b} <=> $hash{$a}} keys %hash ){
		print "La palabra [$_] se encuentra [$hash{$_}] veces \n";
		if($count >= $frecuency){
			last;
		}
		$count++;
}


