import 'dart:async';
import 'dart:typed_data';
import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutterapibloc1/bloc/secscree/secscreen_bloc.dart';
import 'package:flutterapibloc1/presentation/routes/route_const.dart';
import 'package:azlistview/azlistview.dart';

class SecScreen extends StatefulWidget {
  const SecScreen({Key? key}) : super(key: key);

  @override
  State<SecScreen> createState() => _SecScreenState();
}

class _SecScreenState extends State<SecScreen> {
  double value = 0;

  List<Contact>? contacts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getContact();
    BlocProvider.of<SecscreenBloc>(context).add(LoadContactEvent());
  }

  void getContact() async {
    if (await FlutterContacts.requestPermission()) {
      setState(() async {
        contacts = await FlutterContacts.getContacts(
            withProperties: true, withPhoto: true);
        print(contacts);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Increment"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, azlistviewScreen);
              },
              child: Text(
                "AZListView",
                style: TextStyle(color: Colors.black),
              )),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, redbankApiScreen);
              },
              child: Text(
                "API",
                style: TextStyle(color: Colors.black),
              )),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, contactsScreen);
              },
              child: Text(
                "Contacts",
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<SecscreenBloc, SecscreenState>(
            builder: (context, state) {
          if (state is SecScreenLoadingState) {
            print("bruh");
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  ElevatedButton(
                      onPressed: () => BlocProvider.of<SecscreenBloc>(context)
                          .add(LoadSecscreenEvent(0)),
                      child: Text("Finish Loading"))
                ],
              ),
            );
          }
          if (state is SecScreenLoadedState) {
            return Column(
              children: [
                Text("Activity:   ${state.number}"),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () => BlocProvider.of<SecscreenBloc>(context)
                      .add(LoadSecscreenEvent(state.number)),
                  child: Icon(Icons.add),
                ),
              ],
            );
          }
          if (state is SecScreenLoadContactState) {
            return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(children: [
                  ElevatedButton(
                    onPressed: () => BlocProvider.of<SecscreenBloc>(context)
                        .add(LoadingSecScreenEvent()),
                    child: Text("Start Loading"),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  Expanded(
                    child: AlphabetScrollPage(itemss: state.item),
                  )
                ]));
          }
          return Container(
            width: 200,
            height: 100,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Button"),
            ),
          );
        }),
      ),
    );
  }
}

class AlphabetScrollPage extends StatefulWidget {
  final List<Contact> itemss;
  const AlphabetScrollPage({Key? key, required this.itemss}) : super(key: key);

  @override
  State<AlphabetScrollPage> createState() => _AlphabetScrollPageState();
}

class _AZItem extends ISuspensionBean {
  final String title;
  final String tag;
  _AZItem({required this.title, required this.tag});

  @override
  String getSuspensionTag() => tag!;
}

class _AlphabetScrollPageState extends State<AlphabetScrollPage> {
  List<_AZItem> items = [];
  bool doneso = false;
  @override
  void initState() {
    super.initState();
    initList(widget.itemss);
  }

  void initList(List<Contact> items) {
    print('BRUH ' + items.length.toString());

    setState(() {
      this.items = items
          .map((item) => _AZItem(
              title: item.name.first, tag: item.name.first[0].toUpperCase()))
          .toList();
      doneso = true;
    });

    SuspensionUtil.sortListBySuspensionTag(this.items);
  }

  @override
  Widget build(BuildContext context) => AzListView(
        padding: EdgeInsets.all(15),
        data: items,
        itemCount: doneso ? items.length : 3,
        itemBuilder: (context, index) {
          if (index == 0) return Text("Man im dead");
          late _AZItem item = items[index];
          print(item.title[5]);
          return _buildListItem(item);
        },
        /*physics: BouncingScrollPhysics(),
        indexBarData: SuspensionUtil.getTagIndexList(items),
        indexHintBuilder: (context, hint) {
          return Container(
            alignment: Alignment.center,
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.blue[700]!.withAlpha(200),
              shape: BoxShape.circle,
            ),
            child: Text(hint,
                style: TextStyle(color: Colors.white, fontSize: 30.0)),
          );
        },
        indexBarMargin: EdgeInsets.all(10),*/
      );

  Widget _buildListItem(_AZItem item) {
    return ListTile(
      title: Text(item.title.toString()),
      /* onTap: () => widget.onClickedItem(Item.title),*/
    );
  }
}
