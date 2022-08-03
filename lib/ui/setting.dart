import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF22252d),
      body: Container(
        padding: EdgeInsets.only(
            top: screenHeight * 0.025, left: screenWidth * 0.025),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Setting',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                Divider(
                  endIndent: screenWidth * 0.5,
                  height: screenHeight * 0.025,
                  color: Colors.white,
                ),
              ],
            ),
            Column(
              children:  [
                Container(
                  height: screenHeight*0.07,
                  child: const Text(
                    'Made With m@HDi',
                    style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w800),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
