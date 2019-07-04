import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:forms_demo/screens/customerAdd.dart';

void main(){
  runApp(HomePage());
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageScreen(),
    );
  }
}

class HomePageScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>HomePageState();
}

class HomePageState extends State{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottom overflowed hatası için çözüm;
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Form Validation Project",textDirection: TextDirection.ltr,),
      ),
      body: CustomerAdd(),
    );
  }
}
