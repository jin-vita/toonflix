class WebtoonEpisodeModel {
  final String title, rating, date, id;

  WebtoonEpisodeModel({
    required this.title,
    required this.rating,
    required this.date,
    required this.id,
  });

  WebtoonEpisodeModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        rating = json['rating'],
        date = json['date'],
        id = json['id'];
}
