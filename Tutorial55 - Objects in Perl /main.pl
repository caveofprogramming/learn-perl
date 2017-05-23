use strict;
use warnings;

use Data::Person;

$|=1;

sub main {
	
	my $person1 = new Data::Person("Bob", 45);
	$person1->greet("Sue");
	
	my $person2 = new Data::Person("Mike", 55);
	$person2->greet("Rogriguez");
}

main();