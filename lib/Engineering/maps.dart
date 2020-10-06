import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

class CollegeCard extends StatefulWidget {
  final String college;
  final String inst;
  final String district;
  final String type;
  final String gov;
  CollegeCard(this.college,this.inst,this.district,this.type,this.gov);
  @override
  _CollegeCardState createState() => _CollegeCardState();
}

class _CollegeCardState extends State<CollegeCard> {


  @override
  Widget build(BuildContext context) {
   // widget.college;
    return Scaffold(
      appBar: new AppBar(
        title: Expanded(child: new Text("${widget.college},",style: GoogleFonts.actor(fontSize: 20.0, fontWeight: FontWeight.w700),)),
        backgroundColor: Colors.indigo,
      ),


      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(child: Text(widget.college,style: TextStyle(fontSize: 20.0),)),
            ),
            Row(
              children: <Widget>[
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(child: Align(alignment: Alignment.topLeft,child: Text(widget.type,style: TextStyle(fontSize: 20.0,color: Colors.green),))),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(child: Align(alignment: Alignment.topLeft,child: Text(widget.gov,style: TextStyle(fontSize: 20.0,color: Colors.green),))),
            ),
              ],
            ),
           
            //Text(widget.district),

            // -------------------------------------------- table label------------------------------------------------
            Divider(color: Colors.grey,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(child: Align(
                      alignment: Alignment.center,
                      child: Text("Branches",style: GoogleFonts.aBeeZee(fontSize: 18.0,fontWeight: FontWeight.bold),))),
                //  Expanded(child: Align(alignment: Alignment.center, child: Text("Start Year",style: GoogleFonts.aBeeZee(fontSize: 18.0,fontWeight: FontWeight.bold),))),
                  Expanded(child: Align(alignment: Alignment.center, child: Text("Course Type",style: GoogleFonts.aBeeZee(fontSize: 18.0,fontWeight: FontWeight.bold),))),
                  Align(alignment: Alignment.center, child: Text("Intake",style: GoogleFonts.aBeeZee(fontSize: 18.0,fontWeight: FontWeight.bold),)),
                ],
              ),
            ),
            Divider(color: Colors.grey,),


            //------------------------------------------------------ data display-----------------------------------------
            Expanded(
              child: Scaffold(
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
                   
                    return ListView.builder(
                      itemCount: snap.length,
                      itemBuilder: (context,index){
                        return ListTile(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                          child: Text("${snap[index]['CourseName']} ",style: TextStyle(fontSize: 15.0,color: Colors.indigo),)),
                                    ),
                                   /*Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                          child: Text("${snap[index]['StartYear']}",style: TextStyle(fontSize: 15.0,color: Colors.grey,),)),
                                    ),*/
                                    Expanded(
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: Text("${snap[index]['CourseType']}",style: GoogleFonts.aBeeZee(fontSize: 15.0,color: Colors.blueGrey),)),
                                    ),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Text("${snap[index]['Intake']}",style: TextStyle(fontSize: 15.0,color: Colors.red),)),



                                  ],
                                ),


                                //subtitle: Text("${snap[index]['CourseName']}",style: TextStyle(fontSize: 15.0),),

                              );

                      }
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }


  getData() async{
    String theUrl="http://sayaba.co.in/shruti/collegeCard.php";
    var res=await http.post(Uri.encodeFull(theUrl),
        body: {
            //"college":widget.college,
            "inst":widget.inst,
        },
        headers: {"Accept":"application/json"});
    var responsBody=json.decode(res.body);

    print(responsBody);


    return responsBody;
  }
}
