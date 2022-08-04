import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../bloc/auth_cubit/sign_in_cubit/sign_in_cubit.dart';
import '../ui_components/loading_screen_animation.dart';
import '../ui_components/show_snack_bar.dart';
import '../utils/navigation_controller/navigator_screen.dart';
import 'bottom_nav_screen/bottom_nav_screen.dart';
import 'get_started.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  Future<void> _onSignInButtonPressed(BuildContext context) async {
    if (_emailTextController.text.isEmpty) {
      Get.snackbar(" EMAIL","Please Enter Email");
    }
    else if (_passwordTextController.text.isEmpty) {
      Get.snackbar(" PASSWORD","Please Enter Password");
    } else {
      context.read<SignInCubit>().signInWithEmail(password: _passwordTextController.text, email: _emailTextController.text);
    }
  }
  bool visibility = false;

  void onVisIconPressed() {
    setState(() {
      visibility = !visibility;
    });
  }

  storeToken(String token) {
    GetStorage().write('token', token);
  }
  storeNameToken(String token) {
    GetStorage().write('name', token);
  }
  storePhoneToken(String token) {
    GetStorage().write('phone', token);
  }
  storeEmailToken(String token) {
    GetStorage().write('email', token);
  }
  List<Color> _colors = [Colors.white, Colors.blue.shade700 ,Colors.white,];
  List<double> _stops = [0.0, 3.4, 0.0];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInFailed) {
            showSnackBar(context, state.message);
          }
          if (state is SignInSuccessful) {
            showSnackBar(context, "Sign in Successfully", type: SnackBarType.success);

            storeToken(state.response!.data!.token!);
            storeNameToken(state.response!.data!.user!.name!);
            storeEmailToken(state.response!.data!.user!.email!);
            storePhoneToken(state.response!.data!.user!.phone!.toString());
            Nav.pushAndRemoveAllRoute(context, const BottomNavScreen());
          }
        },
        builder: (context, state) {
          return LoadingScreenAnimation(
            isLoading: state is LoadingState,
            child: SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.lightBlueAccent.shade100,
                body: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                            iconSize: size.height * 0.03,
                            color: Colors.white,
                            icon: const Icon(Icons.arrow_back_ios), onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const GetStarted();
                            }),
                          );
                        },),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Image(
                            width: size.width * 0.5,
                            height: size.width * 0.3,
                            image: const AssetImage("assets/images/simphonelogo.png"),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: size.height * 0.02),
                            child: Text(
                              "Welcome Back You Have Been Missed!",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey.shade800, fontSize: size.height * 0.025),
                            ),
                          ),

                          // controller: _emailTextController,

                          SizedBox(
                            height: size.height * 0.03,
                          ),

                          /// email
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              height: Get.height*0.065,
                              decoration: BoxDecoration(
                                  color: Colors.blue.shade700,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:Get.width*0.75,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(30)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 11.0 , left: 5),
                                        child: Icon(
                                          Icons.email,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  TextFormField(
                                    controller: _emailTextController,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.none, color: Colors.white),
                                      ),

                                      hintText: 'Email',
                                      // labelStyle: TextStyle(
                                      //   color: Colors.grey,
                                      //   fontSize: 30,
                                      // ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          /// password
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              height: Get.height*0.065,
                              decoration: BoxDecoration(

                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Stack(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 14.0),
                                        child: Icon(
                                          Icons.vpn_key,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container(
                                        width: Get.width*0.75,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(30)),
                                      ),
                                    ],
                                  ),
                                  TextFormField(
                                    controller: _passwordTextController,
                                    obscureText: visibility ? false : true,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      suffixIcon: InkWell(
                                        child: Icon(

                                          visibility ? Icons.visibility_off : Icons.visibility ,color: Colors.red,
                                          size: size.height * 0.03,
                                        ),
                                        onTap: () {
                                          onVisIconPressed();
                                          setState(() {

                                          });
                                        },
                                      ),
                                      border: InputBorder.none,
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.none, color: Colors.white),
                                      ),

                                      hintText: 'Password',
                                      // labelStyle: TextStyle(
                                      //   color: Colors.grey,
                                      //   fontSize: 30,
                                      // ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),




                          SizedBox(
                            height: size.height * 0.1,
                          ),



                          InkWell(
                            onTap: () {

                              _onSignInButtonPressed(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal:Get.width*0.15),
                              child: Container(
                                alignment: Alignment.center,
                                width: 310,
                                height: 52,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: _colors,
                                      stops: _stops,
                                    ),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: Colors.white,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: size.height * 0.025),
                          //   child: ElevatedButton(
                          //     style: ButtonStyle(
                          //       shape: MaterialStateProperty.all(
                          //         RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(10),
                          //         ),
                          //       ),
                          //       backgroundColor: MaterialStateProperty.all(Colors.green.shade400),
                          //     ),
                          //     onPressed: () {
                          //
                          //     },
                          //     child: Padding(
                          //       padding: EdgeInsets.all(size.height * 0.012),
                          //       child: Text(
                          //         "Sign In",
                          //         style: TextStyle(fontSize: size.height * 0.025),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: size.height * 0.07,
                          ),
                          /// on continue with
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: size.width * 0.23,
                                height: 1,
                                child: DecoratedBox(decoration: BoxDecoration(color: Colors.grey.shade800)),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 0),
                                child: const Text("Or Continue With"),
                              ),
                              SizedBox(
                                width: size.width * 0.23,
                                height: 1,
                                child: DecoratedBox(decoration: BoxDecoration(color: Colors.grey.shade800)),
                              ),
                            ],
                          ),


                          Padding(
                            padding: EdgeInsets.symmetric(vertical: size.height * 0.04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 1,
                                ),
                               CircleAvatar(
                                 radius: Get.height*0.032,
                                 backgroundColor: Colors.transparent,
                                   child: Image.asset("assets/images/google.png")
                               ),
                               CircleAvatar(
                                 radius: Get.height*0.032,
                                 backgroundColor: Colors.white,
                                   child: Image.asset("assets/images/facebook-logo-1024x1024.png")
                               ),
                               CircleAvatar(
                                 radius: Get.height*0.032,
                                 backgroundColor: Colors.white,
                                   child: Image.asset("assets/images/twitter.png")
                               ),
                                Container(
                                  height: 1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
