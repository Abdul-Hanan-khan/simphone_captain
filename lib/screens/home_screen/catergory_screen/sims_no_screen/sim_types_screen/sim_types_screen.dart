import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/navigation_controller/navigator_screen.dart';
import '../sim_no_screen.dart';
import 'e_sim_type_screen/e_sim_type_screen.dart';
import 'e_sim_type_screen/previous_sim_screen/previous_sim_screen.dart';

class SimTypeScreen extends StatefulWidget {
  const SimTypeScreen(this.name, {Key? key}) : super(key: key);
  final String name;

  @override
  _SimTypeScreenState createState() => _SimTypeScreenState();
}

class _SimTypeScreenState extends State<SimTypeScreen> {
  final List<String> logo = [
    'assets/images/simtype.png',
    'assets/images/simtype.png',
    'assets/images/simtype.png',
    'assets/images/simtype.png',
    'assets/images/simtype.png',
    'assets/images/4g.png',
  ];

  final List<String> name = [
    'Post-Paid Sim ',
    'Pre-Paid Sim',
    'My Favourite Sim',
    'E Sim',
    'Duplicate Sim',
    '4G Data Sim',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Sim Type"),
      ),
      body: GridView.builder(
        itemCount: name.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              if (name[index] == "E Sim") {
                Nav.push(context, ESimTypeScreen(widget.name));
              }
              if (name[index] == "Duplicate Sim") {
                Nav.push(context, const PreviousScreen());
              } else {
                Nav.push(context, SimsNoScreen(widget.name));
              }
            },
            child: Card(
              elevation: 0,
              // color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(logo[index], height: 100, width: 100),
                  Text(
                    name[index],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          );
        },
      ),
    ));
  }
}
