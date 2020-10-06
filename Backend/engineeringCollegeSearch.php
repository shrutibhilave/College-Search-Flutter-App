<?php
include_once("conn.php");

  //connection
  $district=$_POST["District"];
  $type=$_POST["Type"];
  $branch=$_POST["Branch"];

 
 $condition1="";
 if($district=="All" && $type!="All" && $branch!="All")
 {
	 $condition1=" institute_info.type='".$type."' AND Course Name='".$branch."'";
 }else{
		if($district!="All" && $type=="All" && $branch!="All")
		{
			$condition1=" institute_info.district= '".$district."' AND Course Name= '".$branch."' ";
		}else{
				if($district!="All" && $type!="All" && $branch=="All")
					 {
						 $condition1="  institute_info.district= '".$district."' AND institute_info.type='".$type."'";
					 }else{
						 if($district=="All" && $type=="All"&& $branch!="All")
						 {
							 $condition1="Course Name= '".$branch."'";
						 }else{
							 if($district=="All" && $type!="All"&& $branch=="All")
						 {
							 $condition1=" AND institute_info.type='".$type."'";
						 }else{
							 if($district!="All" && $type=="All"&& $branch=="All")
						 {
							 $condition1=" institute_info.district='".$district."'";
						 }else{
							 if($district!="All" && $type!="All"&& $branch!="All")
							 {
								$condition1="institute_info.district='".$district."' AND institute_info.type='".$type."' AND `Course Name`='".$branch."'";
						 }else
						 {
							 $condition1="1";
						 }
						 }
						 }
						 }
					 }
			}
 }


  

 
  
  $query="SELECT * FROM branch_branch INNER JOIN institute_info ON institute_info.inst_code=branch_branch.inst_code WHERE ".$condition1."";
 
 
$connect1 = mysql_connect($hostname ,$username,$password);
mysql_select_db($dbname) or die ("canot connect to table");

$result1 = mysql_query("SET NAMES 'utf8'");
$result1 = mysql_query($query) or die("Query failed : " . mysql_error());
$srno=0;
 $array=array();
 
 
  
 if(mysql_num_rows($result1)==0)
  {
	   array_push(
           $array,array(
			   "data"=>"does not exist",
               )
           );
  }
  else{

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
			   "gov"=>$Gov, 
               )
           );
  }
  }
 
  echo json_encode($array);

?>