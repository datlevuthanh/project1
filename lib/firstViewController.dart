import 'package:flutter/material.dart';
import 'main.dart';
import 'secondViewController.dart';
class fistViewController extends StatelessWidget{
  @override
  Widget build (BuildContext context){

     return SafeArea(
         child: Scaffold(
          appBar: AppBar(title: Text("FirstView")),
           body: Center(
              child:TextButton (
                style: TextButton.styleFrom(
                primary: Colors.white,
                  backgroundColor: Colors.black,
                  minimumSize: Size(80,40),
                  ),
                child: Text ('Click Here'),
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>secondViewController()));
                },
              ),
             ),
           ),
          );
  }
}