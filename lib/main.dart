import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:welcomeflutter/Engineering/engineeringList.dart';
import 'package:welcomeflutter/Medical/hotelManagementList.dart';
import 'package:welcomeflutter/Medical/pharmacyList.dart';
import 'package:welcomeflutter/Screen/SizeConfig.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:welcomeflutter/searchCollege.dart';
import 'Medical/architectList.dart';
import 'Medical/medicalList.dart';
import 'Screen/aboutMe.dart';
//By:Shruti Bhilave
// 7/06/2020           ---- lockdown mission completed -------
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(

      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'College List',
              color: Colors.indigo,
              home: MyMainPage(),
            );//krrp
          },
        );
      },
    );
  }//keep
}

class MyMainPage extends StatefulWidget {
  MyMainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> with SingleTickerProviderStateMixin{
  TabController tabController;
  bool isSearching=false;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: new AppBar(
       
        backgroundColor: Colors.indigo,
        title: !isSearching
            ? Text("College Information",style: GoogleFonts.actor(fontSize: 25.0, fontWeight: FontWeight.w700),)
            : TextField(
                onChanged: (value) {
                  search(value);
                                    Text(value);
                                     },
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                      hintText: "Search College Here",
                                      hintStyle: TextStyle(color: Colors.white)),
                        ),
                        actions: <Widget>[
                            isSearching
                                ? IconButton(
                                    icon: Icon(Icons.cancel),
                                    onPressed: () {
                                      setState(() {
                                        this.isSearching = false;
                                       // filteredCountries = countries;
                                      });
                                    },
                                  )
                                : IconButton(
                                    icon: Icon(Icons.search),
                                    onPressed: () {
                                      setState(() {
                                        this.isSearching = true;
                                      });
                                    },
                                  )
                          ],
                        ),
                       // drawer: drawerClass(),
                        backgroundColor: Colors.white,
   // body: engineeringList(),




                        body: Column(
                          children: <Widget>[

                            SizedBox(height: 1 * SizeConfig.heightMultiplier,),

                            SizedBox(height: 1 * SizeConfig.heightMultiplier,),
                            TabBar(
                                controller: tabController,
                                indicatorColor: Colors.green,
                                indicatorWeight: 3.0,
                                labelColor: Colors.black,
                                unselectedLabelColor: Colors.grey,
                                isScrollable: true,
                                tabs: <Widget>[
                                  Tab(
                                    child: Expanded(
                                      child: Text("Engineering", style: TextStyle(
                                          fontSize: 2.5 * SizeConfig.textMultiplier,
                                          fontFamily: 'OpenSans'
                                      ),),
                                    ),
                                  ),
                                  Tab(
                                    child: Text("MBBS", style: TextStyle(
                                        fontSize: 2.5 * SizeConfig.textMultiplier,
                                        fontFamily: 'OpenSans'
                                    ),),
                                  ),
                                  Tab(
                                    child: Text("Pharmacy", style: TextStyle(
                                        fontSize: 2.5 * SizeConfig.textMultiplier,
                                        fontFamily: 'OpenSans'
                                    ),),
                                  ),
                                  Tab(
                                    child: Text("Architect", style: TextStyle(
                                        fontSize: 2.5 * SizeConfig.textMultiplier,
                                        fontFamily: 'OpenSans'
                                    ),),
                                  ),
                                  Tab(
                                    child: Text("Hotel Management", style: TextStyle(
                                        fontSize: 2.5 * SizeConfig.textMultiplier,
                                        fontFamily: 'OpenSans'
                                    ),),
                                  ),
                                ]),
                            Expanded(
                              child: Container(
                                child: TabBarView(
                                    controller: tabController,
                                    children: <Widget>[
//                                      Text("1"),
//                                      Text("1"),
//                                      Text("1"),
//                                      Text("1"),
//                                      Text("1"),
                                      engineeringList(),
                                      medicalList(),
                                      pharmacyList(),
                                      architectList(),
                                      hotelManagementList(),


                                    ]),
                              ),
                            ),

                          ],
                        ),
                  
                        persistentFooterButtons: <Widget>[
                          Text("Developed By : Shruti Bhilave    ",style: GoogleFonts.actor(fontSize: 15.0, color: Colors.indigo,fontWeight: FontWeight.w700),),
                            IconButton(
                              icon: Icon(Icons.add), onPressed: () {
                                   Navigator.of(context).push(CupertinoPageRoute(
                                          builder: (BuildContext context)=>aboutMe()));
                              },
                            ),
                             
                          ],
                  
                      );
                    }
                  }
                  
                  void search(String value) {
                    print (value);
}

