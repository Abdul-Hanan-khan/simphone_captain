import 'package:flutter/material.dart';
import 'package:sim_phone_captain/screens/home_screen/catergory_screen/sims_no_screen/sim_types_screen/e_sim_type_screen/previous_sim_screen/previous_sim_screen.dart';

import '../../../../../../utils/navigation_controller/navigator_screen.dart';
import '../../sim_no_screen.dart';

class ESimTypeScreen extends StatefulWidget {
  const ESimTypeScreen(this.name, {Key? key}) : super(key: key);
  final String name;

  @override
  _ESimTypeScreenState createState() => _ESimTypeScreenState();
}

class _ESimTypeScreenState extends State<ESimTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("E-Sim"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                Nav.push(context, SimsNoScreen(widget.name));
              },
              child: Container(
                height: 100,
                width: 170,
                color: Colors.lightGreen,
                child: const Center(child: Text("E-Sim",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),)),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: (){
                Nav.push(context, const PreviousScreen());
              },
              child: Container(
                height: 100,
                width: 170,
                color: Colors.lightGreen,
                child: const Center(child: Text("Previous Number",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),)),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
