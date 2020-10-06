import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class noSuchEntry extends StatelessWidget {
  final String branch;

  final String district;
 
  noSuchEntry(this.branch,this.district,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: new AppBar(
        title: Row(
          children: <Widget>[
            Expanded
            (child: new Text("$branch, ",style: GoogleFonts.actor(fontSize: 25.0, fontWeight: FontWeight.w700),)),
            Expanded(child: new Text("$district",style: GoogleFonts.actor(fontSize: 25.0, fontWeight: FontWeight.w700),)),
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
      body: Container(
        child: Text("No such entry"),
      ),
    );
  }
}