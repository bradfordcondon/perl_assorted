#!/usr/bin/env perl

# Program: Pulls out the protein IDs from the messy JGI headers.  Must be separated by a space.
# 
# Bradford Condon <bradford.condon@gmail.com>  Cornell University
# 
# March 2014

use strict;
use warnings;
use Getopt::Long;

# usage
my $usage = "$0 -i|input list of protein IDs\n";

# global values
my $input;

# read user options
GetOptions(
	"i|input=s" => \$input,
)
or die ("error in command line arguments.  usage :  -i [input protein list]");


#read list file
open (TTP, $input) or die ("Could not open list  Please specify list with -i \n");
while (<TTP>){
chomp;

#to improve: add replace "_" with " " functionality here.

 # Split into array based on space
	 my (@array) = split(' ');
	 
	 print "$array[2] \n";
	
}
close(TTP);
  