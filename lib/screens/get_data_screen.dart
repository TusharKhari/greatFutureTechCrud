import 'package:flutter/material.dart';
import 'package:great_fut_tech_crud/services/http_services.dart';
// ignore_for_file: prefer_const_literals_to_create_immutables,prefer_const_constructors_in_immutables, camel_case_types,prefer_const_constructors

class DataScreen extends StatefulWidget {
  DataScreen({Key? key}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  CrudServices services = CrudServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DATA'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: services.getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                      itemCount: services.data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text('ID :'),
                                Text(
                                  services.data[index]['id'].toString(),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('TITLE :'),
                                Text(
                                  services.data[index]['title'].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('BODY :'),
                                Text(
                                  services.data[index]['body'].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 9,
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}
