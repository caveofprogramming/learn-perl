package Speak;

use Exporter qw(import);

@EXPORT_OK = qw(test greet);
# @EXPORT = qw(test);

sub test {
	print "Hello there.\n";
}

sub greet {
	print "Hey, how's it goin?\n";
}

1;