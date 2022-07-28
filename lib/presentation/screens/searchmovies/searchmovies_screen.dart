import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterapibloc1/data/models/movie_model.dart';
import 'package:flutterapibloc1/presentation/routes/route_const.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  List<MovieModel> displaymovie_list = List.from(movie_list);

  void updateList(String value) {
    setState(() {
      displaymovie_list = movie_list.where((element) =>
          element.movie_title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushNamed(context, countryScreen);
              },
              icon: Icon(Icons.public))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Search for a movie", style: TextStyle(
                color: Colors.white,
                fontSize: 22, fontWeight: FontWeight.bold
            ),),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value){
                updateList(value);
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
            ),
            SizedBox(height: 20,),
            Expanded(
                child: ListView.builder(
                    itemCount: displaymovie_list.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CachedNetworkImage(
                          imageUrl: displaymovie_list[index].movie_poster_url!,),
                        title: Text(displaymovie_list[index].movie_title!,
                            style: TextStyle(color: Colors.white)),
                        subtitle: Text(displaymovie_list[index].movie_year!,
                            style: TextStyle(color: Colors.white)),
                        trailing: Text(displaymovie_list[index].rating!.toString(),
                            style: TextStyle(color: Colors.yellow)),
                      );
                    }
                )
            )
          ],
        ),
      ),
    );
  }
}
