use strict;
use warnings;

$|=1;

sub main {

 	# An array of file names. Note the "@"" for array
	my @files = (
		'C:\tutorial\perl\projects\logo.png',
		'C:\tutorial\perl\projects\index.html',
		'C:\tutorial\perl\projects\missing.txt',
	);

	# foreach loops through the array, setting the loop
	# variable ($file in this case) to each value in turn.
	
	foreach my $file (@files) {
		
		# -f tests if a file exists.
		if ( -f $file ) {
			print "Found file: $file\n";
		}
		else {
			print "File not found: $file\n";
		}
	}

}

main();
