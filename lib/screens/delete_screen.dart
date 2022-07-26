// ignore_for_file: prefer_const_literals_to_create_immutables,prefer_const_constructors_in_immutables, camel_case_types,prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:great_fut_tech_crud/services/http_services.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({Key? key}) : super(key: key);

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  TextEditingController _idController = TextEditingController();
  CrudServices services = CrudServices();

  bool showIndicator = true;

  void indicator() {
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        showIndicator = false;
      });
    });
  }

  void showData() {
    services.deleteDate(_idController.text);
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
                  " status code : ${services.deleteDataStatus} \n at 0 index response code will be 200 which means success \n otherwise fail or some other reason \njudge according to status code ",
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
        title: Text('DELETE'),
      ),
      body: Column(
        children: [
          Text(
            'According to documentation of the Api delete post method is only valid for id 0 , and as we know to delete a post only id is required ',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(
              height: 50,
              child: TextField(
                controller: _idController,
                decoration: InputDecoration(
                    hintText: 'enter userId 0 for success status'),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(1),
                ],
              )),
          ElevatedButton(
            onPressed: () {
              showData();
            },
            child: Text('Delete'),
          ),
          SizedBox(
            height: 100,
          ),
          Text('please wait for response ')
        ],
      ),
    );
  }
}
