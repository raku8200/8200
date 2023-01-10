#!/usr/bin/perl

use strict;
use warnings;
use LWP::UserAgent;
use HTTP::Headers;
use Socket;


my $ua = LWP::UserAgent->new;

print "IP Address". "\t". "Domain". "\t". "Url". "\t". "Status Code" . "\n";

while (my $domain = <STDIN>) {
    chomp $domain;
    
    my $url = "https://$domain";

    
    my $response = $ua->get($url);

    
    my $ip = inet_ntoa(inet_aton($domain));
    
    print $ip . "\t" . $domain . "\t" . $url . "\t" . $response->code . "\n";
}
