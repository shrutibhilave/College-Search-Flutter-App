<?php
include_once("conn.php");
 $query="SELECT * FROM `institute_info` WHERE `type`='B.Pharm' ORDER BY gov DESC ";

 
$connect1 = mysql_connect($hostname ,$username,$password);
mysql_select_db($dbname) or die ("canot connect to table");

$result1 = mysql_query("SET NAMES 'utf8'");
$result1 = mysql_query($query) or die("Query failed : " . mysql_error());
$srno=0;
 $array=array();
if(mysql_num_rows($result1)>0)
  {
       while ($row=@mysql_fetch_array($result1))
     {  

	  $Gov="";
     // $array[]=$row;
       //echo json_encode($row);
	   if($row['gov']=="Y")
	   {
		   $Gov="Government College";
	   }
	    if($row['gov']=="GA")
	   {
		   $Gov="Government - Aided College";
	   }
	    if($row['gov']=="N")
	   {
		   $Gov="Private College";
	   }
       
       array_push(
           $array,array(
               "collegeName"=>$row['Institute Name'],
               "location"=>$row['district'],
			   "inst"=>$row['inst_code'],
			   "type"=>$row['type'],
			   "gov"=> $Gov,
               )
           );
  }
  }
  echo json_encode($array);

?>