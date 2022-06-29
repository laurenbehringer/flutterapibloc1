import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapibloc1/bloc/secscree/secscreen_bloc.dart';
import 'package:flutterapibloc1/presentation/routes/route_const.dart';

class SecScreen extends StatefulWidget {
  const SecScreen({Key? key}) : super(key: key);

  @override
  State<SecScreen> createState() => _SecScreenState();
}

class _SecScreenState extends State<SecScreen> {
  double value  = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Increment"),
        actions: [
          TextButton(
              onPressed: (){
            Navigator.pushNamed(context, redbankApiScreen);
          },
              child: Text("API", style: TextStyle(
                color: Colors.black
              ),))
        ],
      ),
      body: BlocBuilder<SecscreenBloc,SecscreenState>(
        builder: (context,state){
          if(state is SecScreenLoadingState){
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
                      onPressed: () => BlocProvider.of<SecscreenBloc>(context).add(
                          LoadSecscreenEvent(0)
                      ),
                      child: Text("Finish Loading")
                  )
                ],
              ),
            );
          }
          if(state is SecScreenLoadedState){
            return Column(
              children: [
                Text("Activity:   ${state.number}"),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () => BlocProvider.of<SecscreenBloc>(context).add(LoadSecscreenEvent(
                    state.number
                  )),
                  child: Icon(Icons.add),
                ),
              ],
            );
          }
          return Container(
            color: Colors.red,
            child: Center(
              child: ElevatedButton(
                onPressed: ()=> BlocProvider.of<SecscreenBloc>(context).add(LoadingSecScreenEvent()),
                child: Text("Start Loading"),
              ),
            ),
          );
        }
      ),
    );
  }
}


