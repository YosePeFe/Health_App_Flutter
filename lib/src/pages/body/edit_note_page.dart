import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditNote extends StatefulWidget {
  DocumentSnapshot docToEdit;
  EditNote({this.docToEdit});

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  TextEditingController titulo = TextEditingController();
  TextEditingController contenido = TextEditingController();
  @override
  void initState() {
    titulo = TextEditingController(text: widget.docToEdit['titulo']);
    contenido = TextEditingController(text: widget.docToEdit['contenido']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
              onPressed: () {
                widget.docToEdit.reference.update({
                  'titulo': titulo.text,
                  'contenido': contenido.text
                }).whenComplete(() => Navigator.pop(context));
                /* ref.add({
                  'titulo': titulo.text,
                  'contenido': contenido.text
                }).whenComplete(() => Navigator.pop(context)); */
              },
              child: Text('Save')),
          FlatButton(
              onPressed: () {
                widget.docToEdit.reference
                    .delete()
                    .whenComplete(() => Navigator.pop(context));
                /* ref.add({
                  'titulo': titulo.text,
                  'contenido': contenido.text
                }).whenComplete(() => Navigator.pop(context)); */
              },
              child: Text('Delete'))
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
