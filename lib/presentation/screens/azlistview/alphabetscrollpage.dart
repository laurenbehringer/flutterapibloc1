import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';

class AlphabetScrollPage2 extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String> onClickedItem;
  const AlphabetScrollPage2(
      {Key? key, required this.items, required this.onClickedItem})
      : super(key: key);

  @override
  State<AlphabetScrollPage2> createState() => _AlphabetScrollPage2State();
}

class _AlphabetScrollPage2State extends State<AlphabetScrollPage2> {
  List<_AZItem> items = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initList(widget.items);
  }

  Widget _buildListItem(_AZItem item) {
    final tag = item.getSuspensionTag();
    final offstage = !item.isShowSuspension;

    return Column(
      children: [
        Offstage(
          offstage: offstage,
          child: buildHeader(tag),
        ),
        ListTile(
          title: Text(item.title),
          onTap: () {
            widget.onClickedItem(item.title);
          },
        ),
      ],
    );
  }

  void initList(List<String> items) {
    this.items = items
        .map((item) => _AZItem(title: item, tag: item[0].toUpperCase()))
        .toList();
    SuspensionUtil.sortListBySuspensionTag(this.items);
    SuspensionUtil.setShowSuspensionStatus(this.items);
  }

  @override
  Widget build(BuildContext context) {
    return AzListView(
      padding: EdgeInsets.all(15),
      data: items,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _buildListItem(item);
      },
      //optional
      indexBarMargin: EdgeInsets.all(10),
      indexBarOptions: IndexBarOptions(
          needRebuild: true,
          indexHintAlignment: Alignment.centerRight,
          indexHintOffset: Offset(-20, 0),
          selectTextStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          selectItemDecoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.blue)),

      /* indexHintBuilder: (context, hint) {
        return Container(
          alignment: Alignment.center,
          width: 60,
          height: 60,
          decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          child: Text(
            hint,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
          ),
        );
      },*/
    );
  }
}

class _AZItem extends ISuspensionBean {
  final String title;
  final String tag;

  _AZItem({required this.title, required this.tag});

  @override
  String getSuspensionTag() => tag;
}

Widget buildHeader(String tag) {
  return Container(
    margin: EdgeInsets.only(right: 15),
    padding: EdgeInsets.only(left: 16),
    color: Colors.grey.shade300,
    height: 40,
    alignment: Alignment.centerLeft,
    child: Text(
      tag,
      softWrap: false,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}
