#!/Applications/XAMPP/xamppfiles/bin/perl
#!/usr/bin/perl
#!/opt/local/bin/perl


#to know the path do "which perl"
my $server="127.0.0.1";
my $database="baseDeDatos";
my $tabla="CONTROLENTREVISTAS";
my $user="root";
my $pass="root";
#web address: http://localhost/cgi-bin/perldb2.pl
#web address: http://localhost/xampp/perldb2.pl

print "Content-Type: text/html\n\n";
print "<HTML>\n";
print "<HEAD>\n";
print "<TITLE>Resultados por nombre</TITLE>\n";
print "<link rel='stylesheet' href='../css/style.css'>\n"; 
print "</HEAD>\n";
print "<BODY>\n";
print "<input type=button  class='login2 login-button' value='Ir al Menu principal' onClick=location.href='../index.html'>";
print "<PRE>";
print "<div class='loginPerl'>";

use DBI;
use CGI;
use strict; 
use warnings;
#use Data::Dumper;

my @estructura=();
my @usuario=();
my $cgi = CGI->new(); # create new CGI object
my $name = $cgi->param('name');
my $dbh=DBI->connect(
  "DBI:mysql:database=$database;host=$server",
  "$user",
  "$pass"
) || die "Error connecting to database: $!\n";

my $sth = $dbh->prepare("SELECT column_name FROM information_schema.columns WHERE table_schema = 'basededatos' AND table_name = 'controlentrevistas' ;");
$sth->execute();
while (my @row = $sth->fetchrow_array) {  # retrieve one row
		push( @estructura, @row);
}

my $sth = $dbh->prepare("SELECT * FROM $tabla WHERE `APELLIDOS Y NOMBRES` like '%$name%';");
$sth->execute();
while (my @row = $sth->fetchrow_array) {  # retrieve one row
		push( @usuario, @row);	
}

if (!@usuario) {
    print "<script language='javascript'>
       alert('No hubo Resultados');
       window.location.href = 'consultarName.html';
       </script>";
       exit;
}

my $longitud=scalar(@estructura);
my $longitudUsuario=scalar(@usuario);
print "<strong><center>Resultados: ". $longitudUsuario / $longitud." </center></strong>\n";

my $cont= my $contResultados= my $contUsuario=0;
while ($contUsuario < $longitudUsuario ) {
	if ($cont == $longitud) {
		$contResultados++;
		$cont=0;
		print "<br><br>";
		
	}
	print "<b>@estructura[$cont] =</b> $usuario[$contUsuario]\n";
	$cont++;
	$contUsuario++;
}

$sth->finish();
$dbh->disconnect();

print "<input type=button  class='login2 login-button' value='Ir al menu principal' onClick=location.href='../index.html'>";
print "</div>";
print "</PRE>";
print "</BODY>\n";
print "</HTML>\n";

