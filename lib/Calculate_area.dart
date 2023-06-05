import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:math';
import 'package:math_expressions/math_expressions.dart';

class Calculate_area extends StatefulWidget{
  @override myCalculator createState()=> myCalculator();
}
class myCalculator extends State<Calculate_area>{
  Widget myButton(String buttonValue){
    if(buttonValue=="AC"){
      return Expanded(
        child: Container(
          height: 100,
          width: 100,
          padding: EdgeInsets.symmetric( vertical: 10, horizontal: 5),
          child:ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  elevation: 16,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  )
              ),
              onPressed: (){
                getResult(buttonValue);
              },
              child: Text (style: TextStyle(fontSize: 38,), buttonValue)
          ),
        ),
      );
    }
    return Expanded(
      child: Container(
        height: 100,
        width: 100,
        padding: EdgeInsets.symmetric( vertical: 10, horizontal: 5),
        child:ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 16,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                )
              ),
              onPressed: (){
                getResult(buttonValue);
                },
              child: Text (
                  style: TextStyle(fontSize: 38,), buttonValue)
                    ),
                  ),
                 );
                }
String text = "";
String result = "";
void getResult(String buttonText){
if(buttonText=="AC"){
  text = "";
  result = "";
}else if(buttonText == "Del"){
  if(text.length==0){
    return;
  }
  text = text.substring(0,text.length-1);
}else if(buttonText == "="){
  result = text;
 try{
  if(result.contains('x')){result = result.replaceAll('x','*');}
  Parser p =  Parser();
  Expression exp = p.parse(result);
  ContextModel cm = ContextModel();
  result = '${exp.evaluate(EvaluationType.REAL, cm)}';
  if(result[result.length-1] == '0' && result[result.length-2] == '.'){
    result ='= '+  result.substring(0,result.length-2);
  }else{
    result = '= '+ '${exp.evaluate(EvaluationType.REAL, cm)}';
  }
  }catch(e){
   var mySnackbar =const SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 3),
       content: Text(
           '!!! This is not an expression',
             textAlign: TextAlign.start,
             style: const TextStyle(
               fontSize: 18,
               fontWeight: FontWeight.w400,
             ),
       ),
       backgroundColor:  Color.fromRGBO(0, 0, 0, 0.7),
   );
   ScaffoldMessenger.of(context).showSnackBar(mySnackbar);
   return;
 }
}else{
    text = text+buttonText;
}
setState(() {text;result;});
}
@override
    Widget build (BuildContext context){
      return /*SafeArea(
          child:*/Scaffold(
            appBar: AppBar(backgroundColor: Colors.blue, title: Text('Calculator',style:TextStyle(fontStyle: FontStyle.italic,fontSize:40,fontWeight: FontWeight.w400, ) ,),elevation: 16,),
              body: Container(
                color: Colors.white70,
                child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                  Expanded(
                      child:Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black26,
                            width: 15.0,
                          )
                        ),
                        child: Column(children: <Widget>[
                            Container(
                              alignment: Alignment.bottomRight,
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                              child: Text(
                                text,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87
                                ),
                              ),
                            ),
                            Container(alignment: Alignment.bottomRight,
                              padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
                              child: Text(
                                result,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 60.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87
                                ),
                              ),),
                        ],
                        ),
                      )
                  ),
                   /*new Column(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:<Widget>[*/
                    new Row (mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:<Widget>[
                          myButton('('),
                          myButton(')'),
                          myButton('Del'),
                          myButton('/'),
                        ]
                    ),
                    new Row (mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:<Widget>[
                        myButton('7'),
                        myButton('8'),
                        myButton('9'),
                        myButton('x'),
                      ]
                    ),
                    new Row (mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:<Widget>[
                        myButton('4'),
                        myButton('5'),
                        myButton('6'),
                        myButton('-'),
                      ]
                    ),
                  new Row (mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:<Widget>[
                        myButton('1'),
                        myButton('2'),
                        myButton('3'),
                        myButton('+'),
                      ]
                  ),
                  new Row (mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:<Widget>[
                        myButton('.'),
                        myButton('0'),
                        myButton('AC'),
                        myButton('='),
                      ]
                      ),
                    ]
                  ),
                  ),
                //]
                );
             //  );

              //);
            }
}
