import 'package:flash_cards/components/flash_card_list_view.dart';
import 'package:flash_cards/components/flash_card_page_view.dart';
import 'package:flash_cards/providers/vocab_provider.dart';
import 'package:flash_cards/screens/sentences_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        'page': FlashCardListView(),
        'title': 'List View',
      },
      {
        'page': FlashCardPageView(),
        'title': 'Page View',
      },
      {
        'page': SentencesScreen(),
        'title': 'Sentences',
      }
    ];
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.list),
            title: const Text('List'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.pages),
            title: const Text('Single'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.assignment),
            title: const Text('Sentences'),
          ),
        ],
      ),
    );
  }
}
