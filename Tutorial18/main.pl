use strict;
use warnings;

use Data::Dumper;

$| = 1;

sub main {

	my %months = (
		1 => "Jan",
		5 => "May",
		7 => "Jul",
	);
	
	print $months{5} . "\n";
	
	my %days;
	
	$days{"Sunday"} = 1;
	$days{"Monday"} = 2;
	$days{"Friday"} = 6;
	
	my $day = $days{"Friday"};
	
	print "Friday is day $day\n";
}

main();

