use strict;
use warnings;
use LWP::UserAgent;
use IO::Socket::SSL;

my $ua = LWP::UserAgent->new(cookie_jar=>{});

$ua->ssl_opts(
    'SSL_verify_mode' => IO::Socket::SSL::SSL_VERIFY_NONE, 
    'verify_hostname' => 0
);

my $link = 'https://i0.wp.com/caveofpython.com/wp-content/uploads/2023/03/robot.png?w=996&ssl=1';

my $response = $ua->mirror($link, './robot.png');

unless($response->is_success()) {
    die $response->status_line();
}

print("\nCompleted")