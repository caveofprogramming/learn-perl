use strict;
use warnings;

$|=1;

sub main {
	my $file = 'mymanjeeves.txt';
	
	open(INPUT, $file) or die("Input file $file not found.\n");
	
	while(my $line = <INPUT>) {
		
		# * matches zero or more of the preceding character; e.g.
		# d* matches zero or more d's 7* zero or more 7's, etc.
		# .* matches zero or more of any character, as many as possible
		# .*? matches zero or more of any character, as few as possible
		

		if($line =~ /(s.*?n)/) {
			print "$1\n";
		}
	}

	close(INPUT);
}

main();
