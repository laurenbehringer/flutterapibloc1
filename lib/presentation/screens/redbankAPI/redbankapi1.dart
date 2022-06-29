import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapibloc1/bloc/verifyuser_cifnum/verify_cifnum_bloc.dart';
import 'package:flutterapibloc1/data/services/network_handler.dart';

class RedbankApi extends StatefulWidget {
  const RedbankApi({Key? key}) : super(key: key);

  @override
  State<RedbankApi> createState() => _RedbankApiState();
}

class _RedbankApiState extends State<RedbankApi> {

  @override
  void initState() {
    super.initState();
    //NetworkHandler.PostDoRegistration();
    //NetworkHandler.PostInquiryRegistration();
    NetworkHandler.PostVerifyUserCifnum();
    BlocProvider.of<VerifyCifnumBloc>(context).add(LoadingVerifyCifnumEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Redbank API's"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 300,
              color: Colors.yellow,
              padding: EdgeInsets.all(10),
              child: BlocBuilder<VerifyCifnumBloc, VerifyCifnumState>(
                builder: (context, state) {
                  if (state is VerifyCifnumLoadingState){
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is VerifyCifnumLoadedState){
                    return Column(
                      children: [
                        Text("Name:\t"+state.verifUserCifNum.fullName),
                        Text("Cif Num:\t"+state.verifUserCifNum.cifNum),
                        Text("Activation Code:\t"+state.verifUserCifNum.activationCode),
                        Text("Phone Number:\t"+state.verifUserCifNum.phonenumber),
                        Text("Session ID:\t"+ state.verifUserCifNum.sessionId),
                        Text("WA No:\t"+ state.verifUserCifNum.waNumber),
                        Text("Email:\t"+ state.verifUserCifNum.emailAddress),
                      ],
                    );
                  }

                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
