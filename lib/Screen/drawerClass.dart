/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:welcomeflutter/main.dart';
class drawerClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Drawer(
        child: Container(
          color: Colors.indigo,
          child: new ListView(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: new UserAccountsDrawerHeader( accountEmail: Text("",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
                  currentAccountPicture: GestureDetector(
                      child: Container(
                        height: 10,
                      )
                  ),
                  decoration: new BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
              ),
              Divider(color: Colors.lightBlueAccent,),

              InkWell(
                onTap: (){
                  Navigator.of(context).push(CupertinoPageRoute(
                        builder: (BuildContext context)=>  MyMainPage()));
                
                },
                child: ListTile(
                  title: Text('Home Page',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                  leading: Icon(Icons.home,color: Colors.lightBlueAccent),

                ),
              ),

              InkWell(
                onTap: (){
                   Navigator.of(context).push(CupertinoPageRoute(
                        builder: (BuildContext context)=>  MyMainPage()));
                },
                child: ListTile(
                  title: Text('Engineering',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                  //leading: Icon(Icons.person,color: Colors.lightBlueAccent),

                ),
              ),

              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Medical',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                  //leading: Icon(Icons.shopping_basket,color: Colors.lightBlueAccent),

                ),
              ),

              InkWell(
                onTap: (){ },
                child: ListTile(
                  title: Text('Shopping Cart',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                  leading: Icon(Icons.shopping_basket,color: Colors.lightBlueAccent),
                ),
              ),

              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Favourite',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                  leading: Icon(Icons.favorite,color: Colors.pink ,),
                ),
              ),

              Divider(color: Colors.lightBlueAccent,),

              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Settings',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                  leading: Icon(Icons.settings,color: Colors.lightBlueAccent),
                ),
              ),

              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('About',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                  leading: Icon(Icons.home,color: Colors.lightBlueAccent),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/