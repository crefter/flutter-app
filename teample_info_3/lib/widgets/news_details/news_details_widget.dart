import 'package:flutter/material.dart';
import 'news_details_main_info_widget.dart';
import 'news_details_main_screen_cast_widget.dart';

// здесь вся наша страница

class NewsDetailsWidget extends StatefulWidget {
  final int newsId;
  const NewsDetailsWidget({super.key, required this.newsId});

  @override
  State<NewsDetailsWidget> createState() => _NewsDetailsWidgetState();
}

class _NewsDetailsWidgetState extends State<NewsDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Рама Навами 30.03.23')),
      body: ColoredBox(
        color: const Color.fromRGBO(24, 23, 27, 1.0),
        child: ListView(
          children: const [
            NewsDetailsMainInfoWidgets(),
            SizedBox(
              height: 30,
            ),
            NewsDetailsScreenCastWidgets(),
          ],
        ),
      ),
    );
  }
}
