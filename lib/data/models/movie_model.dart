
class MovieModel{
  String? movie_title;
  String? movie_year;
  String? movie_poster_url;
  double? rating;

  MovieModel({required this.movie_title, required this.movie_year, required this.movie_poster_url, required this.rating});
}

List<MovieModel> movie_list = [
  MovieModel(movie_title: "sawshank redemption", movie_year: "1994",rating: 9.3,movie_poster_url: "https://m.media-amazon.com/images/M/MV5BNzUzNzI0MjAxMl5BMl5BanBnXkFtZTgwMjQ2MjEyMDE@._V1_UX100_CR0,0,100,100_AL_.jpg"),
  MovieModel(movie_title: "The Godfather", movie_year: "1972",rating: 9.2,movie_poster_url: "https://m.media-amazon.com/images/M/MV5BNzUzNzI0MjAxMl5BMl5BanBnXkFtZTgwMjQ2MjEyMDE@._V1_UX100_CR0,0,100,100_AL_.jpg"),
  MovieModel(movie_title: "The Dark Knight", movie_year: "2008",rating: 9.0,movie_poster_url: "https://m.media-amazon.com/images/M/MV5BNzUzNzI0MjAxMl5BMl5BanBnXkFtZTgwMjQ2MjEyMDE@._V1_UX100_CR0,0,100,100_AL_.jpg"),
  MovieModel(movie_title: "12 Angry Men", movie_year: "1957",rating: 9.0,movie_poster_url: "https://m.media-amazon.com/images/M/MV5BNzUzNzI0MjAxMl5BMl5BanBnXkFtZTgwMjQ2MjEyMDE@._V1_UX100_CR0,0,100,100_AL_.jpg"),
  MovieModel(movie_title: "Schindler's List", movie_year: "1993",rating: 9.0,movie_poster_url: "https://m.media-amazon.com/images/M/MV5BNzUzNzI0MjAxMl5BMl5BanBnXkFtZTgwMjQ2MjEyMDE@._V1_UX100_CR0,0,100,100_AL_.jpg"),
  MovieModel(movie_title: "Pulp Fiction", movie_year: "1994",rating: 8.9,movie_poster_url: "https://m.media-amazon.com/images/M/MV5BNzUzNzI0MjAxMl5BMl5BanBnXkFtZTgwMjQ2MjEyMDE@._V1_UX100_CR0,0,100,100_AL_.jpg"),
];

