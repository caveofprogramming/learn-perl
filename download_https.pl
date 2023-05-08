use strict;
use warnings;
use HTTP::Tiny;
 
my $url = 'https://perlmonks.org/';

my $response = HTTP::Tiny->new->get($url);

if ($response->{'success'}) {
    my $html = $response->{'content'};
    print($html);
}
else {
    print("Download failed")
}
