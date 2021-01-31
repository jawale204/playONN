import 'package:flutter/material.dart';
import 'package:playonn/TimeTable/TimeTableScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 2000),()=>{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> TimeTableScreen()))
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
     child: Center(child: Text("yo bitcch"))
    );
  }
}
