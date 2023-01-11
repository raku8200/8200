#!/usr/bin/perl
use Net::FTP;
use Term::ANSIColor;
use 5.010;
use strict;
use warnings;
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
print colored ("[ Start At $datetime ]",'white on_red'),"\n\n";use Net::FTP;

my $file = shift;

print "Opening file handle to $file\n";
open my $fh, '<', $file or die "Cannot open file $file: $!";

while(<$fh>) {
    chomp;
    my $host = $_;
    my $username = "anonymous";
    my $password = "anonymous";
    my $ftp;
    eval {
        $ftp = Net::FTP->new($host, Port => 20, Timeout => 30 ) or die "Cannot connect to $host on port 20: $@";
        $ftp->login($username, $password) or die "Cannot login $username with $password on port 20: " . $ftp->message;
        print  "230 Anonymous login ok: $host  'USERNAME=$username'  'PASSWORD=$password' on port 20\n";
    };
    if ($@) {

    } else {
        $ftp->quit;
    }

    eval {
        $ftp = Net::FTP->new($host, Port => 21, Timeout => 30 ) or die "Cannot connect to $host on port 21: $@";
        $ftp->login($username, $password) or die "Cannot login $username with $password on port 21: " . $ftp->message;
        print  "200 Anonymous login ok: $host   'USERNAME=$username'   'PASSWORD=$password' on port 21\n";
    };
    if ($@) {

    } else {
        $ftp->quit;
    }

    eval {
        $ftp = Net::FTP->new($host, Port => 2121, Timeout => 30) or die "Cannot connect to $host on port 2121: $@";
        $ftp->login($username, $password) or die "Cannot login $username with $password on port 2121: " . $ftp->message;
        print "200 Anonymous login ok: $host  'USERNAME=$username'  'PASSWORD=$password' on port 2121\n";
    };
    if ($@) {

    } else {
        $ftp->quit;
    }
}

close $fh;
        
