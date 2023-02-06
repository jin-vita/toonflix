import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/webtoon_model.dart';
import '../services/api_service.dart';
import '../widgets/webtoon_appbar.dart';
import '../widgets/webtoon_widgets.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const WebToonAppBar(
        title: '오늘의 웹툰',
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return makeList(snapshot, context);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Column makeList(
      AsyncSnapshot<List<WebtoonModel>> snapshot, BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              },
            ),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var webtoon = snapshot.data![index];
                return WebtoonWidgets(webtoon: webtoon);
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
