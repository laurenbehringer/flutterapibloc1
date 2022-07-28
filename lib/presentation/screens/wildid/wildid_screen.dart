import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapibloc1/bloc/wildid/wildid_bloc.dart';
import 'package:flutterapibloc1/data/services/connectivity_service.dart';
import 'package:flutterapibloc1/presentation/routes/route_const.dart';
import 'package:shimmer/shimmer.dart';

class WildId extends StatefulWidget {
  @override
  State<WildId> createState() => _WildIdState();
}

class _WildIdState extends State<WildId> {
  ConnectivityService _connectivityService = ConnectivityService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<WildidBloc>(context).add(LoadWildidApiEvent());
    _connectivityService.connectivityStream.stream.listen((event) {
      if (event == ConnectivityResult.none){
        print(event);
        BlocProvider.of<WildidBloc>(context).add(NoConnectionEvent());
      }
      else{
        print(event);
        BlocProvider.of<WildidBloc>(context).add(LoadWildidApiEvent());
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    // final _testService = useState(ConnectivityService());
    return Scaffold(
      appBar: AppBar(
        title: Text("Wildid"),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushNamed(context, aliceScreen);
              },
              icon: Icon(Icons.account_balance_wallet_outlined)),
          IconButton(
              onPressed: (){
                Navigator.pushNamed(context, trialScreen);
              },
              icon: Icon(Icons.account_balance_wallet_outlined))
        ],
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.blueAccent,
            child: Center(child: Text("title"))
          ),

          Expanded(
            child: BlocBuilder<WildidBloc,WildidState>(
                builder: (context, state){
                  if(state is WildidLoadingState){
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.green,
                      ),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                  if (state is WildidLoadFailedState){
                    return Center(
                      child: Text("Failed To Fetch Data From Server"),
                    );
                  }
                  return Container(
                    child: Text("ga kebaca state"),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
