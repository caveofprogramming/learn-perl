use strict;
use warnings;
use Data::Dumper;
use Getopt::Std;

$| = 1;

=pod

	This is ACME XML parser version 1.0
	Use with care.
	
=cut

sub main {
	my %opts;
	
	# Get command line options
	getopts('af:c', \%opts);
	
	if(!checkusage(\%opts)) {
		usage();
	} 
	
=pod
	perl parse.pl -a -f test.xml -c
	
	a => 1
	c => 1
	f => test.xml
=cut

	my $opts_ref = \%opts;
	
	# Use hash directly.
	print $opts{"f"} . "\n";
	
	# Use reference to hash
	print $opts_ref->{"f"} . "\n";
}

sub checkusage {
	my $opts_ref = shift;
	
	print $opts_ref->{"f"} . "\n"; 
	
	return 1;
}

sub usage {
	print <<USAGE;
	
usage: perl main.pl <options>
	-f <file name>	specify XML file name to parse
	-a	turn off error checking

example usage:
	perl main.pl -f test.xml -a
	
USAGE
	
	exit();
}

main();
