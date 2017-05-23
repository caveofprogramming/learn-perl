use strict;
use warnings;

use LWP::Simple;

sub main {
	
	print "Downloading ...\n";
	# Download the specified HTML page and print it to the console.
	# print get("http://www.caveofprogramming.com/");
	
	# Download the Cave of Programming home page HTML and save it to "home.html"
	# getstore("http://www.caveofprogramming.com/", "home.html");
	
	# Download logo.png from the Internet and store it in a file named "logo.png"
	my $code = getstore('http://www.caveofprogramming.com/wp-content/themes/squiffy/images/logo.png', "logo.png");
	
	# Did we get code 200 (successful request) ?
	if($code == 200) {
		print "Success\n";
	}
	else {
		print "Failed\n";
	}
	
	print "Finished\n";
}

main();
