import 'package:flutter/material.dart';
import 'package:gest/db/family.dart';
import 'package:gest/db/userdatabase.dart';

class insertct extends StatefulWidget {
  State<insertct> createState() => _insertct();
}

String type = "";
class _insertct extends State<insertct> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.teal,
        title: Text("create family"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Name"),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Name is required";
                  }
                  return null;
                },
                onChanged: (String? value) {
                  setState(() {
                    type = value.toString();
                  });
                },
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            Family ct = new Family(familyName: type) ;
                            userDatabase.instance.createFamily(ct);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("family created !")),
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