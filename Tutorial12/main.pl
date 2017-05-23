use strict;
use warnings;

$| = 1;

sub main {
	my @emails = (
		'john@caveofprogramming.com',
		'hello',
		'@llkj.com',
		'jklj778dd@somewhere77.com',
		'lkjl@7788.',
	);
	
	for my $email(@emails) {
		if($email =~ /\w+\@\w+\.\w+/) {
			print "Valid: $email\n";
		}
		else {
			print "Invalid: $email\n";
		}
	}
}

main();
