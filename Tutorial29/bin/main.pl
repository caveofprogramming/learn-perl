use strict;
use warnings;
use Data::Dumper;
use Getopt::Std;

$| = 1;

sub main {
	my %opts;
	
	getopts('af:c', \%opts);
	
	print Dumper(%opts);
	
	my $file = $opts{'f'};
	
	print "File: $file\n"
}

main();
