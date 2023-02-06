import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/widgets/thumb_card.dart';
import 'package:toonflix/widgets/webtoon_appbar.dart';

import '../models/webtoon_model.dart';
import '../services/api_service.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.webtoon,
  });
  final WebtoonModel webtoon;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoons;
  late Future<List<WebtoonEpisodeModel>> episodes;
  @override
  void initState() {
    super.initState();
    webtoons = ApiService.getToonById(widget.webtoon.id);
    episodes = ApiService.getEpisodesById(widget.webtoon.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: WebToonAppBar(title: widget.webtoon.title),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.center,
            child: ThumbCard(webtoon: widget.webtoon),
          ),
        ],
      ),
    );
  }
}
