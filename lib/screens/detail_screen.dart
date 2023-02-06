import 'package:flutter/material.dart';
import 'package:toonflix/widgets/thumb_card.dart';
import 'package:toonflix/widgets/webtoon_appbar.dart';

import '../models/webtoon_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.webtoon,
  });
  final WebtoonModel webtoon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: WebToonAppBar(title: webtoon.title),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.center,
            child: ThumbCard(webtoon: webtoon),
          ),
        ],
      ),
    );
  }
}
