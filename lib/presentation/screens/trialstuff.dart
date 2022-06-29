import 'package:flutter/material.dart';

class Trial extends StatefulWidget {
  const Trial({Key? key}) : super(key: key);

  @override
  State<Trial> createState() => _TrialState();
}

class _TrialState extends State<Trial> {
  final obj = SingletonObj();
  final otherObj = SingletonObj();
  String? name;
  final dog1 = Dogs("Daschund");

  /////////////////////////////////////////////////////
  static var sm = "sambal matah mantap";
  static var dj = "sambal daun orange";
  static var korek = "Sambal Korek Ayam";
  static var bawang = "Sambal Bawang Enakk";

  static List <int> zeroten = [
    0,1,2,3,4,5,6,7,8,9,10
  ];

  static List <int> tentwenty = [
    11,12,13,14,15,16,17,18,19,20
  ];

  Map <dynamic, String> description = {
    Sambal.Matah : sm,
    Sambal.DaunJeruk : dj,
    Sambal.Korek : korek,
    Sambal.Bawang : bawang
  };

  Map <dynamic, List<int>> hello = {
    Sambal.Matah : zeroten,
    Sambal.DaunJeruk : tentwenty
  };

  //print(description[Sambal.Matah]);

//    for (var v in description.values) {
//     print(v);
//   }

  //description.forEach((k, v) => print(v));

  //////////////////////////////

  @override
  void initState() {
    super.initState();

    print(obj == otherObj);
    obj.OKAY();
    otherObj.OKAY();
    print("spacer");

    print(hello[Sambal.Matah]);
    hello.forEach((k,v) => print(k));
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text("Name"),
              onPressed: (){
                name = "LK";
              },
            ),
            ElevatedButton(
              child: Text("OK"),
              onPressed: (){
                Dogs(name!).Bark();
                Dogs(ConstShiz.url);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SingletonObj {
  static SingletonObj? _instance;
  SingletonObj._internal() {
    _instance = this;
  }
  factory SingletonObj() => _instance ?? SingletonObj._internal();

  void OKAY(){
    print("OKAY");
  }

}

class Dogs{
  String name;
  Dogs(this.name);

   void Bark(){
    print("woof! ${name}");
  }
}

enum Sambal { Matah, DaunJeruk, Korek, Bawang }


class ConstShiz {

  static String url = "youtube.com";
}
