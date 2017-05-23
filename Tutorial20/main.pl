use strict;
use warnings;

use Data::Dumper;

$| = 1;

sub main {


	my %hash1 = (
		"cat" => "meat",
		"birds" => "seeds",
		"fish" => "worms",
	);
	
	my @test;

	# We could push a reference to a hash onto an array.
	push @test, \%hash1;
	
	# We could also just refer to the element after the end of the array
	# and by setting it, create it:
	$test[1] = \%hash1;
	
	
	print $test[0]{"birds"} . "\n";
	print $test[1]{"fish"} . "\n";
}

main();

