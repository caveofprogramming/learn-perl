use strict;
use warnings;

$|=1;

sub main {
	
	# \d digit
	# \s space
	# \S non-space
	# \w alphanumeric
	
	# Some examples; in the following examples,
	# each example shows the text, the regular expression
	# and the output, in that order.
	
	# Digits:
	# 'I am 117 years old tomorrow.'
	# (\d+)
	# Matched: '117'
	
	# Space (will also match a tab)
	# I am 117 years old tomorrow.
	# (am\s*\d+)
	# Matched: 'am 117'
	
	# \S (non space -- note, capital 'S')
	# 'I am 117 years old tomorrow.'
	# (y\S+)
	# Matched: 'years'
	
	# Alphanumeric, including underscore
	# \w
	# 'Iam117yearsold_tomorrow.'
	# (\w*)
	# Matched: 'yearsold_tomorrow'
	
	my $text = 'I am 117 years old tomorrow.';
	
	if($text =~ /(y\S+)/) {
		print "Matched: '$1'\n";
	}

	
	
}

main();