use strict;
use warnings;

$|=1;

sub main {
	my $file = 'C:\tutorial\perl\mymanjeeves.txt';
	
	# Either successfully open the file or else die (stop the program)
	open(INPUT, $file) or die("Input file $file not found.\n");
	
	# Read each line from the file, one line at a time.
	while(my $line = <INPUT>) {
		if($line =~ / egg /) {
			print $line;
		}
	}

	close(INPUT);
}

main();