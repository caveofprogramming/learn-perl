use strict;
use warnings;
use Data::Dumper;
use Getopt::Std;

$| = 1;

sub main {
	my %opts;
	
	getopts('af:c', \%opts);
	
	if(!checkusage()) {
		usage();
	} 
}

sub checkusage {
	return 1;
}

sub usage {
	print "incorrect options";
}

main();
