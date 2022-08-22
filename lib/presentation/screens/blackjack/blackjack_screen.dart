import 'dart:async';
import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapibloc1/bloc/bj_bloc/blackjackk_bloc.dart';
import 'package:flutterapibloc1/data/services/blackjack_service.dart';

class BlackJackScreen extends StatefulWidget {
  const BlackJackScreen({Key? key}) : super(key: key);

  @override
  State<BlackJackScreen> createState() => _BlackJackScreenState();
}

class _BlackJackScreenState extends State<BlackJackScreen> {
  int dealerCards = 0, dealerVal = 0;
  int playerCards = 0, playerVal = 0;
  String? deckId;
  List<String> cards = [];
  bool isInputted = false;

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<BlackjackkBloc>(context).add(ShuffleCardEvent());
    //BJNetwork.ShuffleCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("BlackJack"),
        ),
        backgroundColor: Colors.green,
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => setState(() {}),
                      child: Text("set state")),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<BlackjackkBloc>(context).add(
                            DrawCardEvent(deck_id: deckId!, draw_count: "1"));
                        setState(() {
                          dealerCards++;
                          dealerVal += 10;
                          isInputted = false;
                        });
                      },
                      child: Text("deal")),
                  BlocBuilder<BlackjackkBloc, BlackjackkState>(
                      builder: (context, state) {
                    if (state is BlackjackkDrawLoaded) {
                      if (!isInputted) {
                        for (int i = 0; i < state.bjdraw.cards.length; i++) {
                          print("going $i");
                          cards.add(state.bjdraw.cards[i].image);
                          print("repeat");
                        }
                        isInputted = true;
                      }
                      return Column(
                        children: List.from(cards.map(
                          (name) => Container(
                            height: 150,
                            width: 100 * dealerCards.toDouble(),
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              /*separatorBuilder: (context, index) => SizedBox(
                        width: 0.1,
                      ),*/
                              itemCount: dealerCards,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  width: 100,
                                  height: 150,
                                  child: CachedNetworkImage(
                                    imageUrl: name,
                                  ),
                                );
                              },
                            ),
                          ),
                        )),
                      );
                      /*return Text("${cards}");*/
                    }
                    return Text("o");
                  }),
                  Text("cards length = ${cards.length}"),
                  SizedBox(height: 30),
                  Text(cards.toString()),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Dealer",
                    style: desctext,
                  ),
                  SizedBox(height: 10),
                  Text(playerCards.toString()),
                  Text(
                    dealerVal.toString(),
                    style: cardtext,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.orange,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<BlackjackkBloc, BlackjackkState>(
                      builder: (context, state) {
                        if (state is BlackjackkShuffleLoaded) {
                          deckId = state.bjshuffle.deckId;
                          return Text(state.bjshuffle.deckId);
                        }
                        if (state is BlackjackkLoad) {
                          return CircularProgressIndicator();
                        }
                        return Text("blum load");
                      },
                    ),
                    ElevatedButton(
                      child: Text("setstate"),
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                    BlocBuilder<BlackjackkBloc, BlackjackkState>(
                      builder: (context, state) {
                        if (state is BlackjackkDrawLoaded) {
                          return Container(
                            height: 150,
                            width: 100 * playerCards.toDouble(),
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: 1,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                /*   for (int i = 0;
                                    i < state.bjdraw.cards.length;
                                    i++) {
                                  print("going $i");
                                  cards.add(state.bjdraw.cards[i].image);
                                  print("repeat");
                                }*/
                                return Row(
                                  children: List.from(cards.map(
                                    (name) => Container(
                                        width: 100,
                                        height: 150,
                                        child:
                                            CachedNetworkImage(imageUrl: name)),
                                  )),
                                );

                                /*Container(
                                  width: 100,
                                  height: 150,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://deckofcardsapi.com/static/img/AS.png",
                                  ),
                                );*/
                              },
                            ),
                          );
                        }
                        return Text("Nothing here");
                      },
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Player",
                      style: desctext,
                    ),
                    SizedBox(height: 10),
                    BlocBuilder<BlackjackkBloc, BlackjackkState>(
                      builder: (context, state) {
                        if (state is BlackjackkDrawLoaded) {
                          //int.parse(amount != null ? amount : '0');
                          if (!isInputted) {
                            for (int i = 0;
                                i < state.bjdraw.cards.length;
                                i++) {
                              print("going $i");
                              switch (state.bjdraw.cards[i].value) {
                                case 'JACK':
                                  {
                                    playerVal += 10;
                                  }
                                  break;
                                case 'QUEEN':
                                  {
                                    playerVal += 10;
                                  }
                                  break;
                                case 'KING':
                                  {
                                    playerVal += 10;
                                  }
                                  break;
                                case 'ACE':
                                  {
                                    playerVal += 11;
                                  }
                                  break;
                                default:
                                  {
                                    print("loadinggg + $playerVal");
                                    playerVal += int.parse(
                                        state.bjdraw.cards[i].value != null
                                            ? state.bjdraw.cards[i].value
                                            : '0');
                                    print("innn");
                                  }
                                  break;
                              }
                            }
                            isInputted = false;
                          }
                          return Column(
                            children: [
                              Text(
                                playerVal.toString(),
                                style: cardtext,
                              ),
                              Text(state.bjdraw.cards.length.toString()),
                            ],
                          );
                        }
                        return Text(
                          "0",
                          style: cardtext,
                        );
                      },
                    ),
                    playerCards == 0
                        ? ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<BlackjackkBloc>(context).add(
                                  DrawCardEvent(
                                      deck_id: deckId!, draw_count: "2"));
                              setState(() {
                                playerCards = 2;
                              });
                            },
                            child: Text("Deal"))
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    BlocProvider.of<BlackjackkBloc>(context)
                                        .add(DrawCardEvent(
                                            deck_id: deckId!, draw_count: "1"));
                                    setState(() {
                                      playerCards++;
                                    });
                                  },
                                  child: Text("Hit")),
                              ElevatedButton(
                                  onPressed: () {
                                    /* BlocProvider.of<BlackjackkBloc>(context)
                                        .add(BlackjackkInitial());*/
                                    showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                        title: Text("you have stand"),
                                        content: Text(
                                          'Wait for dealers hand',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text("Stand")),
                            ],
                          ),
                    BlocBuilder<BlackjackkBloc, BlackjackkState>(
                      builder: (context, state) {
                        if (state is BlackjackkDrawLoaded) {
                          if (!isInputted) {
                            for (int i = 0;
                                i < state.bjdraw.cards.length;
                                i++) {
                              cards.add(state.bjdraw.cards[i].image);
                              print("repeat");
                            }
                          }
                          return Column(
                            children:
                                List.from(cards.map((name) => Text(name))),
                          );
                          /* return Column(children: texts);*/
                        }
                        return Text("Empty");
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

TextStyle desctext = TextStyle(color: Colors.white, fontSize: 16);
TextStyle cardtext =
    TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold);
