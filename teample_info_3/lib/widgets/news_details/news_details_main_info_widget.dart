import 'package:flutter/material.dart';
import 'package:vk/resources/resources.dart';
import 'package:vk/widgets/widget.dart';

class NewsDetailsMainInfoWidgets extends StatelessWidget {
  const NewsDetailsMainInfoWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _TopPostersWidget(),
        const Padding(
          padding: EdgeInsets.all(17.0),
          child: _NewsNameWidget(),
        ),
        const _ScoreWidget(),
        const _SummeryWidget(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _overviewWidget(),
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: _DescriptionWidget(),
        ),
        const SizedBox(
          height: 30,
        ),
        const _PeopleWidget(),
      ],
    );
  }

  Text _overviewWidget() {
    return const Text(
      'Описание',
      style: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget();

  @override
  Widget build(BuildContext context) {
    return const Text(
      '16:30 - 17:00 Киртан 17:00 - 18:00 Лекция Девакинандана дас 18:00 - 19:00 Гаура Арати киртан 19:00 прасад, уборка',
      style: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
    );
  }
}

class _TopPostersWidget extends StatelessWidget {
  const _TopPostersWidget();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Image(image: AssetImage(Images.ayodhya1)),
        Positioned(
          top: 100,
          right: 200,
          bottom: 0,
          left: 20,
          child: Image(
            image: AssetImage(Images.ramanavami),
          ),
        ),
      ],
    );
  }
}

class _NewsNameWidget extends StatelessWidget {
  const _NewsNameWidget();

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      maxLines: 3,
      text: const TextSpan(
        children: [
          TextSpan(
              text: 'Рама Навами ',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800)),
          TextSpan(
              text: '(30.03.2023!)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
            onPressed: () {},
            child: Row(
              children: const [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: RadialPercentWidget(
                    percent: 0.72,
                    fillColor: Color.fromARGB(255, 10, 23, 25),
                    lineColor: Color.fromARGB(255, 37, 203, 103),
                    freeColor: Color.fromARGB(255, 25, 54, 31),
                    lineWidth: 3,
                    child: Text('72'),
                  ),
                ),
                Text('Оценки'),
              ],
            )),
        Container(width: 1, height: 15, color: Colors.grey),
        TextButton(
          onPressed: () {},
          child: Row(
            children: const [
              Icon(Icons.play_arrow),
              Text('Смотреть Ролик'),
            ],
          ),
        ),
      ],
    );
  }
}

class _SummeryWidget extends StatelessWidget {
  const _SummeryWidget();

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Color.fromRGBO(22, 22, 22, 0),
      child: Padding(
        padding: EdgeInsets.all(18.0),
        child: Text('день явления Господа Рамы (пост до захода солнца)',
            maxLines: 3,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400)),
      ),
    );
  }
}

class _PeopleWidget extends StatelessWidget {
  const _PeopleWidget();

  @override
  Widget build(BuildContext context) {
    const nameStyle = TextStyle(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500);
    const jobTittleStyle = TextStyle(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500);

    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Заводская 41/1', style: nameStyle),
                Text('Место', style: jobTittleStyle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Заводская 41/1', style: nameStyle),
                Text('Место', style: jobTittleStyle),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Заводская 41/1', style: nameStyle),
                Text('Место', style: jobTittleStyle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Заводская 41/1', style: nameStyle),
                Text('Место', style: jobTittleStyle),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
