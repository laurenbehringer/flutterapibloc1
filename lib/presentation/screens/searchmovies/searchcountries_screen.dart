import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapibloc1/bloc/wildid/wildid_bloc.dart';
import 'package:logger/logger.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {

  @override
  void initState() {
    // TODO: implement initState
    //final List<CountryResponseModel> country = await CountryService().getCountriesAPI();
    BlocProvider.of<WildidBloc>(context).add(LoadWildidApiEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Search for Articles", style: TextStyle(
                color: Colors.white,
                fontSize: 22, fontWeight: FontWeight.bold
            ),),
            SizedBox(
              height: 20,
            ),
            BlocBuilder<WildidBloc, WildidState>(
              builder: (context, state) {
                if (state is WildidLoadedState) {
                  return TextField(
                    onChanged: (value) {
                      BlocProvider.of<WildidBloc>(context).add(
                          InputSearchEvent(status: '', text: value, articles: state.articles));
                      // print("displayyyyy here = ${state.displayarticle_list}");
                      // print("state.issearch = ${state.isSearch}");
                      // state.displayarticle_list =state.articles.where((element) =>
                      //     element.title.toLowerCase().contains(value.toLowerCase()))
                      //     .toList();
                      //
                      // state.isSearch = true;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.purple,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none
                      ),
                      hintText: "Search here",
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                    ),
                  );
                }
                return TextField();
              },
            ),
            SizedBox(height: 20),
            BlocBuilder<WildidBloc, WildidState>(
              builder: (context, state) {
                if (state is WildidLoadingState) {
                  return CircularProgressIndicator();
                }
                if (state is WildidLoadedState) {
                  print("first print  = ${state.isSearch}");
                  return Expanded(
                      child: ListView.builder(
                          itemCount: state.isSearch ? state.displayarticle_list.length : state.articles.length,
                          itemBuilder: (context, index) {
                            print("status of bool = ${state.isSearch}");
                            return (state.isSearch) ? Container(
                              child: Column(
                                children: [
                                  Text("boolean = ${state.isSearch}"),
                                  CachedNetworkImage(
                                      imageUrl: state.displayarticle_list[index]
                                          .urlToImage),
                                  Text(state.displayarticle_list[index].title,
                                      style: TextStyle(color: Colors.white)),
                                  Text(state.displayarticle_list[index].author,
                                      style: TextStyle(color: Colors.white)),
                                  Text(state.displayarticle_list[index].publishedAt
                                      .toString(),
                                      style: TextStyle(color: Colors.yellow)),
                                ],
                              ),
                            ) :
                            Container(
                              child: Column(
                                children: [
                                  Text("state = ${state.isSearch}"),
                                  CachedNetworkImage(
                                      imageUrl: state.articles[index]
                                          .urlToImage),
                                  Text(state.articles[index].title,
                                      style: TextStyle(color: Colors.white)),
                                  Text(state.articles[index].author,
                                      style: TextStyle(color: Colors.white)),
                                  Text(state.articles[index].publishedAt
                                      .toString(),
                                      style: TextStyle(color: Colors.yellow)),
                                ],
                              ),
                            );
                          }
                      )
                  );
                }
                return Text("");
              },
            )
          ],
        ),
      ),
    );
  }
}
