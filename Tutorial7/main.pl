use strict;
use warnings;

$|=1;

sub main {
	my $file = 'C:\tutorial\perl\mymanjeeves.txt';
	
	open(INPUT, $file) or die("Input file $file not found.\n");
	
	while(my $line = <INPUT>) {
		
		# The dot matches any character, even space or punctuation
		# e.g. the example below matches
		# I was
		# I said
		# If an
		# I take 
		# etc.
		# (only five characters including the space are actually matched by the epxression)
		if($line =~ /I..a./) {
			print $line;
		}
	}

	close(INPUT);
}

main();