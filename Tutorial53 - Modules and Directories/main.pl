use strict;
use warnings;
use Data::Dumper;

use lib '/Users/johnwpurcell/Documents/work/perl/projects/modules';

use Communication::Speak qw(test greet);

$|=1;

sub main {
	test();
	greet();
}

main();