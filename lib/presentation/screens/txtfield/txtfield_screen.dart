import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapibloc1/bloc/txtfield/txtfield_bloc.dart';
import 'package:flutterapibloc1/presentation/Shared%20Widgets/detailPayment.dart';
import 'package:flutterapibloc1/presentation/routes/route_const.dart';
import 'package:flutterapibloc1/presentation/utils/sharedpreferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Txtfield extends StatefulWidget {
  const Txtfield({Key? key}) : super(key: key);
  @override
  State<Txtfield> createState() => _TxtfieldState();
}

class _TxtfieldState extends State<Txtfield>{
  TextEditingController _username = new TextEditingController(),
      _password = new TextEditingController();
  
  String? tokenValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }

  void getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    tokenValue = pref.getString('token');
    setState(() {});
  }


  Widget _detail(){
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 250,
        color: Colors.green,
        child: Column(
        children: [
          Text(_username.text),
          Text(_password.text),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(txtfield2Screen);
            },
            child: Text("OK"),
          )
        ],
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Txtfield"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              color: Colors.pink,
              child: Center(child: Text("Bruh EPIC THIS IS NOT CHANGING!!! XD", style: TextStyle(color: Colors.white))),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
              width: 200,
              color: Colors.yellow,
              child: tokenValue == null ? Text("No notes") : Text(tokenValue.toString())),
          SizedBox(height: 20),
          BlocBuilder<TxtfieldBloc, TxtfieldState>(
            builder: (context, state){
              if (state is TxtfieldInitial) {
                return Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: _username,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "Username"
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _password,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "Password"
                        ),
                      ),
                      SizedBox(height: 30),
                      Text("Username: ${state.initUsername}\nPassword: ${state.initPassword}\n"),
                      ElevatedButton(
                          onPressed: () {
                            SPHandler.setToken2(_password.text);
                            if (!_password.text.isEmpty) {
                              BlocProvider.of<TxtfieldBloc>(context).add(
                                /*LoadingTxtfieldEvent()*/
                                  LoadTxtfieldEvent(
                                      _username.text, _password.text, _detail(),
                                      ));
                              Navigator.of(context).pushReplacementNamed(
                                  txtfield2Screen);
                            }
                          },
                          child: Text("Send")
                      ),

                    ],
                  ),
                );
              };
              if (state is TxtfieldLoading){
                return Container(
                  padding: EdgeInsets.all(30),
                  color: Colors.orangeAccent,
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      ElevatedButton(
                          onPressed: (){
                            // BlocProvider.of<TxtfieldBloc>(context).add(
                            //   LoadTxtfieldEvent(_username.text,_password.text)
                            // );
                            detailPayment(context, _detail());
                          }, child: Text("k"))
                    ],
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
