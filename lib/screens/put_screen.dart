// ignore_for_file: prefer_const_literals_to_create_immutables,prefer_const_constructors_in_immutables, camel_case_types,prefer_const_constructors

import 'package:flutter/material.dart';

import '../services/http_services.dart';

class PutScreen extends StatefulWidget {
  const PutScreen({Key? key}) : super(key: key);

  @override
  State<PutScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<PutScreen> {
  CrudServices services = CrudServices();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
   // idController.dispose();
  }

  void showData() {
    services.putData(
       _titleController.text, _bodyController.text,  _idController.text);
    Future.delayed(Duration(seconds: 3), () {
      dialog();
    });
  }

  //
  void dialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
                margin: EdgeInsets.all(12),
                color: Colors.white70,
                height: 100,
                // width: 10,
                child: Center(
                    child: Text(
                  " status code : ${services.putDataStatus} \n at 1 index response code will be 200 which means success \n otherwise fail or some other reason \njudge according to status code ",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ))),
          );
        });
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('UPDATE'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 50,
              child: Text(
                  "According to Api's documentation this method is only valid for index 1 and others also"),
            ),
            SizedBox(
              height: 50,
              child: TextField(
                controller: _idController,
                decoration:
                    InputDecoration(hintText: 'enter id 1 for success status'),
              ),
            ),
            SizedBox(
              height: 50,
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(hintText: 'enter title'),
              ),
            ),
            SizedBox(
              height: 50,
              child: TextField(
                controller: _bodyController,
                decoration: InputDecoration(
                  hintText: 'enter body',
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  // services.putData(titleController.text, bodyController.text, idController.text
                  //    );
                  showData();
                },
                child: Text('Update')),
                SizedBox(
                  height: 100,
                ),
                Text("Please wait a moment")

          ],
        ));
  }
}
