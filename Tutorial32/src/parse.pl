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
	
	if(!checkusage("Hello", 7)) {
		usage();
	} 
}

sub checkusage {
	
	# my $greeting = shift;
	# my $number = shift;
	
	my ($greeting, $number) = @_;
	
	print "$greeting number $number\n";
	
	
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
