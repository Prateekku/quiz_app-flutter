import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/question.dart';

void main() =>

  runApp(Quiz());
class Quiz extends StatefulWidget
{
   @override
  State<StatefulWidget> createState()
   {
     return _Quiz();
   }
}
class _Quiz extends State<Quiz>
{
  List<Question> question = [
    Question("Quit india Movement on 8th aug 1942?", true),
    Question("India got independence on 12th august?", false),
    Question("Constitution of india came in act on 26th jan 1950?", true),
    Question("Leh is the coldest place on earth?", false),
    Question("Harijan paper was started by MK gandhi?", true),
    Question("2nd round table conference held at 1932?", true),
  ];
  int questionIndex = 0;
  String answer = " ";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz",
      home: Scaffold(
        backgroundColor: Colors.white,
        body:
        Column(
          children:<Widget> [
            Container(
              height: 670.0,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),

                    child: Text("Question #${questionIndex+1}",
                    style:TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w900,
                      fontSize: 16.0,
                    ),
                    ),
                    ),
                    Text(
                        question[questionIndex].question,
                        style:TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 20.0,
                        ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5.0),
                    child: Text(answer,
                        style:TextStyle(
                      color: answer == "Correct!"? Colors.lightGreen : Colors.redAccent,
                      fontWeight: FontWeight.w900,
                      fontSize: 16.0,
                    ),
                    ),
                    ),
                  ],
                ),
              ),
        ),
            Expanded(child: Row(children:<Widget> [
                 Expanded(
                   child: GestureDetector(
                     child: Container(
                       color: Colors.lightGreen,
                       child: Align(
                         alignment: Alignment.center,
                         child: Text("True",
                         style: TextStyle(
                           fontSize: 20.0,
                             fontWeight: FontWeight.w900,
                           color: Colors.white,
                         ),),
                       ),
                     ),
                     onTap: (){
                       if (question[questionIndex].answer == true)
                         {
                           setState(() {
                             questionIndex++;
                             answer = "Correct!";
                           });

                         } else
                           {
                              setState(() {
                                questionIndex++;
                                answer ="Incorrect!";
                              });
                           }
                     },
                   ),
                 ),
              Expanded(
                child: GestureDetector(
                  child: Container(
                    color: Colors.redAccent,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("False",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                    ),
                  ),
                ),
                  onTap: ()
                  {
                    if(question[questionIndex].answer == false)
                      {
                        setState(() {
                          questionIndex++;
                          answer = "Correct";
                        });
                      }else{
                      setState(() {
                        questionIndex++;
                        answer = "Incorrect";
                      });

                    }
                  },
              ),
              )],
            ),
            ),

      ],
        ),
      ),
    );
  }
}