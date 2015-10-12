#!/Applications/XAMPP/xamppfiles/bin/perl
#!/usr/bin/perl
#!/opt/local/bin/perl


#to know the path do "which perl"
my $server="127.0.0.1";
my $database="baseDeDatos";
my $tabla="CONTROLENTREVISTAS";
my $user="root";
my $pass="root";

print "Content-Type: text/html\n\n";

use DBI;
use CGI;
#use strict; 
#use warnings;
#use Data::Dumper;


my $cgi = CGI->new(); 
my $ci = $cgi->param('CI');
my $name = $cgi->param('name');

my $dbh=DBI->connect(
  "DBI:mysql:database=$database;host=$server",
  "$user",
  "$pass"
) || die "Error connecting to database: $!\n";


my $sth = $dbh->prepare("INSERT INTO $tabla (`C.I`,`APELLIDOS Y NOMBRES` ) VALUES ('$ci','$name');");
$sth->execute();
$sth->finish();
$dbh->disconnect();

print "<script language='javascript'> alert('Usuario registrado'); 
		window.location.href = '../registro.html'; </script>";

