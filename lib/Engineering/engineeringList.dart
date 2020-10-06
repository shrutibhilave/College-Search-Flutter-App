import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:welcomeflutter/Engineering/maps.dart';
import 'package:flutter/cupertino.dart';
import 'package:welcomeflutter/Engineering/searchEngineeringColleges.dart';


class engineeringList extends StatefulWidget {
  @override
  _engineeringList createState() => _engineeringList();
}

class _engineeringList extends State<engineeringList> {

String college;
int i=1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      floatingActionButton: FloatingActionButton(
        heroTag: 'fsfth',
        backgroundColor: Colors.indigo,
        child: Icon(Icons.search,),
        onPressed: (){
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (BuildContext context)=>Search()));
        },
      ),



      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List snap=snapshot.data;

          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.hasError){
            return Center(
              child: Text(" Error !\n Poor network connection"),
            );

          }
          int i=1;
          return ListView.builder(

            itemCount: snap.length,
            itemBuilder: (context,index){
              return Card(
                //elevation: 2.0,
                //shadowColor: Colors.deepPurple,

                child: Material(
                  shadowColor: Colors.white,
                  color: Color.fromRGBO(242, 243, 244  , 0.5),

                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ListTile(

                      
                      title:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("${i++}. ",style: GoogleFonts.aBeeZee(fontSize: 15.0),),
                          Expanded
                          (child: Text("${college=snap[index]['collegeName']}",style: GoogleFonts.aBeeZee(fontSize: 15.0,color: Colors.indigo),)),
                          Icon((Icons.arrow_forward_ios),color: Colors.grey,),

                        ],
                      ),
                      subtitle:  Text("     ${college=snap[index]['location']}",style:GoogleFonts.aBeeZee(fontSize: 15.0,fontWeight: FontWeight.w200),),

                      onTap: (){
                        Navigator.of(context).push(CupertinoPageRoute(
                             builder: (BuildContext context)=>
                             CollegeCard(snap[index]['collegeName'],snap[index]['inst'],snap[index]['location'],snap[index]['type'],snap[index]['gov'],)));
                      },
                    ),
                  ),

                ),
              );
            },
          );
        },
      ),
    );
  }
  getData() async{
    String theUrl="http://sayaba.co.in/shruti/collegeList.php";
    var res=await http.get(Uri.encodeFull(theUrl),headers: {"Accept":"application/json"});
    var responsBody=json.decode(res.body);

    print(responsBody);


    return responsBody;
  }


  }







class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var district=['All','Akola','Amravati','Aurangabad','Beed','Bhandara','Buldhana','Chandrapur','Gadchiroli','Gondia','Hingoli','Jalgaon','Jalna','Kolhapur','Latur','Mumbai City','Mumbai Suburban','Nagpur','Nanded','Nandurbar','Nashik','Osmanabad','Parbhani','Pune','Raigad','Ratnagiri','Sangli','Satara','Sindhudurg','Solapur','Thane','Wardha','Washim','Yavatmal','Silvassa','Palghar'];
  var crrentDistrict='All';
  var type=['All','B.E','B.Tech'];
  var currentType='All';
  var  branch=[
    'All','Aeronautical Engineering','Agricultural Engineering','Architecture','Artificial Intelligence','Automobile Engineering','Bio Medical Engineering','Bio Technology','Chemical Engineering','Chemical Technology','Civil Engineering','Computer Engineering','Computer Science and Engineering','Computer Science and Information Technology','Computer Science and Technology','Computer Technology','Dyestuff Technology','Electrical and Electronics Engineering','Electrical and Instrumentation Engineering','Electrical Engg [Electrical and Power]','Electrical Engg[Electronics and Power]','Electrical Engineering','Electronics & Communication Engineering(Sandwich)','Electronics and Communication Engineering','Electronics and Communication Technology','Electronics and Computer Science','Electronics and Telecommunication Engg','Electronics Design Technology','Electronics Engineering','Environmental Engineering','Fibres and Textile Processing Technology','Food Engineering and Technology','Food Technology',
    'Hotel Management and Catring Technology','Industrial Engineering','Information Technology','Instrumentation and Control Engineering','Instrumentation Engineering','Man Made Textile Technology','Mechanical & Automation Engineering','Mechanical Engineering','Mechanical Engineering Automobile','Mechanical Engineering[Sandwich]','Mechatronics Engineering','Metallurgical Engineering','Mining Engineering','Oil and Paints Technology','Oil Fats and Waxes Technology','Oil Technology','Oil,Oleochemicals and Surfactants Technology','Paints Technology','Paper and Pulp Technology','Petro Chemical Engineering','Petro Chemical Technology','Pharmaceutical and Fine Chemical Technology','Pharmaceuticals Chemistry and Technology','Pharmacy','Plastic and Polymer Engineering','Plastic and Polymer Technology','Plastic Technology','Polymer Engineering and Technology','Printing and Packing Technology','Printing Engineering and Graphics Communication','Production Engineering','Production Engineering[Sandwich]',
    'Surface Coating Technology','Textile Chemistry','Textile Engineering (Fashion Technology)','Textile Engineering / Technology','Textile Plant Engineering','Textile Technology',

  ];
String dropdownValue = 'One';


  var currentBranch='All';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Search Engineering College",style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
                    children: <Widget>[


                    

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Text(""),
                              Text(""),
                               Text(""),
                              Text(""),
                              Text(""),
                              Text(""),
                             // ---------------   District Dropdown------------------
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Row(
                                  children: <Widget>[
                                    Text("District :",style: TextStyle(fontSize: 20.0,color: Colors.indigo),),
                                    DropdownButton<String>(
                                      items: district.map((String dropDownStringItem) {
                                        return DropdownMenuItem<String>(
                                          value: dropDownStringItem,
                                          child: Text(dropDownStringItem,style: TextStyle(fontSize: 20.0),),
                                        );
                                      }).toList(),

                                      onChanged: (String newValue){
                                        setState(() {
                                          this.crrentDistrict=newValue;
                                        });
                                      },
                                      value: crrentDistrict,
                                    ),
                                  ],
                                ),
                              ),

                               //----------------------- Type Dropdown------------------------
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Row(
                                  children: <Widget>[
                                    Text("Type :",style:TextStyle(fontSize: 20.0,color: Colors.indigo),),
                                    DropdownButton<String>(
                                      items: type.map((String dropDownStringItem) {
                                        return DropdownMenuItem<String>(
                                          value: dropDownStringItem,
                                          child: Text(dropDownStringItem,style: TextStyle(fontSize: 20.0),),
                                        );
                                      }).toList(),

                                      onChanged: (String newValue){
                                        setState(() {
                                          this.currentType=newValue;
                                        });
                                      },
                                      value: currentType,
                                    ),
                                  ],
                              ),
                               ),

                              //----------------------- Branch Dropdown------------------------

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                          Text("Engineering Branch :",style: TextStyle(fontSize: 20.0,color: Colors.indigo),
                                           ),
                                          DropdownButton<String>(
                                        items: branch.map((String dropDownStringItem) {
                                          return DropdownMenuItem<String>(
                                            value: dropDownStringItem,
                                            child: Text(dropDownStringItem,style: TextStyle(fontSize: 15.0),),
                                          );
                                        }).toList(),

                                        onChanged: (String newValue){
                                          setState(() {
                                            this.currentBranch=newValue;
                                          });
                                        },
                                        value: currentBranch,
                                      ),
                                      ],
                                    ),
                                   
                                    
                                    
                                  ],
                                ),
                              ),

                             

                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: RaisedButton(
                                  elevation: 8.0,
                                  color: Colors.green,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text("Search",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700,color: Colors.white),),
                                  ),
                                  onPressed: (){
                                    Navigator.of(context).push(CupertinoPageRoute(
                                        builder: (BuildContext context)=>searchEngineeringColleges(crrentDistrict,currentType,currentBranch)));
                                       

                                  },
                                ),
                              ),
                            ],
                          ),
                        ),


                      ),

                    ],
                  ),
              



      
    );
  }
}

