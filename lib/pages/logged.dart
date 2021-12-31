import 'package:flutter/material.dart';
import 'package:gest/pages/addfamily.dart';
import 'package:gest/pages/addcomponent.dart';


import 'package:gest/db/family.dart';
import 'package:gest/db/userdatabase.dart';
void main()=>runApp(loged());
class loged extends StatefulWidget {
  final navigatorKey=GlobalKey<NavigatorState>();
  @override
  State<loged> createState() => _loged();
}

class _loged extends State<loged> {
  final navigatorKey=GlobalKey<NavigatorState>();
  final _formKey = GlobalKey<FormState>();




  final dbaHelper = userDatabase.instance;

  late List<Map<String, dynamic>>  myComp;

  @override
  void initState(){
    super.initState();
    myComp=[];
    _getComponents();
  }

  void _getComponents() async{

    final dbaHelper = userDatabase.instance;
    final allRows = await dbaHelper.getAllCat();
    myComp=allRows;
    setState(() {
    });
  }



  String _username = "";
  String phone = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner:false,
        navigatorKey:navigatorKey,
        home: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              //backgroundColor: Colors.teal,
              title: Text("logged"),
              actions: <Widget>[
              PopupMenuButton(
              itemBuilder: (context) => [
              PopupMenuItem(
               child: Text("new family"),
                value: 1,
               ),
              PopupMenuItem(
              child: Text("new component"),
              value: 2,
              )
              ],

                  onSelected: (int menu){
                    if (menu==1){
                      navigatorKey.currentState!.push(MaterialPageRoute(
                          builder: (content)=>insertct()));
                    }
                    if (menu==2){
                      navigatorKey.currentState!.push(MaterialPageRoute(
                          builder: (content)=>addcomponent()));
                    }
                  },),


              ],
            ),
            body: Center(
                child: Column(children: [
                  Text("you are logged in"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: Text("logout"))
                ]
                )
            )
        )
    );
  }
}
