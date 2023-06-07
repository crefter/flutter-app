import 'package:flutter/material.dart';
import 'package:vk/resources/resources.dart';

class News {
  final int id;
  final String imageName;
  final String title;
  final String sity;
  final String description;

  News(
      {required this.id,
      required this.imageName,
      required this.title,
      required this.sity,
      required this.description});
}

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final _news = [
    News(
      id: 1,
      imageName: Images.altar,
      title: 'Рама Навами 30.03.23 ',
      sity: 'Киров',
      description: 'Праздновали день в день, был четверг',
    ),
    News(
      id: 2,
      imageName: Images.altar,
      title: 'Рама Навами',
      sity: 'Киров',
      description:
          '(санскр. राम नवमी, IAST: Rāmanavamī) — индуистский праздник, в ходе которого отмечается день явления Рамы, — легендарного древнеиндийского принца Айодхьи, почитаемого в индуизме как аватара Вишну.[1][2][3] Рама-навами празднуется в последний, девятый день фестиваля Наваратри, в день навами шукла-пакши — девятый день светлой половины месяца чайтра по индуистскому лунному календарю. В некоторых регионах празднование длится девять дней, называемых Рама-наваратра.[4][5]',
    ),
    News(
      id: 3,
      imageName: Images.altar,
      title: 'Рама Навами',
      sity: 'Владимир',
      description:
          '(санскр. राम नवमी, IAST: Rāmanavamī) — индуистский праздник, в ходе которого отмечается день явления Рамы, — легендарного древнеиндийского принца Айодхьи, почитаемого в индуизме как аватара Вишну.[1][2][3] Рама-навами празднуется в последний, девятый день фестиваля Наваратри, в день навами шукла-пакши — девятый день светлой половины месяца чайтра по индуистскому лунному календарю. В некоторых регионах празднование длится девять дней, называемых Рама-наваратра.[4][5]',
    ),
    News(
      id: 4,
      imageName: Images.altar,
      title: 'Гринландия в Кирове',
      sity: 'Киров',
      description:
          '(санскр. राम नवमी, IAST: Rāmanavamī) — индуистский праздник, в ходе которого отмечается день явления Рамы, — легендарного древнеиндийского принца Айодхьи, почитаемого в индуизме как аватара Вишну.[1][2][3] Рама-навами празднуется в последний, девятый день фестиваля Наваратри, в день навами шукла-пакши — девятый день светлой половины месяца чайтра по индуистскому лунному календарю. В некоторых регионах празднование длится девять дней, называемых Рама-наваратра.[4][5]',
    ),
    News(
      id: 5,
      imageName: Images.altar,
      title: 'Рама Навами',
      sity: 'Москва',
      description:
          '(санскр. राम नवमी, IAST: Rāmanavamī) — индуистский праздник, в ходе которого отмечается день явления Рамы, — легендарного древнеиндийского принца Айодхьи, почитаемого в индуизме как аватара Вишну.[1][2][3] Рама-навами празднуется в последний, девятый день фестиваля Наваратри, в день навами шукла-пакши — девятый день светлой половины месяца чайтра по индуистскому лунному календарю. В некоторых регионах празднование длится девять дней, называемых Рама-наваратра.[4][5]',
    ),
    News(
      id: 6,
      imageName: Images.altar,
      title: 'Рама Навами',
      sity: 'Саратов',
      description:
          '(санскр. राम नवमी, IAST: Rāmanavamī) — индуистский праздник, в ходе которого отмечается день явления Рамы, — легендарного древнеиндийского принца Айодхьи, почитаемого в индуизме как аватара Вишну.[1][2][3] Рама-навами празднуется в последний, девятый день фестиваля Наваратри, в день навами шукла-пакши — девятый день светлой половины месяца чайтра по индуистскому лунному календарю. В некоторых регионах празднование длится девять дней, называемых Рама-наваратра.[4][5]',
    ),
  ];

  var _filteredNews = <News>[];

  final _searchController = TextEditingController();

  void _searshNews() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredNews = _news.where((News news) {
        return news.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredNews = _news;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredNews = _news;
    _searchController.addListener(_searshNews);
  }

  void _onNewsTap(int index) {
    final id = _news[index].id;
    Navigator.of(context).pushNamed('/main_screen/news_details', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 70),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _filteredNews.length,
          itemExtent: 150,
          itemBuilder: (BuildContext context, int index) {
            final neww = _filteredNews[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Image(image: AssetImage(neww.imageName)),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                neww.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                neww.sity,
                                style: const TextStyle(color: Colors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                neww.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      onTap: () => _onNewsTap(index),
                    ),
                  )
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Поиск',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
