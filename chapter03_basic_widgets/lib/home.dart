import 'package:chapter_3_basic_widgets/card1.dart';
import 'package:chapter_3_basic_widgets/card2.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedtab = 0;
  void onTapItem(int index) {
    setState(() {
      selectedtab = index;
    });
  }

  List Pages = <Widget>[
    const Card1(),
    const card2(),
    Container(color: Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[selectedtab],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Card1'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Card2'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Card3'),
        ],
        onTap: onTapItem,
        selectedItemColor: Colors.green,
        currentIndex: selectedtab,
      ),
    );
  }
}
