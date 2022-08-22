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
  bool username = false, password = false, isHidden = true;
  var anyaCount = 0;
  // var number = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BlocConsumer Increment"),
      ),
      body: BlocConsumer<ButtontxtBloc, ButtontxtState>(
        builder: (context, state) {
          if (state is ButtonTxtLoadingState) {
            return CircularProgressIndicator();
          }

          if (state is IncrementSuccessState) {
            return body(state.number);
          }

          return body(0);
        },
        listener: (context, state) {
          if (state is ButtonTxtLoadingState) {
            Future.delayed(Duration(seconds: 1), () {
              BlocProvider.of<ButtontxtBloc>(context).add(
                Increment(
                  state.number,
                ),
              );
            });
          }
        },
      ),
    );
  }

  Widget body(int number) {
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
                LoadButtontxtEvent(
                  number,
                ),
              );
            },
            child: Text("Increment"),
          ),
          SizedBox(
            height: 30,
          ),
          Stack(
            children: [
              customPasswordTextfield(context,
                  isHidden: isHidden,
                  pressed: () => setState(() {
                        isHidden = !isHidden;
                      }),
                  changed: (val) {
                    setState(() {
                      anyaCount = val.toString().length;
                    });
                  }),
              Positioned(
                bottom: 15,
                child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(right: 30, left: 15),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: anyaCount,
                      itemBuilder: (context, index) {
                        return Center(child: Image.asset('assets/secret.png'));
                      }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void _noAction() {}

TextField customPasswordTextfield(
  BuildContext context, {
  //TextFieldController textFieldController = const TextFieldController;
  required Function pressed,
  Function changed = _noAction,
  isHidden = false,
  labelText = "",
}) {
  return TextField(
    obscureText: isHidden,
    showCursor: false,
    maxLength: 10,
    //controller: textFieldController,
    style: TextStyle(color: Colors.transparent),
    decoration: InputDecoration(
      /*border: OutlineInputBorder(
          borderSide: const BorderSide(color: ThemeColors.redbankRed, width: 5),
        ),*/
      counterText: "",
      enabledBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.grey),
      ),
      labelText: labelText,
      suffixIcon: IconButton(
          onPressed: () => pressed(),
          icon: Icon(
            isHidden ? Icons.visibility : Icons.visibility_off,
            color: Colors.red,
          )),
    ),
    onChanged: (String value) => changed(value),
  );
}
