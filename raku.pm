#1/10/2023
#!/usr/bin/perl

use strict;
use warnings;
use LWP::UserAgent;
use HTTP::Headers;
use Socket;
use Term::ANSIColor;
use 5.010;
my $datetime    = localtime;

if ($^O =~ /MSWin32/) {system("cls"); }else { system("clear"); }
print color('bold green');
print q(
      ⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⣠⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣄⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⡿⠋⢹⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀
⠀⠀⠀⣴⣿⠟⣿⣿⣿⣿⣿⣿⣿⠟⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⠻⣿⣦⠀⠀⠀
⠀⢠⣾⡿⠋⣼⣿⣿⣿⣿⣿⣿⡏⠀⠀⠘⠻⠿⢿⣿⣿⣿⣿⣿⣧⠙⢿⣷⡄⠀
⢰⣿⡟⠀⠀⣿⣿⣧⡈⠉⠛⠿⠁⢠⣶⣶⡀⠀⠀⠈⠻⢿⣿⣿⣿⠀⠀⢻⣿⡆
⠈⢿⣿⣄⠀⣿⣿⣿⣿⣦⣄⡀⠀⠈⠛⠛⠀⢸⣷⣶⣤⣈⣿⣿⣿⠀⣠⣿⡿⠁
⠀⠀⠻⣿⣧⡸⣿⣿⣿⣿⣿⣿⣿⣷⡆⠀⢀⣿⣿⣿⣿⣿⣿⣿⢇⣴⣿⠟⠀⠀
⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀
⠀⠀⠀⠀⠀⠈⠙⠿⣿⣿⣿⣿⣿⣧⣶⣿⣿⣿⣿⣿⣿⣿⠿⠛⠁⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠛⠿⠿⠿⠿⠿⠿⠟⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
);

print color('reset');
print "                       ";
print colored ("[ R Raku v2.1 ]",'white on_red');
print colored ("[ Coded By Raku 8200 ]\n",'white on_red');
print "                           ";
print colored ("[ Start At $datetime ]",'white on_red'),"\n\n";

my $ua = LWP::UserAgent->new;

print "IP Address:". "\t". "\tDomain:". "\t"."\t". "\tUrl:". "\t"."\t" ."\t". "\Status Code:" . "\n";

while (my $domain = <STDIN>) {
    chomp $domain;

    my $url = "https://$domain";


    my $response = $ua->get($url);


    my $ip = inet_ntoa(inet_aton($domain));

    print $ip . "\t" ."\t". $domain . "\t" . $url . "\t" ."\t" ."\t". $response->code . "\n";
}
