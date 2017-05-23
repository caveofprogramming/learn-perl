use strict;
use warnings;

use Data::Dumper;

$| = 1;

sub main {

	my %foods = (
		"mice" => "cheese",
		"dogs" => "meat",
		"birds" => "seeds",
	);
	
	
	# We can define an array of variables like this:
	my ($one, $two, $three) = (13, 21, 38);
	
	print "The value of \$two is $two\n";
	
	while( my ($key, $value) = each %foods) {
		print "$key: $value\n";
	}
	

	foreach my $key(sort keys %foods) {
		my $value = $foods{$key};
		
		print "$key = $value\n";
	}

}

main();

