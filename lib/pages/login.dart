import 'package:flutter/material.dart';
import 'package:gest/db/user.dart';
import 'package:gest/db/userdatabase.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _login();
}

class _login extends State<login> {
  final _formKey = GlobalKey<FormState>();

  String _username = "";
  String phone = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.teal,
        title: Text("Login"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(40, 40, 40, 40),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Username"),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Username is required";
                  }
                  return null;
                },
                onChanged: (String? value) {
                  setState(() {
                    _username = value.toString();
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "password"),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "phone is required";
                  }
                  return null;
                },
                onChanged: (String? value) {
                  setState(() {
                    password = value.toString();
                  });
                },
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                child: Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            User ab = await userDatabase.instance
                                .getbyUsername(_username, password);
                            Navigator.pushNamed(context, '/logged');
                          },
                          child: const Text('sign in'),
                        ),
                        Text('new account ?'),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/singup');
                            },
                            child: Text("Singup"))
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
