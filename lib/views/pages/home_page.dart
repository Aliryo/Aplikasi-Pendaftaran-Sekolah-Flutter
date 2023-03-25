import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Text('Pendaftaran');
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance
              .collection('pendaftaran')
              .snapshots()
              .listen((data) {
            print(data.docs[0]['nama']);
          });
        },
      ),
    );
  }
}
