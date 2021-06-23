import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  TextEditingController titulo = TextEditingController();
  TextEditingController contenido = TextEditingController();
  CollectionReference ref = FirebaseFirestore.instance.collection('notas');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
              onPressed: () {
                ref.add({
                  'titulo': titulo.text,
                  'contenido': contenido.text
                }).whenComplete(() => Navigator.pop(context));
              },
              child: Text('Save')),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: titulo,
                decoration: InputDecoration(hintText: 'Title'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: contenido,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(hintText: 'Content'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
