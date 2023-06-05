import 'package:flutter/material.dart';
import 'main.dart';
import 'firstViewController.dart';
import 'Calculate_area.dart';
class secondViewController extends StatelessWidget{
  @override
  Widget build (BuildContext context){

    return
    SafeArea(
        child: Scaffold(
          backgroundColor: Colors.cyanAccent,
          appBar: AppBar(title: Text("Second View")),
           body: Center(
            child:Container(
              child: Padding(
              padding:  EdgeInsets.fromLTRB(20, 40, 20, 500),
             // child: TextField(decoration: InputDecoration(hintText: 'Họ và tên'), keyboardAppearance:Brightness.dark ,) ,
              child: OutlinedButton (
                child: Text ('My Calculator'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Calculate_area()));
                },
                ),
              ),
            ),
          ),
        ),
      );
  }
}