use strict;
use warnings;

$|=1;

sub main {
	
	# Ranges
	# [0-9] any number
	# [A-Z] any uppercase letter (in the English alphabet)
	
	# Alternatives
	# [ABC] -- list of alternates
	# [\=\%] - simply list alternatives. Backslash any character that might have a special meaning in regex
	# [A-Za-z_0-9] -- specify alternatives just by listing them; can include ranges.
	
	# [^0-9T\s] ^ Match anything EXCEPT the specified characters.
	
	
	my $content = "The 39 Steps - a GREAT book - Colours_15 ==%== ABBCCBBCCABCA";

	
	if($content =~ /([^0-9T\s]{5,})/) {
		print "Matched '$1'\n";
	}
	else {
		print "No match\n";
	}
	
}

main();