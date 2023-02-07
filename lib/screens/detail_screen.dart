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
      appBar: WebToonAppBar(
        title: widget.webtoon.title,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ThumbCard(webtoon: widget.webtoon),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: webtoons,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                            '${snapshot.data!.age}  |  ${snapshot.data!.genre}'),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        for (var episode in snapshot.data!)
                          Container(
                            margin: const EdgeInsets.only(
                              bottom: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    episode.title,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.chevron_right_rounded,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
