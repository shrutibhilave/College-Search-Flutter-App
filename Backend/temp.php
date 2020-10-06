 <?php
 $array=array();
  array_push(
           $array,array(
               "collegeName"=>"engineering",
               "location"=>"2000",
			   "inst"=>"200",
			   "type"=>"no",
			   "gov"=>"gov",
               )
           );
         //  print($array);
 echo json_encode($array);
 ?>