import 'dart:async';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:reverse_vending_machine/first_page.dart';


class BluetoothManager {
  BluetoothConnection? connection; // Make it nullable (Optional 1)
  final List<String> receivedMessages = []; // Store received messages

  Future<void> connect(String address) async {
    try {
      connection = await BluetoothConnection.toAddress(address);
      connection?.input?.listen(onDataReceived); // Listen to incoming data
    } on Exception catch (e) {
      print('Connection error: $e');
    }
  }

  Future<void> disconnect() async {
    try {
      await connection?.close();
    } on Exception catch (e) {
      print('Disconnection error: $e');
    }
  }

  void onDataReceived(List<int> data) {
    // Handle incoming data from the HC-06 module
    String message = String.fromCharCodes(data); // Convert bytes to string
    receivedMessages.add(message);
    print('Received message: $message');
  }
}



class HomePage extends StatefulWidget {
  final String phoneNumber;

  const HomePage({super.key, required this.phoneNumber});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DatabaseReference dbRef;
  String numberOfBottles = "0";
   int numberOfBottlesLocal = 0;
  String totalPoints = "0";
  bool clicked=false;
  bool addButtonDisabled=false;
  late StreamSubscription pointsSubscription;
  final BluetoothManager _bluetoothManager = BluetoothManager();
  String _message = '';
  bool _isConnected = false;

  Future<void> _checkConnection() async {
    await Permission.location
        .request(); // Needed for Bluetooth scanning on Android
    await Permission.bluetooth.request();
    // Check for BLUETOOTH_SCAN permission on Android 13 or later
    if (Platform.isAndroid &&
        int.parse(Platform.version.split('.').first) >= 13) {
      await Permission.bluetoothScan.request();
    }
  }

  Future<void> _connect() async {
    String address = '00:22:09:02:1C:3E'; // Replace with your HC-06 address
    await _checkConnection(); // Ensure permissions before connection
    await _bluetoothManager.connect(address);
    setState(() {
      _isConnected = true;
    });
  }

  Future<void> _disconnect() async {
    await _bluetoothManager.disconnect();
    setState(() {
      _isConnected = false;
    });
  }

  Future<void> _sendMessage(String messageSend) async {
    if (_isConnected) {
      _bluetoothManager.connection?.output
          .add(Uint8List.fromList(messageSend.codeUnits)); // Convert to Uint8List
      setState(() {
        messageSend = '';
      });
    } else {
      // Handle sending message when not connected
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      addButtonDisabled=false;
    });
    _connect();
    _bluetoothManager.receivedMessages.add("new");
    _checkConnection();
    dbRef =
        FirebaseDatabase.instance.ref().child("Users/${widget.phoneNumber}");
    obtainPointsDetails("bottles");
    obtainPointsDetails("Total points");
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  void obtainPointsDetails(String ref) {
    DatabaseReference loyaltyPointsRef = FirebaseDatabase.instance
        .ref()
        .child("Users/${widget.phoneNumber}/$ref");
    pointsSubscription = loyaltyPointsRef.onValue.listen((event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        setState(() {
          if(ref=="bottles"){
            numberOfBottles = (snapshot.value.toString());
          }else if(ref=="Total points"){
            totalPoints = (snapshot.value.toString());
          }

          print("newnew points : $totalPoints");
        });
      } else {
        print("Snapshot is null or empty.");
      }
    }, onError: (Object error) {
      print("Error: $error");
    });
  }


  @override
  void dispose() {
    pointsSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        // Return false to disable back button
        return false;
      },
      child: MaterialApp(
        home:Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(widget.phoneNumber,
                      style: TextStyle(
                          color: const Color.fromRGBO(255, 255, 255, 1.0),
                          fontSize: 20.w,
                          fontWeight: FontWeight.bold)),
                ),
                toolbarHeight: 60.w,
                backgroundColor: Colors.green),
            body: Stack(
              children: [
                Container(
                  width: widthSize,
                  height: heightSize,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/plastic.jpg",
                          ),
                          fit: BoxFit.cover)),
                ),
                /*
                Container(
                  width: widthSize,
                  height: heightSize,
                  color: Color.fromRGBO(8, 215, 220, 0.2)

                ),

                 */
                Container(
                  width: widthSize,
                  height: heightSize,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.w),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 20.w),
                            child: Container(
                              width: widthSize,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(165, 214, 167, 0.8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.w)),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 10.w),
                                      child: Text(
                                        "Total loyalty points",
                                        style: TextStyle(
                                            fontSize: 15.w,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 10.w),
                                      child: Text(
                                        totalPoints.toString(),
                                        style: TextStyle(
                                            fontSize: 35.w,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 20.w),
                            child: Container(
                              width: widthSize,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(165, 214, 167, 0.8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.w)),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 10.w),
                                      child: Text(
                                        "Total bottles added now",
                                        style: TextStyle(
                                            fontSize: 15.w,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 10.w),
                                      child: Text(
                                        numberOfBottles.toString(),
                                        style: TextStyle(
                                            fontSize: 35.w,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.w)),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10.w),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        _sendMessage("1");
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              shape:
                                              const RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.zero)),
                                              backgroundColor: Colors.white,
                                              content: Text(
                                                "press close after insert the bottle inside",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.w,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              actions: [
                                                ElevatedButton(
                                                  style:
                                                  ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                    Colors.black,
                                                    elevation: 0,
                                                  ),
                                                  onPressed: () async {
                                                    if(addButtonDisabled==false){
                                                      setState(() {
                                                        addButtonDisabled=true;
                                                      });
                                                      _sendMessage("2");
                                                      await Future.delayed(Duration(seconds: 5)).then((value) {
                                                        print("receivedMessages.last = ${_bluetoothManager.receivedMessages.last}");
                                                        if(_bluetoothManager.receivedMessages.last.contains( "3")){
                                                          print("receivedMessages.last inside= ${_bluetoothManager.receivedMessages.last}");
                                                          numberOfBottles=(int.parse(numberOfBottles)+1).toString();
                                                          totalPoints =(double.parse(totalPoints)+(0.1)).toString();

                                                          Map<String, String>  newPointsUpdate = {
                                                            "Total points": (double.parse(totalPoints).toStringAsFixed(2)).toString(),
                                                            "bottles":numberOfBottles,
                                                          };
                                                          dbRef.update(newPointsUpdate);
                                                          _sendMessage("6");
                                                          addButtonDisabled=false;
                                                          _bluetoothManager.receivedMessages.add("new");
                                                          Navigator.of(context).pop();
                                                        }else if(_bluetoothManager.receivedMessages.last.contains( "4")){
                                                        print("receivedMessages.last inside= ${_bluetoothManager.receivedMessages.last}");
                                                        numberOfBottles=(int.parse(numberOfBottles)+1).toString();
                                                        totalPoints =(double.parse(totalPoints)+(0.2)).toString();

                                                        Map<String, String>  newPointsUpdate = {
                                                        "Total points": (double.parse(totalPoints).toStringAsFixed(2)).toString(),
                                                        "bottles":numberOfBottles,
                                                        };
                                                        dbRef.update(newPointsUpdate);
                                                        _sendMessage("6");
                                                        addButtonDisabled=false;
                                                        _bluetoothManager.receivedMessages.add("new");
                                                        Navigator.of(context).pop();
                                                        }else if(_bluetoothManager.receivedMessages.last.contains( "5")){
                                                          print("receivedMessages.last inside= ${_bluetoothManager.receivedMessages.last}");
                                                          numberOfBottles=(int.parse(numberOfBottles)+1).toString();
                                                          totalPoints =(double.parse(totalPoints)+(0.3)).toString();

                                                          Map<String, String>  newPointsUpdate = {
                                                            "Total points": (double.parse(totalPoints).toStringAsFixed(2)).toString(),
                                                            "bottles":numberOfBottles,
                                                          };
                                                          dbRef.update(newPointsUpdate);
                                                          _sendMessage("6");
                                                          addButtonDisabled=false;
                                                          _bluetoothManager.receivedMessages.add("new");
                                                          Navigator.of(context).pop();
                                                        }else if(_bluetoothManager.receivedMessages.last.contains("new")){
                                                          print("receivedMessages.last inside false= ${_bluetoothManager.receivedMessages.last}");
                                                          _sendMessage("6");
                                                          //Fluttertoast.showToast(msg: "Please check the bottle and try again",toastLength:Toast.LENGTH_SHORT );
                                                          addButtonDisabled=false;
                                                          Navigator.of(context).pop();
                                                        }
                                                      });

                                                    }

                                                  },
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 10.w,
                                                        bottom: 10.w),
                                                    child: Text(
                                                      "Close",
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          fontSize: 15.w,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                      Colors.black,
                                                      elevation: 0,
                                                    ),
                                                    onPressed: () {
                                                      _sendMessage("5");
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 10.w,
                                                          bottom: 10.w),
                                                      child: Text(
                                                        "Cancel",
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 15.w,
                                                            color:
                                                            Colors.white),
                                                      ),
                                                    ),)
                                              ],
                                            );
                                          },
                                        );

                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: Colors.green.shade100,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.w),
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 20.w, bottom: 20.w),
                                        child: Text(
                                          "Add",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.w),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const FirstPage()),
                                            (route) => false);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: Colors.green.shade100,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.w),
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 20.w, bottom: 20.w),
                                        child: Text(
                                          "Finish",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.w),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 10.w),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "Copyrights Reserved",
                                  style: TextStyle(
                                      fontSize: 13.w, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
  void showToastMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue[800] ?? Colors.blue,
                // Use Colors.red if Colors.red[800] is null
                Colors.blue[900] ?? Colors.blue,
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
