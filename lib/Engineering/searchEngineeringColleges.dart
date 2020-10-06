import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:welcomeflutter/Engineering/maps.dart';
import 'package:flutter/cupertino.dart';
import 'package:welcomeflutter/Screen/noSuchEntry.dart';

import 'engineeringList.dart';

class searchEngineeringColleges extends StatefulWidget {
  final String crrentDistrict;
  final String currentType;
  final String currentBranch;
  searchEngineeringColleges(this.crrentDistrict,this.currentType,this.currentBranch);

  @override
  _searchEngineeringCollegesState createState() => _searchEngineeringCollegesState();
}

class _searchEngineeringCollegesState extends State<searchEngineeringColleges> {
  String college;
  var condition="";
  int i=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Row(
          children: <Widget>[
            Expanded
            (child: new Text("${widget.currentBranch}, ",style: GoogleFonts.actor(fontSize: 25.0, fontWeight: FontWeight.w700),)),
            Expanded(child: new Text("${widget.crrentDistrict}",style: GoogleFonts.actor(fontSize: 25.0, fontWeight: FontWeight.w700),)),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(icon: Icon(Icons.search),
                onPressed: (){
                  // Navigator.of(context).push(CupertinoPageRoute(
                  // builder: (BuildContext context)=>searchCollege()));
                },),
            )
          ],
        ),
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Colors.white,
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
              child: Text("Error"),
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
                      subtitle:  Text("     ${college=snap[index]['location']}",style: GoogleFonts.aBeeZee(fontSize: 15.0,fontWeight: FontWeight.w200),),

                      onTap: (){
                        if(condition!="No such entry")
                        {
                        Navigator.of(context).push(CupertinoPageRoute(
                             builder: (BuildContext context)=>
                             CollegeCard(snap[index]['collegeName'],snap[index]['inst'],snap[index]['location'],snap[index]['type'],snap[index]['gov'],)));
                        }
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
    String theUrl="http://sayaba.co.in/shruti/engineeringCollegeSearch.php";
    var res=await http.post(Uri.encodeFull(theUrl),
        body: {
          "District":widget.crrentDistrict,
          "Type":widget.currentType,
          "Branch":widget.currentBranch,
          
        },
        headers: {"Accept":"application/json"});
    var responsBody=json.decode(res.body);
    if(responsBody.toString()=="[{data: does not exist}]")
      {
        condition="No such entry";
         //Navigator.of(context).push(CupertinoPageRoute(
         //builder: (BuildContext context)=>noSuchEntry(widget.currentBranch,widget.crrentDistrict)));
                                     
      }
    return responsBody;
  }


  }


