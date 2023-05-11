use strict;
use warnings;

$|=1;

sub main {
	my $file = 'mymanjeeves.txt';
	
	open(INPUT, $file) or die("Input file $file not found.\n");
	
	while(my $line = <INPUT>) {

		# Surround the bits you want to "capture" with round brackets
		if($line =~ /(I..a.)(...)/) {
			# The stuff matched by the first set of round brackets if now in $1
			# The stuff matched by the second set is in $2
			print "First match: '$1'; second match:'$2'\n";
		}
	}

	close(INPUT);
}

main();
