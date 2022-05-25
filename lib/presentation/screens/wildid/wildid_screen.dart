import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapibloc1/bloc/home_bloc/home_bloc.dart';
import 'package:flutterapibloc1/bloc/wildid/wildid_bloc.dart';
import 'package:flutterapibloc1/data/services/activity_service.dart';
import 'package:flutterapibloc1/data/services/connectivity_service.dart';
import 'package:flutterapibloc1/data/services/wildid_service.dart';
import 'package:flutterapibloc1/presentation/routes/route_const.dart';

class WildId extends StatelessWidget {
  const WildId({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wildid"),
      ),
      body: BlocBuilder<WildidBloc,WildidState>(
          builder: (context, state){
            if(state is WildidLoadingState){
              return Center(
                  child: CircularProgressIndicator()
              );
            }
            if (state is WildidLoadedState){
              return ListView.builder(
                itemCount: state.articles.length,
                  itemBuilder: (context, index){
                  final articlestate = state.articles[index];
                    return Padding(
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
                    );
                  },
              );
            }
            if (state is WildidNoConnectionState){
              return Center(
                child: Text("No Internet"),
              );
            }
            return Container();
          }),
    );
  }
}
