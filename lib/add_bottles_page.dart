import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddBottlePage extends StatefulWidget {
  const AddBottlePage({Key? key}) : super(key: key);

  @override
  State<AddBottlePage> createState() => _AddBottlePage();
}

class _AddBottlePage extends State<AddBottlePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(255, 255, 255, 0.6),
      child: AlertDialog(

        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.zero)
        ),
        backgroundColor: Colors.white,
        content: Text(
          "Put the bottle inside and press the 'add' button below",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15.w, color: Colors.black,),
        ),
        actions: [
          Expanded(
            flex: 1,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 0,
                ),
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.only(top: 10.w, bottom: 10.w),
                  child: Text(
                    "Add",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.w,
                        color: Colors.white),
                  ),
                )),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.of(
                      context)
                      .pop();
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 10.w, bottom: 10.w),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.w,
                        color: Colors.white),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
