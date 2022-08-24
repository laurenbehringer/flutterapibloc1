import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapibloc1/bloc/bj_bloc/blackjackk_bloc.dart';
import 'package:flutterapibloc1/presentation/Shared%20Widgets/Styles.dart';
import 'package:flutterapibloc1/presentation/Shared%20Widgets/blackjack/AppBar.dart';
import 'package:flutterapibloc1/presentation/Shared%20Widgets/blackjack/blackjack_dialogs.dart';
import 'package:flutterapibloc1/presentation/Shared%20Widgets/willpopscope.dart';
import 'package:flutterapibloc1/presentation/routes/route_const.dart';
import 'package:flutterapibloc1/presentation/utils/blackjack/royalValue_checker.dart';
import 'package:flutterapibloc1/presentation/utils/soundEffects.dart';

class BlackJacScreen extends StatefulWidget {
  BlackJacScreen({Key? key}) : super(key: key);

  @override
  State<BlackJacScreen> createState() => _BlackJacScreenState();
}

class _BlackJacScreenState extends State<BlackJacScreen> {
  String? deckId;
  Color bjCol = Color(0xFF275A1F);
  List<String> dealercards = [], playercards = [];
  bool isAdded = false, isValAdded = false;
  bool isAdded2 = false, isValAdded2 = false;
  bool playerBust = false, dealerBust = false;
  bool isDealed = false;
  var playeramount = 0, dealeramount = 0, dealerVal = 0, playerVal = 0;

  final BlackjackkBloc valuebloc = BlackjackkBloc();
  final BlackjackkBloc dealbloc = BlackjackkBloc();

  final BlackjackkBloc playerbloc = BlackjackkBloc();

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<BlackjackkBloc>(context).add(ShuffleCardEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: bjCol, //navigation bar icons' color
      ),
      child: WillPopScope(
        onWillPop: () => OnWillPop(context),
        child: SafeArea(
          child: Scaffold(
            appBar: bjAppbar(context),
            body: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xFF1A5B1F),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () => setState(() {}),
                              child: Text("set state")),
                          Container(
                            height: 40,
                            width: 100,
                            color: Colors.orange,
                            child: BlocBuilder<BlackjackkBloc, BlackjackkState>(
                              builder: (context, state) {
                                if (state is BlackjackkShuffleLoaded) {
                                  deckId = state.bjshuffle.deckId;
                                  return Center(
                                      child: Column(
                                    children: [
                                      Text(
                                        "Deck ID",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        state.bjshuffle.deckId,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ));
                                }
                                if (state is BlackjackkLoad) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                return Text("XD");
                              },
                            ),
                          ),
                        ],
                      ),
                      BlocBuilder<BlackjackkBloc, BlackjackkState>(
                        bloc: valuebloc,
                        builder: (context, state) {
                          if (state is BlackjackValueLoaded) {
                            return Text(state.dealerVal.toString(),
                                style: ThemeStyles().valueText);
                          }
                          return Text("OK");
                        },
                      ),
                      BlocBuilder<BlackjackkBloc, BlackjackkState>(
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
                      ),
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
                                height: 100,
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
                                                    height: 100,
                                                    width: 50,
                                                    child: CachedNetworkImage(
                                                        imageUrl: name))
                                              ],
                                            ))),
                                  ),
                                ),
                              );
                            }
                            return Text(state.toString());
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
                            return Text("ValueEEEE",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 26));
                          }
                          return Container();
                        },
                      ),
                      BlocConsumer<BlackjackkBloc, BlackjackkState>(
                        bloc: valuebloc,
                        builder: (context, state) {
                          if (state is BlackjackValueLoaded) {
                            dealerVal = state.dealerVal;
                            if (state.dealerVal > 21) {
                              valuebloc.add(WinEvent());
                            }
                            return (state.dealerVal > 21)
                                ? Text("BUST", style: ThemeStyles().bustText)
                                : Text(state.dealerVal.toString(),
                                    style: ThemeStyles().valueText);
                          }
                          if (state is WinState) {
                            return Text("$dealerVal",
                                style: ThemeStyles().valueText);
                          }
                          return Text(state.toString());
                        },
                        listener: (context, state) {
                          if (state is BlackjackValueLoaded) {
                            if (state.dealerVal <= playerVal) {
                              print("the bronze jade");
                              dealbloc.add(DrawCardEvent(
                                  deck_id: deckId!, draw_count: "1"));
                              isAdded = false;
                            }
                          }
                          if (state is WinState) {
                            Future.delayed(Duration(milliseconds: 700), () {
                              BJDialogs.showMyWinDialog(context);
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green.shade300,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              SoundEffect.stopSound();
                            },
                            child: Text("Stop")),
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
                              return Text("Standed");
                            }
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      isAdded2 = false;
                                      if (isDealed) {
                                        playerbloc.add(DrawCardEvent(
                                            deck_id: deckId!, draw_count: "1"));
                                      } else {
                                        playerbloc.add(DrawCardEvent(
                                            deck_id: deckId!, draw_count: "2"));
                                      }
                                      isDealed = true;
                                    },
                                    child:
                                        Text(isDealed ? "Hit" : "Deal Player")),
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
                                    : Container()
                              ],
                            );
                          },
                        ),
                        BlocBuilder<BlackjackkBloc, BlackjackkState>(
                            bloc: playerbloc,
                            builder: (context, state) {
                              return Text(" XD - $state - XD");
                            }),
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
                                  height: 100,
                                  width: double.infinity,
                                  child: Center(
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      children: List.from(
                                          playercards.map((name) => Column(
                                                children: [
                                                  Container(
                                                    height: 100,
                                                    width: 50,
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
                                height: 100,
                                width: double.infinity,
                                child: Center(
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    children: List.from(
                                        playercards.map((name) => Column(
                                              children: [
                                                Container(
                                                  height: 100,
                                                  width: 50,
                                                  child: CachedNetworkImage(
                                                      imageUrl: name),
                                                  /*  Text(
                                                      name,
                                                      style:
                                                          TextStyle(fontSize: 12),
                                                    ),*/
                                                ),
                                              ],
                                            ))),
                                  ),
                                ),
                              );
                            }),
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
                                  Text("Value"),
                                  Text("$playerVal"),
                                ],
                              );
                            }
                            if (state is BustedState) {
                              return Text(
                                "Busted",
                                style:
                                    TextStyle(fontSize: 24, color: Colors.red),
                              );
                            }
                            if (state is StandState) {
                              return Column(
                                children: [
                                  Text("Value"),
                                  Text("$playerVal"),
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
