import 'package:flutter/material.dart';
import 'package:gest/db/component.dart';
import 'package:gest/db/userdatabase.dart';

class addcomponent extends StatefulWidget {
  State<addcomponent> createState() => _addcomponent();
}

String name = "";
String quantity="";
String date="";

var SelectedValue;
late List<String> myList;



class _addcomponent extends State<addcomponent> {
  final _formKey = GlobalKey<FormState>();


  final dbaHelper = userDatabase.instance;

  var SelectedValue;

  late List<String> myList;

  @override
  void initState(){
    super.initState();
    myList=[];
    _getCategory();
  }

  _getCategory() async {

    List<String> items=[];
    await dbaHelper.getAllCat().then((value) {
      for (var i = 0; i < value.length; i++) {
        items.add(value[i]['family_name']);
      }
    }
    );
    myList=items;
    setState(() {

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.teal,
        title: Text("create Component"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Component Name"),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Component Name is required";
                  }
                  return null;
                },
                onChanged: (String? value) {
                  setState(() {
                    name = value.toString();
                  });
                },
              ),


              TextFormField(
                decoration: InputDecoration(labelText: "Component quantity"),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Component quantity is required";
                  }
                  return null;
                },
                onChanged: (String? value) {
                  setState(() {
                    quantity = value.toString();
                  });
                },
              ),

              TextFormField(
                decoration: InputDecoration(labelText: "Component date"),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Component Name is required";
                  }
                  return null;
                },
                onChanged: (String? value) {
                  setState(() {
                    date = value.toString();
                  });
                },
              ),
              Container(
                  margin: EdgeInsets.all(30.0),
                  width: double.infinity,
                  child:DropdownButton<String>(
                    hint: Text('Select family'),
                    value: null,
                    onChanged:(newValue){
                      setState(() {
                        SelectedValue=newValue.toString();
                        print(SelectedValue);
                      });
                    },
                    items: myList.map<DropdownMenuItem<String>>((ValueItem){
                      return DropdownMenuItem<String>(
                          value: ValueItem,
                          child:Text(
                            ValueItem,
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )
                      );
                    }).toList(),
                  )
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            Component a = new Component(
                              componentName: name,
                              quantity: quantity,
                              date: date,

                            );
                            userDatabase.instance.createComponent(a);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("component created !")),
                            );
                            Navigator.pushNamed(context, '/logged');
                          },
                          child: const Text('submit'),
                        ),
                      ],
                    )),
              ),



            ],
          ),
        ),
      ),
    );
  }
}