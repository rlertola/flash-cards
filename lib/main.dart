import 'package:flash_cards/components/flash_card_page_view.dart';
import 'package:flash_cards/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

import 'components/flash_card_list_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   title: Text(
        //     'Flash Cards',
        //     style: TextStyle(
        //       fontSize: 24,
        //     ),
        //   ),
        // ),
        body: Container(
          child: TabsScreen(),
          // child: FlashCardPageView(),
          // child: FlashCardListView(),
        ),
      ),
    );
  }
}
