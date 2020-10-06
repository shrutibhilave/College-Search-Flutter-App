
  <?php

$hostname='localhost';
$username='gpdlpune_sayaba';
$password='Shruti@28';
$dbname='gpdlpune_sayaba';

//if(!$connect1 =mysqli_connect($hostname ,$username,$password, $dbname)) die("could not connect to database");



// old connection 
//echo("ganesh heee").$HTTP_SERVER_VARS['HTTP_HOST'];
if(!$connect1 = mysql_connect($hostname ,$username,$password)) die("could not connect to database");
if(!mysql_select_db($dbname,$connect1))
//showerror();
die("Database is currently Down");


//connecti
if(!$connect1 =mysqli_connect($hostname ,$username,$password, $dbname)) die("could not connect to database");

function  showerror()
{
die("Error ".mysql_errorno().":".mysql_error());
}
$thisFile = str_replace('\\', '/', __FILE__);
$docRoot = $_SERVER['DOCUMENT_ROOT'];
$webRoot  = str_replace(array($docRoot, 'conn.php'), '', $thisFile);
$srvRoot  = str_replace('conn.php', '', $thisFile);
define('WEB_ROOT', $webRoot);
define('SRV_ROOT', $srvRoot);
?>

