import 'package:flutter/material.dart';
import 'package:sim_phone_captain/screens/home_screen/order_screen/order_screen.dart';
import 'package:sim_phone_captain/screens/home_screen/side_menu.dart';

import '../../utils/navigation_controller/navigator_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const Drawer(
        child: SideMenu(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02, vertical: size.height * 0.01),
        children: [
          InkWell(
            onTap: (){
              Nav.push(context, const OrderScreen());
            },
            child: Card(
              elevation: 10,
              color: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                // side: BorderSide( width: 5, color: Colors.green),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Icon(
                      Icons.blur_linear,
                      color: Colors.green.shade500,
                      size: size.height * 0.05,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      "Approved",
                      style: TextStyle(color: Colors.green.shade500, fontWeight: FontWeight.w600, fontSize: size.height * 0.03),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "All your Approved orders",
                          style: TextStyle(color: Colors.green.shade500, fontWeight: FontWeight.w400, fontSize: size.height * 0.02),
                        ),
                        Text(
                          "20",
                          style: TextStyle(color: Colors.green.shade500, fontWeight: FontWeight.w400, fontSize: size.height * 0.02),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Nav.push(context, const OrderScreen());
            },
            child: Card(
              elevation: 10,
              color: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                // side: BorderSide( width: 5, color: Colors.green),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Icon(
                      Icons.volume_up,
                      color: Colors.green.shade500,
                      size: size.height * 0.05,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      "Delivered",
                      style: TextStyle(color: Colors.green.shade500, fontWeight: FontWeight.w600, fontSize: size.height * 0.03),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "All the orders that you delivered",
                          style: TextStyle(color: Colors.green.shade500, fontWeight: FontWeight.w400, fontSize: size.height * 0.02),
                        ),
                        Text(
                          "10",
                          style: TextStyle(color: Colors.green.shade500, fontWeight: FontWeight.w400, fontSize: size.height * 0.02),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
