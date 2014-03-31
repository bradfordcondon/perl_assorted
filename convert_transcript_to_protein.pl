#!/usr/bin/env perl

# Program:  Creates a hash of Transcript and protein IDs.  It then reads a list of transcript IDs, and returns the corresponding protein IDs.
# 
# Bradford Condon <bradford.condon@gmail.com>  Cornell University
# 
# March 2014

use strict;
use warnings;
use Getopt::Long;

# usage
my $usage = "$0 -t|input list of transcripts \t  -l|input tab delimited list of transcript to protein \n";

# global values
my $transcript_list;
my $tran_to_prot;
my %hash;


# read user options
GetOptions(
	"t|input=s" => \$transcript_list,
	"l|input=s" => \$tran_to_prot,
)
or die ("error in command line arguments.  usage : -t [input transcripts] -l [transcript to protein list]");


#create hash of transcript to protein conversion
#read list file
open (TTP, $tran_to_prot) or die ("Could not open transcript to protein list.  Please specify list with -l \n");
while (<TTP>){
chomp;
 # Split into hash based on tab
	 my ($key, $value) = split('\t');
#Add that transcript and protein into the hash, with the transcirpt as key
			 $hash{$key} = $value;	
}

close(TTP);
  

#open transcript list

open (TL, $transcript_list) or die ("Could not open transcript list.  Please specify with -t \n");
while (<TL>){
chomp;
	my ($name) = $_;
	
	while ( my ($key, $value ) = each %hash ) {
	if ($name eq $key)
			{	
		print "$value \n";
			}
		}
}
close (TL);
