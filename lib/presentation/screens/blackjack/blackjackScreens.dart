import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapibloc1/bloc/bj_bloc/blackjackk_bloc.dart';
import 'package:flutterapibloc1/presentation/Shared%20Widgets/Styles.dart';
import 'package:flutterapibloc1/presentation/Shared%20Widgets/willpopscope.dart';
import 'package:flutterapibloc1/presentation/utils/soundEffects.dart';

class BlackJacScreen extends StatefulWidget {
  BlackJacScreen({Key? key}) : super(key: key);

  @override
  State<BlackJacScreen> createState() => _BlackJacScreenState();
}

class _BlackJacScreenState extends State<BlackJacScreen> {
  String? deckId;
  Color bjCol = Color(0xFF275A1F);
  List<String> dealercards = [];
  List<String> playercards = [];
  bool isAdded = false, isValAdded = false;
  bool isAdded2 = false, isValAdded2 = false;
  bool playerBust = false, dealerBust = false;
  bool first = true;
  var playeramount = 0, dealeramount = 0, dealerVal = 0;

  final BlackjackkBloc valuebloc = BlackjackkBloc();
  final BlackjackkBloc dealbloc = BlackjackkBloc();

  final BlackjackkBloc playerbloc = BlackjackkBloc();
  final BlackjackkBloc playervaluebloc = BlackjackkBloc();

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<BlackjackkBloc>(context).add(ShuffleCardEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var devheight = MediaQuery.of(context).size.height;
    var devwidth = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: bjCol, //navigation bar icons' color
      ),
      child: WillPopScope(
        onWillPop: () => OnWillPop(context),
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF1A5B1F),
              automaticallyImplyLeading: false,
              elevation: 0,
              centerTitle: true,
              leading: Image.asset(
                "assets/logo.png",
              ),
              title: Container(
                  width: devwidth / 2.5,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF0A3E31),
                  ),
                  child: Center(child: Text("BlackJack"))),
              actions: [
                IconButton(
                    onPressed: () {
                      SoundEffect.changeVolume(0);
                    },
                    icon: Icon(Icons.share)),
                IconButton(
                    onPressed: () {
                      SoundEffect.changeVolume(100);
                    },
                    icon: Text("100")),
                /* IconButton(
                    onPressed: () {
                      SoundEffect.changeVolume(0.5);
                    },
                    icon: Text("50")),
                IconButton(
                    onPressed: () {
                      SoundEffect.changeVolume(1.0);
                    },
                    icon: Text("100")),*/
              ],
            ),
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
                              // bloc: deckbloc,
                              /* buildWhen: (previous, current) =>
                                //current != previous &&
                                current is BlackjackkShuffleLoaded,*/
                              builder: (context, state) {
                                if (state is BlackjackkShuffleLoaded) {
                                  deckId = state.bjshuffle.deckId;
                                  return Text(state.bjshuffle.deckId);
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
                                      dealeramount = 0;
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
                                // setState(() {
                                //   dealeramount++;
                                // });
                              },
                              child: Text("deal"));
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
                                                    margin: const EdgeInsets.symmetric(horizontal: 5),
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
                                print("going $i");
                                switch (state.bjdraw.cards[i].value) {
                                  case 'JACK':
                                    {
                                      dealerVal += 10;
                                      valuebloc.add(
                                          AddValEvent(dealerVal: dealerVal));
                                    }
                                    break;
                                  case 'QUEEN':
                                    {
                                      dealerVal += 10;
                                      valuebloc.add(
                                          AddValEvent(dealerVal: dealerVal));
                                    }
                                    break;
                                  case 'KING':
                                    {
                                      dealerVal += 10;
                                      valuebloc.add(
                                          AddValEvent(dealerVal: dealerVal));
                                    }
                                    break;
                                  case 'ACE':
                                    {
                                      dealerVal += 11;
                                      valuebloc.add(
                                          AddValEvent(dealerVal: dealerVal));
                                    }
                                    break;
                                  default:
                                    {
                                      print("loadinggg + $dealerVal");
                                      dealerVal += int.parse(
                                          state.bjdraw.cards[i].value != null
                                              ? state.bjdraw.cards[i].value
                                              : '0');
                                      valuebloc.add(
                                          AddValEvent(dealerVal: dealerVal));
                                    }
                                    break;
                                }
                              }
                              isValAdded = true;
                            }
                            return Text("Value",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 26));
                          }
                          return Container();
                        },
                      ),
                      BlocBuilder<BlackjackkBloc, BlackjackkState>(
                        bloc: valuebloc,
                        builder: (context, state) {
                          if (state is BlackjackValueLoaded) {
                            return (state.dealerVal > 21)
                                ? Text("BUST", style: ThemeStyles().bustText)
                                : Text(state.dealerVal.toString(),
                                    style: ThemeStyles().valueText);
                          }
                          return Text(state.toString());
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
                        ElevatedButton(
                            onPressed: () {
                              isAdded2 = false;
                              playerbloc.add(DrawCardEvent(
                                  deck_id: deckId!, draw_count: "2"));
                              setState(() {
                                playeramount += 2;
                              });
                            },
                            child: Text("Deal Player")),
                        BlocBuilder<BlackjackkBloc, BlackjackkState>(
                            bloc: playerbloc,
                            builder: (context, state) {
                              return Text(" XD - $state - XD");
                            }),
                        BlocBuilder<BlackjackkBloc, BlackjackkState>(
                            bloc: playerbloc,
                            builder: (context, state) {
                              if (state is BlackjackkDrawLoaded) {
                                print("player cards = $playercards");
                                print("length = ${state.bjdraw.cards.length}");
                                print("Playeramount $playeramount");
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
                                  width: playeramount * 50,
                                  color: Colors.teal,
                                  child: Row(
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
                                );
                              }
                              return Text(state.toString());
                            }),
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
