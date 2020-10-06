
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class aboutMe extends StatefulWidget {
  @override
  _aboutMeState createState() => _aboutMeState();
}

class _aboutMeState extends State<aboutMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (new AppBar(
        backgroundColor: Colors.indigo,
        title: Text("About Me",style: GoogleFonts.actor(fontSize: 25.0, fontWeight: FontWeight.w700,),),
      )),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10,20),
        child: ListView(children: <Widget>[
          Text("Shruti Bhilave",style: GoogleFonts.actor(fontSize: 25.0, fontWeight: FontWeight.w700,color: Colors.indigoAccent),),
           Text(""),
          Text("Contact me at: shrutibhilave28@gmail.com",style: GoogleFonts.actor(fontSize: 20.0,color: Colors.grey),),
           Text(""),
            Text(""),
             Text(""),
          Text("About Me ",style: GoogleFonts.actor(fontSize: 25.0, fontWeight: FontWeight.w700,color: Colors.indigoAccent),),
           Text(""),
          Text("Currently a student of Cummins College of Engineering, Pune ",style: GoogleFonts.actor(fontSize: 20.0,color: Colors.grey),),
          Text("Developed on Year : 2020",style: GoogleFonts.actor(fontSize: 15.0),),
          Text(""),
          Divider(color: Colors.grey),
          
 

        ],),
      ),
    );
  }
}