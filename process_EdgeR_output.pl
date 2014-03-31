#!/usr/bin/env perl

# Program:  Generate list of upregulated and downregulated genes given EdgeR input.
# Bradford Condon <bradford.condon@gmail.com>  Cornell University
# 
# March 2014

use strict;
use warnings;
use Getopt::Long;

# usage
my $usage = "$0 -i|Edge R file \n";

# global values
my $edgeR;


# read user options
GetOptions(
	"i|input=s" => \$edgeR,
)
or die ("error in command line arguments.  usage : -t [input transcripts] -l [transcript to protein list]");

open (UP, '>>upregulated.out');
open (DOWN, '>>downregulated.out');

#read list file
open (FILE, $edgeR) or die ("Could not open transcript to protein list.  Please specify list with -l \n");
while (<FILE>){
chomp;
 # Split into array based on comma
	 my @array = split(',');
	my $tranid = $array[0];
	 my $logfc = $array[1];
	 my $pval = $array[3];
	 
	 print "$tranid , $logfc , $pval \n";
	 
	 #skip the first line (headers)
next if $. < 2;
	 
	 #print out transcripts to up and downregulated output if the pvalue is less than .05.
	 if ($pval <= .05) {
	 
	 	if ($logfc >= 0 ) {
	 	
	 		print UP  "$logfc   $tranid\n";
	 		}
	 		
		if ($logfc < 0 ) {		 	
	 			print DOWN "$tranid\n";
	 			}
	 		}
	} 	


close(FILE);
  close(UP);
  close (DOWN);