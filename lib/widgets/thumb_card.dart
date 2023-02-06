import 'package:flutter/material.dart';

import '../models/webtoon_model.dart';

class ThumbCard extends StatelessWidget {
  const ThumbCard({
    super.key,
    required this.webtoon,
  });

  final WebtoonModel webtoon;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: webtoon.id,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              offset: const Offset(10, 10),
              color: Colors.black.withOpacity(0.3),
            ),
          ],
        ),
        width: 220,
        child: Image.network(webtoon.thumb),
      ),
    );
  }
}
