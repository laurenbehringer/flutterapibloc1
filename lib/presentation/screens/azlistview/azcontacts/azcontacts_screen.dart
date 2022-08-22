import 'package:flutter/material.dart';
import 'package:flutterapibloc1/presentation/screens/azlistview/alphabetscrollpage.dart';

class AzContacts extends StatefulWidget {
  const AzContacts({Key? key}) : super(key: key);

  @override
  State<AzContacts> createState() => _AzContactsState();
}

class _AzContactsState extends State<AzContacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Az List From Contacts"),
      ),
    );
  }
}
