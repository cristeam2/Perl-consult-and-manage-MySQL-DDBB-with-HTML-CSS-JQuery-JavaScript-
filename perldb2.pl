#!/Applications/XAMPP/xamppfiles/bin/perl
#!/usr/bin/perl
#!/opt/local/bin/perl


#to know the path do "which perl"
$server="127.0.0.1";
$database="mis-usuarios";
$tabla="usuarios";
$user="root";
$pass="root";
#web address: http://localhost/cgi-bin/perldb2.pl
#web address: http://localhost/xampp/perldb2.pl

print "Content-Type: text/html\n\n";

use DBI;


my $dbh=DBI->connect(
  "DBI:mysql:database=$database;host=$server",
  "$user",
  "$pass"
) || die "Error connecting to database: $!\n";

my $sth = $dbh->prepare("SELECT * FROM $tabla");

$sth->execute();

#my @array=();

while (@row = $sth->fetchrow_array) {  # retrieve one row
		push(@array, @row);
	    print join("->", @row),"\n<br>";
}
foreach (@array) {
  print "$_\n";
}
print "<br>\n";
print join("\r",@array),"\r";


exit;