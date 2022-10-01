import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Card1'),
        BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Card2'),
        BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Card3'),
      ]),
    );
  }
}
