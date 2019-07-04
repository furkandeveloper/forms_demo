import 'package:flutter/cupertino.dart';

class CustomerAdd extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>CustomerAddState();
} 

class CustomerAddState extends State{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Container(
        child: Center(
          child: Form(
            child: Column(
            children: <Widget>[
              Text("Customer Create",textDirection: TextDirection.ltr,)
            ],
          ),
          ),
        ),
      ),
    );
  }

}