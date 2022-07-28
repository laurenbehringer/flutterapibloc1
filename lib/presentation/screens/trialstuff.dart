import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:developer';
import 'dart:io' show Platform;
import 'package:equatable/equatable.dart';
import 'package:animations/animations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapibloc1/bloc/trial/trial_bloc.dart';
import 'package:flutterapibloc1/presentation/container_transition.dart';

class Trial extends StatefulWidget {
  const Trial({Key? key}) : super(key: key);

  @override
  State<Trial> createState() => _TrialState();
}

var ranval = 0.0;

class _TrialState extends State<Trial> {
  final obj = SingletonObj();
  final otherObj = SingletonObj();
  String name = "";
  Cats _cats = new Cats();
  Cows _cows = new Cows(age: "11");
  Cows _cowss = new Cows();

  /////////////////////////////////////////////////////
  static var sm = "sambal matah mantap";
  static var dj = "sambal daun orange";
  static var korek = "Sambal Korek Ayam";
  static var bawang = "Sambal Bawang Enakk";

  static List<int> zeroten = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  static List<int> tentwenty = [11, 12, 13, 14, 15, 16, 17, 18, 19, 20];

  Map<dynamic, String> description = {
    Sambal.Matah: sm,
    Sambal.DaunJeruk: dj,
    Sambal.Korek: korek,
    Sambal.Bawang: bawang
  };

  Map<dynamic, List<int>> hello = {
    Sambal.Matah: zeroten,
    Sambal.DaunJeruk: tentwenty
  };

  String randoname = "";

  //print(description[Sambal.Matah]);

//    for (var v in description.values) {
//     print(v);
//   }

  //description.forEach((k, v) => print(v));

  //////////////////////////////

  double _value = 0.0;

  @override
  void initState() {
    super.initState();

    print(obj == otherObj);
    obj.OKAY();
    otherObj.OKAY();
    print("spacer");

    print(hello[Sambal.Matah]);
    hello.forEach((k, v) => print(k));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text("Name"),
            onPressed: () {
              name = "LK";
            },
          ),
          ElevatedButton(
            child: Text("Dogs"),
            onPressed: () {
              Dogs _dogs1 = new Dogs(ConstShiz.url, "K9");
              print(_dogs1.name);
              _dogs1.name = "yoooooooo";
              print(_dogs1.name);
              Dogs(name, "Daschund").Bark();
            },
          ),
          ElevatedButton(
            child: Text("Meow"),
            onPressed: () {
              _cats.Meow();
              _cats.name = "felix";
              _cats.Meow();
            },
          ),
          ElevatedButton(
            child: Text("MOO"),
            onPressed: () {
              _cows.Moo();
              _cows.name = "bruh";
              _cows.Moo();
              _cows.age = "2";
              _cows.Moo();
            },
          ),
          ElevatedButton(
            child: Text("MOO"),
            onPressed: () {
              _cows.Moo();
              _cows.name = "bruh";
              _cows.Moo();
              _cows.age = "2";
              _cows.Moo();
            },
          ),
          SizedBox(height: 50),
          BlocConsumer<TrialBloc, TrialState>(
            listener: (context, state) {
              if (state is ChangeSliderValState) {
                _value = state.value;
              }
            },
            builder: (context, state) {
              return TweenAnimationBuilder<double>(
                // 1. add a Duration
                duration: Duration(milliseconds: 500),
                // 2. add a Tween
                tween: Tween(begin: 0.0, end: _value),
                // 3. add a child (optional)
                child: Container(width: 120, height: 120, color: Colors.red),
                // 4. add the buiilder
                builder: (context, value, child) {
                  // 5. apply some transform to the given child
                  return Transform.translate(
                    offset: Offset(value * 200 - 100, 0),
                    child: child,
                  );
                },
              );
            },
          ),
          SizedBox(height: 30),
          BlocConsumer<TrialBloc, TrialState>(
            listener: (context, state) {
              if (state is ChangeSliderValState) {
                _value = state.value;
              }
            },
            builder: (context, state) {
              return Slider.adaptive(
                  value: _value,
                  onChanged: (value1) => BlocProvider.of<TrialBloc>(context)
                      .add(ChangeSliderEvent(value1)));
            },
          ),
        ],
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

  void OKAY() {
    print("OKAY");
  }
}

class Dogs {
  String name, breed;

  Dogs(this.name, this.breed);

  void Bark() {
    print("woof! ${name}");
  }
}

class Humans {
  String name = "", age = "";

  Humans(this.name, this.age);

  void Bark() {
    print("woof! ${name}");
  }
}

class Cats {
  String? name;

  void Meow() {
    print("Meow! ${name}");
  }
}

class Cows {
  String name;
  String? age;

  Cows({this.name = "", this.age});

  void Moo() {
    print("Moo! ${name} I'm ${age} years old!");
  }
}

enum Sambal { Matah, DaunJeruk, Korek, Bawang }

class ConstShiz {
  static String url = "youtube.com";
}

enum Iphonemodel { iphonex, iphone11, iphone12 }

class Vehicle extends Equatable {
  String? type;
  String? year;

  Vehicle() {
    type = "Ford";
    year = "2018";
  }

  @override
  // TODO: implement props
  List<Object?> get props => [type, year];
}

class Vehicles {
  String? type;
  String? year;

  Vehicles() {
    type = "Ford";
    year = "2018";
  }
}
