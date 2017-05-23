use strict;
use warnings;

use File::Copy;

$|=1;

sub main {
	if(move( 
	'/Users/johnwpurcell/Documents/work/perl/projects/Tutorial61 - Moving and Copying Files/logo.png', 'logo2.png')){
		print "One file moved.\n";
	}
	else {
		print "Unable to move file\n";
	}
	
	unlink('logo2.png');
}

main();