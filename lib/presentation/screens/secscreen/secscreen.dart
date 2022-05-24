import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapibloc1/bloc/secscree/secscreen_bloc.dart';

class SecScreen extends StatefulWidget {
  const SecScreen({Key? key}) : super(key: key);

  @override
  State<SecScreen> createState() => _SecScreenState();
}

class _SecScreenState extends State<SecScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SecscreenBloc()/*..add(LoadSecscreenEvent(0))*/,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bloc Increment"),
        ),
        body: BlocBuilder<SecscreenBloc,SecscreenState>(
          builder: (context,state){
            if(state is SecScreenLoadingState){
              Future.delayed(Duration(seconds: 4), () {
               CircularProgressIndicator();
              });
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
                  onPressed: ()=> BlocProvider.of<SecscreenBloc>(context).add(LoadSecscreenEvent(0)),
                  child: Text("start"),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
