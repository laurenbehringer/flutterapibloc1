import 'dart:typed_data';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contact>? contacts;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContact();
  }

  void getContact() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      print(contacts);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pulsa",
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          //NewAppBar("Pulsa"),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField()),
          SizedBox(
            height: 20,
          ),
          (contacts == null)
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.builder(
                    itemCount: contacts!.length,
                    itemBuilder: (BuildContext context, int index) {
                      Uint8List? image = contacts![index].photo;
                      String num = (contacts![index].phones.isNotEmpty)
                          ? (contacts![index].phones.first.number)
                          : "--";
                      return ListTile(
                          leading: (contacts![index].photo == null)
                              ? const CircleAvatar(child: Icon(Icons.person))
                              : CircleAvatar(
                                  backgroundImage: MemoryImage(image!)),
                          title: Text(
                              "${contacts![index].name.first} ${contacts![index].name.last}"),
                          subtitle: Text(num),
                          onTap: () {
                            if (contacts![index].phones.isNotEmpty) {
                              launch('tel: ${num}');
                            }
                          });
                    },
                  ),
                ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
