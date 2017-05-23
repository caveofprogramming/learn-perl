use strict;
use warnings;

use LWP::Simple;

$|=1;

sub main {
	
	my $content = get("http://www.caveofprogramming.com");
	
	unless(defined($content)) {
		die "Unreachable url\n";
	}
	
	if($content =~ m'<a class="mainlink" href=".+?">(.+?)</a>'i) {
		my $title = $1;
		
		print "Title: $title\n";
	}
	else {
		print "\nTitle not found\n";
	}
	
}

main();