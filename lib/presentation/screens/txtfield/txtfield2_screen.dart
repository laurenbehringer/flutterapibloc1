import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapibloc1/bloc/txtfield/txtfield_bloc.dart';

class Txtfield2 extends StatefulWidget {
  const Txtfield2({Key? key}) : super(key: key);

  @override
  State<Txtfield2> createState() => _Txtfield2State();
}

class _Txtfield2State extends State<Txtfield2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("txtfield screen 2"),
      ),
      body: Container(
        color: Colors.purple,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: BlocBuilder<TxtfieldBloc, TxtfieldState>(
          builder: (context, state) {
            if (state is TxtfieldInitial) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Username: ${state.initUsername}"),
                  Text("Password: ${state.initPassword}"),
                  SizedBox(height: 30),
                  state.widget
                ],
              );
            }
            return Container(

            );
          },
        ),
      ),
    );
  }
}
