use strict;
use warnings;

$|=1;

sub main {
	
	# open $input for reading
	my $input = 'mymanjeeves.txt';
	open(INPUT, $input) or die("Input file $input not found.\n");
	
	# open $output for writing
	my $output = 'output.txt';
	open(OUTPUT, '>'.$output) or die "Can't create $output.\n";
	
	# Read the input file one line at a time.
	while(my $line = <INPUT>) {
		
		# If this line has the word "egg" in it, write it
		# to the output file, otherwise ignore it.
		# \b matches the edges (boundaries) of words.
		if($line =~ /\begg\b/) {
			$line =~ s/hen/dinosaur/ig;
			print OUTPUT $line;
		}
	}

	close(INPUT);
	close(OUTPUT);

	close(OUTPUT);
}

main();

