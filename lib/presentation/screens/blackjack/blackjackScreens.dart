import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapibloc1/bloc/bj_bloc/blackjackk_bloc.dart';
import 'package:flutterapibloc1/presentation/Shared%20Widgets/Styles.dart';
import 'package:flutterapibloc1/presentation/Shared%20Widgets/blackjack/AppBar.dart';
import 'package:flutterapibloc1/presentation/Shared%20Widgets/blackjack/blackjack_dialogs.dart';
import 'package:flutterapibloc1/presentation/Shared%20Widgets/willpopscope.dart';
import 'package:flutterapibloc1/presentation/utils/blackjack/royalValue_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_circular_text/circular_text.dart';

class BlackJacScreen extends StatefulWidget {
  BlackJacScreen({Key? key}) : super(key: key);
  @override
  State<BlackJacScreen> createState() => _BlackJacScreenState();
}

class _BlackJacScreenState extends State<BlackJacScreen> {
  String? deckId;
  List<String> dealercards = [], playercards = [];
  bool isAdded = false, isValAdded = false, isAdded2 = false, isDealed = false;
  var dealerVal = 0, playerVal = 0;
  var playerBal;

  final BlackjackkBloc valuebloc = BlackjackkBloc();
  final BlackjackkBloc dealbloc = BlackjackkBloc();
  final BlackjackkBloc playerbloc = BlackjackkBloc();

  int temp = 100;
  void _getStoredColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? tempVAl = prefs.getInt('temp');
    setState(() {
      temp = tempVAl!;
    });
  }

  void setColor(int tempVal) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("temp", tempVal);
    setState(() {
      temp = tempVal;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    /*playerBal = BaseAppBar.getVal();*/
    /*BaseAppBar.initializePreference(playerBal).whenComplete(() {
      setState(() {});
    });*/
    _getStoredColor();
    BlocProvider.of<BlackjackkBloc>(context).add(ShuffleCardEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: ThemeStyles().bjCol,
      ),
      child: WillPopScope(
        onWillPop: () => OnWillPop(context),
        child: SafeArea(
          child: Scaffold(
            appBar: BaseAppBar(
              context: context,
              appBar: AppBar(),
              Balance: temp,
            ),
            body: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFF1A5B1F),
                    image: DecorationImage(
                        image: AssetImage('assets/bjtext.png'),
                        //fit: BoxFit.fill,
                        alignment: Alignment.bottomCenter),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Container(
                        height: 40,
                        width: 100,
                        color: Colors.blue,
                        child: BlocBuilder<BlackjackkBloc, BlackjackkState>(
                          builder: (context, state) {
                            if (state is BlackjackkShuffleLoaded) {
                              deckId = state.bjshuffle.deckId;
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Deck ID",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    state.bjshuffle.deckId,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                ],
                              );
                            }
                            if (state is BlackjackkLoad) {
                              return Center(
                                  child: CircularProgressIndicator(
                                color: Colors.white,
                              ));
                            }
                            return Text("XD");
                          },
                        ),
                      ),
                      SizedBox(height: 15),
                      //missing
                      BlocBuilder<BlackjackkBloc, BlackjackkState>(
                          bloc: dealbloc,
                          builder: (context, state) {
                            if (state is BlackjackkDrawLoaded) {
                              if (!isAdded) {
                                for (int i = 0;
                                    i < state.bjdraw.cards.length;
                                    i++) {
                                  print("going $i");
                                  dealercards.add(state.bjdraw.cards[i].image);
                                  print("repeat");
                                }
                                isAdded = true;
                                isValAdded = false;
                              }
                              return Container(
                                height: 140,
                                width: double.infinity,
                                child: Center(
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    children: List.from(
                                        dealercards.map((name) => Column(
                                              children: [
                                                Container(
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    width: 80,
                                                    child: CachedNetworkImage(
                                                        imageUrl: name))
                                              ],
                                            ))),
                                  ),
                                ),
                              );
                            }
                            return Text("");
                          }),
                      BlocBuilder<BlackjackkBloc, BlackjackkState>(
                        bloc: dealbloc,
                        builder: (context, state) {
                          if (state is BlackjackkDrawLoaded) {
                            if (!isValAdded) {
                              for (int i = 0;
                                  i < state.bjdraw.cards.length;
                                  i++) {
                                dealerVal += RoyalValueCheck.bruh(
                                    state.bjdraw.cards[i].value);
                                valuebloc
                                    .add(AddValEvent(dealerVal: dealerVal));
                              }
                              isValAdded = true;
                            }
                            return Text("Value",
                                style: ThemeStyles().valueHeadingText);
                          }
                          return Container();
                        },
                      ),
                      BlocConsumer<BlackjackkBloc, BlackjackkState>(
                        bloc: valuebloc,
                        builder: (context, state) {
                          if (state is BlackjackValueLoaded) {
                            dealerVal = state.dealerVal;
                            if (state.dealerVal > playerVal &&
                                state.dealerVal < 22) {
                              valuebloc.add(LoseEvent());
                            }
                            if (state.dealerVal > 18) {
                              if (state.dealerVal > 21 ||
                                  playerVal > state.dealerVal) {
                                valuebloc.add(WinEvent());
                              }
                            }
                            return Text(state.dealerVal.toString(),
                                style: ThemeStyles().valueText);
                          }
                          if (state is WinState) {
                            return Column(
                              children: [
                                Text("BUSTED", style: ThemeStyles().bustText),
                                Text("$dealerVal",
                                    style: ThemeStyles().valueText),
                              ],
                            );
                          }
                          return dealerVal == 0
                              ? Container()
                              : Text("$dealerVal",
                                  style: ThemeStyles().valueText);
                        },
                        listener: (context, state) {
                          if (state is BlackjackValueLoaded) {
                            if (state.dealerVal <= playerVal &&
                                state.dealerVal < 20) {
                              dealbloc.add(DrawCardEvent(
                                  deck_id: deckId!, draw_count: "1"));
                              isAdded = false;
                            }
                          }
                          if (state is WinState) {
                            Future.delayed(Duration(milliseconds: 700), () {
                              BJDialogs.showMyWinDialog(context, playerBal);
                              setColor(temp! + 10);
                            });
                          }
                          if (state is LoseState) {
                            Future.delayed(Duration(milliseconds: 700), () {
                              BJDialogs.showMyLoseDialog(context, playerBal);
                              setColor(temp! - 10);
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: ThemeStyles().bjCol,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(height: 40),
                        BlocBuilder<BlackjackkBloc, BlackjackkState>(
                          bloc: playerbloc,
                          builder: (context, state) {
                            if (state is BlackjackkLoad) {
                              return CircularProgressIndicator();
                            }
                            if (state is BustedState) {
                              return Text("Busted XD");
                            }
                            if (state is StandState) {
                              return Text(
                                "Standed",
                                style: ThemeStyles().valueHeadingText,
                              );
                            }
                            return Container(
                              child: Row(
                                mainAxisAlignment: isDealed
                                    ? MainAxisAlignment.spaceEvenly
                                    : MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        isAdded2 = false;
                                        if (isDealed) {
                                          playerbloc.add(DrawCardEvent(
                                              deck_id: deckId!,
                                              draw_count: "1"));
                                        } else {
                                          playerbloc.add(DrawCardEvent(
                                              deck_id: deckId!,
                                              draw_count: "2"));
                                        }
                                        isDealed = true;
                                      },
                                      child: Text(
                                          isDealed ? "Hit" : "Deal Player")),
                                  (isDealed)
                                      ? ElevatedButton(
                                          onPressed: () {
                                            playerbloc.add(StandEvent());
                                            isAdded = false;
                                            dealbloc.add(DrawCardEvent(
                                                deck_id: deckId!,
                                                draw_count: "1"));
                                          },
                                          child: Text("Stand"))
                                      : Text("")
                                ],
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        BlocBuilder<BlackjackkBloc, BlackjackkState>(
                            bloc: playerbloc,
                            builder: (context, state) {
                              if (state is BlackjackkDrawLoaded) {
                                if (!isAdded2) {
                                  for (int i = 0;
                                      i < state.bjdraw.cards.length;
                                      i++) {
                                    print("going $i");
                                    playercards
                                        .add(state.bjdraw.cards[i].image);
                                    print("repeat");
                                  }
                                  isAdded2 = true;
                                  print("playercards = ${playercards}");
                                }
                                return Container(
                                  height: 140,
                                  width: double.infinity,
                                  child: Center(
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      children: List.from(
                                          playercards.map((name) => Column(
                                                children: [
                                                  Container(
                                                    width: 80,
                                                    child: CachedNetworkImage(
                                                        imageUrl: name),
                                                  ),
                                                ],
                                              ))),
                                    ),
                                  ),
                                );
                              }
                              return Container(
                                height: 140,
                                width: double.infinity,
                                child: Center(
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    children: List.from(
                                        playercards.map((name) => Column(
                                              children: [
                                                Container(
                                                  width: 80,
                                                  child: CachedNetworkImage(
                                                      imageUrl: name),
                                                ),
                                              ],
                                            ))),
                                  ),
                                ),
                              );
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        BlocBuilder<BlackjackkBloc, BlackjackkState>(
                          bloc: playerbloc,
                          builder: (context, state) {
                            if (state is BlackjackkDrawLoaded) {
                              for (int i = 0;
                                  i < state.bjdraw.cards.length;
                                  i++) {
                                playerVal += RoyalValueCheck.bruh(
                                    state.bjdraw.cards[i].value);
                              }
                              if (playerVal > 21) {
                                playerbloc.add(BustedEvent());
                              }
                              return Column(
                                children: [
                                  Text("Value",
                                      style: ThemeStyles().valueHeadingText),
                                  Text("$playerVal",
                                      style: ThemeStyles().valueText),
                                ],
                              );
                            }
                            if (state is BustedState) {
                              return Text(
                                "Busted",
                                style: ThemeStyles().bustText,
                              );
                            }
                            if (state is StandState) {
                              return Column(
                                children: [
                                  Text("Value",
                                      style: ThemeStyles().valueHeadingText),
                                  Text("$playerVal",
                                      style: ThemeStyles().valueText),
                                ],
                              );
                            }
                            return Container();
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*ElevatedButton(
onPressed: () {
setColor(20);
},
child: Text("+20")),*/

/*ElevatedButton(
onPressed: () {
BaseAppBar.initializePreference(playerBal == null
? 1000 + 100
    : playerBal + 100);
},
child: Text("+100")),*/

/*BlocBuilder<BlackjackkBloc, BlackjackkState>(
                        bloc: valuebloc,
                        builder: (context, state) {
                          if (state is BlackjackValueLoaded) {
                            if (state.dealerVal > 21) {
                              return ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      dealerVal = 0;
                                      dealercards.clear();
                                      valuebloc.add(AddValEvent(dealerVal: 0));
                                      BlocProvider.of<BlackjackkBloc>(context)
                                          .add(ShuffleCardEvent());
                                    });
                                  },
                                  child: Text("Play again"));
                            }
                          }
                          ;
                          return ElevatedButton(
                              onPressed: () {
                                isAdded = false;
                                dealbloc.add(DrawCardEvent(
                                    deck_id: deckId!, draw_count: "1"));
                              },
                              child: Text("deaaal"));
                        },
                      ),*/
