import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapibloc1/bloc/home_bloc/home_bloc.dart';
import 'package:flutterapibloc1/data/services/activity_service.dart';
import 'package:flutterapibloc1/data/services/connectivity_service.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeBloc(
          RepositoryProvider.of<ActivityService>(context),
          RepositoryProvider.of<ConnectivityService>(context),
        )..add(LoadActivityApiEvent()),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Activity to do")
          ),
        body: BlocBuilder<HomeBloc,HomeState>(
            builder: (context, state){
              if(state is HomeLoadingState){
                return Center(
                    child: CircularProgressIndicator()
                );
              }
              if (state is HomeLoadedState){
                return Column(
                  children: [
                    Text("Activity:   ${state.activityName}"),
                    Text("Type:   ${state.activityType}"),
                    Text("Amount of People:   ${state.noParticipants.toString()}"),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () => BlocProvider.of<HomeBloc>(context).add(LoadActivityApiEvent()),
                      child: Wrap(
                        children: [
                          Text("Next"),
                        Icon(Icons.refresh)
                        ],
                      ),
                    ),
                  ],
                );
              }
              if (state is HomeNoConnectionState){
                return Center(
                  child: Text("No Internet"),
                );
              }
          return Container();
        }),
      ),
    );
  }
}