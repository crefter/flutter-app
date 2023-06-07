import 'package:flutter/material.dart';

import '../news/new_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 1;

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BHAKTI')),
      body: IndexedStack(
        index: _selectedTab,
        children: const [
          Text('Помощь'),
          NewsList(),
          Text('Встречи'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.lyrics), label: 'Помощь'),
          BottomNavigationBarItem(
              icon: Icon(Icons.live_help), label: 'Новости'),
          BottomNavigationBarItem(
              icon: Icon(Icons.free_breakfast_rounded), label: 'Встречи'),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
