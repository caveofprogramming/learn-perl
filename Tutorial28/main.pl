use strict;
use warnings;

use LWP::Simple;

$| = 1;

sub main {

	my $content = get("http://www.caveofprogramming.com");

	unless ( defined($content) ) {
		die "Unreachable url\n";
	}

	my @classes = $content =~ m|class="([^"']*?)"|ig;
	
	if(@classes == 0) {
		print "No matches\n";
	}
	else {
		foreach my $class(@classes) {
			print "$class\n";
		}
	}
}

main();
