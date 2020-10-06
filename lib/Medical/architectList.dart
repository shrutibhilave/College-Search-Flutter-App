import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';


class architectList extends StatefulWidget {
  @override
  _architectList createState() => _architectList();
}

class _architectList extends State<architectList> {

  String college;
  int i=1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,

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
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("${i++}. ",style: GoogleFonts.aBeeZee(fontSize: 15.0),),
                          Expanded(child: Text("${college=snap[index]['collegeName']}",style: GoogleFonts.aBeeZee(fontSize: 15.0,color: Colors.indigo),)),
                        ],
                      ),
                      subtitle:  Column(
                        children: <Widget>[
                          Align(
                              alignment: Alignment.topRight,
                              child: Text("${college=snap[index]['location']}",style: GoogleFonts.aBeeZee(fontSize: 15.0,fontWeight: FontWeight.w200),)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Text("Intake:${college=snap[index]['intake']}",style: GoogleFonts.aBeeZee(fontSize: 15.0,fontWeight: FontWeight.w200,color: Colors.red),),
                                Text("     Gov:${college=snap[index]['gov']}",style: GoogleFonts.aBeeZee(fontSize: 15.0,fontWeight: FontWeight.w200,color: Colors.green),),
                              ],
                            ),
                          ),
                        ],
                      ),
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
    String theUrl="http://sayaba.co.in/shruti/architectList.php";
    var res=await http.get(Uri.encodeFull(theUrl),headers: {"Accept":"application/json"});
    var responsBody=json.decode(res.body);

   // print(responsBody);


    return responsBody;
  }


}





