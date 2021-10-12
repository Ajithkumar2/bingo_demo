import 'package:bingo_demo/screens/base_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bingo_demo/utlis/network_utlis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: use_key_in_widget_constructors
class LoginScreen extends StatefulWidget {
  @override
  _Loginstate createState() => _Loginstate();
}

class _Loginstate extends State<LoginScreen> {
  bool alreadyLoggedin = true, isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return loginView();
  }

  Widget buildProgressIndicator() {
    return CupertinoActivityIndicator(
      animating: true,
      radius: MediaQuery.of(context).size.width * 5 / 100,
    );
  }

  Widget loginView() {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
              child: alreadyLoggedin
                  ? buildProgressIndicator()
                  : ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(20),
                      children: <Widget>[
                        // Container(
                        //   alignment: Alignment.center,
                        //   padding: EdgeInsets.only(
                        //     bottom: MediaQuery.of(context).size.height * 0.08,
                        //     left: MediaQuery.of(context).size.width * 0.04,
                        //     right: MediaQuery.of(context).size.width * 0.04,
                        //   ),
                        //   child: Image.asset(
                        //     'assets/images/logo.png',
                        //     fit: BoxFit.fill,
                        //   ),
                        // ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.04,
                            MediaQuery.of(context).size.width * 0.001,
                            MediaQuery.of(context).size.width * 0.04,
                            MediaQuery.of(context).size.width * 0.03,
                          ),
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Email address',
                              labelStyle: GoogleFonts.overpass(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.04,
                            MediaQuery.of(context).size.width * 0.001,
                            MediaQuery.of(context).size.width * 0.04,
                            MediaQuery.of(context).size.width * 0.03,
                          ),
                          child: TextField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Password',
                              labelStyle: GoogleFonts.overpass(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: isLoading == true
                              ? CupertinoActivityIndicator(
                                  animating: true,
                                  radius: MediaQuery.of(context).size.width *
                                      3 /
                                      100,
                                )
                              : Container(),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.085,
                          padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.04,
                            MediaQuery.of(context).size.width * 0.03,
                            MediaQuery.of(context).size.width * 0.04,
                            0,
                          ),
                          child: OutlinedButton(
                            child: Text(
                              'Login',
                              style: GoogleFonts.overpass(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                color: const Color(0xff4fc3f7),
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    color: Color(0xFF4FC3F7), width: 1)),
                            onPressed: () async {
                              if (isLoading) return;
                              if (emailController.text.isEmpty ||
                                  passwordController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Please fill all the fields',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                  ),
                                );
                                return;
                              }
                              setState(() {
                                isLoading = true;
                              });
                              String response = await Utlis.login(
                                  emailController.text,
                                  passwordController.text);
                              setState(() {
                                isLoading = false;
                              });
                              if (response == "success") {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home(),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      response,
                                      style: const TextStyle(
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.only(
                              top: 0,
                            ),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Do not have an account?',
                                  style: GoogleFonts.overpass(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                  ),
                                ),
                                TextButton(
                                  child: Text(
                                    'Sign Up',
                                    style: GoogleFonts.overpass(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.043,
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    primary: const Color(0xFF4FC3F7),
                                  ),
                                  onPressed: () {},
                                )
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ))
                      ],
                    ))),
    );
  }

  checkLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getString("email") != null) {
      String email = preferences.getString("email") ?? "";
      String password = preferences.getString("password") ?? "";
      print("login check called");
      String data = await Utlis.login(email, password);
      if (data == "success") {
        alreadyLoggedin = true;
      } else {
        alreadyLoggedin = false;
      }
      if (alreadyLoggedin) Navigator.pushReplacementNamed(context, "/home");
    } else {
      alreadyLoggedin = false;
    }

    setState(() {});
  }
}
