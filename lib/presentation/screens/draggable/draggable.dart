import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class DraggableScreen extends StatefulWidget {
  const DraggableScreen({Key? key}) : super(key: key);

  @override
  State<DraggableScreen> createState() => _DraggableScreenState();
}

class _DraggableScreenState extends State<DraggableScreen> {
  final Map<String, Color> color = {
    "blue": Colors.blue,
    "purple": Colors.purple,
    "yellow": Colors.yellow,
    "pink": Colors.pink,
    "teal": Colors.teal,
    "orange": Colors.orange
  };

  Color? selectedcolor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getStoredColor();
  }

  void _setColor(String colorName, Color colors) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('color', colorName);
    setState(() {
      selectedcolor = colors;
    });
  }

  void _getStoredColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? colorName = prefs.getString('color');
    setState(() {
      selectedcolor = color[colorName];
    });
    print(color["orange"]);
  }

  @override
  Widget build(BuildContext context) {
    print(color["blue"]);
    return Scaffold(
        appBar: AppBar(
          title: Text(Platform.operatingSystem),
          centerTitle: true,
          backgroundColor: selectedcolor ?? Colors.black,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var entry in color.entries)
              Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: entry.value,
                    minimumSize: Size(300, 60),
                  ),
                  child: Text(entry.key),
                  onPressed: () => _setColor(entry.key, entry.value),
                ),
              )
          ],
        ));
  }
}
