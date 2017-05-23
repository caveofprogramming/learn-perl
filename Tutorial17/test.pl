use strict;
use warnings;

use Data::Dumper;


my @animals = ('dog', 'cat', 'rabbit');
my @fruits = ('apple', 'banana', 'orange');

my $fruits_ref = \@fruits;
print $fruits_ref->[0] . "\n";

my @values;

push @values, \@animals;
push @values, \@fruits;

print Dumper(@values);

