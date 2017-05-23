use strict;
use warnings;

use LWP::Simple;

$| = 1;

sub main {

	my $content = get("http://www.caveofprogramming.com");

	unless ( defined($content) ) {
		die "Unreachable url\n";
	}

	# <a href="http://news.bbc.co.uk">BBC News</a>
	# []<>

	while (
		$content =~
m| # Use a pipe character as the quote, since we don't need to use it inside the regex.
		<\s*a\s+ # Match the opening <a, with or without space around the 'a'
		[^>]* # Match any amount of gumpf, as long as it's not the closing angle bracket quote
		
		href\s*=\s* # Match href=, with or without space around the '='
		
		['"] # Match either a single or double quote
		
		([^>"']+) # Match any text, as long as it doesn't include a closing '>' bracket or a quote
		
		['"] # Close the quote
		
		[^>]*> # Match anything other than the closing bracket, followed by the closing bracket.
	
	\s*([^<>]*)\s*</ # Match the hyperlinked text; any characters other than angle brackets
	
	|sigx # s: match across new lines; i: case insensitive match; g: global (repeated) match; x: allow whitespace and comments 
	  )
	{
		print "$2: $1\n";
	}

}

main();
