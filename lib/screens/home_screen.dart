import 'package:flutter/material.dart';
import 'package:great_fut_tech_crud/screens/create_screen.dart';
import 'package:great_fut_tech_crud/screens/delete_screen.dart';
import 'package:great_fut_tech_crud/screens/get_data_screen.dart';
import 'package:great_fut_tech_crud/screens/put_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('C R U D'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Api source : https://jsonplaceholder.typicode.com ',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CreateScreen()));
              },
              child: const Text("Create/Post"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DataScreen()));
              },
              child: const Text("Read/Get"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const PutScreen()));
              },
              child: const Text("Update/Put"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DeleteScreen()));
              },
              child: const Text("Delete/Delete"),
            ),
          ],
        ),
      ),
    );
  }
}
