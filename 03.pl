#!/usr/bin/perl
use strict;
use warnings;


my $second;
my @words;
my %hash;
my $count = 1;
my $frecuency = 10;
my @arrIgnore;



open (FILE, "<","BIBLIA COMPLETA.txt") or die "can't open file or does not exist'";
#open (FILEIGNORE) or die "can't open file or does not exist'";


while (<>){
	$_ =~ s/[\#$@~!¡&*()\[\];.,:?^`\n\d\\\/]+//g;	
	$_ =~s/\h+/ /g; 
	push (@arrIgnore, split(" ",$_));

}


while (<FILE>){

	$_ =~s/[\#$@~!¡&*()\[\];.,:?^`\n\d\\\/]+//g;
	
	$_ =~s/\h+/ /g; 

	@words = split(" ", $_);

	foreach (@words){
	if(exists($hash{$_})){
		$hash{$_} = $hash{$_} + 1;
	}else{
		$hash{$_} = 1;
	}
}

}

close (FILE);
#close (FILEIGNORE);



foreach (@arrIgnore){
	if(exists($hash{$_})){
		delete $hash{$_};
	}
}


foreach (sort{$hash{$b} <=> $hash{$a}} keys %hash ){
		print "La palabra [$_] se encuentra [$hash{$_}] veces \n";
		if($count >= $frecuency){
			last;
		}
		$count++;
}





