import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reverse_vending_machine/user_login.dart';
import 'package:reverse_vending_machine/user_register.dart';
import 'package:video_player/video_player.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<StatefulWidget> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late VideoPlayerController _controller;
  bool _visible = false;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    _controller = VideoPlayerController.asset("assets/videos/bg.mp4");
    _controller.initialize().then((_) {
      _controller.setLooping(true);
      Timer(const Duration(milliseconds: 100), () {
        setState(() {
          _controller.play();
          _visible = true;
        });
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  _getVideoBackground() {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 1000),
      child: VideoPlayer(_controller),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Return false to disable back button
        return false;
      },
      child: Scaffold(
        body: Center(
          child: Stack(
            children: <Widget>[
              _getVideoBackground(),
              Container(
                color: const Color.fromRGBO(255, 255, 255, 0.6),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Expanded(
                        flex: 4,
                        child: SvgPicture.asset(
                          'assets/images/logo.svg',
                          width: MediaQuery.of(context).size.width / 1.5,
                        )),
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding:  EdgeInsets.only(left:50.w,right:50.w),
                          child: Column(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize:
                                    Size.fromWidth(MediaQuery.of(context).size.width),
                                  backgroundColor: const Color.fromRGBO(0, 155, 144, 1.0),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.w)))),
                                onPressed: () {
                                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>const UserRegister()));
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>UserRegister()), (route) => false);
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.w, bottom: 10.w),
                                  child: Text(
                                    "Register",
                                    style: TextStyle(fontSize: 25.w,color: Colors.white,fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(top:50.w),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      fixedSize:
                                      Size.fromWidth(MediaQuery.of(context).size.width),
                                      backgroundColor: const Color.fromRGBO(0, 155, 144, 1.0),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.w)))),
                                  onPressed: () {
                                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>const UserLogin()));
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>UserLogin()), (route) => false);
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(top: 10.w, bottom: 10.w),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(fontSize: 25.w,color: Colors.white,fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                    ),
                    Expanded(flex:1,child: Padding(
                      padding:  EdgeInsets.only(bottom:20.w),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text("Copyrights Reserved",style: TextStyle(
                          fontSize: 12.w,color: Colors.black
                        ),),
                      ),
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
