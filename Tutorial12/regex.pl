use strict;
use warnings;

$| = 1;

sub main {
	my $text = "The code for this device is GP8765.";
	
	if($text =~ /is\s(\w\w\d{2,6})\./) {
		print "The code is: $1\n";
	}
	else {
		print "Not found.\n";
	}
	
}

main();
