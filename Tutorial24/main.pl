use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main {
	my $input = "test.csv";
	
	open INPUT, $input or die "\nCan't open $input\n";
	
	<INPUT>;
	
	my @data;
	
	LINE: while(my $line = <INPUT>) {
		chomp $line;
		
		$line =~ /\S+/ or next;
		$line =~ s/^\s*|\s*$//g;
		$line =~ s/\?|\$|approx.\s*//g;
		
		my @values = split /\s*,\s*/, $line;
		
		if(@values < 3) {
			next;
		}
		
		foreach my $value(@values) {
			if(length($value) == 0) {
				next LINE;
			}
		}
		
		my ($name, $payment, $date) = @values;
		
		my %data = (
			"Name" => $name,
			"Date" => $date,
			"Payment" => $payment,
		);
		
		push @data, \%data;
		
		# print "$name: $payment, $date\n";
		
		#print "'$line'\n";
	}
	
	close INPUT;
	
		
	print Dumper(@data);
	
	my $totalPayment = 0;
	
	foreach my $data(@data) {
		$totalPayment += $data->{"Payment"};
	}
	
	print "Total payment: $totalPayment\n";
	
}

main();