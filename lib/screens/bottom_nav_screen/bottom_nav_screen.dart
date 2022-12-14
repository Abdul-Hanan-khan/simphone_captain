import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../home_screen/home_screen.dart';
import '../home_screen/order_screen/order_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;

  final List<String> imgList = [
    'assets/images/sim.png',
    'assets/images/phone.png',
    'assets/images/wifi.png',
  ];

  final List<String> logo = [
    'assets/images/jaz.png',
    'assets/images/ufone.png',
    'assets/images/zong.png',
    'assets/images/telenor.png',
  ];
  final List<String> name = [
    'JAZZ',
    'UFONE',
    'ZONG',
    'TELENOR',
  ];

  List<Widget> tab = [
    const HomeScreen(),
    const OrderScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: tab[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(

        curve: Curves.linear,
        margin: EdgeInsets.symmetric(horizontal: size.width * 0, vertical: size.height * 0.01),
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(
            () {
              _currentIndex = i;
            },
          );
        },
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.green.shade400,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.delivery_dining),
            title: const Text("Order"),
            selectedColor: Colors.green.shade400,
          ),
        ],
      ),
    ));
  }
}
