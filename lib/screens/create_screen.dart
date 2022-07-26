// ignore_for_file: prefer_const_literals_to_create_immutables,prefer_const_constructors_in_immutables, camel_case_types,prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:great_fut_tech_crud/services/http_services.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  CrudServices services = CrudServices();
  TextEditingController _userIdController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();

  void showData() {
    services.createData(
       _titleController.text, _bodyController.text,  _userIdController.text);
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
                  " status code : ${services.createDataStatus} \n if response is 200, which means success \n otherwise fail or some other reason \njudge according to status code ",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ))),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CREATE'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 50,
              child: TextField(
                controller: _userIdController,
                decoration: InputDecoration(hintText: 'enter userId 0 or 1'),
                inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(1),
                              ],
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
                decoration: InputDecoration(hintText: 'enter body', ),
                 
              ),
            ),
            ElevatedButton(
                onPressed: showData,
                child: Text('Create'))
          ],
        ));
  }
}
