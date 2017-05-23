use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main {
	my $input = "test.csv";
	
	open INPUT, $input or die "\nCan't open $input\n";
	
	my $headings = <INPUT>;
	chomp $headings;
	my @headings = split /\s*,\s*/, $headings;
	
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
		

		my %data;
		
		for(my $i=0; $i<@headings; $i++) {
			my $heading = $headings[$i];
			my $value = $values[$i];
			
			$data{$heading} = $value;
		}
		
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