use strict;
use warnings;
use LWP::UserAgent;
use JSON;
use Getopt::Long;
use Term::ANSIColor;
use 5.010;
my $datetime  = localtime;

if ($^O =~ /MSWin32/) {system("cls"); }else { system("clear"); }
print color('bold green');
print q(
          ⠀⠀⠀⠀⠀⠀
            ⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⣠⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣄⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⡿⠋⢹⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀
⠀⠀⠀⣴⣿⠟⣿⣿⣿⣿⣿⣿⣿⠟⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⠻⣿⣦⠀⠀⠀
⠀⢠⣾⡿⠋⣼⣿⣿⣿⣿⣿⣿⡏⠀⠀⠘⠻⠿⢿⣿⣿⣿⣿⣿⣧⠙⢿⣷⡄⠀
⢰⣿⡟⠀⠀⣿⣿⣧⡈⠉⠛⠿⠁⢠⣶⣶⡀⠀⠀⠈⠻⢿⣿⣿⣿⠀⠀⢻⣿⡆
⠈⢿⣿⣄⠀⣿⣿⣿⣿⣦⣄⡀⠀⠈⠛⠛⠀⢸⣷⣶⣤⣈⣿⣿⣿⠀⣠⣿⡿⠁
⠀⠀⠻⣿⣧⡸⣿⣿⣿⣿⣿⣿⣿⣷⡆⠀⢀⣿⣿⣿⣿⣿⣿⣿⢇⣴⣿⠟⠀⠀
⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀
⠀⠀⠀⠀⠀⠈⠙⠿⣿⣿⣿⣿⣿⣧⣶⣿⣿⣿⣿⣿⣿⣿⠿⠛⠁⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠛⠿⠿⠿⠿⠿⠿⠟⠛⠋⠁⠀⠀⠀⠀⠀
);

print color('reset');
print "                       ";
print colored ("[ R Raku v2.1 ]",'white on_red');
print colored ("[ Coded By Raku 8200 ]\n",'white on_red');
print "                           ";
print colored ("[ Start At $datetime ]",'white on_red'),"\n\n";

my $site;
my $outfile;


GetOptions(
    "site=s" => \$site,
    "outfile=s" => \$outfile,
);


if (!$site) {
    die "Usage: $0 --site=<site> [--outfile=<outfile>]\n";
}


my $ua = LWP::UserAgent->new;
$ua->timeout(10);
$ua->agent("MyAgent/0.1");


my @subdomains;


my $response = $ua->get("https://api.sublist3r.com/?domain=$site");
if ($response->is_success) {
    my @api_subdomains = split(/\n/, $response->content);
    push @subdomains, @api_subdomains;
}


$response = $ua->get("https://crt.sh/?q=%.$site&output=json");
if ($response->is_success) {
    my $json = JSON->new->utf8->decode($response->content);
    foreach my $entry (@$json) {
        push @subdomains, $entry->{name_value};
    }
}

#

$response = $ua->get("https://dns.bufferover.run/dns?q=$site");
if ($response->is_success) {
    my $json = JSON->new->utf8->decode($response->content);
    foreach my $entry (@{$json->{FDNS}}) {
        push @subdomains, $entry->{name};
    }
}

#
$response = $ua->get("https://findsubdomains.com/subdomains-of/$site");
if ($response->is_success) {
    my @api_subdomains = split(/\n/, $response->content);
    push @subdomains, @api_subdomains;
}


my %subdomains = map { $_ => 1 } @subdomains;


foreach my $subdomain (sort keys %subdomains) {
    print "$subdomain\n";
}


if ($outfile) {
    open(my $fh, '>', $outfile) or die "Could not open file '$outfile' $!";
    print $fh "$_\n" for (sort keys %subdomains);
    close $fh;
}
