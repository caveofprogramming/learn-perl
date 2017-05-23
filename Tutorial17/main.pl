use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main {
	
	my $input = 'test.csv';
	
	unless(open(INPUT, $input)) {
		die "\nCannot open $input\n";
	}
	
	<INPUT>;
	
	my @lines;

	while(my $line = <INPUT>) {
		
		chomp $line;
		
		# print "'$line'\n";
		
		my @values = split /\s*,\s*/, $line;

		# print join '|', @values;
		
		# print Dumper(@values);
		
		push @lines, \@values;
	}
	
	close INPUT;
	
	
	print $lines[3][1] . "\n";
	
	foreach my $line(@lines) {
		print Dumper($line);
		
		print "Name " . $line->[0] . "\n";
	}
}

main();

