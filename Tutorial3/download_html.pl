use strict;
use warnings;
use LWP::UserAgent;
use IO::Socket::SSL;
use Data::Dumper;

my $ua = LWP::UserAgent->new(cookie_jar=>{});

$ua->ssl_opts(
    'SSL_verify_mode' => IO::Socket::SSL::SSL_VERIFY_NONE, 
    'verify_hostname' => 0
);

my $request = new HTTP::Request('GET', 'https://caveofpython.com/');

my $response = $ua->request($request);

unless($response->{'is_success'}) {
    print $response->{'status_line'}
}

print($response->content());

print("Completed")