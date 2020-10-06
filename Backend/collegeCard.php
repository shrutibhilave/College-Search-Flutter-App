<?php
 include_once("conn.php");
 $inst=$_POST["inst"];
 $CollegeName="PICT";
// $inst="6006";
 $query="SELECT * FROM `branch_branch` WHERE `inst_code`='".$inst."'";
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
     // $array[]=$row;
       //echo json_encode($row);
       
       array_push(
           $array,array(
               "CourseName"=>$row['Course Name'],
               "StartYear"=>$row['Start Year'],
			   "Intake"=>$row['Intake'],
			   "Accreditation"=>$row['Accreditation'],
			   "CourseType"=>$row['Course Type'],
               )
           );
  }
  }
  
   echo json_encode($array);
  
//mysqli_free_result($result);
//mysqli_close($con);
 ?>
 