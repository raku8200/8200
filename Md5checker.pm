use strict;
use Digest::MD5 qw(md5_hex);
use Term::ANSIColor;

my $datetime = localtime;
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
my $target_hash = shift;


open(my $fh, '<', 'rockyou.txt') or die "Could not open file 'rockyou.txt': $!";
my @passwords = <$fh>;
close($fh);

chomp(@passwords);

sub check_password {
  my $password = shift;

  my $hashed_password = md5_hex($password);

  if($hashed_password eq $target_hash) {
    print "Password found: $password\n";
    exit;
  }
}

 
foreach my $password (@passwords) {
  check_password($password);
}


print "Password not found.\n";
