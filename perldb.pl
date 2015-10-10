#!/Applications/XAMPP/xamppfiles/bin/perl
#!/usr/bin/perl
#!/opt/local/bin/perl


#to know the path do "which perl"
#web address: http://localhost/cgi-bin/perldb2.pl
#web address: http://localhost/xampp/perldb2.pl

use DBI;

#Se imprimen las cabeceras
print "content-type: text/html\n\n";

print "<HTML>\n";
print "<HEAD>\n";
print "<TITLE>Resultado</TITLE>\n";
print "</HEAD>\n";
print "<BODY>\n";
print "<h2><center>Ejemplo de conexion a MySQL con script de Perl</center></h2>";
print "<PRE>";

#Se establece la cadena de conexión.
#Consulte los datos de la conexión en el panel de control
my ($servidor, $bd, $usuario, $passw) =
('127.0.0.1', 'mis-usuarios', 'root', 'root');
my $cadena="DBI:mysql:dbname=$bd; host=$servidor";

#Se realiza la conexión
my $dbh = DBI->connect($cadena,$usuario,$passw);

#Se ejecuta la consulta SQL
#IMPORTANTE: MySQL es sensible a mayúsculas/minúsculas en las consultas SQL.
#Esto quiere decir que las tablas "Personas" y "personas" son distintas.
my $SQL= "SELECT nombre,psswrd FROM usuarios";
my $sth = $dbh->prepare($SQL) or die "No puedo conectar a la base de datos";
$sth->execute;

#Se recorre la tabla y se muestran los datos
print "nombre\tpsswrd\n";
while (my $ref = $sth->fetchrow_arrayref) {
  print "$ref->[0]\t$ref->[1]\n";
}

#Se desconecta de la base de datos
$sth->finish();
$dbh->disconnect();

#Se escriben las csabeceras de fin
print "</PRE>";
print "</BODY>\n";
print "</HTML>\n";