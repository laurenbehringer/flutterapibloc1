import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapibloc1/presentation/screens/blackjack/bloc/blackjack_test_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BlackJackTestScreen extends StatefulWidget {
  const BlackJackTestScreen({Key? key}) : super(key: key);

  @override
  State<BlackJackTestScreen> createState() => _BlackJackTestScreenState();
}

class _BlackJackTestScreenState extends State<BlackJackTestScreen> {

  List<Card> cards = [];

  @override
  void initState() {
    BlocProvider.of<BlackjackTestBloc>(context).add(ShuffleCardTest());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<BlackjackTestBloc, BlackjackTestState>(
              builder: (context, state) {
                if (state is BlackjackTestInitial) {
                  return Center(
                    child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<BlackjackTestBloc>(context)
                            .add(DrawCardTest());
                      },
                      child: const Text('Draw'),
                    ),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
            BlocBuilder<BlackjackTestBloc, BlackjackTestState>(
              builder: (context, state) {
                return Container(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height * 0.2,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.transparent,
                  child: Center(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: state.props.cards
                          .map(
                            (e) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              height: 100,
                              width: 50,
                              child: CachedNetworkImage(imageUrl: e.image),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
