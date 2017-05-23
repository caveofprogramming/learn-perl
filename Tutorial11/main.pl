use strict;
use warnings;

$|=1;

sub main {
	
	# * zero or more of the preceding character, as many as possible
	# + one or more of the preceding, as many as possible
	# *? zero or more of the preceding character, as few as possible
	# +? one or more of the preceding, as few as possible
	# {5} five of the preceding
	# {3,6} at least three and at most 6
	# {3,} at least three 

	my $text = 'DE$75883';
	
	if($text =~ /(DE\$\d{3,})/) {
		print "Matched: '$1'\n";
	}
}

main();