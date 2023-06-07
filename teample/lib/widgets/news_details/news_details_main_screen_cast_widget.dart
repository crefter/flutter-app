import 'package:flutter/material.dart';
import 'package:vk/resources/resources.dart';

class NewsDetailsScreenCastWidgets extends StatelessWidget {
  const NewsDetailsScreenCastWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Гости и Ведущие',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 220,
            child: Scrollbar(
              child: ListView.builder(
                itemCount: 10,
                itemExtent: 100,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.black.withOpacity(0.2)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        clipBehavior: Clip.hardEdge,
                        child: Column(
                          children: [
                            const Image(
                                image: AssetImage(Images.jagadishaPandit1)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Джагадиша пандит прабху',
                                      maxLines: 1,
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text('Вел киртан', maxLines: 2),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      'в Кирове неделю',
                                      maxLines: 1,
                                    ),
                                  ]),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: TextButton(
              onPressed: () {},
              child: const Text('Джагадиша прабху'),
            ),
          ),
        ],
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
