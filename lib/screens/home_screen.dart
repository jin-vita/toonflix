import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Future<List<WebtoonModel>> webtoons = ApiService().getToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          '오늘의 웹툰',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      // body: FutureBuilder(
      //   future: webtoons,
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       return const Text('there is data!');
      //     }
      //     return const Text('loading...');
      //   },
      // ),
    );
  }
}
