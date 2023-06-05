import 'package:flutter/material.dart';
class myWidget extends StatelessWidget {
  final bool Calculating;
  myWidget(this.Calculating);
  @override
  Widget build (BuildContext context){
    if (Calculating){
      return const CircularProgressIndicator(strokeWidth: 20.0);
    }else{
      return Text ('Đợi chút');
    }
  }
}
