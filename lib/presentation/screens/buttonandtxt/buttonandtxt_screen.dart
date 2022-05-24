import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapibloc1/bloc/buttontxt/buttontxt_bloc.dart';
import 'package:flutterapibloc1/bloc/home_bloc/home_bloc.dart';

class ButtonTextScreen extends StatefulWidget {
  const ButtonTextScreen({Key? key}) : super(key: key);

  @override
  State<ButtonTextScreen> createState() => _ButtonTextScreenState();
}

class _ButtonTextScreenState extends State<ButtonTextScreen> {
  var number = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Increment"),
      ),
      body: BlocConsumer<ButtontxtBloc, ButtontxtState>(builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(number.toString()),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<ButtontxtBloc>(context).add(
                      Increment(
                        number,
                      ),
                    );
                  },
                  child: Text("Change Above Text"),
                )
              ],
            ),
          );
        },
        listener: (context,state){
          if (state is ButtonTxtLoadingState) {
            CircularProgressIndicator();
          }
          else if(state is IncrementSuccessState){
            number = state.number;
          }
        },
      ),
    );
  }
}
