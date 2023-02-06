import 'package:flutter/cupertino.dart';
import 'package:toonflix/screens/detail_screen.dart';

import '../models/webtoon_model.dart';
import 'thumb_card.dart';

class WebtoonWidgets extends StatelessWidget {
  const WebtoonWidgets({
    super.key,
    required this.webtoon,
  });

  final WebtoonModel webtoon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => DetailScreen(
              webtoon: webtoon,
            ),
            fullscreenDialog: false,
          ),
        );
      },
      child: Column(
        children: [
          ThumbCard(webtoon: webtoon),
          const SizedBox(
            height: 10,
          ),
          Text(
            webtoon.title,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
