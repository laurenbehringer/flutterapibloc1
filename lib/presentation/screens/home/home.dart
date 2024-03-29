import 'dart:convert';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:animations/animations.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutterapibloc1/bloc/bj_bloc/blackjackk_bloc.dart';
import 'package:flutterapibloc1/bloc/deviceInfo/deviceinfo_bloc.dart';
import 'package:flutterapibloc1/bloc/home_bloc/home_bloc.dart';
import 'package:flutterapibloc1/bloc/login/loginn_bloc.dart';
import 'package:flutterapibloc1/bloc/wildid/wildid_bloc.dart';
import 'package:flutterapibloc1/data/models/loginpost.dart';
import 'package:flutterapibloc1/data/services/network_handler.dart';
import 'package:flutterapibloc1/presentation/Paramater/login_parameter.dart';
import 'package:flutterapibloc1/presentation/routes/route_const.dart';
import 'package:flutterapibloc1/presentation/screens/blackjack/blackjack_screen.dart';
import 'package:flutterapibloc1/presentation/screens/trialstuff.dart';
import 'package:flutterapibloc1/presentation/utils/secure_storage.dart';
import 'package:shimmer/shimmer.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Person? person;
  final storage = new FlutterSecureStorage();
  NetworkHandler network = new NetworkHandler();
  LoginParameter loginParameter = LoginParameter();

  final AWOKA = NetworkHandler().redbankurl;
  final Woka = NetworkHandler.baseurl;
  final XD = NetworkHandler().Lmfao();

  /*final BannerAd myBanner = BannerAd(
    adUnitId: "ca-app-pub-4470830479308512/8705681839",
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );*/

  Vehicle car1 = Vehicle();
  Vehicle car2 = Vehicle();
  Vehicles car3 = Vehicles();
  Vehicles car4 = Vehicles();

  var key = encrypt.Key.fromUtf8('my32lengthsupersecretnooneknows1');
  final iv = IV.fromUtf8('put16characters!');

  late String encryptedWKWK = encryptMyData("WKWK");
  late String decryptedWKWK = decryptMyData(encryptedWKWK);

  @override
  void initState() {
    super.initState();
    /*myBanner.load();*/
    BlocProvider.of<WildidBloc>(context).add(LoadWildidApiEvent());
    BlocProvider.of<HomeBloc>(context).add(LoadActivityApiEvent());
    BlocProvider.of<DeviceinfoBloc>(context).add(LoadingDeviceEvent());
    //print("without equatable : ${car3 == car4}");
    //print("with equatable : ${car1 == car2}");

    print("this is wkwk encrypted");
    print(encryptedWKWK);

    print("this is wkwk decrypted");
    print(decryptedWKWK);
  }

//encrypt
  String encryptMyData(String text) {
    final e = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted_data = e.encrypt(text, iv: iv);
    return encrypted_data.base64;
  }

//dycrypt
  String decryptMyData(String text) {
    final e = Encrypter(AES(key, mode: AESMode.cbc));
    final decrypted_data = e.decrypt(Encrypted.fromBase64(text), iv: iv);
    return decrypted_data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, wildIdScreen);
            },
            icon: Icon(Icons.star)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, secScreen);
              },
              icon: Icon(Icons.add)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, buttontxt);
              },
              icon: Icon(Icons.add)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, txtfieldScreen);
              },
              icon: Icon(Icons.mail)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, draggableScreen);
              },
              icon: Icon(Icons.attach_money_outlined)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, blackjackhomeScreen);
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(seconds: 1), () {
            BlocProvider.of<WildidBloc>(context).add(LoadWildidApiEvent());
            BlocProvider.of<HomeBloc>(context).add(LoadActivityApiEvent());
            SecureStorage().readAll();
          });
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Text("Activity To Do", style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Container(
                color: Colors.pink,
                child:
                    BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                  if (state is HomeLoadingState) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.green,
                      ),
                    );
                  }
                  if (state is HomeLoadedState) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Activity:   ${state.activityName}"),
                          Text("Type:   ${state.activityType}"),
                          Text(
                              "Amount of People:   ${state.noParticipants.toString()}"),
                          SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () => BlocProvider.of<HomeBloc>(context)
                                .add(LoadActivityApiEvent()),
                            child: Wrap(
                              children: [Text("Next"), Icon(Icons.refresh)],
                            ),
                          ),
                          /*SizedBox(height: 40),
                              CachedNetworkImage(
                                imageUrl: "http://via.placeholder.com/350x150",
                                placeholder: (context, url) => CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              ),*/
                        ],
                      ),
                    );
                  }
                  if (state is HomeNoConnectionState) {
                    return Center(
                      child: Text("No Internet"),
                    );
                  }
                  return Container();
                }),
              ),
              SizedBox(height: 10),
              BlocBuilder<BlackjackkBloc, BlackjackkState>(
                builder: (context, state) {
                  if (state is BlackjackkShuffleLoaded) {
                    return Text(state.bjshuffle.deckId);
                  }
                  return Text("Picturess");
                },
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 180,
                color: Colors.orange,
                child: BlocBuilder<WildidBloc, WildidState>(
                  builder: (context, state) {
                    if (state is WildidLoadingState) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is WildidLoadedState) {
                      return ListView.builder(
                        itemCount: state.articles.length,
                        itemBuilder: (context, index) {
                          final articlestate = state.articles[index];
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Container(
                                  color: Colors.red,
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  child: Column(
                                    children: [
                                      Text("title ${articlestate.title}")
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    if (state is WildidNoConnectionState) {
                      return Center(
                        child: Text("No Internet"),
                      );
                    }
                    if (state is WildidLoadFailedState) {
                      return Center(
                        child: Text("Failed To Fetch Data From Server"),
                      );
                    }
                    return Text("OK");
                  },
                ),
              ),
              SizedBox(height: 10),
              /*Container(
                height: 60,
                width: 320,
                child: AdWidget(ad: myBanner),
                color: Colors.green,
              ),*/
              Text("Device Info", style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              BlocBuilder<DeviceinfoBloc, DeviceinfoState>(
                builder: (context, state) {
                  if (state is DeviceInfoLoading) {
                    return CircularProgressIndicator();
                  }
                  if (state is AndroidDeviceInfoState) {
                    return Container(
                      width: 300,
                      height: 100,
                      color: Colors.green,
                      child: Column(
                        children: [
                          Text("bruh"),
                          Text("Model Name :" +
                              state.androiddeviceInfo['manufacturer'] +
                              " " +
                              state.androiddeviceInfo['model']),
                          Text("Rooted? " + state.rootStatus),
                          Text("Android Version: " + state.androidVersion),
                        ],
                      ),
                    );
                  }
                  return Container(
                    width: 300,
                    height: 100,
                    color: Colors.green,
                    child: Column(
                      children: [
                        Text("bruh"),
                        Text("Model Name : None Found"),
                        Text("Rooted? None Found"),
                        Text("Android Version: None Found"),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 10),
              Text("Redbank Login", style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              BlocBuilder<LoginnBloc, LoginnState>(builder: (context, state) {
                if (state is LoginnLoading) {
                  return CircularProgressIndicator();
                }
                if (state is LoginnLoaded) {
                  return Container(
                    padding: const EdgeInsets.all(15),
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.lightBlue[100]),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Full Name: \t',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(state.person.fullName)
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Email: \t',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(state.person.email)
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Phone Num: \t',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(state.person.phonenum)
                          ],
                        )
                      ],
                    ),
                  );
                }
                return Text("Click Button to Login");
              }),
              ElevatedButton(
                  child: Text("Post"),
                  onPressed: () {
                    loginParameter.username = "admin";
                    loginParameter.password = "admin";
                    BlocProvider.of<LoginnBloc>(context)
                        .add(LoadingLoginEvent(loginParameter: loginParameter));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
