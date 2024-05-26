import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:reverse_vending_machine/otp_page.dart';

import 'first_page.dart';
import 'loading_page.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<StatefulWidget> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  TextEditingController _numberController = TextEditingController();
  DatabaseReference dbRef=FirebaseDatabase.instance.ref().child("Users");

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    double heightDevice = MediaQuery.of(context).size.height;
    double widthDevice = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        // Return false to disable back button
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
          automaticallyImplyLeading: false,
          title: Text(
            "Enter the phone number",
            style: TextStyle(
                fontSize: 20.w, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          toolbarHeight: 60.w,
          centerTitle: true,
        ),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
        body: Container(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.w),
                  child: Container(
                    width: widthDevice,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(180, 194, 181, 1.0),
                        border: Border(
                            bottom: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black))),
                    child: Center(
                      child: Padding(
                        padding:
                            EdgeInsets.only(top: 50.w, left: 30.w, right: 30.w),
                        child: TextField(
                          readOnly: true,
                          showCursor: false,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          style: TextStyle(fontSize: 35.w),
                          controller: _numberController,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20.w),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20.w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            stops: [
                                              0.1.w,
                                              0.4.w,
                                              0.6.w,
                                              0.9.w,
                                            ],
                                            colors: const [
                                              Color.fromRGBO(20, 98, 16, 1.0),
                                              Color.fromRGBO(22, 157, 34, 1.0),
                                              Color.fromRGBO(22, 157, 34, 1.0),
                                              Color.fromRGBO(20, 98, 16, 1.0),
                                              //Color.fromRGBO(7, 121, 222, 1.0),
                                              // Color.fromRGBO(20, 72, 140, 1.0),
                                            ],
                                          ),
                                          //  color: Color.fromRGBO(188, 197, 197, 1.0),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20.w),
                                              topLeft: Radius.circular(20.w),
                                              bottomRight: Radius.circular(20.w),
                                              bottomLeft: Radius.circular(20.w))),
                                      child: InkWell(
                                        onTap: () {
                                          _numberController.text =
                                              "${_numberController.text.trim()}1";
                                        },
                                        child: Center(
                                          child: Text(
                                            "1",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 45.w,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20.w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            stops: [
                                              0.1.w,
                                              0.4.w,
                                              0.6.w,
                                              0.9.w,
                                            ],
                                            colors: const [
                                              Color.fromRGBO(20, 98, 16, 1.0),
                                              Color.fromRGBO(22, 157, 34, 1.0),
                                              Color.fromRGBO(22, 157, 34, 1.0),
                                              Color.fromRGBO(20, 98, 16, 1.0),
                                              //Color.fromRGBO(7, 121, 222, 1.0),
                                              // Color.fromRGBO(20, 72, 140, 1.0),
                                            ],
                                          ),
                                          //  color: Color.fromRGBO(188, 197, 197, 1.0),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20.w),
                                              topLeft: Radius.circular(20.w),
                                              bottomRight: Radius.circular(20.w),
                                              bottomLeft: Radius.circular(20.w))),
                                      child: InkWell(
                                        onTap: () {
                                          _numberController.text =
                                              "${_numberController.text.trim()}2";
                                        },
                                        child: Center(
                                          child: Text(
                                            "2",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 45.w,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20.w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            stops: [
                                              0.1.w,
                                              0.4.w,
                                              0.6.w,
                                              0.9.w,
                                            ],
                                            colors: const [
                                              Color.fromRGBO(20, 98, 16, 1.0),
                                              Color.fromRGBO(22, 157, 34, 1.0),
                                              Color.fromRGBO(22, 157, 34, 1.0),
                                              Color.fromRGBO(20, 98, 16, 1.0),
                                              //Color.fromRGBO(7, 121, 222, 1.0),
                                              // Color.fromRGBO(20, 72, 140, 1.0),
                                            ],
                                          ),
                                          //  color: Color.fromRGBO(188, 197, 197, 1.0),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20.w),
                                              topLeft: Radius.circular(20.w),
                                              bottomRight: Radius.circular(20.w),
                                              bottomLeft: Radius.circular(20.w))),
                                      child: InkWell(
                                        onTap: () {
                                          _numberController.text =
                                              "${_numberController.text.trim()}3";
                                        },
                                        child: Center(
                                          child: Text(
                                            "3",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 45.w,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20.w),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20.w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            stops: [
                                              0.1.w,
                                              0.4.w,
                                              0.6.w,
                                              0.9.w,
                                            ],
                                            colors: const [
                                              Color.fromRGBO(20, 98, 16, 1.0),
                                              Color.fromRGBO(22, 157, 34, 1.0),
                                              Color.fromRGBO(22, 157, 34, 1.0),
                                              Color.fromRGBO(20, 98, 16, 1.0),
                                              //Color.fromRGBO(7, 121, 222, 1.0),
                                              // Color.fromRGBO(20, 72, 140, 1.0),
                                            ],
                                          ),
                                          //  color: Color.fromRGBO(188, 197, 197, 1.0),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20.w),
                                              topLeft: Radius.circular(20.w),
                                              bottomRight: Radius.circular(20.w),
                                              bottomLeft: Radius.circular(20.w))),
                                      child: InkWell(
                                        onTap: () {
                                          _numberController.text =
                                              "${_numberController.text.trim()}4";
                                        },
                                        child: Center(
                                          child: Text(
                                            "4",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 45.w,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20.w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            stops: [
                                              0.1.w,
                                              0.4.w,
                                              0.6.w,
                                              0.9.w,
                                            ],
                                            colors: const [
                                              Color.fromRGBO(20, 98, 16, 1.0),
                                              Color.fromRGBO(22, 157, 34, 1.0),
                                              Color.fromRGBO(22, 157, 34, 1.0),
                                              Color.fromRGBO(20, 98, 16, 1.0),
                                              //Color.fromRGBO(7, 121, 222, 1.0),
                                              // Color.fromRGBO(20, 72, 140, 1.0),
                                            ],
                                          ),
                                          //  color: Color.fromRGBO(188, 197, 197, 1.0),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20.w),
                                              topLeft: Radius.circular(20.w),
                                              bottomRight: Radius.circular(20.w),
                                              bottomLeft: Radius.circular(20.w))),
                                      child: InkWell(
                                        onTap: () {
                                          _numberController.text =
                                              "${_numberController.text.trim()}5";
                                        },
                                        child: Center(
                                          child: Text(
                                            "5",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 45.w,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20.w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            stops: [
                                              0.1.w,
                                              0.4.w,
                                              0.6.w,
                                              0.9.w,
                                            ],
                                            colors: const [
                                              Color.fromRGBO(20, 98, 16, 1.0),
                                              Color.fromRGBO(22, 157, 34, 1.0),
                                              Color.fromRGBO(22, 157, 34, 1.0),
                                              Color.fromRGBO(20, 98, 16, 1.0),
                                              //Color.fromRGBO(7, 121, 222, 1.0),
                                              // Color.fromRGBO(20, 72, 140, 1.0),
                                            ],
                                          ),
                                          //  color: Color.fromRGBO(188, 197, 197, 1.0),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20.w),
                                              topLeft: Radius.circular(20.w),
                                              bottomRight: Radius.circular(20.w),
                                              bottomLeft: Radius.circular(20.w))),
                                      child: InkWell(
                                        onTap: () {
                                          _numberController.text =
                                              "${_numberController.text.trim()}6";
                                        },
                                        child: Center(
                                          child: Text(
                                            "6",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 45.w,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20.w),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20.w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            stops: [
                                              0.1.w,
                                              0.4.w,
                                              0.6.w,
                                              0.9.w,
                                            ],
                                            colors: const [
                                              Color.fromRGBO(20, 98, 16, 1.0),
                                              Color.fromRGBO(22, 157, 34, 1.0),
                                              Color.fromRGBO(22, 157, 34, 1.0),
                                              Color.fromRGBO(20, 98, 16, 1.0),
                                              //Color.fromRGBO(7, 121, 222, 1.0),
                                              // Color.fromRGBO(20, 72, 140, 1.0),
                                            ],
                                          ),
                                          //  color: Color.fromRGBO(188, 197, 197, 1.0),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20.w),
                                              topLeft: Radius.circular(20.w),
                                              bottomRight: Radius.circular(20.w),
                                              bottomLeft: Radius.circular(20.w))),
                                      child: InkWell(
                                        onTap: () {
                                          _numberController.text =
                                              "${_numberController.text.trim()}7";
                                        },
                                        child: Center(
                                          child: Text(
                                            "7",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 45.w,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20.w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            stops: [
                                              0.1.w,
                                              0.4.w,
                                              0.6.w,
                                              0.9.w,
                                            ],
                                            colors: const [
                                              Color.fromRGBO(20, 98, 16, 1.0),
                                              Color.fromRGBO(22, 157, 34, 1.0),
                                              Color.fromRGBO(22, 157, 34, 1.0),
                                              Color.fromRGBO(20, 98, 16, 1.0),
                                              //Color.fromRGBO(7, 121, 222, 1.0),
                                              // Color.fromRGBO(20, 72, 140, 1.0),
                                            ],
                                          ),
                                          //  color: Color.fromRGBO(188, 197, 197, 1.0),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20.w),
                                              topLeft: Radius.circular(20.w),
                                              bottomRight: Radius.circular(20.w),
                                              bottomLeft: Radius.circular(20.w))),
                                      child: InkWell(
                                        onTap: () {
                                          _numberController.text =
                                              "${_numberController.text.trim()}8";
                                        },
                                        child: Center(
                                          child: Text(
                                            "8",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 45.w,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20.w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            stops: [
                                              0.1.w,
                                              0.4.w,
                                              0.6.w,
                                              0.9.w,
                                            ],
                                            colors: const [
                                              Color.fromRGBO(20, 98, 16, 1.0),
                                              Color.fromRGBO(22, 157, 34, 1.0),
                                              Color.fromRGBO(22, 157, 34, 1.0),
                                              Color.fromRGBO(20, 98, 16, 1.0),
                                              //Color.fromRGBO(7, 121, 222, 1.0),
                                              // Color.fromRGBO(20, 72, 140, 1.0),
                                            ],
                                          ),
                                          //  color: Color.fromRGBO(188, 197, 197, 1.0),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20.w),
                                              topLeft: Radius.circular(20.w),
                                              bottomRight: Radius.circular(20.w),
                                              bottomLeft: Radius.circular(20.w))),
                                      child: InkWell(
                                        onTap: () {
                                          _numberController.text =
                                              "${_numberController.text.trim()}9";
                                        },
                                        child: Center(
                                          child: Text(
                                            "9",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 45.w,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20.w),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20.w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            stops: [
                                              0.1.w,
                                              0.4.w,
                                              0.6.w,
                                              0.9.w,
                                            ],
                                            colors: const [
                                              Color.fromRGBO(20, 98, 16, 1.0),
                                              Color.fromRGBO(22, 157, 34, 1.0),
                                              Color.fromRGBO(22, 157, 34, 1.0),
                                              Color.fromRGBO(20, 98, 16, 1.0),
                                              //Color.fromRGBO(7, 121, 222, 1.0),
                                              // Color.fromRGBO(20, 72, 140, 1.0),
                                            ],
                                          ),
                                          //  color: Color.fromRGBO(188, 197, 197, 1.0),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20.w),
                                              topLeft: Radius.circular(20.w),
                                              bottomRight: Radius.circular(20.w),
                                              bottomLeft: Radius.circular(20.w))),
                                      child: InkWell(
                                        onTap: () {
                                          _numberController.text = "";
                                        },
                                        child: Center(
                                          child: Text(
                                            "C",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 45.w,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20.w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            stops: [
                                              0.1.w,
                                              0.4.w,
                                              0.6.w,
                                              0.9.w,
                                            ],
                                            colors: const [
                                              Color.fromRGBO(20, 98, 16, 1.0),
                                              Color.fromRGBO(22, 157, 34, 1.0),
                                              Color.fromRGBO(22, 157, 34, 1.0),
                                              Color.fromRGBO(20, 98, 16, 1.0),
                                              //Color.fromRGBO(7, 121, 222, 1.0),
                                              // Color.fromRGBO(20, 72, 140, 1.0),
                                            ],
                                          ),
                                          //  color: Color.fromRGBO(188, 197, 197, 1.0),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20.w),
                                              topLeft: Radius.circular(20.w),
                                              bottomRight: Radius.circular(20.w),
                                              bottomLeft: Radius.circular(20.w))),
                                      child: InkWell(
                                        onTap: () {
                                          _numberController.text =
                                              "${_numberController.text.trim()}0";
                                        },
                                        child: Center(
                                          child: Text(
                                            "0",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 45.w,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20.w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            stops: [
                                              0.1.w,
                                              0.4.w,
                                              0.6.w,
                                              0.9.w,
                                            ],
                                            colors: const [
                                              Color.fromRGBO(20, 98, 16, 1.0),
                                              Color.fromRGBO(22, 157, 34, 1.0),
                                              Color.fromRGBO(22, 157, 34, 1.0),
                                              Color.fromRGBO(20, 98, 16, 1.0),
                                              //Color.fromRGBO(7, 121, 222, 1.0),
                                              // Color.fromRGBO(20, 72, 140, 1.0),
                                            ],
                                          ),
                                          //  color: Color.fromRGBO(188, 197, 197, 1.0),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20.w),
                                              topLeft: Radius.circular(20.w),
                                              bottomRight: Radius.circular(20.w),
                                              bottomLeft: Radius.circular(20.w))),
                                      child: InkWell(
                                        onTap: () {
                                          if (_numberController.text
                                              .trim()
                                              .isNotEmpty) {
                                            _numberController.text =
                                                _numberController
                                                    .text
                                                    .trim()
                                                    .substring(
                                                        0,
                                                        _numberController.text
                                                                .trim()
                                                                .length -
                                                            1);
                                          }
                                        },
                                        child: Center(
                                            child: Icon(
                                          Icons.backspace_rounded,
                                          color: Colors.white,
                                          size: 40.w,
                                        )),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
        bottomNavigationBar: Container(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.zero)),
                    backgroundColor: const Color.fromRGBO(67, 134, 71, 1.0),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const FirstPage()));
                    /*
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AdminHomePage(),
                        ),
                            (route) => false);


                     */
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.w, bottom: 20.w),
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white, fontSize: 15.w),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    // backgroundColor: const Color.fromRGBO(23, 64, 124, 1.0),
                    backgroundColor: const Color.fromRGBO(13, 63, 26, 1.0),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.zero)),
                  ),
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        context = context;
                        return const LoadingPage();
                      },
                    );
                    if (_numberController.text.trim().startsWith('0')) {
                      _numberController.text =
                          _numberController.text.substring(1);
                    }
                    if (_numberController.text.length == 9) {
                      _numberController.text='+94${_numberController.text}';
                      dbRef.child("${_numberController.text}/Total points").once().then((event) async {
                        DataSnapshot snapshot = event.snapshot;
                        if (snapshot.value != null) {
                          showErrorMessage(context, "Account already found");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UserRegister(),
                            ),
                          );
                        } else {
                          try {
                             await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: _numberController.text,
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException e) {},
                              codeSent: (String verificationId, int? resendToken) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OtpCheckPage(
                                      verificationId: verificationId,
                                      mobileNumber: _numberController.text,
                                    ),
                                  ),
                                );
                              },
                              codeAutoRetrievalTimeout: (String verificationId) {},
                            );
                          } on FirebaseAuthException catch (e) {
                            // Check if the widget is still in the widget tree
                            if (!mounted) return;
                            // Handle errors, such as wrong OTP
                            print("Error: $e");
                          }
                        }
                      }, onError: (Object error) {
                        print("Error: $error");
                      });
                    } /*else {
                      Fluttertoast.showToast(
                          msg: "Enter a valid number",
                          toastLength: Toast.LENGTH_SHORT);
                    }*/

                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.w, bottom: 20.w),
                    child: Text(
                      "Send OTP",
                      style: TextStyle(color: Colors.white, fontSize: 15.w),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red[800] ?? Colors.red,
                // Use Colors.red if Colors.red[800] is null
                Colors.red[900] ?? Colors.red,
                // Use Colors.red if Colors.red[900] is null
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10.w),
          ),
          padding: EdgeInsets.all(16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.w,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

