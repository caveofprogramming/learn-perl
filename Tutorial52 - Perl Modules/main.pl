use strict;
use warnings;
use Data::Dumper;

use Speak qw(test greet);

$|=1;

sub main {
	#Speak::test();
	
	test();
	greet();
	
	#my @dogs = qw(retriever labrador alsatian);
	#print Dumper(@dogs);
}

main();